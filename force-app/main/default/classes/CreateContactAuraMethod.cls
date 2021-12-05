public class CreateContactAuraMethod {
    @AuraEnabled
    public static Contact doInsert(String lastname)
    {
        System.debug('lastname---->'+lastname);
        contact c=new contact();
        c.lastname=lastname;
        insert c;
        return c;
    }
}