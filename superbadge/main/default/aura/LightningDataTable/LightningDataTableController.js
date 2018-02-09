({
    doInit : function(component, event, helper) {
        helper.loadTableHeader(component, event, helper);
        helper.loadTableRow(component, event, helper);
        component.set("v.cellvalue", 255.76589);
    },
    
    sortData : function(component, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = (component.get("v.sortedDirection") !== 'asc')
        ? 'asc' : 'desc';
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        helper.sortData(component, fieldName, sortDirection);
    },
    
    onCellChange : function(component, event, helper) {
    }
});