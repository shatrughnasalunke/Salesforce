public inherited sharing class SearchInVFController {
    public list <Account> acc;
    public SearchInVFController( ) {
    }
    public List<Account> search(){
        string searchquery='SELECT Name,Id FROM Account  ORDER BY Name DESC';
        acc= Database.query(searchquery);
        return acc;
    }
}
//The sharing setting of the class where a method is defined is applied,
//not of the class where the method is called from. For example, 
//if a method is defined in a class declared as with sharing is called by a class declared as 
//without sharing, the method executes with sharing rules enforced.