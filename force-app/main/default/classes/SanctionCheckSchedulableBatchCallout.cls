public class SanctionCheckSchedulableBatchCallout { 
            
            /*
        global class SanctionCheckSchedulableBatchCallout implements Database.Batchable<sObject>, Database.AllowsCallouts {
        global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Account__c FROM SanctionCheck__c WHERE Status__c = \'New\' ';
        
        return Database.getQueryLocator(query);
        }
        
        global void execute(
        Database.BatchableContext bc,
        List<SanctionCheck__c> records
        ) {
        List<Id> accountIds = new List<Id>();https://shatrughna94-dev-ed.my.salesforce.com/_ui/common/apex/debug/ApexCSIPage#
        for (SanctionCheck__c sc : records) {
        accountIds.add(sc.Account__c);
        }
        
        LexisNexisAccountSearch.newAccountSearch_makeRequest(accountIds);
        }
        
        global void finish(Database.BatchableContext bc) {
        }
        }
        */
    
}