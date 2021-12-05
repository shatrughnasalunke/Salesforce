public with sharing class TestApiJwt {
    public static void getUsersSimple(){
        String jwtToken = '';
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:TestJwt/users');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        Map<String, Object> response;

        if (res.getStatusCode() == 200 ) {
          response = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
          System.debug('response: ' + response);
        }
        else {
          System.debug('Error');
        }
    }
}