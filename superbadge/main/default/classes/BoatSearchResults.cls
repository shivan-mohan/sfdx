public without sharing class BoatSearchResults {
    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId) {
        if(String.isBlank(boatTypeId))
            return [Select Id, Name, Picture__c From Boat__c];
        
        return [Select Id, Name, Picture__c From Boat__c Where BoatType__r.Id = :boatTypeId];
    }
}