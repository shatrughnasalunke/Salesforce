public class TestController {
        @AuraEnabled(cacheable=true)    
        public static Map<String, String> getCountry(){
        Map<String, String> options = new Map<String, String>();
        Map<String, String> getCountryValues=new Map<String, String>();
        Schema.DescribeFieldResult fieldResult = Account.shatrughna94__Country__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for(shatrughna94__Custom_Country_Object__c cc:  [SELECT Id, shatrughna94__India__c, shatrughna94__State__c FROM shatrughna94__Custom_Country_Object__c])
        {
            System.debug('cc'+cc);
           // options.put(cc.shatrughna94__India__c, cc.shatrughna94__India__c);
            System.debug(cc.shatrughna94__India__c);
            for (Schema.PicklistEntry p: pList)
            { System.debug(p.getValue());
               if(cc.shatrughna94__India__c.Equals(p.getValue()))
               {      System.debug('true');
                   options.put(cc.shatrughna94__India__c, cc.shatrughna94__India__c);
               }
            }
        }
        system.debug('options----->'+options);
        return options;
    }
    @AuraEnabled(cacheable=true)    
    public static List<String> gteValues(String selectdCountry)
    {
        List<String> strlist=new list<String>();
        for(shatrughna94__Custom_Country_Object__c cc1:  [SELECT Id, shatrughna94__India__c, shatrughna94__State__c FROM shatrughna94__Custom_Country_Object__c where shatrughna94__India__c=:selectdCountry])
        {
            strlist.add(cc1.shatrughna94__State__c);
        }
        System.debug(strlist);
        return strlist;
    }
 	
}