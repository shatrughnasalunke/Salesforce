public class ContactTriggerhelperClone {
    
public static void UpdateContact(List<Contact> contactlist){
    String ContactId;
    Set<Id> AccountIds = new Set<Id>();
    List<Contact> updateExistinglistofContact = new List<Contact> ();
    
    for (Contact cc : contactlist) {
        if (cc.shatrughna94__PrimarContact__c == true) {
              AccountIds.add(cc.AccountId);
              ContactId = cc.Id;
     }
    }
    List<Contact> existingContact = [SELECT Id, AccountId, FirstName , shatrughna94__PrimarContact__c 
                                      FROM Contact WHERE AccountId IN : AccountIds 
                                      AND shatrughna94__PrimarContact__c = true];
     system.debug('existingContact--->'+existingContact);
    
    for (Contact newIds : existingContact) {
        if (newIds.Id != ContactId) {
            system.debug('insdie if--->');
            newIds.shatrughna94__PrimarContact__c = false;
            updateExistinglistofContact.add(newIds);
     }
    }
    system.debug('updateExistinglistofContact--->'+updateExistinglistofContact);
    update updateExistinglistofContact;
   } 
    
   public static void countOfContact (List<Contact> OldAndNewlistOfContact) {
       
       Set<Id> AccountIds = new Set<Id>();
       for (Contact cc : OldAndNewlistOfContact) {
           AccountIds.add(cc.AccountId);
       }
        
   } 
}