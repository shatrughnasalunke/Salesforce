public class UpdateAccounonContatcActivity {
    
    public static void doUpdate(List<Contact> ccList) {
        MAP<Id,Account> accMap = new MAP<Id,Account>();
        List<Account> listOfAccount = new List<Account> ();
        for (Contact cc : ccList) {
              Account accountToUpdate = new Account ();
              accountToUpdate.Id=cc.AccountId;
              listOfAccount.add(accountToUpdate);
        }
        accMap.putall(listOfAccount);
        update accmap.values();
    }

}