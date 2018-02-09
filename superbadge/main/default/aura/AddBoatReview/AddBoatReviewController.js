({
    doInit : function(component, event, helper) {
        helper.onInit(component, event, helper);
    },
    
    onSave : function(component, event, helper) {
        component.set("v.boatReviewRecord.Boat__c", component.get("v.boat.Id"));
        component.find("service").saveRecord(function(saveResult) {
            if(saveResult.state == "SUCCESS") {
                var resultsToast = $A.get("e.force:showToast");
                if(resultsToast) {
                    resultsToast.setParams({
                        "title" : "Saved",
                        "message" : "Boat Review Created"
                    });
                    
                    resultsToast.fire(); 
                }
                else {
                    alert('Boat Review Created');
                }
            }
            else {
                for (var i = 0; i < saveResult.error.length; i++) {
                    console.log('save error ' + saveResult.error[i].message);
                }
            }
            
            var reviewAdded = component.getEvent("boatReviewAdded");
            reviewAdded.fire();
            helper.onInit(component,event,helper);
        });
    },
    
    onRecordUpdated : function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType == "CHANGED") {
            var changedFields = eventParams.changedFields;
            var saveResultsToast = $A.get("e.force:showToast");
            if(saveResultsToast != 'undefined') {
                saveResultsToast.setParams({
                    "title": "Saved",
                    "message": "Boat Review Saved"
                });
                
                saveResultsToast.fire(); 
            }
        }
    }
});