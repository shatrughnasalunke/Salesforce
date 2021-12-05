/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────
* Summary of this Class.
*
* Additional information:
* 			           This Class is used display all Appproved,Pending Approval and Rejeted Cases
*					   in component.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @modifiedBy     Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @maintainedBy   Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @version        1.0
* @created        4-March-2020
* @modified       4-March-2020
* ──────────────────────────────────────────────────────────────────────────────────────────────────
**/
public class ApprovalProcessOperation{
    @AuraEnabled
    public Static List<case> getApproved{get;set;}
    @AuraEnabled
    public Static List<case>  getPending{get;set;}
    @AuraEnabled
    public Static List<case>  getRjected{get;set;}
    @AuraEnabled
    public static List<case>  getApproved()
    {  
        getApproved=[Select caseNumber,Origin,Status,Owner.Name,Type,Subject,Description from case where Status='Approved' limit 10];  
        return getApproved; 
    }
    @AuraEnabled
    public static List<case>  pendingApprovalRecord()
    {
        getPending=[Select caseNumber,Origin,Status,Owner.Name,Type,Subject,Description from case  where Status='Pending Approval' ]; 
        return  getPending;
    }
    @AuraEnabled
    public static List<case>  getRejected()
    { 
        getRjected=[Select caseNumber,Origin,Status,Owner.Name,Type,Subject,Description from case  where Status='Rejected' limit 1]; 
	    return getRjected;
    }
}