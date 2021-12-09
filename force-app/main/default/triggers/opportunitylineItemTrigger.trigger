Trigger opportunitylineItemTrigger on opportunityLineItem (
            before insert,
            before update,
            after insert,
            after update,
            before delete,
            after delete,
            after undelete  ) {
            SWITCH ON Trigger.OperationType {
               WHEN BEFORE_Insert {
               }
               WHEN AFTER_INSERT {
                OppLineItemHelper.doInsertAsset(Trigger.newMap);
               }
           }             
}