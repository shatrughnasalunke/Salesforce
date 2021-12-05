public class ContactList
{
   public class WrapperContact
   { 
      public string FirstName;
      public string lastName;
      public String Email;
   }
    @AuraEnabled 
    public static List<WrapperContact> getContact()
    {
        List<WrapperContact>  wrapList=new  List<WrapperContact>();
        for(Contact clist:[Select Id,FirstName,lastName,Email from Contact])
        {     
        	WrapperContact w = new WrapperContact();
        	w.FirstName=clist.FirstName;
        	w.FirstName=clist.lastName;
        	w.FirstName=clist.Email;
            wrapList.add(w);
        }
       System.debug('--->'+wrapList); 
       return wrapList; 
    }
}