public class NewServiceForm {

    public class DataClass
    {
   	 	public string servicetitle{get;set;}
   	 	public string description{get;set;}
   	 	public string name{get;set;}
    	public string datatype{get;set;}
        public string selectPicklistvalue{get;set;}
    }
 

    public static void getData(List<DataClass> abs) {
        for(DataClass x:abs)
        {
             Account ss=new Account();
             ss.Name=x.servicetitle;
             ss.description=x.description;
        }
        
    }
}