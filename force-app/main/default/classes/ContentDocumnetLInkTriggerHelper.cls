public class ContentDocumnetLInkTriggerHelper {
    
    public static void sendMultipleFile(Map<Id, ContentDocumentLink> neMap,  
                                        Map<Id, ContentDocumentLink> oldMap) {
     
        system.debug('newMap values---->'+neMap);                                    
        String subject = 'Placeholder';
        String body = 'Placeholder';
        Boolean isSuccess = false; 
        Set<Id>  caseIds = new Set<Id> ();
        Map<String, Case> mapOfContact = new Map<String, Case>();
        Set<Id>  contentDocumentId = new Set<Id> ();
      
       for (ContentDocumentLink  getRecords : neMap.Values()) {
               if (getRecords.LinkedEntityId != Null ) {
                   caseIds.add(getRecords.LinkedEntityId);
                   contentDocumentId.add(getRecords.ContentDocumentId);
               }
       }
                                            
       for(Case cclist : [SELECT Id, Contact.Email, CaseNumber FROM
                      	                     Case WHERE Id IN : caseIds] ) {
            mapOfContact.put(cclist.Contact.Email, cclist);
       }
                                            
       List<ContentVersion> cv_list = [SELECT VersionData, PathOnClient FROM 
                                                ContentVersion WHERE  
                                                ContentDocumentId IN :  contentDocumentId ];
    	if (cv_list.Size() > 0) {
            for (ContentVersion cv : cv_list) {
                Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                efa.setFileName(cv.pathOnClient); 
                efa.setBody(cv.versionData);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setUseSignature(false);
 				mail.setFileAttachments(new Messaging.EmailFileAttachment[] { efa }); 
                String[] toAddresses = new String[]{};
                for (String s : mapOfContact.keySet()) {
                     toAddresses.add(s);
                 }
                try {
                        List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });  
                        if(results[0].success) {
                                system.debug('isSucess--->'+isSuccess);
                                isSuccess = true;
                        }
                        else {
                                isSuccess = false;
                                system.debug('isSucess--->'+isSuccess);
                        }
                  } 
                 catch(Exception ex) {
                        isSuccess = false;
                 }
            }
        }                                        
    }
}