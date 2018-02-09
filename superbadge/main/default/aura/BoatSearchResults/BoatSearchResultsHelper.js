({
	onSearch : function(component, event, helper) {
		var boatTypeId = component.get('v.boatTypeId');
        var action = component.get('c.getBoatsByType');
        action.setParams({'boatTypeId' : boatTypeId});
		action.setCallback(this, function(res) {
			var state = res.getState();
			var response = res.getReturnValue();
			if (state == 'ERROR') {
                component.set('v.errorMessage', true);
			}
			else {
				if (response) {
                    component.set('v.errorMessage', false);
					component.set('v.boats', response);
                    if (response == null || response.length == 0) {
                        component.set('v.errorMessage', true);
                    }
				}
			}
		});

		$A.enqueueAction(action);
	}
});