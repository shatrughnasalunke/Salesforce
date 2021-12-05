public class SearchRecordDynamic{
    @AuraEnabled 
    public static WraperForStorage searchRecord(String getName)
    {
       WraperForStorage wrperObj=new  WraperForStorage();
       List<List<sObject>>  obList=new List<List<sObject>>();
       if(getName!=null && getName!='') 
       { 
            System.debug('getName--->'+getName);
            String searchQuery = 'FIND \'' + getName + '\' IN ALL FIELDS RETURNING Lead(Name,FirstName,LastName), Contact(FirstName,LastName,Account.Name )';
            List<List<sObject>> dynamicSearch=search.query(searchQuery);
            Lead[] leadlistarra=(Lead[])dynamicSearch[0];
            contact[] contactlist=(contact[])dynamicSearch[1];
            wrperObj.leadlist = leadlistarra;  
            wrperObj.cntsLst = contactlist;  
       }  
            return wrperObj;
    }
    Public class WraperForStorage
    {
        @AuraEnabled Public List<Lead> leadlist {get;set;}  
        @AuraEnabled Public List<Contact> cntsLst {get;set;}  
    }
}