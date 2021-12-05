@isTest
public with sharing class TestUtility {
   
    /** 
    * ********************************************************
    * This method is test data for create user
    * ********************************************************
    */
    
    public static User createTestUser() {
        
        Profile pf = [SELECT Id FROM Profile 
                      WHERE Name = 'System Administrator' Limit 1];
        String orgId = UserInfo.getOrganizationId();
        String dateString = String.valueof(Datetime.now()).replace(' ','').replace(':','').replace('-','');
        Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));
        String uniqueName = orgId + dateString + randomInt;
        User tuser = new User(  firstname = 'Test',
                                lastName = 'User',
                                email = uniqueName + '@test' + orgId + '.org',
                                Username = uniqueName + '@test' + orgId + '.org',
                                EmailEncodingKey = 'ISO-8859-1',
                                Alias = uniqueName.substring(18, 23),
                                TimeZoneSidKey = 'America/Los_Angeles',
                                LocaleSidKey = 'en_US',
                                LanguageLocaleKey = 'en_US',
                                ProfileId = pf.Id
                                );
        insert tuser;
        return tuser;
    }
    /** 
    * ******************************************************
    * This method is test data for create Account
    * ******************************************************
    */
    public static Account createAccount() {
        User u = createTestUser();
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.ownerId = u.Id;
        insert acc;
        system.debug('account Id--->'+acc.Id);       
        if(acc.Id != null){
            createContact (acc.Id);
            createOpportunity(acc.Id);
            createCase(acc.Id);
        }
        return acc;
    }
    /**
     * *******************************************************
     * This method is test data for create contact object
     * *******************************************************
    */
    public static Contact createContact(Id accId)  {
        Contact con = new Contact();
        con.AccountId = accId;
        con.FirstName = 'FirstName';
        con.LastName = 'LastName';
        con.Email = 'FirstName@test.com' + Math.floor(Math.random() * 1000);
        insert con;
        return con;
    }
    /**
    * ***********************************************************
    * This method is test data for create Opportunity object
    * ***********************************************************
    */
    public static Opportunity createOpportunity(Id accId)  {
        Opportunity oppt = new Opportunity(Name ='New mAWS Deal',
                            AccountID = accId,
                            StageName = 'Customer Won',
                            Amount = 3000,
                            CloseDate = System.today()
                            );
        insert oppt;
        if (oppt.Id != null ) {
          deleteOpportunity(oppt.Id);
        }
        return oppt;
    }   
    /**
    * ************************************************************
    * This method is test data for delete Opportunity
    * ************************************************************
    */
     public static void deleteOpportunity(Id oppId) {
        Opportunity deleteOpportunity = [SELECT Id,Name FROM Opportunity
                          				 WHERE ID  =: oppId Limit 1];
        delete deleteOpportunity;
        system.debug('deleteOpportunity-->'+deleteOpportunity);
        if (deleteOpportunity.Id != null){
             undeleteOpportunity(deleteOpportunity);
        }
    }
     /**
    * ************************************************************
    * This method is test data for undelete Opportunity
    * ************************************************************
    */
     public static void undeleteOpportunity(Opportunity undeleteOpportuniy) {
         if (undeleteOpportuniy != null) {
       		     undelete undeleteOpportuniy;
         }
    }
   /* ************************************************************
    * This method is test data for create Case object
    * ************************************************************
    */
    public static Case  createCase(Id accountId) {
        Case cas = new Case(Status ='New', Priority = 'Medium', Origin = 'Email', AccountId=accountId);
        insert cas ;
        return cas ;
    } 
    
     /* ************************************************************
    * This method is test data for create addLeaveBalance Data object
    * ************************************************************
    */
    public static List<shatrughna94__LeaveManagement__c>  createLeaveBalance(integer i) {
     
        Account acc  =  createAccount();
        Contact contactId = [SELECT Id, AccountId FROM Contact WHERE AccountId =: acc.Id];
        List<shatrughna94__LeaveManagement__c> listofTestData = new List<shatrughna94__LeaveManagement__c> ();
        
        shatrughna94__LeaveBalance__c leaveBalanceSettings = new shatrughna94__LeaveBalance__c();
        leaveBalanceSettings.shatrughna94__SickLeave__c = 0.5;
        leaveBalanceSettings.shatrughna94__VacationBalance__c = 0.5;
        leaveBalanceSettings.Name = 'Test Custom Settings';
        insert leaveBalanceSettings;
        
        for (i=0; i<50; i++) {
            shatrughna94__LeaveManagement__c leaveManagement = new shatrughna94__LeaveManagement__c();
            leaveManagement.shatrughna94__Contact__c = contactId.Id;
            leaveManagement.shatrughna94__Active__c = true;
            leaveManagement.shatrughna94__SickLeave__c = leaveBalanceSettings.shatrughna94__SickLeave__c;
            leaveManagement.shatrughna94__VacationLeave__c = leaveBalanceSettings.shatrughna94__VacationBalance__c;
            listofTestData.add(leaveManagement);
        }
        insert listofTestData;
        return listofTestData;
    } 
}