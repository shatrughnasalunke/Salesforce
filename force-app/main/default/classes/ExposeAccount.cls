
@RestResource(urlMapping='/v1/accounts/*')
global with sharing class ExposeAccount {
    
    public ExposeAccount() {
        system.debug('Get Account Details');
    }
   
    /*@HttpGet
    global static List<Account> getAccounts() {
        return [SELECT Id,Name FROM Account] ;
    } */
   
    @HttpGet
    global static List<Account> getAccount() {

        RestRequest rest = RestContext.request;
        String accountType =  RestContext.request.params.get('type');
        String industryType  = RestContext.request.params.get('industry');
        return  [SELECT ID, Name, (SELECT Id, FirstName,Account.Name, LastName, Email FROM Contacts) FROM Account WHERE Type =: accountType AND industry =: industryType];
    }
   
    @HttpPost 
    global static void doInsert(){
    RestRequest rest = RestContext.request;
    String name = RestContext.request.params.get('name');
    String  branchType= RestContext.request.params.get('branch');
    List<Account> insertAccountList = new List<Account> ();
    String v1 = name; 
    String v2 = branchType;
    Account acc;
  
    if (!(String.isBlank(v1) && String.isBlank(v2))) {
                acc = new Account() ;
                acc.Name=v1;
                acc.shatrughna94__Branch_Type__c = v2;
                acc.Industry = 'Chemiclas';
               // acc.Type='Prospect';
                insertAccountList.add(acc);
     }   
  
     if(insertAccountList.size() > 0) {
         insert insertAccountList;
     }
  
    } 
}
