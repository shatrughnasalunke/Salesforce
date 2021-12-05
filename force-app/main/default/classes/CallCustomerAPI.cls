public class CallCustomerAPI  {
    
    public static List<shatrughna94__CustomeSettingAPI__c> cusList = shatrughna94__CustomeSettingAPI__c.getAll().values();
    private final String clientId=cusList[1].shatrughna94__ClinetId__c;
    private final String clientSecret=cusList[1].shatrughna94__clientSecret__c;
    private final String username=cusList[1].shatrughna94__UserName__c;
    private final String password=cusList[1].shatrughna94__Password__c;
    
    public class deserializeResponse {
        public String id;
        public String access_token;
    }
    public String ReturnAccessToken(CallCustomerAPI account) {
    String reqbody = 'grant_type=password&client_id=' +
                		  clientId + '&client_secret=' +
           				  clientSecret +'&username=' + 
            			  username + '&password='+ password;
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setHeader('content-type','application/x-www-form-urlencoded');
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res = h.send(req);
        deserializeResponse resp1 = (deserializeResponse) JSON.deserialize(res.getbody(), deserializeResponse.class);
        return resp1.access_token;
    }
    
    @AuraEnabled
    public static void  getCustomerData()  {
        CallCustomerAPI acount1 = new CallCustomerAPI();
        String accessToken = acount1.ReturnAccessToken(acount1);
        List<Account> listAccount = new List<Account>();
        if (accessToken != null) {
            String endPoint = cusList[1].shatrughna94__CustomerAPI__c;
            Http https = new Http();
            HttpRequest request = new HttpRequest();
            request.setHeader('Authorization', 'Bearer ' + accessToken);
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('accept','application/json');
            request.setMethod('GET');
            request.setEndpoint(endPoint);
            HttpResponse response = https.send(request);
            System.debug('Response Body For Account Object---->'+response.getBody());
            String trimmedResponse = response.getBody().unescapeCsv().remove('\\');
            JSONParser parser = JSON.createParser(response.getBody());
            if (parser!=null) {
	              CustomerEntityClass.fetchAccount(parser);
            }
        }
    }
}