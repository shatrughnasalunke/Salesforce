Public class RenderedControllr {
 Public Boolean ShowpageBlockFlag{get;set;}
 Public Account accRec{get;set;}

  Public RenderedControllr(){
   accRec = [select name,id,accountnumber from account limit 1];
   ShowpageBlockFlag = false;
  }
   
  Public void ShowBlockMethod(){
   ShowpageBlockFlag = true;
  }

}