global class BatchToAddLeaveBalanceEveryMonth Implements Database.Batchable<sObject>, Schedulable {
    
    global void execute(SchedulableContext sc) {
        
        Id jobId = database.executeBatch(new BatchToAddLeaveBalanceEveryMonth(), 200);
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        String query = 'SELECT Id,shatrughna94__SickLeave__c,shatrughna94__Active__c,shatrughna94__VacationLeave__c FROM shatrughna94__LeaveManagement__c';
        return Database.getQueryLocator(query);
    }
    
    global void execute (Database.BatchableContext sc, List<shatrughna94__LeaveManagement__c> listofLeave) {
        
        Map<String, shatrughna94__LeaveBalance__c>
       						 leaveBalanceSettings = shatrughna94__LeaveBalance__c.getAll();
        List<shatrughna94__LeaveManagement__c> 
         				     insertToLeaveManagement = new List<shatrughna94__LeaveManagement__c> (); 
       
        for (shatrughna94__LeaveManagement__c leaveBalance : listofLeave ) {
            if (leaveBalance.shatrughna94__Active__c ==  True) {
                leaveBalance.shatrughna94__VacationLeave__c = leaveBalanceSettings.Values().shatrughna94__VacationBalance__c;  
                leaveBalance.shatrughna94__SickLeave__c = leaveBalanceSettings.Values().shatrughna94__SickLeave__c;
                insertToLeaveManagement.add(leaveBalance);
            }
        }
        
        if (!insertToLeaveManagement.isEmpty()) {
            update insertToLeaveManagement;
        }
    }   
    global void finish (Database.BatchableContext sc) {
        
    }                         
}