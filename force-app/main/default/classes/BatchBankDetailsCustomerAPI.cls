global class BatchBankDetailsCustomerAPI Implements Database.Batchable<sObject>,Database.AllowsCallouts, Schedulable{
    public static Id idRecType = Schema.SObjectType.Customer__c.getRecordTypeInfosByName().get('Business Customer').getRecordTypeId();
    global void execute(SchedulableContext sc) {
           Database.executeBatch(new BatchBankDetailsCustomerAPI(),200); 
    }
    global database.QueryLocator start(Database.BatchableContext bc) {
        Integer setLimit =1;
        System.debug('inside start method');
        String soqlQuery = 'SELECT shatrughna94__ClinetId__c FROM shatrughna94__CustomeSettingAPI__c LIMIT : setLimit';
        return Database.getQueryLocator(soqlQuery); 
    }
    global void execute(Database.BatchableContext bc, List<shatrughna94__CustomeSettingAPI__c> customSettings) { 
        
        Map<String,Customer__c> mapOfCustomer = new Map<String,Customer__c>();
        List<Customer__c> listOfCustomer = new List<Customer__c>();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('accept','application/json');
        request.setMethod('GET');
        request.setEndpoint('callout:BankDetails/services/apexrest/v1/CustomerDetails/');
        Http https = new Http();
        HttpResponse response  = https.send(request);
        System.debug('Response--->'+response.getBody());
        
        if (response.getStatusCode() == 200){
            String trimmedResponse = response.getBody().unescapeCsv().remove('\\');
            JsonParser parser = JSON.createParser(response.getBody());
            Entity.getAllBanksDetails(parser);
         }
    }  
    global void finish(Database.BatchableContext bc) {
       Id JobId  = Database.executeBatch(new BatchToDeleteSuperfluousCustomer() , 200);
       System.debug('Job Id---->'+JobId);
    }
}