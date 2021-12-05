Public class ECS_UK_FraudCheckMock
{
}

/*
/**=====================================================================
* Experian
* Class: ECS_UK_Fraud_Check_Mock
* Description: Mock test Class for ECS_UK_Fraud_Check_Test.
* Created Date: 11/Dec/2020.
* Created By: Shatrughna Salunke.
=====================================================================
@isTest
public class ECS_UK_Fraud_Check_Mock implements HttpCalloutMock{
    String dataCode ='failure';
    public ECS_UK_Fraud_Check_Mock(String dataCode)
    {
        this.dataCode = dataCode;
    }
    public HTTPResponse respond(HTTPRequest req) 
    {
        HTTPResponse res = new HTTPResponse();
        if(dataCode.equalsIgnoreCase('success'))
        {
            if (req.getEndpoint().endsWith('api/oauth/token'))
            {
                res.setBody('{"token":"XXX=="}');
                res.setStatusCode(200);
                
            } 
            else if (req.getEndpoint().contains('api/fulfillments'))
            {
                System.assertEquals('DELETE', req.getMethod());
                res.setHeader('Content-Type', 'application/json');
                res.setBody('{"cancelSubscription": true}');
                res.setStatusCode(200);
            }
        }
        else if(dataCode.equalsIgnoreCase('exception'))
        {
            if (req.getEndpoint().endsWith('api/oauth/token')) 
            {
                res.setBody('{"token":"XXX=="}');
                res.setStatusCode(200);
            }
            else if (req.getEndpoint().contains('api/fulfillments'))
            {
                System.assertEquals('DELETE', req.getMethod());
                
                res.setHeader('Content-Type', 'application/json');
                res.setBody(null);
                res.setStatusCode(200);
            }          
        } 
        return res;
    }
    
}
*/