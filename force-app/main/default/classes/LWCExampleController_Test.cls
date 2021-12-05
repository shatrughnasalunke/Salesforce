/*
    Compnay Name        : xxxxx 
    Name                : LWCExampleController_Test 
    Description         : Test Class for LWCExampleController
    Created By          : Shatrughna Salunke
    Last Modified By    : Shatrughna Salunke
    Cretaed Date        : 6,Jan 2021
    Last Modifiied Date : 6,Jan 2021
    User Story No       :   
*/
@isTest
private class LWCExampleController_Test {
@testSetup static void setup() 
{
    List<Account> testAccts = new List<Account>();
    for(Integer i=0;i<2;i++) {
        testAccts.add(new Account(Name = 'TestAcct'+i));
    }
   // insert testAccts;
}
@isTest static void testMethod1() {
    Account acct = [SELECT Id FROM Account WHERE Name='TestAcct0' LIMIT 1];
    System.debug('acct--->'+acct);
    acct.Phone = '555-1212';
    update acct;
    System.debug('acct--->'+acct);
    Account acct2 = [SELECT Id FROM Account WHERE Name='TestAcct1' LIMIT 1];
    delete acct2;
}
@isTest static void testMethod2() {
    
    Account acct = [SELECT Phone FROM Account WHERE Name='TestAcct0' LIMIT 1];
    System.assertEquals(null, acct.Phone);

    Account acct2 = [SELECT Id FROM Account WHERE Name='TestAcct1' LIMIT 1];
    System.assertNotEquals(null, acct2);
 }
}