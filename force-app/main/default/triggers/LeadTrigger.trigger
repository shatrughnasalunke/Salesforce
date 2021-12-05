Trigger LeadTrigger on Lead (before insert,
                             before update, 
                             after  insert,
                             after  update, 
                             before delete, 
                             after  delete,
                             after  undelete) {
                             Switch On Trigger.OperationType {
                                WHEN BEFORE_INSERT {
                                }
                                WHEN BEFORE_UPDATE {
								}
                                WHEN AFTER_INSERT {
                                 LeadHelper.getCloneLead(Trigger.newMap);   
                                }
                                WHEN AFTER_UPDATE {
								}
                             }      
}