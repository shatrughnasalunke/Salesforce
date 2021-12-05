public class HandleCustomException extends Exception {
    
    public static void LogException(Exception e){
        LogException(e,'');
    }
    public static void LogException(Exception e,string relatedToId){
        try {
                String stackTrace = e.getStackTraceString().substringBefore('\n');
                String className = stackTrace.substringAfter('shatrughna94.').substringBefore('.');	
                String methodName = stackTrace.substringBefore(':').substringAfter(className).substringAfter('.');
                        
                String QueryLimit = '1. SOQL Queries used / SOQL Queries allowed: ' + Limits.getQueries() + '/' + Limits.getLimitQueries();
                String DMLimit = '2. Number of records queried so far /  Number allowed: ' + Limits.getDmlRows() + '/' + Limits.getLimitDmlRows();
                String DMLStat = '3. Number of DML statements used so far / Number allowed: ' +  Limits.getDmlStatements() + '/' + Limits.getLimitDmlStatements();   
                String CPUT = '4. Amount of CPU time (in ms) used so far / CPU usage time (in ms) allowed: ' + Limits.getCpuTime() + '/' + Limits.getLimitCpuTime();
              
            
                CustomException__c exc = new CustomException__c();
            	exc.Related_To_Number__c=relatedToId;
                //exc.Govt_Limit_in_Executing_Code__c = String.format('{0}\n{1}\n{2}\n{3}',new List{QueryLimit, DMLimit,DMLStat,CPUT});
                exc.Exception_Message__c = e.getMessage();
                exc.Exception_Type__c = e.getTypeName();
                exc.Line_Number__c = e.getLineNumber();
                exc.StackTrace__c = e.getStackTraceString();
                exc.MethodName__c=methodName;
                exc.ClassName__c=className;
                database.insert(exc);            
        } 
        finally{
        }            
    } 
}