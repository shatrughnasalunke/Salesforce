trigger TestAccountTrigger on Account ( before update, after insert, after update) {
    if (Trigger.isBefore) {
        for (Account accountinstance : Trigger.new) {
            if (Trigger.isBefore) {
             accountinstance.shatrughna94__Exe_Count__c +=1;
            }
           system.debug('Count-->'+accountinstance.shatrughna94__Exe_Count__c);
        }
      
    }
}