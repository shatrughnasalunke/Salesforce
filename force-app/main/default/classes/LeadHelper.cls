public with sharing class LeadHelper {
    public static void getCloneLead(Map<Id, Lead> cloneLead) {
      
        boolean avoidRecursion = false;
        boolean passPartialOperation = false;
        boolean listnotEmpty ;
        boolean  checkAccess;

        List<Lead> v1 = [SELECT ID,FirstName, 
                                lastName, Company,
							    LeadSource From 
                                Lead WHERE ID IN : cloneLead.keySet() WITH SECURITY_ENFORCED];
        
        List<Lead> duplicateLead = v1.deepClone();
        checkAccess = schema.sObjectType.Lead.fields.firstName.isCreateable();
        listnotEmpty = (!duplicateLead.isEmpty());
        
        if (listnotEmpty) {
            if(avoidRecursion==false) {
                avoidRecursion= true;
                if (Schema.sObjectType.Lead.fields.firstName.isCreateable()) {
                    Database.insert(duplicateLead, passPartialOperation);
                }
            }
        }
    }
}