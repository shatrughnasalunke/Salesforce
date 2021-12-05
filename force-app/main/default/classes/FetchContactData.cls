public with sharing class FetchContactData {
    public FetchContactData() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAllContacts(){
        try {
            
          List<Contact> getAllContact =[SELECT Id, Name FROM Contact limit 50000];
          return  getAllContact;
       
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}