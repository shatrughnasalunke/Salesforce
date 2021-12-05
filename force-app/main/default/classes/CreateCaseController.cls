public with sharing class CreateCaseController {
    public Case theCase {get; set;}
    public String lastError {get; set;}
    public CreateCaseController() {
        theCase = new Case();
        lastError = '';
    }
      
    public PageReference createCase() {
        createNewCase();
        theCase = new Case();
        return null;
    }
       
     private void createNewCase() {      
        try {
            insert theCase;
            
            FeedItem post = new FeedItem();
            post.ParentId = ApexPages.currentPage().getParameters().get('id');
            post.Body = 'created a case';
            post.type = 'LinkPost'; 
            post.LinkUrl = '/' + theCase.id;
            post.Title = theCase.Subject;
            insert post;
        } catch(System.Exception ex){
           lastError = ex.getMessage();
        }
    }   
}