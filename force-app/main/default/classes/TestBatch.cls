global class TestBatch implements Database.Batchable<SObject>, Database.Stateful
{
    global set<id> allfailedcases=new set<id>();
    global set<id> allsuccessid=new set<id>();
    global integer totalcases=0;
    @TestVisible static Integer testCount;
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
         System.debug('Shatrughna Salunke--->');
        List<case> caseListadat=[Select id,casenumber, Subject,origin From Case WHERE Origin='web' and Subject =null];
        system.debug('Data------->'+caseListadat.size());
        String query = 'Select  Subject,origin From Case WHERE Origin=\'web\' and Subject =null ';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Case> scope)
    {
        System.debug('scope--->'+scope);
        System.debug('list to be case size  :: ' + scope.size());
        if(!scope.isEmpty())
        {  
            totalcases+=scope.size();
            List<case> caselist = new List<case>();
            for(Case a : scope){
                caselist.add(a);
            }
            Database.DeleteResult[] dqccase = Database.delete(scope, false);
            for(Integer i=0; i < dqccase.size(); i++) {
                if(dqccase.get(i).isSuccess()) {
                    System.debug('Records are deleted  Successfully');
                    allsuccessid.add(dqccase.get(i).Id);
                } 
                else if(!dqccase.get(i).isSuccess())
                {
                    Database.Error errors =  dqccase.get(i).getErrors().get(0);
                    System.debug('Error Occurs While Processing The Record'+errors.getMessage());
                    allfailedcases.add(caselist.get(i).Id);
                }
            }         
        }      
    }
    global void finish(Database.BatchableContext BC)
    {
        system.debug('All failed DQC case----> ' +allfailedcases);
        system.debug('All success DQC cases---> ' +allsuccessid.size());
        system.debug('Total number of DQC cases---> '+totalcases);
        testCount=totalcases;
    }
    
    /*
     ECS_UK_EinsteinBotCancellationProce_Idn
		ECS_UK_ChatbotCancellationProce_Idn_Test

    Post deplyment steps:
 
Note 1: Need to assign permission set  to  deployed  apex class 


Permission Sets Name 
sfdc.chatbot.service.permset


    */
   
}