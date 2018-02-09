({
    onInit : function(component, event, helper) {
        component.find("service").getNewRecord(
            "BoatReview__c",
            null,
            false,
            $A.getCallback(function() {
                var rec = component.get("v.boatReviewRecord");
                var boat = component.get("v.boat");
                var error = component.get("v.recordError");
                if(error) {
                    console.log('creation error ' + error);
                }

                if(!(rec == null)) {
                    component.set("v.boatReview", rec);
                }
            })
        );
    }
});