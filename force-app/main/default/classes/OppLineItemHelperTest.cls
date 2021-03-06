@isTest
public with sharing class OppLineItemHelperTest {
    public OppLineItemHelperTest() {
        system.debug('Opportunity Line Item Record has been created ');
    }
@TestSetup static void oppIetmTestData() {
//insert product
    Product2 p = new Product2();
    p.Name = ' Test Product ';
    p.Description='Test Product Entry For Product';
    p.productCode = 'SFDCPanther-123';
    p.isActive = true;
insert p;

//insert pricebook entry for the product
    PricebookEntry standardPrice = new PricebookEntry();
    standardPrice.Pricebook2Id = Test.getStandardPricebookId();
    standardPrice.Product2Id = p.Id;
    standardPrice.UnitPrice = 100;
    standardPrice.IsActive = true;
    standardPrice.UseStandardPrice = false;
insert standardPrice ;

// insert account
    Account acc = new Account(
    Name = 'Shatrughna ',
    Rating = 'Hot',
    Industry = 'Banking',
    Phone = '9087654321'
);
insert acc;

// Create Opportunity
    Opportunity opp = new Opportunity();
    opp.AccountId = acc.Id;
    opp.Name = 'Test Opportunity';
    opp.CloseDate= System.Today();
    opp.StageName='Prospecting';
    opp.Pricebook2Id = Test.getStandardPricebookId();
    insert opp;

// Add product and Pricebook to the particular opportunity using OpportunityLineItem 
    OpportunityLineItem oppLineItem = new OpportunityLineItem();
    oppLineItem.OpportunityId = opp.Id;
    oppLineItem.PricebookEntryId = standardPrice.Id;
    oppLineItem.UnitPrice = 7000;
    oppLineItem.Quantity = 5;
    insert oppLineItem;
    
}
@isTest 
public static void dotestConstructor (){
    OppLineItemHelper cc = new OppLineItemHelper ();
}
@isTest
    public static void  doInsertAssetTest() {
       List<OpportunityLineItem>  s = [SELECT Id, UnitPrice
                                                     FROM OpportunityLineItem 
                                                     WHERE UnitPrice = 7000];
       String v1 = 'Check unit price';
       system.assertEquals(7000, s[0].UnitPrice, v1);
    }
}