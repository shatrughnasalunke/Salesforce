trigger AccountTriggerCallout on Account (before insert, after insert, before update,after update,
                                          before delete, after delete, after undelete) {

    SWITCH ON  Trigger.OperationType {

        WHEN BEFORE_INSERT  {
            AccountTriggerCalloutHelper.doAutoDecisioning(Trigger.new);
        }
        WHEN BEFORE_UPDATE {
        }
        WHEN AFTER_INSERT {
            AccountTriggerCalloutHelper.beforeCallout(Trigger.newMap);
        }
        WHEN AFTER_UPDATE {
          //AccountTriggerCalloutHelper.beforeCallout(Trigger.newMap);
        }
        WHEN BEFORE_DELETE {
        }
        WHEN AFTER_UNDELETE {
        }
    
    }

}