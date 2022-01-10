
@RestResource(urlMapping='/v1/Tasks/*')
global with sharing class ExposeTask {
    public ExposeTask() {
        system.debug('Get Data');
    }
    @HttpGet 
    global static List<Task> getAllTask() {
        //String  accountNumber = RestContext.request.params.get('accountNumber');
        String  accountNumber = RestContext.request.params.get('accountNumber');
        String  acountRevenue =  RestContext.request.params.get('accountRevenue');
        String  industry = RestContext.request.params.get('industry');
      
        Account acc =[SELECT Id,Name ,Industry, AccountNumber, AnnualRevenue 
                                                             FROM Account WHERE AccountNumber =: accountNumber
                                                             AND AnnualRevenue > 20000 
                                                             AND Industry='Banking' WITH SECURITY_ENFORCED];   
        if (acc.Id != null ) {
                return [SELECT Id, WhatId, What.Name ,Subject FROM TASK WHERE WhatId =:acc.Id ];//WITH SECURITY_ENFORCED];

         } else {
               return null;
         }
    } 
}

