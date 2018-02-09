/**
* @name orderTrigger
* @description
**/
trigger orderTrigger on Order (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    if(trigger.isAfter) {
        if(trigger.isUpdate) {
            if (!(trigger.new == null)) {
                OrderHelper.AfterUpdate(trigger.new, trigger.old);
            }
        }
    }
}