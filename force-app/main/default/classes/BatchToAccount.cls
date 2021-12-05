global class BatchToAccount Implements
						Database.Batchable<sObject> {
                            
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account Limit 1';
        return Database.getQueryLocator(query);
    }
    global void execute (Database.BatchableContext sc, List<Account> listofAccount) {
        List<Account> insertToAccount = new List<Account> ();
        for (Account cc : listofAccount ) {
            insertToAccount.add(new Account(Name='Batchaccount'));
        }
        if (!insertToAccount.isEmpty()) {
            insert insertToAccount;
        }
    }   
    global void finish (Database.BatchableContext sc) {
       Id JobId = Database.executeBatch(new BatchToInsertContract(),200);
    }                         
}