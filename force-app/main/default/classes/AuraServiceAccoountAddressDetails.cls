public class AuraServiceAccoountAddressDetails {
    @AuraEnabled
    Public Static List<Account> fetchAccount()
    {
        List<account> acclist=[SELECT Id, ShippingStreet, 
                               ShippingCity, ShippingState, 
                               ShippingPostalCode, ShippingCountry, 
                               ShippingLatitude, ShippingLongitude, 
                               ShippingGeocodeAccuracy, ShippingAddress
                               FROM Account where ShippingStreet!=null AND 
                               ShippingCity!=null AND ShippingState!=null AND 
                               ShippingPostalCode!=null AND ShippingCountry!=''];
        System.debug('acclist--->'+acclist); 
        return acclist;
    }
}