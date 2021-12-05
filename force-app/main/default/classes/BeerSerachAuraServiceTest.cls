/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────
* Summary of this class.
*
* Additional information:
* 			This class is an test class coverage for  BeerSerachAuraService class
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @modifiedBy     Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @maintainedBy   Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @version        1.0
* @created        10-May-2020
* @modified       10-May-2020
* ──────────────────────────────────────────────────────────────────────────────────────────────────
**/
@isTest 
private class BeerSerachAuraServiceTest
{
       static testMethod void beerSearchValidate() 
       {
           shatrughna94__Beer__c b = new shatrughna94__Beer__c(Name='Beer Example', shatrughna94__Total_Quantity__c=100);
           System.debug('Price before inserting new book: ' + b.shatrughna94__Total_Quantity__c);
           insert b;
           b = [SELECT shatrughna94__Total_Quantity__c FROM shatrughna94__Beer__c WHERE Id =:b.Id];
           System.debug('Toatal Quantity after trigger fired: ' + b.shatrughna94__Total_Quantity__c);
           Test.startTest();
           System.assertEquals(100, b.shatrughna94__Total_Quantity__c);
           BeerSerachAuraService.searchBeer('Beer Example'+ 'null');
           BeerSerachAuraService.searchBeer(null);
           Test.stopTest();
      }
}