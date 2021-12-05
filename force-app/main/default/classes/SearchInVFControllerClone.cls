public without sharing class SearchInVFControllerClone { 
    public List<account> acc{get;set;}
    public void callMe () {
        SearchInVFController cc = new SearchInVFController();
        acc = cc.search() ;
    }
    public void clear(){
        acc.clear();
    }
}