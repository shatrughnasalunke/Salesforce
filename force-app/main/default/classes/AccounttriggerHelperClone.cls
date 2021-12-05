public class AccounttriggerHelperClone {
    public static void createContactWhenAccountisCreated (List<Account> listOfaccount) {
        //Create account whic not associated with account
        Set<Id> accountIds = new Set<Id>();
        List<Contact> cclist = new List<Contact>();
        contact c ;
        for (Account acc : listOfaccount) {
          cclist.add(new Contact(FirstName='Before Insert contact',lastName='salunke'));  
        }
        insert cclist;
    }
    public static void preventAccountUpdateTo (Map<Id, Account> newMap, Map<Id, Account> oldMap) {
        for (Account acc : newMap.Values()) {
            if (acc.NumberOfEmployees != oldMap.get(acc.Id).NumberOfEmployees 
                							&& acc.NumberOfEmployees == 30 ) {
               acc.addError('Number of employee should be less than 30');
            }
        }
    }
    public static void createContatcassociatedWithAccount(Map<Id, Account> newMap) {
        List<Contact> insertContatcList = new list<Contact>();
        Set<Id> accountId = new Set<Id>(newMap.keySet());
        for (Id acc : accountId){
            insertContatcList.add(new Contact(FirstName='AfterInsert_shatrughna',lastName='salunke', AccountId = acc));
        }
        insert insertContatcList;
    }
    public static void addPrefixNamewhenAccountCreated(List<Account> acclistOfAccount){
        for (Account acc : acclistOfAccount) {
              acc.Name ='Dr'+acc.Name;
        }
    }
    public static void UpdateContatcstatus(Map<Id, Account> newMap) {
        Set<Id> accountIds = new Set<Id>(newMap.keySet());
        Contact cc  ;
        List<Contact> cclist = new List<Contact>();
        for(Account acc : [SELECT Id,Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id IN : accountIds]) {
            if (acc.Contacts!=null) {
                if (acc.Name ==null) {
                    cc = new Contact();
                    cc.AccountId = acc.id;
                    cc.FirstName ='Updated';
                    cclist.add(cc);
                }
            }
        }
        update cclist;
    }
    public static void beforeUpdateDmlOperation(Map<Id, Account> newMap) {
       List<Account> acclist = new List<Account>();
       for (Account acc : newMap.Values()) {
             acc.Name = 'After Update';
        }
        update acclist;
    }
    public static void insertRecordOnAccountClone(List<Account> acc) {
        List<Id> accountId = new List<Id> ();
        for (Account acclist :acc ) {
            accountId.add(acclist.Id);
        }
        system.debug(accountId);
        insertRecordOnAccount(accountId);
    }
    @future
    public static void insertRecordOnAccount(List<Id> acc) {
        List<Account>  accList = new List<Account> ();
        for (Id getnewAccount : acc ) {
            accList.add(new Account(Name='Future Method Example'));
        }
        system.debug('accList--->'+accList);
        if (!accList.isEmpty()) {
            system.debug('accList--->'+accList);
            insert accList;
        }
    }
    @future(callout = true)
    public static void notifyExternalSystem(String Ids) {
       system.debug('acc');
    }
    
}