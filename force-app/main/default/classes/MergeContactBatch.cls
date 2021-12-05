global class MergeContactBatch implements database.Batchable<sObject> {
   
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String name  = '%Test%';
        String query = 'SELECT Id, Name FROM Contact WHERE Name like \''+name+'\'';
        return Database.getquerylocator(query);    
    }
    
    global void execute (Database.BatchableContext BC, List<Contact> scope) {
         // Calling helper class 
         List<Contact> ccList = ContactHelper.getData();
         System.debug('ccList--->'+ccList);
         Contact masterConact = MergeContactBatch.getContact();
         List<Contact> dupcontactList = new List<Contact>();
         Set<Id> Ids = new Set<Id>();
          
         for(Contact contactRecrd : scope) {
                Ids.add(contactRecrd.Id);
                dupcontactList.add(contactRecrd);
          }
          
          List<Contact> contactList = [SELECT Id FROM Contact 
                                       			 WHERE Id IN: Ids AND id!= '0032v00003lPbkLAAS'];
          
          Database.MergeResult[] results = Database.merge(masterConact, contactList, true);
 }     
 
  global void finish (Database.BatchableContext BC) {} 
    public static Contact getContact(){
        
        // Query for  masterRecord  
        List<Contact> contactList = [SELECT Id FROM Contact WHERE Id = '0032v00003lPbkLAAS'];
        if(!contactList.isEmpty()){
            return contactList[0];
        }else{
            return null;
        }
    }
 }