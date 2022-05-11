trigger TaskTrigger on Task (before insert, before update) {
    TaskHelper helper = new TaskHelper();
    switch on Trigger.operationType{
        when
            BEFORE_INSERT{
             helper.afterInsert(Trigger.new);
        }
        when BEFORE_UPDATE{
            helper.afterUpdate(Trigger.new);
        }
    }
}