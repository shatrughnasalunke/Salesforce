public class ContactAuraController {
   
    @AuraEnabled
    public static ContactDataTableWrapper getContactData(Integer pageNumber, Integer pageSize, String getName) {
        System.debug('objectType--->'+getName);
        //Offset for SOQL
        Integer offset = (pageNumber - 1) * pageSize;
         String str= getName;
        //Total Records
      //  Integer totalRecords = 'SELECT COUNT() FROM str';
        Integer  totalRecords= database.countQuery('SELECT count() FROM str');
        System.debug(totalRecords);
        Integer recordEnd = pageSize * pageNumber;
    
        //Instance of Contact DataTable Wrapper Class
        ContactDataTableWrapper objDT =  new ContactDataTableWrapper();  
        objDT.pageSize = pageSize;
        objDT.pageNumber = pageNumber;
        objDT.recordStart = offset + 1;
        objDT.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
        objDT.totalRecords = totalRecords;
        String soqlQuery = 'SELECT ID,Name FROM str ORDER BY Name LIMIT :pageSize OFFSET :offset';
        objDT.contactList =database.query(soqlQuery);
        return objDT;
    }
     
    //Wrapper Class For Contact DataTable  
    public class ContactDataTableWrapper {
        @AuraEnabled
        public Integer pageSize {get;set;}
        @AuraEnabled
        public Integer pageNumber {get;set;}
        @AuraEnabled
        public Integer totalRecords {get;set;}
        @AuraEnabled
        public Integer recordStart {get;set;}
        @AuraEnabled
        public Integer recordEnd {get;set;}
        @AuraEnabled
        public List<Contact> contactList {get;set;}
    }
}