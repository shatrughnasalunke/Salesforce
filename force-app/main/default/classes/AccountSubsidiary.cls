public class AccountSubsidiary {
  
    @AuraEnabled
    public static List<Account> getSubsidiary(String currentAccountId) {
        List<Account> listOfChildAccount =[SELECT Id, Name,shatrughna94__CompanyType__c,Website,shatrughna94__Active__c, ParentId 
                                           						FROM Account  WHERE ParentId =:currentAccountId ];
        return listOfChildAccount;
    }

}