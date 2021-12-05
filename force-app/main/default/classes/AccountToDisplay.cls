public with sharing class AccountToDisplay {
   
    public AccountToDisplay() {
    }
    @AuraEnabled(cacheable =true)
    public static List<Account>  legacyAccount(){
        try {
         List<Account> acc  = [SELECT Id,Name FROM Account Limit 50000];
         system.debug('----'+acc);
         return acc;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}