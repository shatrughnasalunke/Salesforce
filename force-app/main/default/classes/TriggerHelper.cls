public with sharing class TriggerHelper {
    public TriggerHelper() {
    }
    public static void adminPrveillageForDelete(Map<Id,Task> mapOfOldValues) {
      shatrughna94__TaskCustomSettings__c currentUser = shatrughna94__TaskCustomSettings__c.getInstance(UserInfo.getProfileId());
      System.debug('currentUser--->'+currentUser);
       for (Task listofTask :  mapOfOldValues.Values()) {
            if (currentUser.shatrughna94__isLoggedInUserAdmin__c == false) {
                listofTask.addError('Only System Admin Can Delete The Task');
            }
       }   
    }
}