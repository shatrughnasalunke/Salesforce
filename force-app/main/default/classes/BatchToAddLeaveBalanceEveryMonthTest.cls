@isTest
public class BatchToAddLeaveBalanceEveryMonthTest {
      
        public static testMethod void  TestBatchForAddLeavBalanceBatch() {
        List<shatrughna94__LeaveManagement__c> getLeaveMgData = TestUtility.createLeaveBalance(50);
        
        Test.startTest();
          database.executeBatch(new BatchToAddLeaveBalanceEveryMonth(),200);
        Test.stopTest();
        
        system.assertEquals(50, getLeaveMgData.size());
        system.assertNotEquals(2, getLeaveMgData.size());
    }
}