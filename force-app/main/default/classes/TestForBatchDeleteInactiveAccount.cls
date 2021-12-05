/**
     * @description       : 
     * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
     * @group             : 
     * @last modified on  : 04-04-2021
     * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
     * Modifications Log 
     * Ver   Date         Author                               Modification
     * 1.0   04-03-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
    **/
    @isTest
    public with sharing class TestForBatchDeleteInactiveAccount {

    public static testMethod  void getData() {
        
            Account acc =  new Account();
            acc.Name='TestName';
            insert acc;
    } 
}