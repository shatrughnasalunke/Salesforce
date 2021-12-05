/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-04-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   04-04-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/


global class BatchToDeletePurgeRecord implements Database.Batchable<sObject> {

    global Database.querylocator start(Database.BatchableContext bc){
    string query  = 'Select Id, Name   from Account';
    System.debug('query-------->'+query);
    return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        Set <Id> AccountId  = new Set<Id>();
       
        for(Account acc : scope){
            AccountId.add(acc.Id);
        }
        List<Case> caseToDelete =[SELECT ID, AccountId FROM Case 
                                            WHERE AccountId IN :AccountId];

        List<Opportunity>  opportunityToDelete = [SELECT ID, AccountId FROM Opportunity
                                                      WHERE AccountId IN :AccountId];
    
        Database.delete(caseToDelete,false);
        Database.delete(opportunityToDelete,false);
        Database.delete(Scope,false);
    }
    global void finish(Database.BatchableContext bc){
       
        AsyncApexJob a = [SELECT a.TotalJobItems, a.Status, a.NumberOfErrors,
        a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById,
        a.CompletedDate FROM AsyncApexJob a WHERE id = :BC.getJobId()];
     }  
}