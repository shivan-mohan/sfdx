public without sharing class Product2Extension {
    public List<ProductWrapper> productsToInsert { get; set; }
    public String errorMessage { get; set; }
    public Boolean showError { get; set; }
    
    public class ProductWrapper {
        public Product2 productRecord { get; set; }
        public PriceBookEntry pricebookEntryRecord { get; set; }
        public String familyValue { get; set; }
        public List<SelectOption> familyPickList { get; set; }
        
        public ProductWrapper(Product2 p, PriceBookEntry pbe, list<SelectOption> family) {
            this.productRecord = p;
            this.pricebookEntryRecord = pbe;
            this.pricebookEntryRecord.Pricebook2Id = Constants.STANDARD_PRICEBOOK_ID;
            this.familyPickList = family;
        }
    }
    
    public Product2Extension(Apexpages.StandardController stdCon) {
        this.productsToInsert = new List<ProductWrapper>();
        this.addRows();
    }

    public void addRows() {
        for (Integer i = 0; i< Constants.DEFAULT_ROWS; i++) {
            Product2 p = new Product2();
            PriceBookEntry pbe = new PriceBookEntry();
             
            List<SelectOption> family = this.getFamilyOptions();
            productsToInsert.add(new ProductWrapper(p, pbe, family));
        }
    }
    
    public List<SelectOption> getFamilyOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(Constants.SELECT_ONE, Constants.SELECT_ONE));
        for(Schema.PicklistEntry p : Constants.PRODUCT_FAMILY) {
            options.add(new SelectOption(p.getValue(), p.getValue()));
        }
        
        return options;
    }
    
    public List<ChartHelper.ChartData> getInventory() {
        return ChartHelper.GetInventory();
    }

    public PageReference Save() {
        Savepoint sp = Database.setSavepoint();
        try {
            List<Product2> products = new List<Product2>();
            List<PricebookEntry> entries = new List<PricebookEntry>();
            
            for (ProductWrapper wrp : productsToInsert) {
                if(null != wrp.productRecord && null != wrp.pricebookEntryRecord) {
                    if(null != wrp.productRecord.Name && null != wrp.productRecord.Family
                        && constants.SELECT_ONE != wrp.productRecord.Family && null != wrp.productRecord.Initial_Inventory__c
                        && null != wrp.pricebookEntryRecord.UnitPrice) {
                        products.add(wrp.productRecord);
                        PricebookEntry entry = wrp.pricebookEntryRecord;
                        entry.IsActive = true;
                        entry.Pricebook2Id = constants.STANDARD_PRICEBOOK_ID;
                        entries.add(entry);
                    }
                }
            }
            
            Database.insert(products, true);
            
            for (integer index = 0; index < entries.size(); index++) {
                entries[index].Product2Id = products[index].id;
            }
            
            Database.insert(entries, true);
            
            apexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO, productsToInsert.size() + ' inserted'));
            productsToInsert.clear();
            addRows();
        } catch (Exception e) {
            Database.rollback(sp);
            apexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, constants.ERROR_MESSAGE));
        }
        
        return null;
    }
}