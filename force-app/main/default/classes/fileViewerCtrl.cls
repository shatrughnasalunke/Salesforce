public class fileViewerCtrl {
    @AuraEnabled 
    public static List<contentDocument> fetchContentDocument(){
        return [Select id,Title,FileType,CreatedBy.Name,ContentSize From contentDocument LIMIT 1000];
    }
}