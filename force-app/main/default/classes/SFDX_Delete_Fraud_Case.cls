/*
Compnay            : xxxxx
Name               : SFDX_Delete_Fraud_Case
Description        : Future method for delete fraud cases
Created By Name    : Shatrughna Salunke
Careated Date      : 7,Jan 2021 
Last Modified  By  : Shatrughna Salunke
Last Modified Date : 7,Jan,2021
User Story Number  :  
*/
public with sharing class SFDX_Delete_Fraud_Case {
    public static list<Case> deletecaselist;
    public SFDX_Delete_Fraud_Case()
    {
        deletecaselist=new list<Case>();
    }
    @Future
    public static void deleteFraudCase(List<Id> casids)
    {
      deletecaselist=[select id,AccountId from case where AccountId=:casids];
      try 
        {
          
          if(deletecaselist.size()>0 && deletecaselist!=null && !deletecaselist.isEmpty())
          {    
                delete deletecaselist;
                string emailto=System.Label.Email_Fraud_Cases;
                string emailCC=System.Label.Email_Fraud_Cases_cc_Addresses;
                string emailSubject='Fraud case has been deleted__'+SFDX_All_Constant.CurrentDate;
                string setContentType=SFDX_All_Constant.SET_CONTENTTYPE;
                String emailBody='Test Email Please Ignore';
                string setFileName=SFDX_All_Constant.SETFILENAME;
             //   SFDX_Send_Email_Using_Apex_Class.sendEmail(emailto,emailCC,emailSubject,emailBody,setContentType,setFileName);
          }
        }
        catch (Exception e) {
                string emailto=System.Label.Email_Fraud_Cases;
                string emailCC=System.Label.Email_Fraud_Cases_cc_Addresses;
                string emailSubject='Error has occurred'+SFDX_All_Constant.CurrentDate;
                string setContentType=SFDX_All_Constant.SET_CONTENTTYPE;
                string emailBody=e.getMessage();
                string setFileName=SFDX_All_Constant.SETFILENAME;
               // SFDX_Send_Email_Using_Apex_Class.sendEmail(emailto,emailCC,emailSubject,emailBody,setContentType,setFileName);

      }
    }
}