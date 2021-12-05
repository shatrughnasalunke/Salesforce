/*  
Created By  : Shatrughna Salunke.
Description : To fetch all account from SourceOrg to TargetOrg (Current Org)
using Rest API Integration and Display Account Lightning component.

Notes       : 
1.Salesforce to Salesforce REST ApI integration 2 Remote site setting required in TaregtOrg.
2.Check securitytoken with password,password policy,IpRanges and login hours while 
implementing Salesforce to Salesforce Rest API Integration.
3.Make sure connected app configure propely in source org. 
*/
public class GetAccountUsingRESTAPI {
public static List <Account> accs { get; set;}
  public String s;
  private final String clientId = '3MVG9G9pzCUSkzZuuBMWIULfDxd7ApOrpZ9zliTmWs1fmwRPsECLF1RCstbHwIsCRknZmVWf8mMyAbqXRekrN';
  private final String clientSecret = '536F8D730AAEE5F89C9A65CC4362116F737451620ED5CD92FD4D052D1DACEBB1';
  private final String username = 'shatrughn@sourceorg.com';
  private final String password = 'sourceorg@123pHbZ5lgWdRHiLlMlAkxkJ34uW';
  public class deserializeResponse {
  public String id;
  public String access_token;
  }
  /*public String ReturnAccessToken (GetAccountUsingRESTAPI acount)
  {
  String reqbody = 'grant_type=password&amp;client_id='+clientId+'&amp;client_secret='+clientSecret+'&amp;username='+username+'&amp;password='+password;
  Http h = new Http();
  HttpRequest req = new HttpRequest();
  req.setBody(reqbody);
  req.setHeader('content-type','application/x-www-form-urlencoded');
  req.setMethod('POST');
  req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
  HttpResponse res = h.send(req);
  deserializeResponse response = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
  system.debug('---------------------------->'+response );
  return response.access_token;
  }*/
  public String ReturnAccessToken(GetAccountUsingRESTAPI acount) {
  String reqbody = 'grant_type=password&client_id=' + clientId + '&client_secret=' +
      				clientSecret + '&username=' + username + '&password=' + password;
  Http h = new Http();
  HttpRequest req = new HttpRequest();
  req.setBody(reqbody);
  req.setHeader('content-type', 'application/x-www-form-urlencoded');
  req.setMethod('POST');
  req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
  HttpResponse res = h.send(req);
  deserializeResponse resp1 = (deserializeResponse) JSON.deserialize(res.getbody(), deserializeResponse.class);
  system.debug('------------------------------->' + resp1);
  return resp1.access_token;
  }
  public static pageReference callGetAccount() {
  GetAccountUsingRESTAPI acount1 = new GetAccountUsingRESTAPI();
  String accessToken;
  accessToken = acount1.ReturnAccessToken(acount1);
  list 
  < account > ListAccount = new List 
    < account > ();
      if (accessToken != null) {
      System.debug('Inside If Condition-------------->');
      String endPoint = 'https://ap15.salesforce.com/services/apexrest/v1/getAccounts/';
      Http h2 = new Http();
      HttpRequest req1 = new HttpRequest();
      req1.setHeader('Authorization', 'Bearer ' + accessToken);
      req1.setHeader('Content-Type', 'application/json');
      req1.setHeader('accept', 'application/json');
      req1.setMethod('GET');
      req1.setEndpoint(endPoint);
      HttpResponse res1 = h2.send(req1);
      String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
      system.debug('trimmedResponse------------------------->' + trimmedResponse);
      JSONParser parser = JSON.createParser(res1.getBody());
      System.debug('parser------------------>' + parser);
      set 
      < account > accList = new set 
        < account > ();
          while (parser.nextToken() != null) {
          if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) {
          Account acc;
          if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Id')) {
          parser.nextToken();
          String sId = parser.getText();
          acc = new Account();
          acc.Id = sId;
          system.debug('Id@@@' + sId);
          parser.nextToken();
          if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Name')) {
          parser.nextToken();
          string sName = parser.getText();
          acc.Name = sName;
          system.debug('Name@@@' + sName);
          }
          accList.add(acc);
          }
          accList.remove(null);
          }
          ListAccount.AddAll(accList);
          system.debug('AccountList----------------------------------->' + Json.serialize(ListAccount));
          String s = Json.serialize(ListAccount);
          }
          }
          list 
          < String > accListtest = new list 
            < String > ();
              for (Account acc: ListAccount) {
              accListtest.add(acc.name);
              }
              accs = [Select Id, Name from account where Name =: accListtest];
              System.debug('accListtest----------->' + accListtest);
              return null;
              }
 }