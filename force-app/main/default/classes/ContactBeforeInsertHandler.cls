/**
 * @description       : 
 * @author            : Shatrughna.Salunke
 * @group             : 
 * @last modified on  : 21-05-2021
 * @last modified by  : Shatrughna.Salunke
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   21-05-2021   Shatrughna.Salunke   Initial Version
**/
public with sharing class ContactBeforeInsertHandler {
    public ContactBeforeInsertHandler() {

    }

     public static void doUpdate(List<Contact> ccList)  {

        MAP<Id,Account> accMap = new MAP<Id,Account>();
        List<Account> listOfAccount = new List<Account> ();
        for (Contact cc : ccList) {
              Account accountToUpdate = new Account ();
              accountToUpdate.Id=cc.AccountId;
              listOfAccount.add(accountToUpdate);
        }
        accMap.putall(listOfAccount);
        update accmap.values();
    }

    public static void getContactCountOnAccount(List<Contact>  listOfContact) {
        Map<Id,Contact> mapOfContact = new Map<Id, Contact>();
        for (Contact newRecords :  listOfContact) {
            mapOfContact.put(newRecords.AccountId, newRecords);
        }
        Integer counter=0;
        List<Account>  updateToAccount = new List<Account>();
        Map<Id,Account> mapToUpdateAccount = new Map<Id,Account>();
        for (Contact cc : [SELECT Id,AccountId, LastName FROM Contact 
                           					   WHERE AccountId IN : mapOfContact.KeySet()]) {
             Account acc = new Account();
             acc.Id=cc.AccountId;
             acc.shatrughna94__TotalCount__c=counter++;
             updateToAccount.add(acc);
        }
       
        if(updateToAccount.size() > 0 && !updateToAccount.isEmpty()){
           mapToUpdateAccount.putAll(updateToAccount);
        }
      
        if (mapToUpdateAccount.size()> 0 && !mapToUpdateAccount.isEmpty()){
            update mapToUpdateAccount.values();
        }
    }
}