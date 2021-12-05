/*
Compnay            : xxxxx
Name               : AccountTriggerHandlerHelper
Description        : helper class for trigger account object
Created By Name    : Shatrughna Salunke
Careated Date      : 7,Jan 2021 
Last Modified  By  : Shatrughna Salunke
Last Modified Date : 7,Jan,2021
User Story Number  :  
*/
public with sharing class AccountTriggerHandlerHelper {

        public static void beforeInsert() {

        }
        public  static void beforeUpdate() {

        }
        public  static void afterInsert() {
            
        }
        public  static void afterUpdate(List<Account> acc) {
            System.debug('acc-----'+acc);
            List<Id> accId=new List<Id>();
            for(Account acclist:acc) {
                accId.add(acclist.Id);
            }
            SFDX_Delete_Fraud_Case.deleteFraudCase(accId);
        }
}