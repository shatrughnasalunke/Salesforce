global class BatchToInsertRecord  implements Database.Batchable<sObject>, Schedulable {
    public void execute(SchedulableContext SC) {
        Id job = Database.executeBatch(new BatchToInsertRecord(),200);
    } 
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Name FROM Lead Limit 1';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Lead> leadlist) {
        List<Lead> listOfLead = new List<Lead> ();
        for(Lead lea : leadlist) {
            listOfLead.add(new Lead(FirstName='Batch '+lea.Name));
        }
       try {
            system.debug('list of Lead --->'+listOfLead);
            insert  listOfLead;
        } catch(Exception e) {
            System.debug(e);
        }
    }   
    global void finish(Database.BatchableContext BC) {
       Id JobId = Database.executeBatch(new BatchToInsertOpportunity(),200);
    }
}