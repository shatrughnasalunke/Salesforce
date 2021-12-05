public class TotalContatctCount {
    public static void getContatcCountOnAccount(List<Contact>  listOfContact) {
        Map<Id,Contact> mapOfOldContact = new Map<Id, Contact>();
        for (Contact oldRecords :  listOfContact) {
            system.debug('AccoutnId--->' + oldRecords.AccountId);
            if ( oldRecords.AccountId != null) {
                system.debug('inside if condtion');
                mapOfOldContact.put(oldRecords.AccountId, oldRecords);
            }
        }
        system.debug('Size of Records--->'+mapOfOldContact.size());
        if (mapOfOldContact.size () >0  ) {
            Integer counter=0;
            system.debug('mapOfOldContact---?'+mapOfOldContact);
            List<Account>  updateToAccount = new List<Account>();
            Map<Id,Account> mapToUpdateAccount = new Map<Id,Account>();
            for (Contact cc : [SELECT Id,AccountId, LastName FROM Contact 
                               WHERE AccountId IN : mapOfOldContact.KeySet()]) {
                                   Account acc = new Account();
                                   acc.Id = cc.AccountId;
                                   acc.shatrughna94__TotalCount__c = counter++;
                                   updateToAccount.add(acc);
                               }
            System.debug('UpdateToAccount list--->'+updateToAccount);
            System.debug('counter--->'+counter);
            if(updateToAccount.size() > 0 && !updateToAccount.isEmpty()){
                mapToUpdateAccount.putAll(updateToAccount);
            }
            if (mapToUpdateAccount.size()> 0 && !mapToUpdateAccount.isEmpty()){
                update mapToUpdateAccount.values();
            }
            
        }
        
    }
}