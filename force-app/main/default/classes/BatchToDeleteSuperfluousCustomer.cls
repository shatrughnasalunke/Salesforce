global class BatchToDeleteSuperfluousCustomer implements  Database.Batchable<sObject>, Database.stateful, Database.AllowsCallouts, Schedulable  {
     public static Id idRecType = Schema.SObjectType.Customer__c.getRecordTypeInfosByName().get('Superfluous Customer').getRecordTypeId();
     Integer  count=0;
     global void execute(SchedulableContext sc) {
         Database.executeBatch(new BatchToDeleteSuperfluousCustomer(),200); 
     }
     global Database.QueryLocator start(Database.BatchableContext BC){
       String soqlQuery = 'SELECT Id, RecordTypeId FROM shatrughna94__Customer__c WHERE RecordTypeId = :idRecType or RecordTypeId=\'\'' ;
       //String query = 'Select Id, Name, Stage_change_reminder_count__c,StageName From Opportunity WHERE StageName = \'Prospecting\' and Open_Tasks__c =\' 0\' and Last_Activity_Age__c >= \'12\'';
       return Database.getQueryLocator(soqlQuery);
     }
     global void execute(Database.BatchableContext BC, List<Shatrughna94__Customer__c> listofCustomers){
         Database.DeleteResult[] srList = Database.Delete(listofCustomers, false);
         for (Database.DeleteResult sr : srList) {
             if (sr.isSuccess()) {
                 count++;
                 system.debug('Successfully inserted account. Account ID: ' + sr.getId());
             }
             else {
                 for (Database.Error getError : sr.getErrors()) {
                     System.debug('The following error has occurred.');                    
                     System.debug(getError.getStatusCode() + ': ' + getError.getMessage());
                     System.debug('Account fields that affected this error: ' + getError.getFields());
                 }
             }
         }
     }
     global void finish(Database.BatchableContext BC) {
         System.debug('Total success count--->'+count);
    }
}