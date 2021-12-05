public class DisplayTestObjectClone {
   
      public DisplayTestObjectClone() {
          
         List<shatrughna94__TestObjects__c>    records =[SELECT Name, shatrughna94__LastName__c 
                                FROM shatrughna94__TestObjects__c ];
       }
}