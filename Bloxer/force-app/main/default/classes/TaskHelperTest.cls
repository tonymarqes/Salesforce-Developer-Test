@isTest
public with sharing class TaskHelperTest {
    @TestSetup
    static void setup(){
        National_Holidays__c holiday = new National_Holidays__c();
        holiday.Name = 'Today is Holiday Test';
        holiday.Type__c = 'National';
        holiday.Date__c = Date.today();
        insert holiday;
    }

    @isTest
    public static void insertHolidayTask() {
        Test.startTest();
        Task task1 = new Task();
        task1.ActivityDate = Date.today();
        insert task1;
        Test.stopTest();
        System.assertEquals(true, [SELECT Id, Is_Holiday__c FROM Task].get(0).Is_Holiday__c);
    }

    @isTest
    public static void updateHolidayTask() {
        Test.startTest();
        Task task1 = new Task();
        task1.ActivityDate = Date.today().addDays(2);
        insert task1;

        task1.ActivityDate = Date.today();
        update task1; 
        Test.stopTest();
        System.assertEquals(true, [SELECT Id, Is_Holiday__c FROM Task].get(0).Is_Holiday__c);
    }

    @isTest
    public static void insertNonHolidayTask() {
        Test.startTest();
        Task task1 = new Task();
        task1.ActivityDate = Date.today().addDays(1);
        insert task1;
        Test.stopTest();
        System.assertEquals(false, [SELECT Id, Is_Holiday__c FROM Task].get(0).Is_Holiday__c);
    }

}
