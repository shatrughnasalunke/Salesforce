/*
Compnay            : xxxxx
Name               : SFDX_Send_Email_Using_Apex_Class
Description        : Send Email Using Apex Class Comman Class For All 
Created By Name    : Shatrughna Salunke
Careated Date      : 7,Jan 2021 
Last Modified  By  : Shatrughna Salunke
Last Modified Date : 7,Jan,2021
User Story Number  :  
*/
public with sharing class EmailUtility {
   /* string emailto='shatrughna.salunkhe@gmail.com,shatrughna.salunke@cognizant.com';
    string emailCC='shatrughna.salunkhe@gmail.com,shatrughna.salunkhe@cognizant.com';
    string emailSubject='Test Data';
    string setContentType='application/pdf';
    String emailBody='Test Email Please Ignore';
    string setFileName='My Body';*/
    //SFDX_Send_Email_Using_Apex_Class.sendEmail(emailto,emailCC,emailSubject,emailBody,setContentType,setFileName);

    public static  Boolean sendEmail(/*String emailTo, String emailCC, String emailSubject, 
                                     String emailBody,String setContentType,String setFileName*/){
      
         string emailto='shatrughna.salunkhe@gmail.com,shatrughna.salunke@cognizant.com';
    string emailCC='shatrughna.salunkhe@gmail.com,shatrughna.salunkhe@cognizant.com';
    string emailSubject='Test Data';
    string setContentType='application/pdf';
    String emailBody='Test Email Please Ignore';
    string setFileName='My Body';                                 
                                         
        List<OrgWideEmailAddress> lstOrgWideEmailId = [SELECT Id, DisplayName, IsAllowAllProfiles, 
                                                       Address FROM OrgWideEmailAddress];
                                         
        system.debug('emailto--->'+emailTo);                                 
        String orgWideEmailAddressID;
        Boolean isSuccess = false;       
        Blob body = Blob.valueOf(emailBody);
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.setContentType(setContentType);
        attach.setFileName(setFileName);
        attach.setInline(false);
        attach.Body = body;
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setUseSignature(false);
        String[] toAddresses = new String[]{};
        for(String emailId:emailTo.split(',')) {
            if(emailId != null && emailId !=''&& emailId != ' '){
                toAddresses.add(emailId.trim());
            }
        }
        mail.setToAddresses(toAddresses);
        String[] ccAddresses = new String[]{};
        for(String emailId:emailCC.split(',')) {
            if(emailId != null && emailId !=''&& emailId != ' '){
                ccAddresses.add(emailId);
            }
        }
        mail.setCCAddresses(ccAddresses);
        mail.setSubject(emailSubject);
        mail.setPlainTextBody((emailBody==null?'This email body is empty':emailBody));
        mail.setHtmlBody('<h1>Dear Shatrughna Salunke</h1>');
        if(lstOrgWideEmailId.size() == 0) {
        }
        else {
                orgWideEmailAddressID = lstOrgWideEmailId[0].id;    
        }
        //mail.setOrgWideEmailAddressId(orgWideEmailAddressID);
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach });
        try  {
                List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });  
                if(results[0].success) {
                        isSuccess = TRUE;
                }
                else {
                      isSuccess = FALSE;
                }
        } 
        catch(Exception ex) {
                isSuccess = FALSE;
        }
    return isSuccess;
    }
}