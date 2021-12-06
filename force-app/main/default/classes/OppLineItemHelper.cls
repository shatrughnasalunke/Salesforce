public with sharing class OppLineItemHelper {
    public OppLineItemHelper() {
        System.debug('Opportunity Line Item Trigger');
    }
    public static void doInsertAsset (Map<Id, OpportunitylineItem> mapOppLineItem) {
        Set<Id> oppId = new Set<Id> ();
        Set<Id> accid = new Set<Id> ();
        List<Asset> listofAsset = new List<Asset>();
        for (OpportunitylineItem oppl :  mapOppLineItem.Values()) {
            oppId.add(oppl.opportunityId);
        }
        Asset doInsert ; // = new Asset();
        for (Opportunity oppIds : [SELECT Id, AccountId FROM Opportunity 
                                                        WHERE AccountId IN :oppId WITH SECURITY_ENFORCED ]) {
            accid.add(oppIds.AccountId);
            doInsert = new Asset();
            doInsert.AccountId = oppIds.AccountId;
            listofAsset.add(doInsert);
        }    
        boolean b1 = false;
        if(!listofasset.isEmpty()) {
                Database.insert(listofAsset, b1);
        }
    }
}
