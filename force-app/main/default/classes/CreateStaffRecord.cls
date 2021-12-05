public class CreateStaffRecord {
    
    @AuraEnabled
    public Static Account CreateAccount(Account acc)
    {
        try
        {     
       		 insert acc;
        }
        catch(DMLException e)
        {
            
            throw new AuraHandledException(e.getDMLMessage(0));
        }
        Catch(Exception e)
        {
            throw new AuraHandledException(e.getMessage()); 

        }
        
        return null;
        
    }
    

}