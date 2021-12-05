public class BroadCastMessage {
    @AuraEnabled(Cacheable=True)
    public static List<shatrughna94__Broadcast__c> broadCaseMessage() {
        Date getToday=Date.Today();
        Date oneDayBefore = Date.Today().addDays(1);
        List<shatrughna94__Broadcast__c> listOfBroadCast = new List<shatrughna94__Broadcast__c>();
        Map<Id, shatrughna94__Broadcast__c> mapOfBroadCast = new Map<Id,shatrughna94__Broadcast__c> ([SELECT ID, shatrughna94__DATE__c,shatrughna94__Active__c, shatrughna94__HOLIDAY__c 
                                                                                                      FROM shatrughna94__Broadcast__c]);
        for (shatrughna94__Broadcast__c getMessage:mapOfBroadCast.Values() ) {
            if (getMessage.shatrughna94__Active__c==True) {
                if  (getMessage.shatrughna94__DATE__c == oneDayBefore || getMessage.shatrughna94__DATE__c==getToday) {
                    listOfBroadCast.add(getMessage);  
                }
            }
        }
        return listOfBroadCast;
    }
    
}