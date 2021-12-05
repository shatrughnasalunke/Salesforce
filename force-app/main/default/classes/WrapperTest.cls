public class WrapperTest {
     public Wrapper accString {get;set;}
     public WrapperTest(){
      accString = new Wrapper();
      accString.name = 'Shatrughna Salunke';
      accString.FirstName = 'Shatrughna Salunke';
      accString.LastName = 'Shatrughna Salunke';
      accString.College = 'Shatrughna Salunke';
      accString.Country = 'Shatrughna Salunke';
    } 
    public class Wrapper
    {
        public String name {get;set;}
        public String FirstName {get;set;}
        public String LastName {get;set;}
        public String College {get;set;}
        public String State {get;set;}
        public String Country {get;set;}
    }
}