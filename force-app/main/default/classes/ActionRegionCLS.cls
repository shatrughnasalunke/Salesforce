public class ActionRegionCLS{
 public String reqAccNumber{get;set;}
 public Account accObj{get;set;}

 public ActionRegionCLS(){
  accObj = new Account();
 }
 public void fillRecord(){
  if(reqAccNumber !=null && reqAccNumber !=''){
    List<Account> accLst = new List<Account>();
    accLst = [select id,Name,AccountNumber,Type,AnnualRevenue from Account where AccountNumber =:reqAccNumber];
    if(accLst !=null && accLst.size()>0){
     accObj = accLst[0];
    }
    else{
   
     ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Info,' No Records found with this Account Number:'+reqAccNumber);
     ApexPages.addMessage(myMsg);
     accObj  = null;
  
    }
  }
 }

 }