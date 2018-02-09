/**
 * @name TestDataFactory
 * @description Contains methods to construct and/or validate commonly used records
**/
public with sharing class TestDataFactory {
    public static void VerifyQuantityOrdered(Product2 originalProduct, Product2 updatedProduct, Integer qtyOrdered) {
        System.assertEquals(updatedProduct.Quantity_Ordered__c, (originalProduct.Quantity_Ordered__c + qtyOrdered));
    }

    /**
     * @name ConstructCollaborationGroup
     * @description
    **/
    public static CollaborationGroup ConstructCollaborationGroup() {
        //ToDo: Ensure this method returns a single Chatter CollaborationGroup
        //    whose Name starts with 'TEST' followed by the INVENTORY_ANNOUNCEMENTS constant
        //    and configured so anyone can join, see and post updates.
        CollaborationGroup ChatterGroup = new CollaborationGroup(
              Name = 'TEST' + Constants.INVENTORY_ANNOUNCEMENTS,  
              CollaborationType = 'Public',
              IsArchived = false,
              IsAutoArchiveDisabled = true
        );
        
        return ChatterGroup;
    }

    /**
     * @name CreateProducts
     * @description Constructs a list of Product2 records for unit tests
    **/
    public static List<Product2> ConstructProducts(Integer cnt) {
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Product2 records
        //  with all the required fields populated
        //  and IsActive = true
        //  an Initial Inventory set to 10
        //  and iterating through the product family picklist values throughout the list.
        List<Product2> products = new List<Product2>();
        List<Schema.PicklistEntry> pEntries = Constants.PRODUCT_FAMILY;
        Integer pVal = 0;
        for(Integer i = 0; i < cnt; i++){
            Product2 pd2 = new Product2();
            pd2.Name = 'Product-' + i;
            pd2.IsActive = true;
            pd2.Initial_Inventory__c = 10;
            if(pVal == 4) {
                pVal = 0;
            }
            
            pd2.Family = pEntries.get(pVal).getValue();
            pVal++;
            products.add(pd2);
        }
        
        return products;
    }

    /**
     * @name CreatePricebookEntries
     * @description Constructs a list of PricebookEntry records for unit tests
    **/
    public static List<PriceBookEntry> ConstructPricebookEntries(List<Product2> prods) {
        //ToDo: Ensure this method returns a corresponding list of PricebookEntries records
        //  related to the provided Products
        //  with all the required fields populated
        //  and IsActive = true
        //  and belonging to the standard Pricebook
        List<PriceBookEntry> entries = new List<PriceBookEntry>();
        for(Product2 pd2 : prods) {
            PriceBookEntry pbe = new PriceBookEntry();
            pbe.isActive = true;
            pbe.UnitPrice = 100;
            pbe.Product2Id = pd2.id;
            pbe.PriceBook2Id = Constants.STANDARD_PRICEBOOK_ID;
            entries.add(pbe);
        }
        
        return entries;
    }

    /**
     * @name CreateAccounts
     * @description Constructs a list of Account records for unit tests
    **/
    public static List<Account> ConstructAccounts(Integer cnt) {
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Account records
        //  with all of the required fields populated.
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < cnt; i++) {
            Account ac=new Account();
            ac.Name = 'Account' + i;
            accounts.add(ac);
        }
        
        return accounts;
    }

    /**
     * @name CreateContacts
     * @description Constructs a list of Contacxt records for unit tests
    **/
    public static List<Contact> ConstructContacts(Integer cnt, List<Account> accts) {
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Contact records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < cnt; i++) {
            contact con = new contact();
            con.LastName = 'Contact' + i;
            con.AccountId = accts.get(i).id;
            contacts.add(con);
        }
        
        return contacts;
    }

    /**
     * @name CreateOrders
     * @description Constructs a list of Order records for unit tests
    **/
    public static List<Order> ConstructOrders(Integer cnt, List<Account> accts) {
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Order records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<Order> orders = new List<Order>();
        for(Integer i = 0; i < cnt; i++) {
            Order ord = new Order();
            ord.AccountId = accts.get(i).Id;
            ord.EffectiveDate = Date.Today();
            ord.Status = Constants.DRAFT_ORDER_STATUS;
            ord.Pricebook2Id  = Constants.STANDARD_PRICEBOOK_ID;
            orders.add(ord);
        }
        
        return orders;
    }

    /**
     * @name CreateOrderItems
     * @description Constructs a list of OrderItem records for unit tests
    **/
    public static List<OrderItem> ConstructOrderItems(integer cnt, list<pricebookentry> pbes, list<order> ords) {
        //ToDo: Ensure this method returns a list of size cnt of OrderItem records
        //  related to the provided Pricebook Entries
        //  and related to the provided Orders
        //  with all of the required fields populated.
        //  Hint: Use the DEFAULT_ROWS constant for Quantity as it will be used in the next challenge
        List<OrderItem> orderItems = new List<OrderItem>();
        for(Integer i = 0; i < cnt; i++) {
            OrderItem oItem = new OrderItem();
            oItem.OrderId = ords.get(i).Id;
            oItem.PriceBookEntryId = pbes.get(i).Id;
            oItem.Quantity = 1;
            oItem.UnitPrice = 10;
            orderItems.add(oItem);
        }
        
        return orderItems;
    }

    /**
     * @name SetupTestData
     * @description Inserts accounts, contacts, Products, PricebookEntries, Orders, and OrderItems.
    **/
    public static void insertTestData(Integer cnt) {
        //ToDo: Ensure this method calls each of the construct methods
        //  and inserts the results for use as test data.
        List<Account> accounts = TestDataFactory.ConstructAccounts(cnt);
        Database.insert(accounts, true);
        
        List<Contact> contacts = TestDataFactory.ConstructContacts(cnt, accounts);
        Database.insert(contacts, true);
        
        List<Product2> products = TestDataFactory.ConstructProducts(cnt);
        Database.insert(products, true);
        
        List<PriceBookEntry> entries = TestDataFactory.ConstructPricebookEntries(products);
        Database.insert(entries, true);
        
        List<Order> orders = TestDataFactory.ConstructOrders(cnt, accounts);
        Database.insert(orders, true);
        
        List<OrderItem> ordItems = TestDataFactory.ConstructOrderItems(cnt, entries, orders);
        Database.insert(ordItems, true);
    }

}