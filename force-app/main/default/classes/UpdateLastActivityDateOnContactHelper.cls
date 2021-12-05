/*
* Name               : 
* Class Name         : UpdateLastActivityDateOnContactHelper
* Description        : 
* Story Number       :
* Created By         : Shatrughna Salunke.
* Created Date       : 18 March, 2021
* Last Modified Date : 18 March, 2021
* Last LModified By   :
*/
public class UpdateLastActivityDateOnContactHelper {
    
       /*public static void updateLastActivityDateOnContact(Map<Id, Contact> contactMapOld, Map<Id, Contact> contactMapNew){
        Profile p = [SELECT Id, Name FROM Profile WHERE Id =: Userinfo.getProfileid()];
        LocktonPurgeDataSettings__c settings =LocktonPurgeDataSettings__c.getOrgDefaults();
        if (p.Name.equals(settings.Lockton_System_Admin__c) || System.isBatch() ){
            // The current user is a sys admin, or this is a batch process
            // so for each contact being updated, we need to revert the LastActivityDate__c 
            // back to what it was before this before update was called
            for (Contact c : contactMapNew.values()){
                Contact oldContact = contactMapOld.get(c.Id);
                c.LastActivityDate__c = oldContact.LastActivityDate__c;
            }
        }
         else{
            for ( Contact c : contactMapNew.values() ){
                 c.LastActivityDate__c = Date.Today(); 
            }
        }
    }*/
}