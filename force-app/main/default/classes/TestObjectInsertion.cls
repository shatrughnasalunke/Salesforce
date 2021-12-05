public class TestObjectInsertion{

    public shatrughna94__TestObjects__c coll;

    public void insertCollage() {
        coll= [SELECT Name, shatrughna94__LastName__c FROM 
                        shatrughna94__TestObjects__c where id =: ApexPages.currentPage().getParameters().get('id')];
        system.debug('coll----->'+coll);                
    }
    public shatrughna94__TestObjects__c getcoll() {
        return coll;
    }
    public PageReference save() {
    
        upsert coll;
        PageReference pref = new ApexPages.StandardController(coll).view();
        return pref;
    }
}