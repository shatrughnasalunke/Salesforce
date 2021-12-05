public with sharing class CompanyOverview{
   
    @AuraEnabled(cacheable=true)
    public static List<String>  showCompanyOverviewOnLightningComponent(List<Id> accountIds) {
       if (accountIds.size()> 0 && !accountIds.isEmpty()){
           List<String> overView = new List<String> ();
           for (Account acc : [SELECT Id,Name, OverView__c FROM Account WHERE Id IN : accountIds]) {
               overView.add(acc.OverView__c);
           }
           return overView;
       }
        return null;
    }
}