({
    doInit : function (component, event, helper) {
        helper.loadTableHeader(component, event, helper);
        helper.loadTableRow(component, event, helper);
    },
    
    sortData : function(component, event, helper) {
        var fieldName = 'name';
        var sortDirection = (component.get("v.sortedDirection") !== 'asc')
        ? 'asc' : 'desc';
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        helper.loadTableRow(component, event, helper);
    }
});