public with sharing class HolidayCardController {
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getNextHoliday() {
        List<National_Holidays__c> holidays =  [SELECT Id, Name, Type__c, Date__c FROM National_Holidays__c WHERE Date__c >= TODAY LIMIT 1];

        Map<String, Object> response = new Map<String, Object>();

        if(holidays.size() > 0){
            National_Holidays__c holiday = holidays.get(0);
            response.put('hasNextHoliday', true);
            response.put('Name', holiday.Name);
            response.put('isToday', holiday.Date__c == Date.today());
            response.put('Date', holiday.Date__c.format());
            response.put('DaysDiff', Date.today().daysBetween(holiday.Date__c));
        }else{
            response.put('hasNextHoliday', false);
        }
        
        
        System.debug('Outro comentario APEX');

        return response;
    }
}