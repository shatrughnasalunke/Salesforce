/*
Compnay            : xxxxx
Name               : OpportunityController_Test
Description        : Delete opportunity by using lightning web component test apex class
Created By Name    : Shatrughna Salunke
Careated Date      : 7,Jan 2021 
Last Modified  By  : Shatrughna Salunke
Last Modified Date : 7,Jan,2021
User Story Number  :  
*/
@isTest
public with sharing class OpportunityController_Test {
    
   private static testMethod void  methodName(){
   list<opportunity> oppList=new List<opportunity>();
     for(integer i=0;i<2;i++)
       {
        opportunity getInsert=new opportunity();
        getInsert.Name='Test';
        getInsert.StageName=SFDX_All_Constant.STAGE_NAME;
        getInsert.Amount=SFDX_All_Constant.AMMOUNT;
        getInsert.closeDate=SFDX_All_Constant.CurrentDate;
        oppList.add(getInsert);
    }
    insert oppList;
        Test.startTest();
        OpportunityController.deleteOpportunities(oppList);
        Test.stopTest();
    } 

}