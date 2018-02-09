({
	doInit : function (component, event, helper) {
        var hasLoaded = component.get('v.hasLoaded');
        if(!hasLoaded) {
            helper.loadBoatTypes(component, event, helper);
            var createRecordEvent = $A.get('e.force:createRecord');
            if(!(createRecordEvent === null)) {
                component.set('v.isCreateNewSupported', true);
            }

            component.set('v.hasLoaded', true);
        }
    },
    
    onFormSubmit : function (component, event, helper) {
        //helper.onFormSubmit(component, event, helper);
        var formData = new Object();
        formData.boatTypeId = component.find('selBoatType').get('v.value');
        var formSubmitEvent = component.getEvent('formsubmit');
        formSubmitEvent.setParam('formData', formData);
        formSubmitEvent.fire();
    },
    
    onNewClick : function (component, event, helper) {
        var boatTypeId = component.find('selBoatType').get('v.value');
        var createNewBoatEvent = $A.get("e.force:createRecord");
        if(boatTypeId == '' || boatTypeId == null || boatTypeId == undefined) {
            createNewBoatEvent.setParams({
				"entityApiName": "Boat__c"
            });  
        }
        else {
            createNewBoatEvent.setParams({
                "entityApiName": "Boat__c",
            	"defaultFieldValues": {
                    'BoatType__c' : boatTypeId
                }
            });
        }

        createNewBoatEvent.fire();
    },
});