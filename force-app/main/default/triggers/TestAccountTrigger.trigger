Trigger TestAccountTrigger on Account ( before insert,
                                        before update,
                                        after insert, 
                                        after update,
                                        before delete,
                                        after delete,
                                        after undelete
                                        ) {

            SWITCH on Trigger.OperationType {
                WHEN BEFORE_INSERT {
                }
                WHEN BEFORE_UPDATE {
                }
                WHEN AFTER_INSERT{
                }
                WHEN AFTER_UPDATE{
                }
                WHEN BEFORE_DELETE{
                }
                WHEN AFTER_DELETE{
                }
                WHEN AFTER_UNDELETE {
                }       
           }                         
}