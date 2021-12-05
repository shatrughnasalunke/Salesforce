public class FraudChecks
{
}


/*
/**=====================================================================
* Experian
* Name: ECS_UK_Check_Frauds
* Description: Request for email if match found then return customer number and and productId
* Created Date: 30/10/2020
* Created By: Shatrughna Salunke
* UV-5586 Fraud Spreadsheet Live Frauds.
=====================================================================
public class ECS_UK_Check_Frauds
{
  
    @AuraEnabled
    public static List<Account> checkFrauds(String entityType)
    {   
        List<account> getDetails=new List<account>();
        List<List<Account>>  accList = [FIND : entityType IN All Fields RETURNING Account(id,PersonEmail, ECS_UK_Product__pc,ECS_UK_Customer_Number__pc,ECS_UK_ICON_Ref_Number__pc ) limit 1];
        for(List<Account> accountList1 : accList){
            for(Account accountList2 : accountList1){
                if(accountList2.PersonEmail != null )
                {
                    if((accountList2.PersonEmail).equalsIgnoreCase(entityType)  )
                    {
                        getDetails.add(accountList2);
                        System.debug('getDetails--->'+getDetails);
                    }
                }
            }
        }
        return getDetails;
    }
    //method To Cancel Subscription for Live Fraud
    @AuraEnabled
    public static void  cancelSubscription(String customerId)
    {
        
        String cancellationMessage;
        try{
            if(customerId!='')
            { 
                System.debug('Customer Id---->'+customerId);
                String brandName;
                Account customerAccount = [Select ECS_UK_Customer_ID__c,ECS_UK_Confirmed_Fraud__pc from Account where id =:customerId limit 1];
                ECS_UK_Subscription__c[] subscriptionData = [SELECT ECS_UK_Brand__c FROM ECS_UK_Subscription__c where ECS_UK_Customer__c =:customerId];
                String corvetteCustomerId = customerAccount.ECS_UK_Customer_ID__c;
                if(subscriptionData[0].ECS_UK_Brand__c != null){
                    brandName = subscriptionData[0].ECS_UK_Brand__c;
                }else{
                    brandName = 'creditmatcher';
                }         
                String cancellationOption = 'DEFERRED';
                String cancellationReason = 'Live Fraud';
                String strToken = ECS_UK_CorvetteAuthentication.getOAuthToken();
                ECS_UK_External_API__c objExternalAPI = ECS_UK_External_API__c.getValues('Corvette CancelSubscription');
                String strEndPoint = objExternalAPI.ECS_UK_API_URL__c+'?cancellationType='+cancellationOption+'&cancellationReason='+ EncodingUtil.urlEncode(cancellationReason,'UTF-8');
                HttpRequest req = new HttpRequest();
                req.setHeader('Content-Type', ECS_UK_Constants.ECS_UK_CONTENTTYPE);
                req.setHeader('Authorization','Bearer '+ strToken);
                req.setHeader('Connection', ECS_UK_Constants.ECS_UK_CONNECTIONTYPE);
                req.setHeader('accept', ECS_UK_Constants.ECS_UK_CONTENTTYPE);
                req.setHeader('x-api-version', ECS_UK_Constants.ECS_UK_API_VERSION);
                req.setHeader('x-customerId', corvetteCustomerId);
                req.setHeader('x-brand', brandName);
                req.setBody('{"cancelSubscription": true}');
                req.setEndpoint(strEndPoint);
                req.setMethod('DELETE');
                req.setTimeout(20000);
                Http http = new Http();
                HttpResponse res = http.send(req);            
                system.debug('res.getStatusCode()----'+res.getStatusCode());
                if(res.getStatusCode() == 200)
                {
                    customerAccount.ECS_UK_Activity_Template_Details__pc = ECS_UK_Constants.ACTIVITY_TEMPLATE_PRODUCT_CANCELLATION_SUCCESS; //TODO check 
                    customerAccount.ECS_UK_Confirmed_Fraud__pc=true;
                    update customerAccount;
                }
                else
                {
                    Map<String, Object> errorResultMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
                    cancellationMessage = String.valueOf(errorResultMap.get('message')); 
                    System.debug('cancellationMessage-->'+cancellationMessage);
                }
            }
            else
            {
                System.debug('Customer Id----->'+customerId);
            }
        }
        catch(Exception ex)
        {
            cancellationMessage = 'Can not do the cancellation at this time'; 
            ECS_UK_CustomHandlerClass.exception(ex, 'Corvette Integration Requested by From Live Frauds');            
        }
    }
}

*/