@isTest
public with sharing class LeadHelperTest {
      @TestSetup
      static void leadTestData(){
        Lead doInsert = new Lead(FirstName ='Shatrughna',LastName='Salunke',
                        Company='Accenture',LeadSource='WEB');
       // Lead l1 = doInsert;
        insert doInsert;
      }  
      @isTest()
      public static  void  cloneTriggerTest() {
        List<Lead> v1 = [SELECT Id, FirstName FROM Lead WHERE FirstName  =  'Shatrughna' limit 1];
        List<Lead> getLead = v1;
        String v2 = 'Size should have atleast one recod';
        System.assertEquals('Shatrughna', getLead[0].FirstName,v2);      
    }
}


