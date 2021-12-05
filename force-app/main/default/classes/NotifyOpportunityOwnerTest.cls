@isTest
public class NotifyOpportunityOwnerTest {
   
    static testMethod void testTriggerOpportunityDeleteNotiifcation(){
     
      Account getaccount = TestUtility.createAccount();
      system.assertEquals('Test Account', getaccount.Name);
      system.assertEquals('Test Account', getaccount.Name, 'Success');
      system.assertNotEquals('Test Account1', getaccount.Name, 'Success Message'); 
    }
}