public with sharing class AccountTriggerv1 {

    @future(Callout= true)
    public static void notofyExternalSystem(id accountid) {
        Account acc = [SELECT Id ,Name FROM Account Where Id = : accountid ];
        http objectHttp =  new http();
        HttpRequest req= new HttpRequest();
        req.setEndpoint('http//example.org/restService');
        req.setMethod('Post');
        req.setBody(JSON.serialize(acc));
        HttpResponse res =objectHttp.send(req);
        system.debug('res--->'+res);
    }

}