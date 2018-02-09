({
	onBoatClick : function(component, event, helper) {
		var boatSelect = component.getEvent('boatselect');
        boatSelect.setParam('boatId', component.get('v.boat.Id'));
        boatSelect.fire();
        
        var boatSelected = $A.get('e.c:BoatSelected');
        boatSelected.setParam('boat', component.get('v.boat'));
        boatSelected.fire();
        
        var mapEvent = $A.get("e.c:PlotMapMarker");
        mapEvent.setParams({
            'sObjectId' : component.get('v.boat').Id
        });
        mapEvent.fire();
	}
});