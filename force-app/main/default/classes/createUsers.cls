public with sharing class createUsers {

    public shatrughna94__TestObjects__c user{get;set;}
    
    public createUsers() {
        user = new shatrughna94__TestObjects__c();
    }
    public PageReference saveDetails() {
        insert user;
        return null;
    }

}