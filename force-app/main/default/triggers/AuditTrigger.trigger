/**
 * @description       : 
 * @author            : Shatrughna.Salunke
 * @group             : 
 * @last modified on  : 21-05-2021
 * @last modified by  : Shatrughna.Salunke
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   21-05-2021   Shatrughna.Salunke   Initial Version
**/
trigger AuditTrigger on Audit__c (After Insert,AFTER Update) {
    
    Switch On Trigger.OperationType {
        When BEFORE_INSERT {

        }
        When AFTER_INSERT{
            
             //GenerateReport.GenerateReportFromTrigger(Trigger.new);
        }
        When AFTER_UPDATE{
            // GenerateReport.GenerateReportFromTrigger(Trigger.new);
        }
        
        WHEN BEFORE_UPDATE  {

        }
        WHEN BEFORE_DELETE {
         
        }
    }
}