
@RestResource(urlMapping='/v1/Tasks/*')
global with sharing class ExposeTask {
    public ExposeTask() {
        system.debug('Get Data');
    }
    @HttpGet 
    global static List<Task> getAllTask() {
        
        String  id = RestContext.request.params.get('accountId');
        String  accountNumber = RestContext.request.params.get('accountNumber');
        String  acountRevenue =  RestContext.request.params.get('accountRevenue');
        String  industry = RestContext.request.params.get('industry');


        return [SELECT Id, WhatId, Subject FROM  TASK WHERE WhatId =:id WITH SECURITY_ENFORCED ];
    } 
}
