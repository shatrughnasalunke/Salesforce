public with sharing class fetchAllAccount {
    public fetchAllAccount() {


    }

    @AuraEnabled
    public static List<Account> getAllAccount(){
        try {
          List<Account> acc = [SELECT Id, Name FROM  Account];
          return acc;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
