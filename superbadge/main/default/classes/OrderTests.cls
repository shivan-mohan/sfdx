@isTest
private without sharing class OrderTests {
    @testSetup
    private static void setupTestData() {
        CollaborationGroup ChatterGroup = TestDataFactory.ConstructCollaborationGroup();
        insert ChatterGroup;
        TestDataFactory.InsertTestData(1);
    }
    
    //@isTest(seeAllData = false)
    static testmethod void OrderUpdate_UnitTest () {
        Test.startTest();
            Order rec = [select id, Status from Order limit 1];
            Product2 prod = [SELECT Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 limit 1];
            
            rec.status = constants.ACTIVATED_ORDER_STATUS;      
            Database.update(rec, true);
            Product2 updatedprod = [SELECT 
            Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 limit 1];
            
            TestDataFactory.VerifyQuantityOrdered(prod, updatedprod, 1);
       Test.stopTest();
    }
    
    //@isTest(seeAllData = false)
    static testmethod void orderExtension_unitTest() {
        orderExtension ext = new orderExtension(new apexPages.standardController(new Order()));
        List<SelectOption> userOptions = ext.getFamilyOptions();
        ext.gethasNext();
        ext.gethasPrevious();
        ext.gettotalPages();
        ext.getPageNumber();
        ext.next();
        ext.last();
        ext.first();
        ext.previous();
        ext.onFieldChange();
        ext.SelectFamily();
        ext.Save();
        try {
            orderExtension.QueryOrderRecord(ext.orderRecord.Id);
        } catch(Exception e) {
        }
    }
}