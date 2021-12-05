trigger AccountTriggerV1 on Account (before insert) {

    switch on Trigger.OperationType {
        when Before_Insert {
        }
        when Before_Update {
        }
        when After_Insert {
         AccountTriggerHelperV1.getContatcCount();
        }
    
        when  After_Update {
        }
       when Before_Delete {
        }
        when After_Delete {
        }
       
        when After_Undelete {
        }
    }
}