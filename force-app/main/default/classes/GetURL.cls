public class GetURL {
    public class Output
    {
     	@InvocableVariable
     	Public String salesforceUrl;
    }
    @InvocableMethod
    Public Static List<Output> getList()
    {
        List<Output> outputList=new List<Output>();
        List<Account> accList=[Select Id,shatrughna94__Apply_Online__c from Account where shatrughna94__Apply_Online__c!='' limit 1];
        Output cc=new Output();
        cc.salesforceUrl=accList[0].shatrughna94__Apply_Online__c;
        outputList.add(cc);
        return outputList;
    }
}