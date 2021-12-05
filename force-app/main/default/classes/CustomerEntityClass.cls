public class CustomerEntityClass {
 @AuraEnabled
 public static List<CustomertWrapper> fetchAccount(JSONParser parser) {
    
     CustomertWrapper accWrapper = new CustomertWrapper();
     List<CustomertWrapper> accWrapperList = new List<CustomertWrapper>();
     while (parser.nextToken() != null) { 
           if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) {
               if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Id')) {
                      parser.nextToken();
                      accWrapper.Ids=parser.getText();
                      parser.nextToken();
                     if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Name')){
                      parser.nextToken();
                      accWrapper.FirstName = parser.getText();
                   }
                }
              }
               accWrapperList.add(accWrapper);
           }
          return accWrapperList;
    }
    public static CustomertWrapper fetchAccountJson(String jsonBody) {
       CustomertWrapper response = (CustomertWrapper) JSON.deserialize(jsonBody, CustomertWrapper.class);
       return response;
    } 
    public class CustomertWrapper{
        @AuraEnabled
        public String Ids{get;set;}
        @AuraEnabled
        public String FirstName{get;set;}
        @AuraEnabled
        public Integer accountCount{get;set;}
    }
}