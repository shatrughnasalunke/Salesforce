/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-04-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   04-04-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
@isTest 
public class CartDetailsAuraServicesTest {
       static testMethod void beerSearchValidate() 
       {
           // Test Data For Coupon Method
           shatrughna94__Coupon__c coupon= new shatrughna94__Coupon__c(Name='New Coupon', shatrughna94__Price__c=100);
           System.debug('Coupon After Insert: ' +coupon.shatrughna94__Price__c);
           insert coupon;
           
           coupon = [SELECT Name, shatrughna94__Price__c FROM shatrughna94__Coupon__c WHERE Id =:coupon.Id];
           shatrughna94__Cart__c cart = new shatrughna94__Cart__c(shatrughna94__Coupon__c=coupon.Id);
           insert cart;
           
           cart =[SELECT Id, shatrughna94__Coupon__r.Name,shatrughna94__Coupon__r.shatrughna94__Price__c FROM shatrughna94__Cart__c where Id=:cart.Id];
           
           System.debug('Coupon Name for Cart after insert--->'+cart.shatrughna94__Coupon__r.Name);
        
       }
}