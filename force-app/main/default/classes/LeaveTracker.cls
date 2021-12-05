public class LeaveTracker {
    @AuraEnabled
    public static List<String> getPickList(String objName,String fldName) {
        List<String> pkList = new List<String>();
        Map<String,Schema.SObjectType> allObj = Schema.getGlobalDescribe();
        Map<String,Schema.SObjectField> allFlds = allObj.get(objName).getDescribe().fields.getMap();
        List<Schema.PicklistEntry> pickList = allFlds.get(fldName).getDescribe().getPickListValues();
       
        for(Schema.PicklistEntry pk : pickList){
            pkList.add(pk.getValue());
        }
        return pkList;
    }
    @AuraEnabled
    public static List<String> getLevaeType(String objName,String leaveType) {
        List<String> pkList = new List<String>();
        Map<String,Schema.SObjectType> allObj = Schema.getGlobalDescribe();
        Map<String,Schema.SObjectField> allFlds = allObj.get(objName).getDescribe().fields.getMap();
        List<Schema.PicklistEntry> pickList = allFlds.get(leaveType).getDescribe().getPickListValues();
        for(Schema.PicklistEntry pk : pickList){
            pkList.add(pk.getValue());
        }
        return pkList;
    }
    @AuraEnabled
    public static List<shatrughna94__LeaveManagement__c> getLeaveBalance(Id userId) {
     
        system.debug('userId--->'+userId);
        return [SELECT Id, shatrughna94__Contact__r.Name, shatrughna94__From__c, Name ,
                                    shatrughna94__LeaveType__c, shatrughna94__SickLeave__c, shatrughna94__To__c, 
                                    shatrughna94__Type__c, shatrughna94__VacationLeave__c, shatrughna94__Manager__r.Name FROM
                                    shatrughna94__LeaveManagement__c WHERE 
                                    shatrughna94__Contact__c = : userId Limit 1];
    }
    
    @AuraEnabled 
    public static Map<String, shatrughna94__publicHoliday__c> publicHoliday() {
        
        Map<String, shatrughna94__publicHoliday__c>
                                    mapOfHolidays = shatrughna94__publicHoliday__c.getAll();
        system.debug(mapOfHolidays);
        return mapOfHolidays;
    }
    
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
       
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        List <sObject> returnList = new List < sObject > ();
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'SELECT Id, Name from ' +ObjectName + ' WHERE Name LIKE: searchKey Order By createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    
    @AuraEnabled
    public static Account createAccount(Account ac){
        insert ac;
        return ac;
   } 
}