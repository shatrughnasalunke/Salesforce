public class handleAfterUpdateHandler {
    
   public static void updaetLastActivityDateOnContactFromAccount(Map<Id, Account> oldMap, Map<Id, Account> newMap){
   List <Contact> accountAssociatedContct = [SELECT Id, Name,AccountId, LastActivityDate__c
                                                  FROM Contact 
                                                  WHERE AccountId IN :newMap.keySet()];
  for(Contact updateToContact : accountAssociatedContct) {
            Account oldAcc = oldMap.get(updateToContact.AccountId);
            updateToContact.LastActivityDate__c = Date.Today();
   }
  if (accountAssociatedContct.size() > 0){
              update accountAssociatedContct;
     }
  }
  public static void  updateOpportunityAndContacts (Map<Id,Account> mapAccount) {
        System.debug('mapAccount---->'+mapAccount);
        BatchToUpdateOpportunityAndContact.runBatch(mapAccount);
  } 
  public static void getName() {
        system.debug('get Name--->');
  }
  public static void sendEmail(Map<Id,Account> newMap,
                               Map<Id, Account> oldMap ) {
        Set<String> contactEmail = new Set<String>(); 
        List<String> sendTo = new List<String>();
        Set<Id> accountIds = new Set<Id> () ;                           
 
        for (Account  acc : newMap.Values()) {
            if (acc.Industry!= oldMap.get(acc.Id).Industry) {
				accountIds.add(acc.Id);
            }
        }
        for (Contact cc : [SELECT Id, Email FROM 
                            		Contact WHERE AccountId IN :accountIds]) {
             contactEmail.add(cc.Email);
        }
        sendTo.addAll(sendTo);                          
  }   
}