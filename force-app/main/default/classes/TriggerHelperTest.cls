@isTest
public with sharing class TriggerHelperTest {
    public TriggerHelperTest() {
    }
    @testSetup
    static void taskTestData(){
        Task t = new Task();
        t.subject = 'Call';
        t.status='Not Started';
        t.priority ='Low';
        insert t;    
    }
    @isTest 
    public static void adminPrevilledgeTest(){
        Task t = [SELECT Id, Subject FROM Task limit 1];
        System.assertEquals('Call',t.Subject);
        System.assertNotEquals('Test',t.subject);
    }
}