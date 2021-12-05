global class TestSchdeule implements Schedulable {
   global void execute(SchedulableContext sc) {
      TestBatch b = new TestBatch(); 
      database.executebatch(b,500);
   }
}

/*
@isTest
public class ECS_UK_Delete_Redundant_DQC_Case_Test {
    static testmethod void dqcCaseTest() 
    {   
        List<Case> dqc_caselist=new List<Case>();
        for (Integer i=0;i<10;i++) {
            Case newcase = new Case(ECS_UK_Type__c='DQC Query',ECS_UK_DQC_Reference_Number__c=null);
            dqc_caselist.add(newcase);
        }
        insert dqc_caselist;
        Test.startTest();
            ECS_UK_Delete_Redundant_DQC_Case batch = New ECS_UK_Delete_Redundant_DQC_Case();
            //Database.QueryLocator ql = batch.start(null);
           // batch.execute(null,dqc_caselist);
            //batch.Finish(null);
            Database.executebatch(batch);
        Test.stopTest();
    }
    
*/