public class LeadHelper {
    public static void getCloneLead(Map<Id, Lead> cloneLead) {
        
        boolean avoidRecursion = false;
        List<Lead> accLead = [SELECT ID,FirstName, lastName, Company,
							  LeadSource From Lead WHERE ID IN : cloneLead.keySet()];
        system.debug('accLead-->'+accLead);
        List<Lead> duplicateLead = accLead.deepClone();
        System.debug('duplicateLead--->'+duplicateLead);
        if (!duplicateLead.isEmpty()) {
            if(avoidRecursion==false) {
                avoidRecursion= true;
                Database.insert(duplicateLead, true);
            }
          
        }
    }
}