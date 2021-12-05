/*
 * Name                : Lockton Insurance
 * Class Name          : SanctionCheckSchedulableBatch
 * Description         :
 * Story               :
 * Created By          : Shatrughna Salunke
 * Created Date        : 8 April,  2021
 * Last Modified Date  : 8 April,  2021
 * Last Modified By    : Shatrughna Salunke
 */


global class SanctionCheckSchedulableBatch { //implements Database.Batchable<sObject>, Schedulable 

   /*
  String batchsize = LexisNexisSettings__c.getInstance().DefaultBatchSize__c;
  Integer defaultBatchSize = integer.valueof(batchsize);  
    
  global void execute(SchedulableContext sc) {
    Database.executeBatch(new SanctionCheckSchedulableBatch(), defaultBatchSize);
  }
  global Database.QueryLocator start(Database.BatchableContext bc) {
    Integer dailyBatchSize= Integer.valueOf(LexisNexisSettings__c.getInstance().DefaultBatchSize__c);
   
    String query = 'SELECT Id, Name, LatestSanctionCheck__c FROM Account WHERE Blocked__c = false AND IsPersonAccount = false AND (LatestSanctionCheck__c < THIS_MONTH OR LatestSanctionCheck__c = null) AND Owner.IsActive = true  ORDER BY LatestSanctionCheck__c ASC NULLS FIRST, LastModifiedDate DESC LIMIT :dailyBatchSize'; // : getRoundedUpValue';
    //String query = 'Select Id, Name, ,StageName From Opportunity WHERE StageName = \'Prospecting\' and Open_Tasks__c=0 and LastActivityDate__c >=12 ';
    return Database.getQueryLocator(query);
  }
  global void execute(Database.BatchableContext bc, List<Account> records) {
    Set<Id> AccountId = new Set<Id>();

    List<SanctionCheck__c> listofSanctionChecks = new List<SanctionCheck__c>();

    for (Account acc : records) {
      AccountId.add(acc.Id);
      SanctionCheck__c insertToChecks = new SanctionCheck__c();
      insertToChecks.Account__c = acc.Id;
      insertToChecks.Status__c = 'New';
      insertToChecks.Batch__c=true; 
      listofSanctionChecks.add(insertToChecks);
    }
    Database.insert(listofSanctionChecks, true);
  }
  global void finish(Database.BatchableContext bc) {
   // Database.executeBatch(new SanctionCheckSchedulableBatchCallout(), 100);
  }*/
}