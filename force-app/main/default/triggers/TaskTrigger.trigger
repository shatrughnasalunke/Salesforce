trigger TaskTrigger on Task (before insert, before update, after insert, 
                             after update, before delete, after delete,
                             after undelete) {
                                                           
        Switch on trigger.operationType {
            WHEN BEFORE_INSERT  {
            }
            WHEN BEFORE_UPDATE {
            }
            WHEN AFTER_Insert {
            }
            WHEN After_Update{
            }
            WHEN Before_Delete{
                TriggerHelper.adminPrveillageForDelete(Trigger.oldMap);
            }
            WHEN After_Undelete {
            }
        }                            
}