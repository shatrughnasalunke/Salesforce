public class AccountHistory
{
      Public void doInsert()
      {
          List<RecentlyViewed> reViewRecord =[SELECT Id, Name, Language, NetworkId, LastReferencedDate, LastViewedDate, NameOrAlias, Phone, Email, LastName, FirstName, Alias, Type, UserRoleId, RecordTypeId, IsActive, ProfileId, Title FROM RecentlyViewed where
                                              LastVieWedDate=today];
          List<shatrughna94__Account_History__c> doUpdate=new List<shatrughna94__Account_History__c>();
          List<shatrughna94__Account_History__c> doInsert=new List<shatrughna94__Account_History__c>();
          List<shatrughna94__Account_History__c> existingrecordId=[Select Id,Name from shatrughna94__Account_History__c];
          for(RecentlyViewed recv:reViewRecord)
          {  for(shatrughna94__Account_History__c cc:existingrecordId)
          	 {	 
                if(recv.id==cc.id)
                {     
                     shatrughna94__Account_History__c accH=new shatrughna94__Account_History__c();
                     accH.shatrughna94__Account_Id__c=recv.ID;
                     accH.Type__c=recv.Type;
                     acch.shatrughna94__User_Id__c= UserInfo.getUserId();
                     doUpdate.add(accH);
                }  
                else
                {
                     shatrughna94__Account_History__c accH=new shatrughna94__Account_History__c();
                     accH.shatrughna94__Account_Id__c=recv.ID;
                     accH.Type__c=recv.Type;
                     acch.shatrughna94__User_Id__c= UserInfo.getUserId();
                     doInsert.add(accH);
                }
             } 
          }
          if(doUpdate.Size()>0)
          Update doUpdate;
          
          if(doInsert.size()>0)
          Insert doInsert;  
          
      }
}