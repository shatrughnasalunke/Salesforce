public with sharing class sampleapexclass {
    public sampleapexclass() {

    }
   @AuraEnabled
   public static void  callMe(String getName){
       try {
              
        System.debug('getName--->'+getName);
        
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
   }
   @AuraEnabled
   public static void methodName(String fileName){
       try {
         System.debug('fileName--->'+fileName);
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
   }
}