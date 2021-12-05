public class ContactListController {

    @AuraEnabled
    public static List<Contact> getContactList(String accId)
    {
        List<Contact> contactList=[Select id,FirstName,LastName,Phone,Email,AccountID,Account.Name, name from contact where accountId=:accId];
        return contactList;
    }
  
    @AuraEnabled
   public static Contact createContact1(Contact con,Id AccountId)
   {
       System.debug('AccountId from AccountPage----->'+AccountId); 
       con.AccountId = AccountId;     
       insert con;
       System.debug('Con------------->'+Con);
       return con;    
   }   
 }