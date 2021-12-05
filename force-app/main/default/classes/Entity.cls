public class Entity {
    @AuraEnabled
    public static List<EntityData> getAllBanksDetails(JSONParser parser) {
        system.debug('Parser Values--->'+parser);
        List<EntityData> listOfEntityData = new List<EntityData>();
        List<shatrughna94__Customer__c> listofCustomerData =  new List<shatrughna94__Customer__c>();
        while (parser.nextToken() != null) {
            EntityData  entityData =  new EntityData ();
            Shatrughna94__Customer__c insertToCustomer = new Shatrughna94__Customer__c(); 
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) ) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Id')) {
                    parser.nextToken();
                    entityData.Id = parser.getIdValue();
                    insertToCustomer.shatrughna94__CustomerId__c = parser.getText();
                    System.debug('Customer Id--->'+ insertToCustomer.shatrughna94__CustomerId__c);
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Salutation')) {
                        parser.nextToken();
                        entityData.Salutation = parser.getText();
                        insertToCustomer.shatrughna94__Salutation__c = parser.getText();
                        System.debug('Salutation--->'+insertToCustomer.shatrughna94__Salutation__c);
                    }
                    parser.nextToken();
                    if((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'FirstName')) {
                        parser.nextToken();
                        entityData.FirstName = parser.getText();
                        insertToCustomer.shatrughna94__FirstName__c = parser.getText();
                        System.debug('First Name--->'+insertToCustomer.shatrughna94__FirstName__c);
                    }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'LastName')) {
                        parser.nextToken();
                        entityData.LastName = parser.getText();
                        insertToCustomer.shatrughna94__LastName__c = parser.getText();
                        System.debug('Last Name--->'+insertToCustomer.shatrughna94__LastName__c);
                    }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Birthdate')) {
                        parser.nextToken();
                        entityData.Birthdate = parser.getText();
                        insertTOCustomer.shatrughna94__Birthdate__c = Date.valueOf(parser.getText()); 
                        System.debug('BirthDate-->'+insertTOCustomer.shatrughna94__Birthdate__c);
                    }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Email')){
                        parser.nextToken();
                        entityData.Email = parser.getText();
                        insertToCustomer.shatrughna94__Email__c = parser.getText();
                        System.debug('Email--->'+insertToCustomer.shatrughna94__Email__c);
                    }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'MobilePhone')) {
                        parser.nextToken();
                        entityData.MobilePhone = parser.getText();
                        insertToCustomer.shatrughna94__MobilePhone__c = parser.getText();
                        System.debug('Mobile Phone--->'+insertToCustomer.shatrughna94__MobilePhone__c);
                        
                    }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Active__c')) {
                        parser.nextToken();
                        entityData.Active = parser.getText();
                        insertToCustomer.shatrughna94__Active__c = Boolean.valueOf(parser.getText());
                        System.debug('Active--->'+insertToCustomer.shatrughna94__Active__c);
                    }
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'NomineeUpdated__c')) {
                        parser.nextToken();
                        entityData.NomineeUpdated = parser.getText();
                        system.debug('entityData.NomineeUpdated--->'+entityData.NomineeUpdated);
                        insertToCustomer.shatrughna94__NomineeUpdated__c = parser.getText();
                        System.debug('Nominee--->'+insertToCustomer.shatrughna94__NomineeUpdated__c);
                    }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'PANNumber__c')) {
                        parser.nextToken();
                        entityData.PANNumber = parser.getText();
                        insertToCustomer.shatrughna94__PANNumber__c = parser.getText();
                        System.debug('Pan Number--->'+insertToCustomer.shatrughna94__PANNumber__c);
                    }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'PrimaryAccount__c')) {
                        parser.nextToken();
                        entityData.PrimaryAccount = parser.getText();
                        insertToCustomer.shatrughna94__PrimaryAccount__c = parser.getText();
                        System.debug('Primary Account--->'+insertToCustomer.shatrughna94__PrimaryAccount__c);
                    }
                    listOfEntityData.add(entityData);
                    listofCustomerData.add(insertToCustomer);
                }
            }
        }
        if (System.isBatch() == True) {
            Database.UpsertResult[] resultdata = Database.Upsert(listofCustomerData,false) ;
            for ( Database.UpsertResult getData : resultdata) {
                if (getData.isSuccess()){
                    System.debug('Success Id --->'+getData.getId());
                } else {
                    for (Database.Error error: getData.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(error.getStatusCode() + ': ' + error.getMessage());
                        System.debug('Fields that affected this error: ' + error.getFields());
                    }
                } 
            }
        }
        return listOfEntityData;  
    }
    @AuraEnabled 
    public static List<Entity> fetchCustomerDataFromAPI (String getBody) {
        system.debug('Response---->'+getBody);
        return (List<Entity>)System.JSON.deserialize(getBody, Entity.class);
    }  
    public class EntityData {
        public String Id ;
        public String Salutation ;
        public String FirstName ;
        public String LastName ;
        public String Birthdate ;
        public String Email ;
        public String MobilePhone;
        public String Active;
        public String NomineeUpdated;
        public String PANNumber ;
        public String PrimaryAccount;
    }
}