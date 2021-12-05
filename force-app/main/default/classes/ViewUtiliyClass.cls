public with sharing class ViewUtiliyClass {
    public ViewUtiliyClass() {
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccount(){
        try {
            return [SELECT Id, Name FROM Account limit 50000];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}