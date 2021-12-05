/*
Compnay            : xxxxx
Name               : SFDX_All_Constant
Description        : Define all constant in one apex class and then access it from this
Created By Name    : Shatrughna Salunke
Careated Date      : 7,Jan 2021 
Last Modified  By  : Shatrughna Salunke
Last Modified Date : 7,Jan,2021
User Story Number  :  
*/
public with sharing class SFDX_All_Constant {
        
    /*Constant related to OpportunityController_Test Class*/

    public static final string  STAGE_NAME='Prospect';
    public static final Integer AMMOUNT=30;
    public static final Date    CurrentDate=Date.Today(); 

    /*Constatnt Related to Case Creation*/
    public static final string  SUBJECT='Match Found';
    public static final string  DESCRIPTION='Match Found';
    public static final string  NO_SUBJECT='NO Match Found';
    public static final string  NO_DESCRIPTION='NO Match Found';
    public static final string  STATUS='Closed';
    public static final string  ORIGIN='Phone'; 

    /*Constatnt Related to Account Trigger*/
     public static final string  CUSTOMER_NAME='Fraud';
     public static final boolean CONFIRMED_FRAUD=true;


     /*Constatnt  All Send Email Using  Apex Class*/
    public static final string SET_CONTENTTYPE='application/pdf';
    public static final string SETFILENAME='Fraud Case '+CurrentDate;

}