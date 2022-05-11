@isTest
public with sharing class InsertHolidaysTest {
    @isTest
    public static void shouldInsertRecords() {
        Test.setMock(HttpCalloutMock.class, new HolidayMock(200));
        Test.startTest();
        InsertHolidays.doInsert();
        Test.stopTest();
        System.assert([SELECT Id FROM National_Holidays__c].size() > 0);
    }

    @isTest
    public static void shouldNotInsertRecords() {
        Test.setMock(HttpCalloutMock.class, new HolidayMock(404));
        Test.startTest();
        InsertHolidays.doInsert();
        Test.stopTest();
        System.assert([SELECT Id FROM National_Holidays__c].size() == 0);
    }
    
    @isTest
    public static void shouldThrowErrorAndNotInsertRecords() {
        //Test return with statusCode 200 but different structure
        Test.setMock(HttpCalloutMock.class, new HolidayMock(000));
        Test.startTest();
        InsertHolidays.doInsert();
        Test.stopTest();
        System.assert([SELECT Id FROM National_Holidays__c].size() == 0);
    }
}