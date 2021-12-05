public  with sharing class entityTypeController {
    @AuraEnabled
    public static List<sObject> getEntity(String entityType)
    { 
        system.debug('entityType-->'+entityType);
        List<sObject> sob=new List<sObject>();   
        if(entityType!=null)
        {
            String query='SELECT Name, Id FROM '+entityType ;
            system.debug('query-->'+query);
            sob=database.query(query);
            system.debug('sob-->'+sob);
        }
        return sob;
    }
    @AuraEnabled 
    public static List<Account> getData()
    { 
        List<Account> c=[Select id,Name from Account];
        system.debug('c--->'+ c );
        return c;
    }   
    @AuraEnabled
    public static List<User> getUserList() {
        return [Select id,name,email FROM User ];
    }
}