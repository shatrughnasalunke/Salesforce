public class lightningTreeController {
    @AuraEnabled
    public static List<item> getAccountTree(){
        List<item> items = new List<item>();
        List<Account> acctList = new List<Account>();
        acctList = [SELECT Id, Name, (SELECT Id, Name From Contacts) From Account LIMIT 10];
        for(Account acc: acctList){
            List<item> conitems = new List<item>();
            for(Contact c: acc.Contacts){
                item conitem = new item(c.Name, String.valueOf(c.Id), false, null);
                conitems.add(conitem);
            }
            item accitem = new item(acc.Name, String.valueOf(acc.Id), false, conitems);
            items.add(accitem);
        }
        return items;
    }
    public class item{
        @AuraEnabled
        public String label {get; set;}
        @AuraEnabled
        public String name {get; set;}
        @AuraEnabled
        public Boolean expanded {get; set;}
        @AuraEnabled
        public List<item> items {get; set;}
        
        public item(String label, String name, Boolean expanded, List<item> items){
            this.label = label;
            this.name = name;
            this.expanded = expanded;
            this.items = items;
        }
    }
}