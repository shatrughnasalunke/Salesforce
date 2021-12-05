global class BatchToInsertCase Implements
						Database.Batchable<sObject> {
                            
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,CaseNumber FROM Case Limit 1';
        return Database.getQueryLocator(query);
    }
    global void execute (Database.BatchableContext sc, List<Case> listOfcses) {
        List<Case> listofcase = new List<Case> ();
        for (Case cc : listOfcses ) {
            listofcase.add(new Case(subject='BatchCase'));
        }
        if (!listofcase.isEmpty()) {
            insert listofcase;
        }
    }   
    global void finish (Database.BatchableContext sc) {
       
    }                         
}