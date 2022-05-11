public with sharing class InsertHolidays implements Database.AllowsCallouts {
    
    @future(callout=true)
    public static void doInsert() {

        Date currentDate = Date.today();
        String currentYear = String.valueOf(currentDate.year());
        HttpResponse result = null;

        try {
            result = HolidayUtil.getHolidays(currentYear);
            if(result != null){
                if(result.getStatusCode() == 200){
                    List<Object> holidaysList = (List<Object>) JSON.deserializeUntyped(result.getBody());
                    insertRecords(holidaysList);
                }    
            }
        } catch (Exception e) {
            System.debug('Unexpected Error: ' + e.getMessage() + ' - Stack Trace : ' + e.getStackTraceString());
        }
    }


    private static void insertRecords(List<Object> holidaysList){
        List<National_Holidays__c> listHolidaysToInsert = new List<National_Holidays__c>();
        for(Object obj : holidaysList){
            Map<String, Object> holiday = (Map<String, Object>) obj;
            National_Holidays__c newHoliday = new National_Holidays__c();
            newHoliday.Name = String.valueOf(holiday.get('name'));
            newHoliday.Date__c = Date.valueOf((String) holiday.get('date'));
            newHoliday.Type__c = String.valueOf(holiday.get('type'));
            listHolidaysToInsert.add(newHoliday);
        }

        insert listHolidaysToInsert;
    } 
}
