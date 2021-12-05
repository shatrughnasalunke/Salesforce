public class GetAccountAndContacts {

     @AuraEnabled
    public static List<Account> getAccountRecords() {
        return new List<Account>([Select id,Name from Account LIMIT 100]);
    }
    @AuraEnabled
    public static List<Contact> getContactRecords(string accId) {
        return new List<Contact>([Select id,Name from Contact Where AccountId =: accId LIMIT 100]);
    }
}