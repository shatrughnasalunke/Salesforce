public class NotifyOpportunityOwner {
   
    public static void notifyOpportunityOwnerWhenOpportunityDeleted (Map<Id,Opportunity> mapOfOpportunity) {
    
        Profile p = [SELECT Id, Name FROM Profile 
                     				 WHERE Id =: Userinfo.getProfileid()];
        shatrughna94__OpportunitySettings__c settings =shatrughna94__OpportunitySettings__c.getOrgDefaults();
        set<Id> accountId = new set<Id> ();
        
        for (Opportunity opp : mapOfOpportunity.Values()) {
            
            if (opp.accountId != NUll && !p.Name.Equals(settings.shatrughna94__SystemAdmin__c) ) {
                		accountId.add(opp.accountId);
           }
        }
        
        if (!accountId.isEmpty()) {
            Account acc = [SELECT Id, Owner.Email FROM Account 
                           					      WHERE Id IN : accountId Limit 1] ;
            if (acc!= null) {
                notifyAccountOwner(acc.Owner.Email);
            }
        }
    }
    
    public static void notifyAccountOwner (String ownerEmail) {
        String emailSubject ='Opportunity has been deleted';
        String emailBody = 'Opportunity Delete successfuly';
        String setContentType = 'application/csv';
        String setFileName = 'Opportunity';
        if (ownerEmail!= null &&  ownerEmail!='') {
             EmailUtility.sendEmail(ownerEmail, ownerEmail,  emailSubject, 
                                      emailBody, setContentType, setFileName); 
        }    
    }
}