public class FutureMethodExample 
{
         @future
         public static void updateAccount(List<Id> Idss)
         {  System.debug(Idss);
             try
             {   List<Contact> cc=new List<Contact>();
                 for(Contact c:[Select Id ,accountId,FirstName,LastName from Contact Where AccountID IN:Idss] )
                 {
                     Contact ccL=New Contact();
                     ccL.AccountId=c.AccountId;
                     ccL.firstName='Shatrughna';
                     ccL.LastName='Salunke';
                     ccL.Id=c.Id;
                     cc.add(ccL);
                 }
              	if(cc.size()>0)
                {
                    update cc;
                }
             }
             catch(Exception e) 
            {
   					 System.debug('An exception occurred: ' + e.getMessage());
            }
		}
}