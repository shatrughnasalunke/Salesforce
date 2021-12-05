public inherited sharing class DisplayContactOnAccountSelController {
    
    public list<AccountContactWrapper> lstAccountContactWrapper { get; set; }
    public list<AccountContactWrapper> lstSelectedAccountContactWrapper { get; set; }
    public list<account> selectedAccounts{get;set;}   
    public DisplayContactOnAccountSelController () {
        lstSelectedAccountContactWrapper = new list<AccountContactWrapper>();
        if(lstAccountContactWrapper == null) {
            lstAccountContactWrapper = new list<AccountContactWrapper>();
            for(account a:[select id,name,industry, (select id,name from contacts) from account ]) {
                lstAccountContactWrapper.add(new AccountContactWrapper(a));
            }
        }
    }
    public void ProcessSelected() {
        lstSelectedAccountContactWrapper =new list<AccountContactWrapper>();
        selectedAccounts =new list<Account>();
        for(AccountContactWrapper wrapobj:lstAccountContactWrapper){
            if(wrapobj.isSelected==true) {
                selectedAccounts.add(wrapobj.acc);
            } 
        }
        for(Account acc:[select id,name,(select id,name from contacts) from account where id in:selectedAccounts]) {
            lstSelectedAccountContactWrapper.add(new AccountContactWrapper(acc)); 
        }
    }
    public with sharing class AccountContactWrapper {
        
        public Account acc {get;set;}
        public boolean isSelected {get;set;}
        
        public AccountContactWrapper(account a) {
            acc = a;
            isselected=false;
        }
    }
    
}