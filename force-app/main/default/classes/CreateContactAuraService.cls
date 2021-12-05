public class CreateContactAuraService {

     @AuraEnabled
      public static void createContact(List<Contact> apexContactList,String apexAccountId)
      {
          System.debug('List Of Record from component--->'+apexContactList);
          List<contact> conList=new List<contact>();
          for(contact cc:apexContactList)
          {   cc.AccountId= apexAccountId;
              conList.add(cc);
          }
          insert conList;
      }
}