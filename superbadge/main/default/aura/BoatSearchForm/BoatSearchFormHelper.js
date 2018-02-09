({
	loadBoatTypes : function(component, event, helper) {
		var action = component.get('c.getBoatTypes');
		action.setCallback(this, function(res) {
			var state = res.getState();
			var response = res.getReturnValue();
			if (state == 'ERROR') {
                //Do something
			}
			else {
				if (response) {
					component.set('v.boatTypes', response);
                    helper.onFormSubmit(component, event, helper);
				}
			}
		});

		$A.enqueueAction(action);
	},
    
    onFormSubmit : function (component, event, helper) {
        var formData = new Object();
        formData.boatTypeId = component.find('selBoatType').get('v.value');
        var formSubmitEvent = component.getEvent('formsubmit');
        formSubmitEvent.setParam('formData', formData);
        formSubmitEvent.fire();
    }
});