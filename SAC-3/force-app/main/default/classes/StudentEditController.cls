Apex Class

// Apex Class for Editing Student Records
public with sharing class StudentEditController {
    // Apex Controller variable to store Student record
    @AuraEnabled public Student__c student {get; set;}
    
    // Method to retrieve Student record
    @AuraEnabled 
    public static Student__c getStudent(Id studentId) {
        return [SELECT Id, Name, Student_ID__c, Grade__c FROM Student__c WHERE Id =: studentId];
    }
    
    // Method to update Student record
    @AuraEnabled 
    public static void updateStudent(Student__c student) {
        
        // Validate Student Name 
        if(string.isBlank(student.Name)) {
            throw new AuraHandledException('Student Name is required.');
        }
        
        // Validate Student ID 
        if(string.isBlank(student.Student_ID__c)) {
            throw new AuraHandledException('Student ID is required.');
        }
        
        // Validate Grade
        if(string.isBlank(student.Grade__c)) {
            throw new AuraHandledException('Grade is required.');
        }
        
        // Perform DML operation to update Student record
        try {
            update student;
        } catch(Exception e) {
            throw new AuraHandledException('Error updating Student record.');
        }
    }
}