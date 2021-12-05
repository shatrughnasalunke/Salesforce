@isTest
public with sharing class contactUtilityTest {
 
    @testSetup
    public static void contactTestData(){
        List<Contact> cclist = new List<Contact> ();
        for (integer i = 0; i < = 10; i ++) {
            Contact cc = new Contact();
            cc.firstName = 'Shatrughna'+i;
            cc.lastName='Salunke';
            cc.phone='9373735419';
            cc.email='shatrughna@gamil.com';
            cclist.add(cc);
        }
        insert cclist; 
    }
    @isTest
    static void sendEmailNotificationTest(){
    }
}