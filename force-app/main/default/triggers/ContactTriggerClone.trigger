trigger ContactTriggerClone on Contact (Before Update ,After Insert, After Update, After undelete) {
    
    SWITCH on Trigger.operationType {
        
      When BEFORE_UPDATE {
             ContactTriggerhelperClone.UpdateContact(Trigger.new);
            // ContactTriggerhelperClone.UpdateContact(Trigger.newMap);
        }
        When AFTER_INSERT {
             ContactTriggerhelperClone.UpdateContact(Trigger.new);  
            // ContactTriggerhelperClone.UpdateContact(Trigger.newMap);
        }
        When AFTER_UPDATE {
             ContactTriggerhelperClone.UpdateContact(Trigger.new);
            // ContactTriggerhelperClone.UpdateContact(Trigger.newMap);
        }
        When AFTER_UNDELETE {
            ContactTriggerhelperClone.UpdateContact(Trigger.new);
            // ContactTriggerhelperClone.UpdateContact(Trigger.newMap);
        }
           
    } 
}