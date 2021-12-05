global class BatchToDeletePurgeAccount Implements Database.Batchable<sObject>, Schedulable {
    Integer count = 0 ;
    global void execute (System.SchedulableContext sc) {
       database.executeBatch(new BatchToDeletePurgeAccount(), 200);  
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Name  FROM Account  WHERE Active__c = false' ;
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account>  accountToBeDeleted) {
        Database.DeleteResult[] deleteResult = Database.Delete(accountToBeDeleted , false);
        for (Database.DeleteResult  re : deleteResult) {
            if (re.isSuccess()){
                count ++;
                System.debug('get Id of Records --->'+re.getId());
            }else{
                for (Database.Error error : re.getErrors()) {
                     System.debug('Error is occurred here-->'+error); 
                }
            }
         }
    }
    global void finish (Database.BatchableContext BC) {
        System.debug('Record Successfully deleted --->'+count);
    }
}