/**
* @description       : 
* @author            : Shatrughna.Salunke
* @group             : 
* @last modified on  : 22-05-2021
* @last modified by  : Shatrughna.Salunke
* Modifications Log 
* Ver   Date         Author               Modification
* 1.0   21-05-2021   Shatrughna.Salunke   Initial Version
**/
public class AccountTriggerHandler extends TriggerHandler{
    
    private Map<Id, Account> oldMap(){
        return (Map<Id, Account>)Trigger.oldMap;
    }
    private Map<Id, Account> newMap(){
        
        return (Map<Id, Account>)Trigger.newMap;
    }
    
    private List<Account> oldList(){
        
        return (List<Account>)Trigger.old;
    }
    
    private List<Account> newList(){
        
        return (List<Account>)Trigger.new;
    }
    
    public override void handleBeforeInsert(){
        List<Account> newList = newList();
        handleBeforeInsertHandler.validateInput(newList);
        handleBeforeInsertHandler.copyBillingAddressFromShippingAddress(newList);
        handleBeforeInsertHandler.validatePhoneNumber(newList);
    }
    
    public override void handleAfterInsert(){
        Map<Id, Account> oldMap = oldMap();
        Map<Id, Account> newMap = newMap();
        handleAfterUpdateHandler.updaetLastActivityDateOnContactFromAccount(oldMap, newMap);
    }
    
    public override void handleBeforeUpdate(){
        Map<Id, Account> newMap = newMap();
        List<Account> newList = newList();
        AccountActivationPorcess.checkActivationProcess(newMap);
    }
    
    public override void handleAfterUpdate(){
        Map<Id, Account> oldMap = oldMap();
        Map<Id, Account> newMap = newMap();
        handleAfterUpdateHandler.updateOpportunityAndContacts(newMap);
        handleAfterUpdateHandler.sendEmail(oldMap,newMap);
    }
    
    public override void handleBeforeDelete(){
        Map<Id, Account> oldMap = oldMap();
        AccountActivationPorcess.checkActivationProcess(oldMap);
    }
    
    public override void handleAfterDelete(){
    }
    
    public override void handleAfterUndelete(){
    }
}