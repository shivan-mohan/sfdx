/**
 * @name product2Trigger
 * @description Trigger to notify staff of low levels of inventory
**/
trigger product2Trigger on Product2 (
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete
) {
    if(trigger.isUpdate) {
        if(trigger.isAfter) {
            Product2Helper.AfterUpdate((List<Product2>)trigger.new);
        }
    }
}