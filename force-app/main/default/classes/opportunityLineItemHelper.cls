public with sharing class opportunityLineItemHelper {
    public OpportunityLineItemHelper() {
      System.debug('Constructor executed ');
    }
    public static void doInsertAsset(Map<Id, opportunityLineItem> mapOfopportunityLineItem) {
        
        List<Opportunity> getAccountId = [SELECT Id, AccountId FROM 
                                           Opportunity
                                           WHERE  
                                           AccountId IN : mapOfopportunityLineItem.keySet()
                                           WITH SECURITY_ENFORCED]; 
         System.debug('getAccountId-->'+getAccountId);
    }
}