public class DisplayTestObject {
    public List<shatrughna94__TestObjects__c> records {get; set;}
    public DisplayTestObject() {
     records =[SELECT Name, shatrughna94__LastName__c 
              				FROM shatrughna94__TestObjects__c];
     system.debug('records-->'+records);
  }
}