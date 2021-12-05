public class wrapperCustomObjCtrCmp {    
   
    public class wrapperCustomClass{
        @AuraEnabled
        public string studentName;
        @AuraEnabled
        public string studentEmail;
        @AuraEnabled
        public string studentAddress;
        @AuraEnabled
        public Id recStudentId;        
        @AuraEnabled
        public Boolean editMode;
        
        public wrapperCustomClass(string studentName, string studentEmail, string studentAddress, Id recStudentId,Boolean editMode){
         this.studentName = studentName;
         this.studentEmail = studentEmail;
         this.studentAddress = studentAddress;  
         this.recStudentId = recStudentId;           
         this.editMode=editMode;
        }
        
    }
    
    
    @AuraEnabled
    public static List<wrapperCustomClass> appCustomWrapListMthd(){
       List<NewStudent__c> newStudent = new List<NewStudent__c>();       
       List<wrapperCustomClass> custWrapObj = new  List<wrapperCustomClass>();            
       List<NewStudent__c> newStudentView =[SELECT ID, Name, shatrughna94__Email__c, shatrughna94__Address__c  FROM shatrughna94__NewStudent__c ORDER BY NAME ASC];
            
        for(NewStudent__c studentObj:newStudentView){            
           custWrapObj.add(new wrapperCustomClass(studentObj.Name, studentObj.shatrughna94__Email__c,studentObj.Address__c, studentObj.Id, false));   
        }
        system.debug('custWrapObj---->'+custWrapObj);
        return custWrapObj;
    }
    
   
    @AuraEnabled
    public static List<NewStudent__c> delectRecId(Id delRecId){
        delete [Select Id From NewStudent__c Where Id=:delRecId];        
        List<NewStudent__c> listStudent = [Select Id, Name, Email__c, Address__c From NewStudent__c];        
        return listStudent;       
    }    
    
    @AuraEnabled
    public static NewStudent__c saveEdited(string editName, string editAddress, string editEmail, Id recId){
        system.debug('==recId=='+recId);
        
        NewStudent__c newStudentView =[Select Id, Name, Email__c, Address__c From NewStudent__c Where Id=:recId];
        newStudentView.Name = editName;
        newStudentView.Address__c= editAddress;
        newStudentView.Email__c= editEmail;
        update newStudentView;
        return newStudentView;        
    }
 }