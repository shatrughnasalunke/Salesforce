public class ECS_UK_EinsteinBotCancellationAPI
{
}


/**=====================================================================
* Experian
* Name: ECS_UK_EinsteinBotCancellationAPI
* Description: API Call to cancel subscription
* Created Date: 17/12/2018
* Created By: Pawan Raut
* Date Modified Modified By         Description of the update
* 15/07/2019    Carlo Dell'Anno     Added timeout to 20 second 

public class ECS_UK_EinsteinBotCancellationAPI {
    
    public class BotCancellationoutput
    {
        @InvocableVariable
        public boolean cancellationSuccess;
        
        @InvocableVariable
        public String  cancellationMessage;
        
        @InvocableVariable
        public String refundRequiredCheck;
       
    }
    
    
    public class Botinput
    {
        @InvocableVariable
        public String customerId;
        
        @InvocableVariable
        public String cancellationReason;
    }
    
    @InvocableMethod(label='Cancel Subscription process')
    public static List<BotCancellationoutput> cancelSubscriptionAPI(List<Botinput> customerInput)
    {
        
        BotCancellationoutput botOutput = new BotCancellationoutput();
        try{
            String brandName;
            //Get Corvette customer Id
            Account customerAccount = [Select ECS_UK_Customer_ID__c from Account where id =:customerInput[0].customerId limit 1];
            ECS_UK_Subscription__c[] subscriptionData = [SELECT ECS_UK_Brand__c FROM ECS_UK_Subscription__c where ECS_UK_Customer__c =:customerInput[0].customerId];
            String corvetteCustomerId = customerAccount.ECS_UK_Customer_ID__c;
            if(subscriptionData[0].ECS_UK_Brand__c != null){
                brandName = subscriptionData[0].ECS_UK_Brand__c;
            }else{
                brandName = 'creditmatcher';
            }         
            String cancellationOption = 'DEFERRED';
            String cancellationReason = customerInput[0].cancellationReason;
            //Get the authorization token
            String strToken = ECS_UK_CorvetteAuthentication.getOAuthToken();
            //Get the end point of the service from Custom setting
            ECS_UK_External_API__c objExternalAPI = ECS_UK_External_API__c.getValues('Corvette CancelSubscription');
            String strEndPoint = objExternalAPI.ECS_UK_API_URL__c+'?cancellationType='+cancellationOption+'&cancellationReason='+ EncodingUtil.urlEncode(cancellationReason,'UTF-8');
            HttpRequest req = new HttpRequest();
            //1. setting the headers
            req.setHeader('Content-Type', ECS_UK_Constants.ECS_UK_CONTENTTYPE);
            req.setHeader('Authorization','Bearer '+ strToken);
            req.setHeader('Connection', ECS_UK_Constants.ECS_UK_CONNECTIONTYPE);
            req.setHeader('accept', ECS_UK_Constants.ECS_UK_CONTENTTYPE);
            req.setHeader('x-api-version', ECS_UK_Constants.ECS_UK_API_VERSION);
            req.setHeader('x-customerId', corvetteCustomerId);
            req.setHeader('x-brand', brandName);
            //2. setting the body
            req.setBody('{"cancelSubscription": true}');
            //3. setting the endpoint
            req.setEndpoint(strEndPoint);
            //4. setting the method type
            req.setMethod('DELETE');
            //5. increase default timeout (10000) to 20 Sec
            req.setTimeout(20000);
            //6. get the response
            Http http = new Http();
            HttpResponse res = http.send(req);            
            botOutput.cancellationSuccess = false;
            system.debug('res.getStatusCode()----'+res.getStatusCode());
            if(res.getStatusCode() == 200)
            {
                system.debug('res.getStatusCode()----'+res.getStatusCode());
                botOutput.cancellationSuccess = true;
                customerAccount.ECS_UK_Activity_Template_Details__pc = ECS_UK_Constants.ACTIVITY_TEMPLATE_PRODUCT_CANCELLATION_SUCCESS; //TODO check 
                //Call to Refund Required check
                botOutput.refundRequiredCheck = ECS_UK_EinsteinBotCancellationProcess.getRefundRequiredInfo(customerInput[0].customerId);
                update customerAccount;
            }
            else
            {
                Map<String, Object> errorResultMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
                botOutput.cancellationMessage = String.valueOf(errorResultMap.get('message')); 
            }
        }
        catch(Exception ex)
        {
            botOutput.cancellationMessage = 'Can not do the cancellation at this time'; 
            ECS_UK_CustomHandlerClass.exception(ex, 'Corvette Integration Requested by Bot');            
        }
        
        system.debug('botOutput-----'+botOutput);
        return new List<BotCancellationoutput>{botOutput};            
      }
    
}*/