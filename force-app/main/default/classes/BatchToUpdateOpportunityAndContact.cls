global class BatchToUpdateOpportunityAndContact implements  Database.Batchable<sObject>, Database.stateful, Database.AllowsCallouts  {

    public Set<Id> accountIds;
    public static String soqlQuery='';
    public static void runBatch(Map<Id,Account> mapAccount){
    set<Id> accountIds = mapAccount.keySet();
    System.debug('accountIds--->'+mapAccount.keySet());    
         
        if( accountIds.size() > 0 ) {
            soqlQuery =   'Select Id  FROM Contact  ';
        }
        BatchToUpdateOpportunityAndContact batchToUpdateOppAndContacts = new BatchToUpdateOpportunityAndContact();
        batchToUpdateOppAndContacts.accountIds = accountIds;
        Database.executeBatch(batchToUpdateOppAndContacts, 200);
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
          return Database.getQueryLocator(soqlQuery);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> contactslistOfRecord ){
        System.debug('contactslistOfRecord--->'+contactslistOfRecord);
    }
   
    global void finish(Database.BatchableContext BC) {
        
    }
}