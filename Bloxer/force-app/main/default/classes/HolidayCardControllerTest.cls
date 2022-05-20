@isTest
public with sharing class HolidayCardControllerTest {
    @isTest
    public static void getNextHolidaySuccess() {
        Test.startTest();
        
        National_Holidays__c holiday = new National_Holidays__c();
        holiday.Name = 'HasFutureHoliday';
        holiday.Type__c = 'National';
        holiday.Date__c = Date.today().addDays(1);
        insert holiday;

        Map<String, Object> result = HolidayCardController.getNextHoliday();
        System.assertEquals(true, (Boolean) result.get('hasNextHoliday'));
        System.debug('Teste 2');

        Test.stopTest();
    }

    @isTest
    public static void getNextHolidayReturnsEmpty() {
        Test.startTest();
        
        National_Holidays__c holiday = new National_Holidays__c();
        holiday.Name = 'HasPastHoliday';
        holiday.Type__c = 'National';
        holiday.Date__c = Date.today().addDays(-5);
        insert holiday;

        Map<String, Object> result = HolidayCardController.getNextHoliday();
        System.assertEquals(false, (Boolean) result.get('hasNextHoliday'));

        Test.stopTest();
    }

}
