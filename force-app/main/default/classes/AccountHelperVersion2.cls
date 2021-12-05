public with sharing class AccountHelperVersion2 {
    public AccountHelperVersion2() {
    }
    public static void cloneBillingAddressToShippingAddress(List<Account> newListOfAccount)  {
        List<Account> listofAccount = new List<Account> ();
        Account acc ;  
        for (Account getAccount :  newListOfAccount) {
            acc = new Account();
             acc.Name = getAccount.Name+'Clone';
             acc.ShippingState = getAccount.BillingState; 
             acc.ShippingPostalCode = getAccount.BillingPostalCode ; 
             acc.ShippingCity = getAccount.BillingCity ;
             acc.ShippingStreet =  getAccount.BillingStreet; 
             acc.ShippingCountry = getAccount.BillingCountry; 
             acc.ShippingLatitude = getAccount.BillingLatitude;  
             acc.ShippingLongitude = getAccount.BillingLongitude; 
             acc.ShippingGeocodeAccuracy = getAccount.BillingGeocodeAccuracy;  
            // acc.ShippingAddress = getAccount.BillingAddress;
            listofAccount.add(acc);
        }
       try {
        if(listofAccount.size() > 0) {
            Database.insert(listofAccount, false); 
        }
        } catch (Exception e) {
          // system.debug('Get Message--->'+e.getMessage());
       }     
    }
}