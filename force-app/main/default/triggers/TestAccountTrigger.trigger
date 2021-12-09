Trigger TestAccountTrigger on Account ( before insert,
                                        before update,
                                        after insert, 
                                        after update,
                                        before delete,
                                        after delete,
                                        after undelete
                                        ) {
                SWITCH on Trigger.OperationType {
                WHEN AFTER_INSERT{
                    TestAccountTriggerHelper.updateOpporunity(Trigger.newMap);
                    TestAccountTriggerHelper.doInsertContact(Trigger.newMap);
                }
           }                         
}