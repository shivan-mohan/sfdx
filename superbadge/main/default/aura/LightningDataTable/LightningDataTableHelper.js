({
    loadTableHeader : function(component, event, helper) {
        var detailTableHeaders = [];
        
        var header0 = new Object();
        header0.label = 'Name';
        header0.fieldName = 'name';
        header0.type = 'http';
        header0.sortable = true;
        detailTableHeaders.push(header0);
        
        var header1 = new Object();
        header1.label = 'Record';
        header1.fieldName = 'record';
        header1.type = 'url';
        header1.sortable = true;
        detailTableHeaders.push(header1);
        
        var header2 = new Object();
        header2.label = 'Date of birth';
        header2.fieldName = 'dateofbirth';
        header2.type = 'text';
        header2.sortable = true;
        detailTableHeaders.push(header2);
        
        var header3 = new Object();
        header3.label = 'Salary';
        header3.fieldName = 'salary';
        header3.type = 'currency';
        header3.typeAttributes = new Object();
		header3.typeAttributes.currencyCode = 'EUR';
        header3.sortable = true;
        detailTableHeaders.push(header3);
        component.set('v.detailTableHeaders', detailTableHeaders);
    },
    
    loadTableRow : function(component, event, helper) {
        var detailTableRows = [];
        for(var index = 0; index < 5; index++) {
            var row = new Object();
            row.id = index;
            row.name = 'Name ' + index;
            row.record = 'https://www.google.com';
            row.dateofbirth = '31/10/1980';
            row.salary = '1000';
            row.sortable = true;
            
            detailTableRows.push(row);
        }
        
        component.set('v.detailTableRows', detailTableRows);
    },
    
    sortData: function (component, fieldName, sortDirection) {
        var data = component.get("v.detailTableRows");
        var reverse = sortDirection !== 'asc';
        data.sort(this.sortBy(fieldName, reverse));
        component.set("v.detailTableRows", data);
    },
    
    sortBy: function (field, reverse, primer) {
        var key = primer ?
            function(x) {return primer(x[field])} :
            function(x) {return x[field]};
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    }
});