global class BatchToInsertOpportunity  implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Opportunity Limit 1';
        return Database.getQueryLocator(query);
    }
    
    global void execute (Database.BatchableContext sc, List<Opportunity> listofOpportunities) {
        List<Opportunity> opplIst = new List<Opportunity> ();
        for (Opportunity cc : listofOpportunities ) {
            opplIst.add(new Opportunity(Name='Batch Opportunity',StageName='Closed-WON',CloseDate=System.Today()+1));
        }
        if (!opplIst.isEmpty()) {
            insert opplIst;
        }
    }   
    global void finish (Database.BatchableContext sc) {
        Id JobId = Database.executeBatch(new BatchToInsertContact(),200);
    }                         
}