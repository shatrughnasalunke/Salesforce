public with sharing class contatctnotifictaion {
    public contatctnotifictaion() {
    }
   // Send notification when case is closed 
    public static Set<String>  sendNotification(Map<Id, Contact> mapOfContact) {
        System.debug('Contatc Email-->'+mapOfContact);
        Set<String> emailId = new Set<String> ();
        for(Contact getContact :  mapOfContact.values()) {
                emailId.add(getContact.email);
        }
        if(emailId.size() > 0) {
            notificationAction(emailId);
            return emailId;
        }   
        return null;
    }
    public static void notificationAction(Set<String> getEmailId) {
        if (getEmailId!=null) {
            // send email withtText
            // add logic here 
        }
    }
    //Duplicate avoid based on email and phone
    public static void  duplicateRecord(List<Contact> listOfContact) {
            System.debug('list od contatc--->'+listOfContact);
            Set<String> emailId = new Set<String> ();
            Set<String> getPhone = new Set<String>();
            for (Contact  getContact  :  listOfContact) {
                emailId.add(getContact.email);
            }
    List<Contact> checkExistingCount  = [SELECT Email FROM Contact WHERE email IN : emailId OR Phone IN : getPhone];
    if (checkExistingCount.size() >0) {
        for (Contact ph : listOfContact) {
                   ph.email.addError('Duplicate contatc not allowed ');
            }    
        } 
    }
}