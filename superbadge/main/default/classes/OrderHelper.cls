public without sharing class OrderHelper {
    /**
    * @name AfterUpdate
    * @description 
    * @param List<Order> newList
    * @param List<Order> oldList
    * @return void
    **/
    public static void AfterUpdate(List<Order> newList, List<Order> oldList) {
        Set<Id> activatedOrderIds = new Set<Id>();

        for ( Integer i=0; i<newList.size(); i++ ) {
            if (((newList[i].Status.compareTo(Constants.ACTIVATED_ORDER_STATUS) == 0) && newList[i].ActivatedDate != null) 
                && (oldList[i].Status.compareTo(Constants.DRAFT_ORDER_STATUS) == 0)) {
                activatedOrderIds.add(newList[i].Id);
            }
        }

        OrderHelper.RollUpOrderItems(activatedOrderIds);
    }

    /**
    * @name RollUpOrderItems
    * @description Given a set of Activated Order ids, query the child Order Items and related Products to calculate Inventory levels
    * @param Set<Id> activatedOrderIds
    * @return void
    **/
    public static void RollUpOrderItems(Set<Id> activatedOrderIds) {
        Map<Id, Product2> productMap = new Map<Id, Product2>();
        Set<Id> productIds = new Set<Id>();

        List<OrderItem> items = [SELECT Id, Product2Id, Quantity
                                FROM OrderItem
                                WHERE OrderId In :activatedOrderIds];
        for(OrderItem oi : items) {
            productIds.add(oi.Product2Id);
        }

        productMap = new Map<Id, Product2>([SELECT Id, Quantity_Ordered__c FROM Product2 WHERE Id IN :productIds]);

        AggregateResult[] groupedResults  = [SELECT Product2Id, SUM(Quantity) activatedQuantity
                                             FROM OrderItem
                                             WHERE Product2Id In :productMap.keySet() GROUP BY Product2Id]; 
        for (AggregateResult ar : groupedResults)  {
            productMap.get((String) ar.get('Product2Id')).Quantity_Ordered__c = Integer.valueOf(ar.get('activatedQuantity'));
        }

        if(productMap != null && productMap.size() > 0) {
            update productMap.values();
        }
    }
}