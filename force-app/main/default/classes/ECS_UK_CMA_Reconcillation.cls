public with sharing class ECS_UK_CMA_Reconcillation {
    public ECS_UK_CMA_Reconcillation() {

    }
}
    /*
    
    global class ECS_UK_CMA_Reconciliation implements Database.Batchable<sObject>,Database.Stateful
    {   
        global integer total_files=0;
        global Set<ECS_UK_Content_Version__mdt> cma_miising_files=new Set<ECS_UK_Content_Version__mdt>();
        global List<ContentVersion> cma_extract_files=new List<ContentVersion>();
        global Database.QueryLocator start(Database.BatchableContext BC)
        {
            String searchKeyword='CMA_Extract_';
            datetime within24hrs=system.now()-1;
            //String query = 'SELECT ID, Title, VersionData FROM ContentVersion WHERE Title Like \'%'+searchKeyword+'%\' and createdDate >: within24hrs';
            String query = 'SELECT ID, Title, VersionData FROM ContentVersion WHERE createdDate >: within24hrs';
            return Database.getQueryLocator(query);
        }
        global void execute(Database.BatchableContext BC, List<ContentVersion> cma_extract_files)
        { 
            total_files+=cma_extract_files.size();
            //ECS_UK_CMA_Reconciliation__c Data
            List<ECS_UK_CMA_Reconciliation__c> cma_reconciliation =[SELECT Name, Id, ECS_UK_DIN__c, 
                                 ECS_UK_Screen_Type__c, ECS_UK_Experian_LAN_Id__c, ECS_UK_Agent_Name__c, 
                                 ECS_UK_Customer_Name__c, ECS_UK_Action_Type__c, ECS_UK_Action_Description__c 
                                                                             FROM ECS_UK_CMA_Reconciliation__c];
            
            List<ECS_UK_Content_Version__mdt> getContetnTitle=[Select Title__c from ECS_UK_Content_Version__mdt];
            Map<Id, ContentVersion> contentMap = new Map<Id, ContentVersion>((List<ContentVersion>) cma_extract_files);
            List<ContentVersion> cma_content_data = [SELECT Id, Title FROM ContentVersion WHERE ID IN 
                                                     :contentMap.keySet()
                                                     AND Title like'%CMA_Extract_%'];
            Integer count=0;
            for (ECS_UK_Content_Version__mdt meta_data : getContetnTitle)
            { 
                for (ContentVersion get_content_data : cma_content_data)
                {   
                    if(meta_data.title__c.contains(get_content_data.title))
                    {
                        //if(meta_data.title__c==get_content_data.title)
                    
                        System.debug('No Missing file');
                    }
                    else 
                    {
                        System.debug('Missing file');
                    }
                }
            }
        } 
        global void finish(Database.BatchableContext BC)
        {
            System.debug('Total CMA Files---->'+total_files);
            System.debug('Total Missing CMA File'+cma_miising_files.size());
        }        
    }
    
    */