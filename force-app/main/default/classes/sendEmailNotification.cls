public class sendEmailNotification {
    public static void sendemail() {  
        String EmailId;
        Id OrgWideEAId;
        
        Lead leadIds = [SELECT  Id, Email FROM Lead Order by Email DESC limit 1];
        EmailTemplate emailTemplate = [SELECT Id, Subject, Description, HtmlValue, DeveloperName, Body 
                                            FROM EmailTemplate WHERE  Name = 'Test123' ];
        for(OrgWideEmailAddress owa : [SELECT Id, Address, DisplayName 
                                       FROM OrgWideEmailAddress]) {
                if(owa.DisplayName.contains('Medi')){
                EmailId = owa.Address;
                OrgWideEAId = owa.Id;
            }
        }
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setTargetObjectId(leadIds.id);
        message.setSubject('Sample Notification');
        message.setReplyTo(EmailId);
        message.setUseSignature(false);
        message.setOrgWideEmailAddressId(OrgWideEAId);
        //message.setBccSender(false);
        message.setSaveAsActivity(false); 
        message.setHtmlBody(emailTemplate.HtmlValue);
        message.setTemplateID(emailTemplate.Id); 
        message.toAddresses = new String[] {'shatrughnasalunkhe@gmail.com'};
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
       
        if (results[0].success)  {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ' +  results[0].errors[0].message);
        }
    }
}