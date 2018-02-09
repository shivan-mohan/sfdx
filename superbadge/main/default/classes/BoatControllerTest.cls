@isTest
public without sharing class BoatControllerTest {
    @testSetup
    private static void setupData() {
        GenerateData.initData();
    }
    
    @isTest
    private static void getBoatTypesTest() {
        BoatControllerTest.setupData();
        System.assertEquals(BoatController.getBoatTypes().size(), [Select Id, Name From BoatType__c].size());
    }
    
    @isTest
    private static void getBoatsByTypeTest() {
        BoatControllerTest.setupData();
        List<BoatType__c> boatTypes = BoatController.getBoatTypes();
        
        System.assertEquals(BoatController.getBoatsByType(null).size(), [Select Id, Name, Picture__c From Boat__c].size());
        
        System.assertEquals(BoatController.getBoatsByType(boatTypes[1].Id).size(), [Select Id, Name, Picture__c From Boat__c Where BoatType__r.Id = :boatTypes[1].Id].size());
        System.assertEquals(BoatController.getBoatsByType(boatTypes[3].Id).size(), [Select Id, Name, Picture__c From Boat__c Where BoatType__r.Id = :boatTypes[3].Id].size());
        System.assertEquals(BoatController.getBoatsByType(boatTypes[5].Id).size(), [Select Id, Name, Picture__c From Boat__c Where BoatType__r.Id = :boatTypes[5].Id].size());
    }
    
    @isTest
    private static void getBoatReviewsByBoatId() {
        BoatControllerTest.setupData();
    }
}