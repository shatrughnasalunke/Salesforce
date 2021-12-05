public class AccountActivationPorcess {
 
    public static void checkActivationProcess(Map<Id, Account > mapOfIds) {

      Set < Id > parentAccountIds = new Set < Id > ();
        for (Id parentId: mapOfIds.KeySet()) {
            parentAccountIds.add(parentId);
        }
        Map < Id, Account > mapOfChildAccount = new Map < Id, Account > ();
        List < Account > listOfChildAccount = new List < Account > ();
        for (Account childAccounts: [SELECT Id, ParentId, shatrughna94__Active__c, Name FROM
                Account WHERE ParentId IN: parentAccountIds
            ]) {
            mapOfChildAccount.put(childAccounts.parentId, childAccounts);
            listOfChildAccount.add(childAccounts);
        }
        if (listOfChildAccount.size() > 0) {
            for (Account acc: mapOfIds.Values()) {
                for (Account childAccount: listOfChildAccount) {
                    if (childAccount.Active__c ==True  && acc.Active__c == false) {
                          acc.addError('Please deactivate all child account');
                    }
                    
                }
            } 
        }
    }
}