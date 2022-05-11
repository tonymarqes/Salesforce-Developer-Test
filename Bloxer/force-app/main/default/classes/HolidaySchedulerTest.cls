@istest
public with sharing class HolidaySchedulerTest {

    // HolidayScheduler m = new HolidayScheduler();
    // String sch = '0 minute * day * ? *';
    // String jobID = system.schedule('Holiday Job', sch, m);


    @isTest
    public static void shouldSchedule() {
        Test.setMock(HttpCalloutMock.class, new HolidayMock(200));
        Test.startTest();
        HolidayScheduler m = new HolidayScheduler();
        String sch = '0 0 0 1 1 ? *';
        String jobID = system.schedule('Holiday Job', sch, m);
        Test.stopTest();
    }
}
