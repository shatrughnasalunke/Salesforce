/*
Compnay            : xxxxx
Name               : SFDX_CSVFileReadLWCCntrl
Description        : Import records using Lighting Web Component?
Created By Name    : Shatrughna Salunke
Careated Date      : 9,Jan 2021 
Last Modified  By  : Shatrughna Salunke
Last Modified Date : 9,Jan,2021
User Story Number  :  
*/

public with sharing class SFDX_CSVFileReadLWCCntrl {
    @AuraEnabled
    public static list<Account> csvFileRead(Id contentDocumentId){
        list<Account> accountInsertList = new list<Account>();
        if(contentDocumentId != null) {
            
            // Fetch File Data based on the basic of document id 
            ContentVersion contentVersionObj = [SELECT Id, VersionData FROM ContentVersion WHERE ContentDocumentId =:contentDocumentId];
            // split the file data
            list<String> csvRecordsList = contentVersionObj.VersionData.toString().split('\n');

            for(Integer i = 1; i < csvRecordsList.size(); i++){
                Account accountObj = new Account();
                list<String> csvRowData = csvRecordsList[i].split(',');
                System.debug('csvRowData====> '+csvRowData);
                accountObj.Name = csvRowData[0]; // accName
                accountObj.AccountSource = csvRowData[1];
                accountObj.Site = csvRowData[2];
                accountObj.Type = csvRowData[3];
                accountObj.Website = csvRowData[4];
                accountInsertList.add(accountObj);
            }

            try{    
                if(!accountInsertList.isEmpty()) {
                    insert accountInsertList;
                }
            }
            catch (Exception ex) {
                throw new AuraHandledException(ex.getMessage());
            } 
        }
        return accountInsertList;    
    }
}