public with sharing class TaskHelper {
    public void afterInsert(List<Task> newTasksRecords) {
        updateHolidayField(newTasksRecords);
    }
    
    public void afterUpdate(List<Task> newTasksRecords) {
        updateHolidayField(newTasksRecords);
    } 
    
    private void updateHolidayField(List<Task> listOfTasks){
        Set<Date> tasksDates = new Set<Date>();

        for(Task taskItem : listOfTasks){
            if(taskItem.ActivityDate != null){
                tasksDates.add(taskItem.ActivityDate);
            }
        }

        List<National_Holidays__c> nationalHolidays = [SELECT Id, Name, Type__c, Date__c FROM National_Holidays__c WHERE Date__c IN: tasksDates];

        for(Task taskItem : listOfTasks){
            for(National_Holidays__c nationalHoliday : nationalHolidays){
                    if(taskItem.ActivityDate == nationalHoliday.Date__c){
                        taskItem.Is_Holiday__c = true;
                    }else{
                        taskItem.Is_Holiday__c = false;
                    }
            }
        }
    }
}
