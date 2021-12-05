/*
 Compnay Name        : xxxxx 
 Name                : LWCExampleController 
 Description         : Create account using lwc  
 Created By          : Shatrughna Salunke
 Last Modified By    : Shatrughna Salunke
 Cretaed Date        : 6,Jan 2021
 Last Modifiied Date : 6,Jan 2021
 User Story No       :   
*/
public inherited sharing class LWCExampleController {
    @AuraEnabled
    public static void saveAccountRecord(Account objAcc){
        try{
            insert objAcc;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}