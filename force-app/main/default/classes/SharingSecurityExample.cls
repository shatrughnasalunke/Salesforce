public class SharingSecurityExample {
    @AuraEnabled 
    public static List<shatrughna94__TestObjects__c> fetchRecords(){
        return [SELECT Name, shatrughna94__LastName__c
                  								FROM shatrughna94__TestObjects__c];
    }
}