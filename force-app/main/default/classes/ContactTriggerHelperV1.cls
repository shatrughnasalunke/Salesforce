public with sharing class ContactTriggerHelperV1 {

    public static shatrughna94__TriggerActivation__c cc =  shatrughna94__TriggerActivation__c.getInstance(userInfo.getProfileId());

    public ContactTriggerHelperV1() {
    }

    public static void getContactCount(List<Contact>   contactList) {
        Set<Id> accountIds = new Set<Id> ();
        for (Contact acc : contactList) {
             accountIds.add(acc.accountId);
        }
        List<Account> listToUpdate = new List<Account> ();
        for(Account acc : [SELECT ID,Name,shatrughna94__TotalCount__c, 
                                    (SELECT Id, Name FROM Contacts )
                                        FROM Account WHERE Id IN : accountIds]) {
            if (acc.Contacts.size() > 0 ){
                acc.shatrughna94__TotalCount__c = acc.Contacts.size();
                listToUpdate.add(acc);
            }
        }
      //update  listToUpdate;
    }
    public static void getContactCountV1(Map<Id, Contact> contactList) {
        Map<Id,Contact> mapOfContact = new Map<Id, Contact> () ;
        for (Contact getContactlist  : contactList.Values()) {
            mapOfContact.put(getContactlist.accountId, getContactlist);
        } 
        List<Account> listOfAccount = [SELECT Id, Name,(SELECT Id,Name FROM Contacts) FROM Account WHERE Id IN : mapOfContact.keySet()];
        Map<Id, Account> mapOfAccount = new Map<Id, Account> ();
        for (Account acc : listOfAccount) {
                acc.shatrughna94__TotalCount__c = acc.Contacts.size();
                mapOfAccount.put(acc.Id, acc);
        }
        update  mapOfAccount.Values();   
    }
    public static void doNotDeleteActiveContact (Map<Id,Contact> mapOfOldValues) {
        for (Contact getOldValues : mapOfOldValues.Values()) {
                if (getOldValues.shatrughna94__Active__c ==  True) {
                    getOldValues.shatrughna94__Active__c.addError('You can not delete active contact');
                }
                if (getOldValues.shatrughna94__PrimarContact__c ==  True) {
                    getOldValues.shatrughna94__Active__c.addError('This is primary contact you canot delete primary contact');
                }
    }
    }    
    public static void avoidMultiplePrimaryContact(Map<Id,Contact> mapOfNewContact) {
        String currentId = '';
        Set<Id> accountIds = new Set<Id>();
        for (Contact getnewContactlist :  mapOfNewContact.Values()) {
           if (getnewContactlist.shatrughna94__PrimarContact__c == true) {

                accountIds.add(getnewContactlist.accountId); 
                currentId = getnewContactlist.Id;
           }
        }
        List<Contact> listOfContact = new List<Contact> ();                                                       
        for (Contact getPrimaryContact: [SELECT Id,Name,shatrughna94__PrimarContact__c FROM Contact WHERE AccountId In : accountIds
                                         AND shatrughna94__PrimarContact__c = true])  {                 
                 
                    if (currentId != getPrimaryContact.Id ) {
                        getPrimaryContact.shatrughna94__PrimarContact__c = False; 
                        listOfContact.add(getPrimaryContact);                       
                      }                                                 
             }
         if (listOfContact.size() >0 ) {
                update listOfContact;
         }

     }    
     public static void preventDuplicateContact(Map<Id,Contact>  newValues, 
                                                Map<Id,Contact> oldValues) {

        System.debug('new values--->'+newValues.Values());
        System.debug('keySet--->'+newValues.keySet());
        System.debug('oldValues---->'+oldValues.values());
        System.debug('oldValues keySet'+oldValues.keySet());                                            


        Map<String, Contact> mapOfEmail = new Map<String, Contact> ([SELECT  Id ,Email FROM Contact WHERE Email !='' limit 50000]);
        for (Contact  contactlist  :  newValues.Values()) {
                if (mapOfEmail.ContainsKey(contactlist.Email)) {
                    contactlist.Email.addError('Duplicate Record Found');
                }
        }
     }
     public static void preventDuplicateContactSecondApproach(Map<Id, Contact> newValues) {
        if(cc.shatrughna94__ActivateTrigger__c == false) {
            Set<String> currentEmailList = new Set<String> ();
            for (Contact cc : newValues.values()) {
                currentEmailList.add(cc.Email);
            }
            List<Contact> existingEmailId = [SELECT Id, Email FROM Contact WHERE Email IN : currentEmailList];
            if (existingEmailId.size() > 0 ) {
                    for (Contact showError  : newValues.Values()) {
                            showError.Email.addError('Duplicate email found');
                    }
            }
        }
     }
}