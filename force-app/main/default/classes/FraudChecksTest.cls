public class FraudChecksTest
{
}

/*
/**=====================================================================
* Experian
* Name: ECS_UK_Check_Frauds_Test
* Description: Test  class for  ECS_UK_Check_Frauds
* Created Date: 11/12/2020
* Created By: Shatrughna Salunke
* UV-5586 Fraud Spreadsheet Live Frauds.
===================================================================== 
@isTest
public class ECS_UK_Check_Frauds_Test {
    public static TestMethod void checkFraud(){
        Account acc = new Account();
        acc.FirstName='Shatrughna';
        acc.LastName = 'shatrughna test';
        acc.ECS_UK_Product__pc = 'Credit Expert';
        acc.ECS_UK_ICON_Ref_Number__pc='41476663';
        acc.ECS_UK_Customer_Number__pc='111119211301';
        acc.PersonEmail='shatrughna.salunke@experian.com';
        insert acc;
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = acc.id;
        Test.setFixedSearchResults(fixedSearchResults);
        List<List<SObject>> searchList = [FIND 'test' IN ALL FIELDS RETURNING Account(id, name) LIMIT 1];
        Test.startTest();
        ECS_UK_Check_Frauds.checkFrauds(acc.PersonEmail);
        Test.stopTest();
    }
    public static TestMethod void testSubscriptionAPI()
    {
        List<Account> corvetteCustomerList = ECS_UK_TestDataFactory.createCorvetteCustomers(1);
        ECS_UK_TestDataFactory.createAPIURLCustomSetting('Corvette Token', 'https://c2.stg.experiancs.co.uk/api/oauth/token');
        ECS_UK_TestDataFactory.createAPIURLCustomSetting('Corvette CancelSubscription', 'https://c2.stg.experiancs.co.uk/api/fulfillments');
        
        ECS_UK_Subscription__c sub = new ECS_UK_Subscription__c();
        sub.ECS_UK_Customer__c = corvetteCustomerList[0].id;
        sub.ECS_UK_Brand__c = 'creditmatcher';
        insert sub;
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new ECS_UK_EinsteinBotCancellatn_CalloutMock('success'));
        ECS_UK_Check_Frauds.cancelSubscription(corvetteCustomerList[0].id);
        Test.stopTest();          
    }
    public static testmethod void testMehod2() {
        
        List<Account> corvetteCustomerList = ECS_UK_TestDataFactory.createCorvetteCustomers(1);
        ECS_UK_TestDataFactory.createAPIURLCustomSetting('Corvette Token', 'https://c2.stg.experiancs.co.uk/api/oauth/token');
        ECS_UK_TestDataFactory.createAPIURLCustomSetting('Corvette CancelSubscriptions', 'https://c2.stg.experiancs.co.uk/api/fulfillments');
        
        ECS_UK_Subscription__c sub = new ECS_UK_Subscription__c();
        sub.ECS_UK_Customer__c = corvetteCustomerList[0].Id;
        insert sub;
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new ECS_UK_EinsteinBotCancellatn_CalloutMock('exception'));
        ECS_UK_Check_Frauds.cancelSubscription(corvetteCustomerList[0].Id);
        Test.stopTest();    
    }
}*/