public class testApexxxx {
    public String currentURL {get;set;}
    public testApexxxx()
    {    
     currentURL = ApexPages.currentPage().getUrl();
    }
    public PageReference getRecord()
     {        
        PageReference pageRef = new PageReference('http://www.google.com');
        pageRef.setRedirect(true);
        return pageRef;
     }
}


/*


         var fulladdress = [];
         var previouslySearchedDate=[];   
         var temp = creditSearches;
           
            for(var i=0 ; i<temp.length;i++)
            {
              if(!$A.util.isUndefinedOrNull(temp[i].previouslySearchedOn))
                {
                  var previousDate=(temp[i].previouslySearchedOn=== undefined ? "" : temp[i].previouslySearchedOn+'');
                  temp[i].previouslySearchedDate=previousDate;
                }

             }

     <div class="assoc-label slds-grid slds-wrap">Previously searched on: {!r.previouslySearchedDate}</div><!--<aura:iteration items="{!r.previouslySearchedOn}" var="item" indexVar="index">
*/

/*

Currently I am working on high priority bug, so can we have requirement for the import of csv file into salesforce put on hold for day 2 work please? If day 2 work gets done early then I will let you know and we will have it added to Day 2 work at that time.


*/