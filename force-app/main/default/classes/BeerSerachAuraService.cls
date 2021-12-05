/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────
* Summary of this class.
*
* Additional information:
* 			This class is used to display beer details when user enter beer name in search bar in 
* 			lightning component.This "searchBeer()" method returns the list of beer detils.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @modifiedBy     Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @maintainedBy   Shatrughna V. Salunke   <shatrughnasalunkhe@gmail.com>
* @version        1.0
* @created        4-March-2020
* @modified       4-March-2020
* ──────────────────────────────────────────────────────────────────────────────────────────────────
**/
public without sharing class BeerSerachAuraService 
{
@AuraEnabled
public static List<sObject> searchBeer(String searchParam){

    String likeParam ='%'+searchParam+'%';
    String query ='';
    if(searchParam!=null){
        query='SELECT Id, IsDeleted, CreatedDate, Name, LastModifiedDate,SystemModstamp, shatrughna94__Tags__c, shatrughna94__Alcohol__c, shatrughna94__Id__c, shatrughna94__brewery_Name__c, shatrughna94__Image__c, shatrughna94__Total_Quantity__c, shatrughna94__Remaining_Quantity__c FROM shatrughna94__Beer__c where name like:likeParam limit 50';  
    }   
    else {
        query='SELECT Id, IsDeleted,CreatedDate,Name,LastModifiedDate,SystemModstamp, shatrughna94__Tags__c, shatrughna94__Alcohol__c, shatrughna94__Id__c, shatrughna94__brewery_Name__c, shatrughna94__Image__c, shatrughna94__Total_Quantity__c, shatrughna94__Remaining_Quantity__c FROM shatrughna94__Beer__c limit 50';  
    }    
  
    List<sObject> sObjectList=Database.query(query);
    System.debug('sObjectList------------->'+sObjectList);
    return sObjectList;
}    
}