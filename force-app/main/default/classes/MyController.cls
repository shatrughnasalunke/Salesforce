public class MyController {

    private final Account account;

    public MyController() {
        account = [SELECT Id, Name FROM Account  ];
    }

    public Account getAccount() {
        return account;
    }

    public PageReference save() {
        update account;
        return null;
    }
}