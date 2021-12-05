global class OldAccountDeleteBatch implements Database.Batchable<sObject>, schedulable  {
    global void execute(SchedulableContext SC) {
 			database.executebatch(new OldAccountDeleteBatch(),200);
    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        Date threeDaysBefore = System.today().addDays(-3);
        String SOQL = 'SELECT Id FROM Account WHERE CreatedDate <=:threeDaysBefore';
        return Database.getQueryLocator(SOQL);
    }
    global void execute(Database.BatchableContext bc, List <Account> accountToDelete) {
           
          Database.delete(accountToDelete, false);
          Database.emptyRecycleBin(accountToDelete);
    }
    global void finish(Database.BatchableContext bc) {
        
    }
}