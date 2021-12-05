public with sharing class UserController {
    @AuraEnabled
    public static List<User> getUserList()
    {
        System.debug('Shatrughna Salunke');
        return [Select id,name,email FROM User];
    }
}