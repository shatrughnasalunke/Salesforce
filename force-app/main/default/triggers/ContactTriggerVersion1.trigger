trigger ContactTriggerVersion1 on Contact (before insert, After Insert , 
                                           before update, after update,
                                           before delete, after delete, after undelete) {
        switch on Trigger.OperationType {

            when Before_Insert {
                System.debug('Before Insert');
                //ContactTriggerHelperV1.preventDuplicateContact(Trigger.newMap, Trigger.oldMap);
            }
            when Before_Update {
                System.debug('Before Update');
                ContactTriggerHelperV1.preventDuplicateContact(Trigger.newMap, Trigger.oldMap);
            }
            when After_Insert {
                ContactTriggerHelperV1.getContactCount(Trigger.new);
                ContactTriggerHelperV1.getContactCountV1(Trigger.newMap);
                contatctnotifictaion.sendNotification(Trigger.newMap);
            }
            When After_Update {
                ContactTriggerHelperV1.avoidMultiplePrimaryContact(Trigger.newMap);
            }
            when Before_Delete {
                ContactTriggerHelperV1.doNotDeleteActiveContact(Trigger.oldMap);
            }   
            when After_Delete {
                ContactTriggerHelperV1.getContactCount(Trigger.Old);
                ContactTriggerHelperV1.getContactCountV1(Trigger.oldMap);
            }
            when After_Undelete {
                ContactTriggerHelperV1.getContactCount(Trigger.new);
            }  
        }
    }