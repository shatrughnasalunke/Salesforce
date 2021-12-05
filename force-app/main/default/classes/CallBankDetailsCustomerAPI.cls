public class CallBankDetailsCustomerAPI {
   
    public static List<shatrughna94__CustomeSettingAPI__c> cusList = shatrughna94__CustomeSettingAPI__c.getAll().values();
    
    public Static String accessToken;
    private final String clientId = cusList[0].shatrughna94__ClinetId__c;
    private final String clientSecret = cusList[0].shatrughna94__clientSecret__c;
    private final String username = cusList[0].shatrughna94__UserName__c;
    private final String password = cusList[0].shatrughna94__Password__c;
   
    public class deserializeResponse {
      
        public String id;
        public String access_token;
    }
    
    public class deserializeResponseforDeleteMethod {
        public String Id;
        public String message;
    }

    public String ReturnAccessToken(CallBankDetailsCustomerAPI account) {
           
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
    public static String getBankDetailsFromCustomerObject()  {
            string jsonSerial='' ;
            List<Entity.EntityData> listOfEntityData ;
            CallBankDetailsCustomerAPI acount1 = new CallBankDetailsCustomerAPI();
            accessToken = acount1.ReturnAccessToken(acount1);
            List<Account> listAccount = new List<Account>();
            if (accessToken != null) {
                String endPoint = cusList[0].shatrughna94__CustomerAPI__c;
                Http https = new Http();
                HttpRequest request = new HttpRequest();
                request.setHeader('Authorization', 'Bearer ' + accessToken);
                request.setHeader('Content-Type', 'application/json');
                request.setHeader('accept','application/json');
                request.setMethod('GET');
                request.setEndpoint(endPoint);
                HttpResponse response = https.send(request);
                String trimmedResponse = response.getBody().unescapeCsv().remove('\\');
                JSONParser parser = JSON.createParser(response.getBody());
                if (parser!=null) {
                   listOfEntityData = Entity.getAllBanksDetails(parser);
                   jsonSerial = JSON.serialize(listOfEntityData);
                }
          } 
        return jsonSerial;
    }
    @AuraEnabled 
    public static String deleteRecordFromLightningOrg(Id  recordId) {
        CallBankDetailsCustomerAPI  contact = new CallBankDetailsCustomerAPI ();
        accessToken = contact.ReturnAccessToken(contact);
        if (accessToken!=null) {
            String endpoint1 = cusList[0].shatrughna94__CustomerAPI__c;
            system.debug('endpoint--->'+endpoint1);
            Http https = new Http () ;
            HttpRequest request = new HttpRequest();
            request.setHeader('Authorization', 'Bearer ' + accessToken);
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('accept','application/json');
            request.setMethod('DELETE');
            request.setEndpoint(endpoint1+'/'+recordId);
            HttpResponse response = https.send(request);
            system.debug('response.getBody()'+response.getBody());
            system.debug('Here is status code ---->'+ response.getStatusCode());
            if (response.getStatusCode() == 200){
                 
                 return 'Success';
            }
            else {
                system.debug('Please contact to system Administrator');
            }
        }
        return null ;
    }
}