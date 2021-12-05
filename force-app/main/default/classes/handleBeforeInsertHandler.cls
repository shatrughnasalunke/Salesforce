/**
 * @description       : 
 * @author            : Shatrughna.Salunke
 * @group             : 
 * @last modified on  : 21-05-2021
 * @last modified by  : Shatrughna.Salunke
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   21-05-2021   Shatrughna.Salunke   Initial Version
**/
public class handleBeforeInsertHandler {
    public static void validateInput(List<Account> listOfRecords){
        
        for (Account acc : listOfRecords) {
            if (acc.Branch_Type__c=='Main') {
                System.debug('Nothing to do leave as it is  ...');
            }
            else if (acc.Branch_Type__c=='Subsidiary' && acc.ParentId==null ){
                acc.parentId.addError('Parent Account is mandetory for subsidairy account....');
            }
        }    
    }
    public static void copyBillingAddressFromShippingAddress(List<Account> acclist) {
        for (Account acc : acclist){
            if(acc.shatrughna94__IsShippingAddressSame__c==True) {
                acc.ShippingCity=acc.BillingCity;
                acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingState=acc.BillingState;
                acc.ShippingStreet=acc.BillingStreet;
                acc.ShippingPostalCode=acc.BillingPostalCode;
            } 
        } 
    }
 
    public static void  validatePhoneNumber (List<Account> listOfAccount) {
            System.debug('getListOfAccout '+ listOfAccount);
            for (Account getAcc : listOfAccount) {
                    System.debug('getAcc---->'+getAcc);

            } 
    }

    public static void checkDuplicateAccount (List<Account> listOfAccount){
        System.debug('Display of Account'+listOfAccount);
        Map<String,Account>  mapOfExistingAccount = new Map<String, Account>();
        for (Account acc  :  listOfAccount) {
               mapOfExistingAccount.put(acc.Name,acc);
        } 
        for (Account checkAccount :  listOfAccount) {
                if (mapOfExistingAccount.containsKey(checkAccount.Name)) {
                    checkAccount.addError('Duplicate Account Found');
                }
        }
    }     
}