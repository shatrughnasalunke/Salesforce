global class ScheduleFutureMethdoe implements Schedulable 
{
    global void execute(SchedulableContext ctx) 
    {
        		List<id> accId=new List<id>();	
        		List<Account> lisTId=[Select id ,name from Account];
   				for(Account acc:lisTId)
                {
                    	accId.add(acc.id); 
                }    
                FutureMethodExample.updateAccount(accId);
    }
}