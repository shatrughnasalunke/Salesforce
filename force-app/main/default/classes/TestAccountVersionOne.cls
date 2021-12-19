@isTest
public with sharing class TestAccountVersionOne {

    @TestSetup 
    static void  doInserttAccount(){
        Account acc = new Account(
            Name='Test Account',
            shatrughna94__Branch_Type__c = 'Main');
        insert acc;
        Opportunity opp = new Opportunity (
        Name = 'TestOpportunity',
        StageName ='Closed - Lost', CloseDate = system.today(),AccountId = acc.Id); 
        insert opp;
    }
    @isTest
     public static void  mapOfOpportunity(){
        Opportunity opp = [SELECT Id,Name FROM Opportunity WHERE Name ='TestOpportunity'];
        System.assertEquals(Opp.Name,'TestOpportunity','checkFirstName');
    }
    @isTest
    public static void constructorTest() {
        TestAccountTriggerHelper cc = new TestAccountTriggerHelper();
    }
}