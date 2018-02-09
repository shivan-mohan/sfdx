public with sharing class AccountTriggerHelper {

    public static void Run() {
        fflib_SObjectDomain.getTriggerEvent(AccountDomain.Class).disableRecursion();
        fflib_SObjectDomain.triggerHandler(AccountDomain.Class);
    }
}