global class BatchToInsertContact Implements
						Database.Batchable<sObject> {
                            
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,FirstName FROM Contact Limit 1';
        return Database.getQueryLocator(query);
    }
                            
    global void execute (Database.BatchableContext sc, List<Contact> getlistofRecord) {
        List<Contact> listOfContact = new List<Contact> ();
        for (Contact cc : getlistofRecord ) {
            listOfContact.add(new Contact(FirstName='Batch',LastName='Contact'));
        }
        if (!listOfContact.isEmpty()) {
            insert listOfContact;
        }
    }   
    global void finish (Database.BatchableContext sc) {
       Id JobId = database.executeBatch(new BatchToInsertCase(),200 );
    }                         
}