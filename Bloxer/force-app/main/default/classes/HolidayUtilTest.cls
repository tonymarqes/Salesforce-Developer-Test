@isTest
public with sharing class HolidayUtilTest {
    @isTest
    public static void getHolidaysSuccessfull() {
        Test.setMock(HttpCalloutMock.class, new HolidayMock(200));
        Test.startTest();
        HttpResponse response = HolidayUtil.getHolidays('2022');
        Test.stopTest();
        System.assertEquals(200, response.getStatusCode());  
    }

    @isTest
    public static void getHolidaysError404() {
        Test.setMock(HttpCalloutMock.class, new HolidayMock(404));
        Test.startTest();
        HttpResponse response = HolidayUtil.getHolidays('9000');
        Test.stopTest();
        System.assertEquals(404, response.getStatusCode());  
    }

    @isTest
    public static void getHolidaysError500() {
        Test.setMock(HttpCalloutMock.class, new HolidayMock(500));
        Test.startTest();
        HttpResponse response = HolidayUtil.getHolidays('Year');
        Test.stopTest();
        System.assertEquals(500, response.getStatusCode());  
    }

    @isTest
    public static void getHolidaysException() {
        Test.setMock(HttpCalloutMock.class, new HolidayMock(500));
        Test.startTest();
        HttpResponse response = HolidayUtil.getHolidays('');
        Test.stopTest();
        System.assertEquals(null, response);  
    }
}
