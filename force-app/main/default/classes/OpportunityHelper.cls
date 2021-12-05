public with sharing class OpportunityHelper {
    public OpportunityHelper() {
    }
    public  static void doInsertOpportunityLineItems(Map<Id, Opportunity> mapOfOpportunity) {
        List<OpportunityLineItem> listOfOpportunityLineItem = new List<OpportunityLineItem> ();
        OpportunityLineItem opp;   
        for (Opportunity getOppo :  mapOfOpportunity.values()) {
              opp  = new OpportunityLineItem();
              //opp.Name = 'Trigger Execute Successfully';
              opp.OpportunityId = getOppo.id;
              opp.Product2Id = '0052v00000gO34IAAS';
              listOfOpportunityLineItem.add(opp);
        }
        if(!listOfOpportunityLineItem.isEmpty()) {
            try {
                Database.Insert(listOfOpportunityLineItem, true);
            } catch (Exception e) {
                system.debug('System debug--->'+e.getMessage());
            }
        }
    }

}