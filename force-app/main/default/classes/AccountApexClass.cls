public class AccountApexClass {
    List<Account> accList{get;set;}
    AccountApexClass() {
         accList=[Select id,Name FROM Account];
         system.debug('accList--->'+accList);
    }
      
}