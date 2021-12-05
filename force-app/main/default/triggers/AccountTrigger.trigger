/* -------------------------------------------------------------------------------------------------+
* This is the framework/virtual class for Apex Triggers.
*
* Developed by Shatrughna  Salunke. This class is intended to be extended by
* additional apex classes to implement various standard/custom object trigger handlers.
* It is the intention 
* --------------------------------------------------------------------------------------------------
* @author         Shatrughna Salunke <shatrughnasalunkhe@gmail.com>
* @modifiedBy     Shatrughna Salunke <shatrughnasalunkhe@gmail.com>
* @maintainedBy   Shatrughna Salunke
* @version        0.1
* @created        2021-02-01
* @modified       2021-02-01
* @systemLayer    Triggers
* @see            classes/AccountTriggerHandler.cls for concrete implementation
* @see  triggers/AccountTrigger.trigger for invocation example
* --------------------------------------------------------------------------------------------------
* @changes 
* v0.1            shatrughnasalunkhe@gmail.com
* 2021-02-01      Implemented this class along with AccountTriggerHandler
*                 Invocation from AccountTrigger.trigger
*
* v0.1            shatrughnasalunkhe@gmail.com
* 2021-02-04      Refactored/simplified how this is invoked.
* -------------------------------------------------------------------------------------------------+
*/
trigger AccountTrigger on Account( before insert, after insert,before update, after update, 
                                   before delete, after undelete){
          TriggerHandler.run(AccountTriggerHandler.class);
         /*          
          * Trigger.operationType return the event type i.e before insert, before update...
          * Add all new logic inside the class called AccountTriggerHandler.
          * Important : Do not add any new logic inside the trigger.
         */
         System.debug('Account trigger event' +Trigger.operationType + 'end');  
         System.debug('Test Debug adde');
         System.debug('For Triger Changes');
         
 }