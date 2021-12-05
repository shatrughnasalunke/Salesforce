global class TestApexClass {
        @AuraEnabled
        global static  List<Account> getName(String Name)
        {
            System.debug('getName--->'+Name);
            List<Account> accList=[Select id,name from account where name=:Name];
            System.debug('accList--->'+accList);
            return accList;
        }
        @AuraEnabled
        global static List<Contact>  getContactName(String cName)
        {
            System.debug('cName-->'+cName);
            List<Contact> cList=[select id , firstName,LastName from Contact];
            system.debug('cList--->'+cList);
            return cList;
        }
}