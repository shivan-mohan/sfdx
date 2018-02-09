public without sharing class BoatController {
    @AuraEnabled
    public static List<BoatType__c> getBoatTypes() {
        return [Select Id, Name From BoatType__c Order By Name];
    }
    
    @AuraEnabled
    public static List<Boat__c> getBoatsByType(String boatTypeId) {
        return BoatSearchResults.getBoats(boatTypeId);
    }
    
    @AuraEnabled
    public static List<BoatReview__c> getBoatReviewsByBoatId(String boatId) {
        return BoatReviews.getAll((Id)boatId);
    }
}