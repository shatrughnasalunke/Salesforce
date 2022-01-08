public with sharing class AccountTriggerCalloutHelper {
    
    public AccountTriggerCalloutHelper() {
            system.debug('Apex class executed succcessfully');
    }
    public static void doAutoDecisioning (List<Account> getAccount) {
        for (Account acc  : getAccount) {
            if (acc.Industry=='Banking' && acc.AnnualRevenue > 20000
                                                    && acc.shatrughna94__autoDecision__c == false ) {
                acc.shatrughna94__autoDecision__c = true;
                system.debug('acc.shatrughna94__autoDecision__c--->'+acc.shatrughna94__autoDecision__c);
           }
        }

    }
    public static void beforeCallout(Map<Id, Account> getAccount) {
    system.debug('Get test Data');
        Account accId =[SELECT Id, Name FROM Account WHERE Id IN : getAccount.keySet() WITH SECURITY_ENFORCED limit 1];
        if (accId.Id != Null) {   
            Id accountId = accId.Id;
            doCallout(accountId); 
        }
    }
    @future(callout=true)    
    public static void doCallout(Id  accountIds) {
        List<Account>  listOfAccounts = [SELECT Id, Name, Industry, Type,AccountNumber,AnnualRevenue, 
                                            shatrughna94__autoDecision__c FROM Account WHERE Id = : accountIds WITH SECURITY_ENFORCED];

        for (Account getCriteria :  listOfAccounts) {
                if (getCriteria.Industry=='Banking' && getCriteria.AnnualRevenue > 20000
                                                    && getCriteria.shatrughna94__autoDecision__c == true ) {
                     system.debug('Update Record');                              
                }
        }                                        
        system.debug('listOfAccounts--->'+listOfAccounts);
    }
 }


