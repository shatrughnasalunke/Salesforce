

@RestResource(urlMapping='/v1/Case/*')
global with sharing class GetAllCases {
    public GetAllCases() {
        system.debug('Expose API Example ');
    }
   // Try using below url in Workbench
    ///services/apexrest/shatrughna94/v1/Case


 /*   @HttpGet
    global Static  List<Case>  getCases() {
        RestRequest req = RestContext.request;
        String productId = req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
        if(string.isBlank(productId)) {
            return [SELECT Id, CaseNumber, Subject FROM Case];
        }else {
             return [SELECT Id, CaseNumber, Subject FROM Case WHERE ID=: productId];
        }

    }*/
// /services/apexrest/shatrughna94/v1/Case?caseId=5002v00002nvE9AAAU&caseNumbers=00001053
    @httpGet 
    global static list<Case> gteAllcase(){
        //RestRequest rest = RestContext.request;
        RestRequest rest = RestContext.request;
        System.debug('resrt');
        System.debug('rest--->'+rest);
        String caseId = RestContext.request.params.get('caseId');
        String getNumber = RestContext.request.params.get('caseNumbers');

        return [SELECT Id, CaseNumber ,Subject  FROM Case WHERE ID = : caseId AND CaseNumber = : getNumber];
    }
}
