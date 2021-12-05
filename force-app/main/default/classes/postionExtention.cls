public class postionExtention {

    
  
 
    Position__C t;

    private ApexPages.StandardController stdCtrl{get;set;}
    public postionExtention(ApexPages.StandardController std) 
    {
    	System.debug(std);
        stdCtrl = std;
        Position__C note = new Position__C();
        note = (Position__C) stdCtrl.getRecord();  
        //note.Account__c = ApexPages.currentPage().getParameters().get('AccountId');    
    }

}