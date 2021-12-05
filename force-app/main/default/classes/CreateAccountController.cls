public  class CreateAccountController{
    
    //Prpoerties
    public Account acc {get;set;}
    
    //Constructor 
    public CreateAccountController(){        
        //Instances        
        acc = new Account();
    }
    
    //Save Method 
    public PageReference SaveMethod(){
        Insert acc;
        return null;
    }
}