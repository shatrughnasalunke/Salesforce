/**
 * @description       : 
 * @author            : Shatrughna.Salunke
 * @group             : 
 * @last modified on  : 21-05-2021
 * @last modified by  : Shatrughna.Salunke
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   21-05-2021   Shatrughna.Salunke   Initial Version
**/
trigger ContactTrigger on Contact (Before Insert , Before Update,
                                   After Insert, After Update,
                                   Before Delete, After Delete,
                                   After Undelete) {
                                       
Switch on Trigger.OperationType{
      When Before_Insert {
            ContactBeforeInsertHandler.doUpdate(Trigger.new);
            ContactBeforeInsertHandler.getContactCountOnAccount(Trigger.new);
      }
      When Before_Update {
            ContactBeforeInsertHandler.doUpdate(Trigger.new);
            ContactBeforeInsertHandler.getContactCountOnAccount(Trigger.new);
      }
      When Before_DELETE {
             TotalContatctCount.getContatcCountOnAccount(Trigger.Old);
      }
      When After_DELETE {
      }
      When After_Undelete {
           TotalContatctCount.getContatcCountOnAccount(Trigger.new);
      }
   } 

}