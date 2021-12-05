trigger OpportunityTrigger on Opportunity ( Before insert, Before update,
                                            After insert, After update, Before delete, After delete,
                                            After undelete   
                                           ) {
       Switch on Trigger.operationtype{
           When Before_Insert {
           }
           When Before_Update {
           }
           when After_Insert {
            OpportunityHelper.doInsertOpportunityLineItems(Trigger.newMap);
           }
           When After_Update { 
           } 
           When Before_Delete {
               //trigger when Opportunity is deleted then send a email to related Account owner. 
               //for opportunity deletion like who deleted it and same for undelete case but when opportunity is. 
               //undelete then send email to accounts Owner. if someone who is not admin.            
              // NotifyOpportunityOwner.notifyOpportunityOwnerWhenOpportunityDeleted(trigger.oldMap);
           }
           When AFTER_DELETE {
           }
           WHEN AFTER_UNDELETE {
               //NotifyOpportunityOwner.notifyOpportunityOwnerWhenOpportunityDeleted(trigger.newMap);
           }
       }                                     
}