public with sharing class TestAccountTriggerHelper {
    public TestAccountTriggerHelper() {
        System.debug('Constructo executed');
    }
public static boolean getStageValues() {
    boolean  flag = false;
    String strObjectName = 'Opportunity';
    String strPicklistField = 'stageName';
    shatrughna94__OppStageName__mdt customSettings = shatrughna94__OppStageName__mdt.getInstance('Closed_Won');
    String getName = customSettings.shatrughna94__StageName__c ;   
    Map<String, String> mapPickListValues = new Map<String, String>();
    Schema.SObjectType objSobjectType = Schema.getGlobalDescribe().get(strObjectName);
    Schema.DescribeSObjectResult objDescribeSobject = objSobjectType.getDescribe();
    Map<String, Schema.SObjectField> mapFields = objDescribeSobject.fields.getMap();
    List<Schema.PicklistEntry> lstPickListValues = mapFields.get(strPicklistField).getDescribe().getPickListValues();
    for (Schema.PicklistEntry objPickList : lstPickListValues) {
           System.debug('Value = ' +objPickList.getValue() +' , Label = ' +objPickList.getLabel());
           if (getName == objPickList.getValue()){
            return true;
        }
    }
     return  flag;
  }
  public static Date checkCreatedDate () {
    Date greaterThan = System.today().addDays(-30);
    return greaterThan;
  }
  public static void  updateOpporunity(Map<Id, Account> mapofAccount) {
     boolean checkStage =  getStageValues();
     Date checkDate  = checkCreatedDate();
     List<Opportunity> lisofOpportunity = new List<Opportunity>() ;
     List<Opportunity> getAllOpp = [SELECT Id,Name FROM Opportunity WHERE 
                                           AccountId IN :mapofAccount.keySet() WITH SECURITY_ENFORCED];
        if(!getAllOpp.isEmpty()){
            for (Opportunity opp :  getAllOpp){
                    if (checkStage && opp.CreatedDate > = checkDate){
                        opp.StageName ='Closed Lost';
                        lisofOpportunity.add(opp);
                  }
             }
             if (!lisofOpportunity.isEmpty()) {
                Database.insert(lisofOpportunity,false);
             }
        }
    }
 
   public static void doInsertContact(Map<Id, Account> mapOfAccount) {
         Contact cc ;
         List<Contact> listOfContact  = new List<Contact> (); 
         for (Account acc :  mapOfAccount.values()) {
                cc = new Contact(AccountId = acc.Id, FirstName = acc.Name,LastName = 'Company',
                Email ='ShatrughnaSalunkhe@gmail.com');
                listOfContact.add(cc);
         }
         if (!listOfContact.isEmpty()) {
            insert listOfContact;
         }
  }
}