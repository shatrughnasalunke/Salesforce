public class AccountListController {
    
    @AuraEnabled
    public static List < Case > fetchAccts() {
        
        return [ SELECT Id, CaseNumber, Subject, origin FROM Case LIMIT 10 ];
        
    }
    

}