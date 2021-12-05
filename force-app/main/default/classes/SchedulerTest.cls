@isTest
Private class SchedulerTest {
         static testmethod void test()
         {
            Test.StartTest();
            TestSchdeule testsche = new TestSchdeule();
            String sch = '0 0 23 * * ?';
            system.schedule('Test status Check', sch, testsche );
            Test.stopTest();
        }
        
}