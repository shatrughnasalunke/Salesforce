public class mybatchclass
{
/*global class ECS_UK_Delete_Redundant_DQC_Case implements Database.Batchable<sObject>,Database.Stateful
{
    global set<id> failedcases=new set<id>();
    global set<id> successid=new set<id>();
    global integer totalcases=0;
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'Select Id, RecordType.Name,Type,Subject,ECS_UK_Type__c,ECS_UK_DQC_Reference_Number__c From Case WHERE ECS_UK_Type__c =\'DQC Query\' and RecordType.Name=\'ECS UK DQC\' and ( ECS_UK_DQC_Reference_Number__c=null or  ECS_UK_DQC_Reference_Number__c= \'\') limit 5 ';
        system.debug('query'+query);
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Case> dqc_cases)
    {
        System.debug('dqc_cases--->'+dqc_cases);
        System.debug('dqc_cases--->' + dqc_cases.size());
        if(!dqc_cases.isEmpty())
        {  
            totalcases+=dqc_cases.size();
            List<case> caselist = new List<case>();
            for(Case a : dqc_cases){
                caselist.add(a);
            }
            Database.DeleteResult[] dqccase = Database.delete(dqc_cases, false);
            for(Integer i=0; i < dqccase.size(); i++) {
                if(dqccase.get(i).isSuccess()) {
                    successid.add(dqccase.get(i).Id);
                } 
                else if(!dqccase.get(i).isSuccess())
                {
                    Database.Error errors =  dqccase.get(i).getErrors().get(0);
                    failedcases.add(caselist.get(i).Id);
                }
            }         
        }      
    }   
    global void finish(Database.BatchableContext BC)
    {
        System.debug('Inside finish method');
        System.debug('All failed DQC case----> ' +failedcases.size());
        System.debug('All success DQC cases---> ' +successid.size());
        System.debug('Total number of DQC cases---> '+totalcases);
    }
}*/
}