trigger AccountTriggerVersion2 on Account (before insert, before update, After insert, after update, 
                                           before delete, after undelete ) {
                switch on Trigger.OperationType {
                    when  Before_Insert{
                    AccountHelperVersion2.cloneBillingAddressToShippingAddress(Trigger.new);
                    }
                    when Before_Update{
                        AccountHelperVersion2.cloneBillingAddressToShippingAddress(Trigger.new);

                        System.debug('inside befire trigger');
                        system.debug('my Second chnages ');
                    }
                }                         
}