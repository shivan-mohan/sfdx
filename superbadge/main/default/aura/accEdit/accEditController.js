({
    handleSaveRecord: function(component, event, helper) {
        component.find("accountRecordData").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                component.set('v.recordSaveError', 'Problem saving record, error: ' + JSON.stringify(saveResult.error));
            } else {
                component.set('v.recordSaveError', 'Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
    }
});