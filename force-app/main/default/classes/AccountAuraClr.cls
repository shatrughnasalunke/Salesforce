public class AccountAuraClr
 {
   @AuraEnabled
   public static String getAccountRecord(String getName){
          Map<Id,Account> acc=new Map<Id,Account>();
          for(Account acc1 : [Select id,Name,Phone,Type from Account where Name=:getName]){
            acc.put(acc1.Id,acc1);
          }
          String data=JSON.serialize(acc);
          System.debug('data--->'+data);
          return data;
   }
   @AuraEnabled
   public static String getList(String getName){
          List<Account> acc=new List<Account>();
          for(Account acc1 : [Select id,Name,Phone,Type from Account where Name=:getName]){
            acc.add(acc1);
          }
          String acclist=JSON.serialize(acc);
          System.debug('data--->'+acclist);
          return acclist;
   }
 
}