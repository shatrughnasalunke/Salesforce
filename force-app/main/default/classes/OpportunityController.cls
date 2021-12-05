/*
Compnay            : xxxxx
Name               : OpportunityController
Description        : Delete opportunity by using lightning web component
Created By Name    : Shatrughna Salunke
Careated Date      : 7,Jan 2021 
Last Modified  By  : Shatrughna Salunke
Last Modified Date : 7,Jan,2021
User Story Number  :  
*/
public with sharing class OpportunityController {
    public OpportunityController() {
    }
    @AuraEnabled(cacheable=true)
    public static List<opportunity> fetchOpportunityList(){
        try {
            return [select Id, Name, StageName,Amount From Opportunity limit  5];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void deleteOpportunities(List<opportunity> oppList){
    try {
        Map<String,Opportunity> getMap=new Map<String,Opportunity>();
        List<Id> accId=new List<Id>();
        for (Opportunity currentContact : oppList) {
            getMap.put(currentContact.AccountId,currentContact);
            accId.add(currentContact.AccountId);
        }
        deleteAccount(getMap.keySet());
        delete oppList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @future 
    public static void deleteAccount(Set<String> ids) 
     {
     try {
                List<Account> acclIst=[Select id, (select id, name from contacts), name from Account];
                List<Case> cclist=new List<Case>();
                Map<String,Account> mapAccount=new Map<String,Account>();
                Map<Id, List<Contact>> ContactMap = new Map<Id, List<Contact>>();
                for(Account getopp:acclIst)
                {
                    mapAccount.put(getopp.Id , getopp);
                    List<Contact> cc=getopp.getSobjects('Contacts');
                    ContactMap.put(getopp.Id,cc);
                }
                for(Id getAccountId:ids)
                {     
                    List<contact> getName=ContactMap.get(getAccountId);
                    if(mapAccount.containsKey(getAccountId) && getName[0].shatrughna94__Check__c==true)
                    { 
                        Case cc=new Case();
                        cc.subject=SFDX_All_Constant.SUBJECT;
                        cc.Description=SFDX_All_Constant.DESCRIPTION;
                        cc.status=SFDX_All_Constant.status;
                        cc.origin=SFDX_All_Constant.ORIGIN;
                        cclist.add(cc);
                    }
                    else 
                    {
                        Case cc=new Case();
                        cc.subject=SFDX_All_Constant.NO_SUBJECT;
                        cc.Description=SFDX_All_Constant.NO_DESCRIPTION;
                        cc.status=SFDX_All_Constant.status;
                        cc.origin=SFDX_All_Constant.ORIGIN;
                        cclist.add(cc);
                    }
                } 
                insert cclist;
        }
        catch (Exception e) 
        {
            
        } 
        finally 
        {
            
        }
    }

}