@isTest 
public class CreateContactAuraMethodTest {
      static testMethod void gdoInsert() 
       {
           Contact b = new Contact(lastname='Test Contact Record');
           insert b;
           Test.startTest();
           CreateContactAuraMethod.doInsert(b.lastname);
           Test.stopTest();
      }
}