global class TestApexClass {
        @AuraEnabled
        global static  List<Account> getName(String Name){
            System.debug('getName--->'+Name);
            List<Account> accList=[Select id,name from account where name=:Name];
            System.debug('accList--->'+accList);
            return accList;
        }
    public static void  voidMyTestMethod(integer i) {
        system.debug('Shatrughna Salunke');
    }
}