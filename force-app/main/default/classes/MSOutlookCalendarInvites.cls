public class MSOutlookCalendarInvites {
    
    @invocableMethod
    public static void Sendinvite() { 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        mail.setToAddresses(new List<String>{'s.vishnu.salunke@accenture.com'}); 
        mail.setSubject('Meeting Invitation'); 
        mail.setPlainTextBody(''); 
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment(); 
        attach.filename = 'reminder.ics'; 
        attach.ContentType = 'text/calendar; charset=utf-8; method=REQUEST';
        attach.inline = true; 
        attach.body = invite(); 
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] {attach}); 
        Messaging.SendEmailResult[] er = Messaging.sendEmail(new Messaging.Email[] { mail }); 
    }
    
    private static Blob invite() { 
        DateTime dt=DateTime.now().adddays(1);
        String startdatetime = String.valueof(dt.year()+'0'+dt.month()+''+dt.day()+'T110000');
        String enddatetime = String.valueof(dt.year()+'0'+dt.month()+''+dt.day()+'T100000');
        String txtInvite = ''; 
        txtInvite += 'BEGIN:VCALENDAR\n'; 
        txtInvite += 'PRODID:-//Microsoft Corporation//Outlook 12.0 MIMEDIR//EN\n';
        txtInvite += 'VERSION:2.0\n';
        txtInvite += 'METHOD:REQUEST\n';
        txtInvite += 'CALSCALE:GREGORIAN \n';
        txtInvite += 'X-MS-OLK-FORCEINSPECTOROPEN:TRUE\n';
        txtInvite += 'BEGIN:VEVENT\n';
        txtInvite += 'CLASS:PUBLIC\n';
        txtInvite += 'CREATED:20191026T203709Z\n';
        txtInvite += 'DTEND:'+enddatetime+'\n';
        txtInvite += 'DTSTAMP:20191026T203709Z\n';
        txtInvite += 'DTSTART:'+startdatetime+'\n';
        txtInvite += 'LAST-MODIFIED:20191026T203709Z\n';
        txtInvite += 'LOCATION:US\n';
        txtInvite += 'PRIORITY:5\n';
        txtInvite += 'SEQUENCE:0\n';
        txtInvite += 'ACTION:DISPLAY\n';
        txtInvite += 'SUMMARY;';
        txtInvite += 'LANGUAGE=en-us:Meeting Reminder\n';
        txtInvite += 'TRANSP:OPAQUE\n';
        txtInvite += 'UID:'+startdatetime+'Z-4000F192713-0052@salesforce.com\n';
        txtInvite += 'X-ALT-DESC;FMTTYPE=text/html:<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN"><HTML><HEAD><META NAME="Generator" CONTENT="MS Exchange Server version 08.00.0681.000"><TITLE></TITLE></HEAD><BODY></BODY></HTML>\n';
        txtInvite += 'X-MICROSOFT-CDO-BUSYSTATUS:BUSY\n';
        txtInvite += 'X-MICROSOFT-CDO-IMPORTANCE:1\n';
        txtInvite += 'END:VEVENT\n';
        txtInvite += 'END:VCALENDAR'; 
        return Blob.valueOf(txtInvite);
    }
 }