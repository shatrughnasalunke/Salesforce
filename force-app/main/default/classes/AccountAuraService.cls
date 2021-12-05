public class AccountAuraService
{
     @AuraEnabled
     public static List<Account> fetchAccount(){
         return [Select Name,type,rating,Phone from account];
         
     }
}