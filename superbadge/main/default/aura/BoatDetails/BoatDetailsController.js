({
	onBoatSelected : function(component, event, helper) {
		var boat = event.getParam('boat');
        component.set('v.id', boat.Id);
        component.set('v.isEmpty', false);
        var service = component.find('service');
        service.reloadRecord();
	},
    
    handleActive : function(component, event, helper) {
	},
    
    onRecordUpdated : function(component, event, helper) {
	},
    
    onBoatReviewAdded : function(component, event, helper) {
        component.find('boattabset').set("v.selectedTabId", 'boatreviewtab');
        var boatReviews = component.find('boatReviewsComponent')
        boatReviews.refresh();
    }
});