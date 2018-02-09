public with sharing class AccountDomain extends fflib_SObjectDomain {

    public AccountDomain(List<sObject> sObjectList) {
        Super(sObjectList);
        this.Configuration.disableTriggerState();
    }
    
    public override void onBeforeInsert() {
        for(Account a : ((List<Account>)this.Records)) {
            a.Description = String.isBlank(a.Description) ? 'Insert' : a.Description + ' Insert';
        }
    }
    
    public override void onBeforeUpdate(Map<Id,SObject> existingRecords) {
        for(Account a : ((List<Account>)this.Records)) {
            a.Description = String.isBlank(a.Description) ? 'Update' : a.Description + ' Update';
        }
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<Account> accountList) {
            return new AccountDomain(accountList);
        }
    }
}