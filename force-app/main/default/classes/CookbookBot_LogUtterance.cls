public with sharing class CookbookBot_LogUtterance
{
    public class LogInput
    {
        @InvocableVariable(required=false)
        public String sCurrentUtterance;
        
        @InvocableVariable(required=true)
        public String sLiveAgentTranscriptId;
    }
    @InvocableMethod(label='Log Utterance')
    public static void logUtterance(List<LogInput> inputParameters)
    {
          if(inputParameters.size()>0)
          {    
            System.debug('inputParameters---->'+inputParameters);
            String sCurrentUtterance = inputParameters[0].sCurrentUtterance;
            String sLiveAgentTranscriptId = inputParameters[0].sLiveAgentTranscriptId;
            System.debug('sLiveAgentTranscriptId---->'+sLiveAgentTranscriptId);
            shatrughna94__Utterance__c logRecord = new shatrughna94__Utterance__c();
            logRecord.shatrughna94__CurrentUtterance__c = sCurrentUtterance;
            logRecord.shatrughna94__Chat_Transcript__c=sLiveAgentTranscriptId;
        	insert logRecord;
          }
        }
}