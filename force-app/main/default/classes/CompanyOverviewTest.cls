@isTest
public class CompanyOverviewTest {
    
 @testSetup
    public  static void  setupData () {
           Account acc = new Account(
           Name='TestName',Active__c=True ,
           Type='Custome_Direct' ) ;
          
         insert acc;
    }
    public 
    @isTest static void showOverViewTest () {
        
        List <Id> getaccountIds = new List <Id>();
        List<Account> listOfAccount =[SELECT Id,Name FROM Account WHERE Name='TestName' Order  By Name DESC];
        System.assertEquals('TestName', listOfAccount[0].Name);
        System.assertNotEquals('TestName1', listOfAccount[0].Name);
        for (Account accId : listOfAccount) {
            getaccountIds.add(accId.Id);
        }  
        CompanyOverview.showCompanyOverviewOnLightningComponent(getaccountIds);
    }

    
    //Test to negative scenario
    //if id is null or size is zero it will return null
    public 
    @isTest static void negativeTestForOverviewMethod() {
        List <Id> getaccountIds = new List <Id>();
        CompanyOverview.showCompanyOverviewOnLightningComponent(getaccountIds);
    }
   
}