public class UserHistorySection{
@AuraEnabled 
    public static WraperForStorage searchRecord()
    {
        User u = [select Id, username from User where Id = :UserInfo.getUserId()];
        WraperForStorage wrperObj=new  WraperForStorage();
        List<Account> accList=[Select ID,OwnerId, name From Account];
        List<Case> caseList=[Select ID,OwnerId, CaseNumber,AccountId,Account.Name  From Case];
        wrperObj.accList = accList;  
        wrperObj.caseList = caseList;  
        return wrperObj;
    }
    Public class WraperForStorage
    {
        @AuraEnabled Public List<Account> accList {get;set;}  
        @AuraEnabled Public List<Case> caseList {get;set;}  
    }
}