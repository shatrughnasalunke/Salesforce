public class DataDisplayController {
    public String PDFData {get; set;} 
    
    public DataDisplayController()
    {
        PDFData = '';
    }
    
    public PageReference downloadPDF()
    {
        System.PageReference pageRef = new System.PageReference('/apex/PDFGenerator');
       //ensure pdf downloads and is assigned with defined name
        pageRef.getHeaders().put('content-disposition', 'attachment; filename=TestPDF.pdf');
        
        return pageRef;
    }
}