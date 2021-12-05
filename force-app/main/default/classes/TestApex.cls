public class TestApex {
    @AuraEnabled
    public static  List<Account> getName(String Name)
    {
        System.debug('Name--->'+Name);
        List<Account> accList=[Select id ,name from account where name=:Name];
        return accList;
    }
}