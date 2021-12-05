public class ContactHelper {
    
    public static List<Contact> getData() {
      return  [SELECT Id, FirstName FROM Contact ];
    }
}