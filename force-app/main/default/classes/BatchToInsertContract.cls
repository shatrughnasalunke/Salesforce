global class BatchToInsertContract Implements
										Database.Batchable<sObject>  {
                                            
      global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Contract Limit 1';
        return Database.getQueryLocator(query);
    }
    global void execute (Database.BatchableContext sc, List<Contract> listOfContract) {
        List<Account> contractList = new List<Account> ();
        for (Contract cc : listOfContract ) {
            contractList.add(new Account(Name='BtachContract'));
        }
        if (!contractList.isEmpty()) {
            insert contractList;
        }
    }   
    global void finish (Database.BatchableContext sc) {
       
    }                                                               
                                            

}