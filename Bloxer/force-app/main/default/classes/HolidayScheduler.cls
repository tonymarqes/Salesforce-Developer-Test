global class HolidayScheduler implements Schedulable {  
    global void execute(SchedulableContext SC) {
        InsertHolidays.doInsert(); 
     }
}
