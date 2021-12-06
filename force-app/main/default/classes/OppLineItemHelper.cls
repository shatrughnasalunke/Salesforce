public with sharing class OppLineItemHelper {
    public OppLineItemHelper() {
        System.debug('Opportunity Line Item Trigger');
    }
    public static void doInsertAsset (Map<Id, OpportunitylineItem> mapOppLineItem) {
        system.debug('Map of values--->'+mapOppLineItem.Values());
        Set<Id> accountId = new Set<Id> (mapOppLineItem.keySet());
        System.debug('AccountId -->'+accountId); 
        List<Asset> listofAsset = new List<Asset>();
        if (!accountId.isEmpty()) {
            Asset ss ;
            for (Id ids  : accountId){
                ss = new Asset();
                ss.AccountId =Ids; 
                listofAsset.add(ss);           
             }
         }
         if (!listofAsset.isEmpty()) {
              boolean b1 = true;
             // Database.insert(listofAsset,b1);   // Getting field integration error
         }
    }
}
