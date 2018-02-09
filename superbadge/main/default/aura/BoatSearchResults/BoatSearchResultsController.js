({
	doSearch : function(component, event, helper) {
        var inputParams = event.getParam('arguments');
        component.set('v.boatTypeId', inputParams.boatTypeId);
        helper.onSearch(component, event, helper);
	},
    
    onBoatSelect : function(component, event, helper) {
        var boatId = event.getParam('boatId');
        component.set('v.selectedBoatId', boatId);
	}
});