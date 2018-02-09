({
	onInit : function(component, event, helper) {
		var boat = component.get('v.boat');
        var action = component.get('c.getAll');
        action.setParams({'boatId' : boat.Id});
		action.setCallback(this, function(res) {
			var state = res.getState();
			var response = res.getReturnValue();
			if (state == 'ERROR') {
                component.set('v.errorMessage', true);
			}
			else {
				if (response) {
                    component.set('v.errorMessage', false);
					component.set('v.boatReviews', response);
                    if (response == null || response.length == 0) {
                        component.set('v.errorMessage', true);
                    }
				}
			}
		});

		$A.enqueueAction(action);
	}
})