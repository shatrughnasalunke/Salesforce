public class TestObject{
    public List<Account> accList{get;set;}
    public string getName{get;set;}
    public TestObject() 
    {
        getName='<b>' + 'Shatrughna' + '</b>'; 
        accList=[Select id,name,type from account];
        system.debug(accList);
    }
}