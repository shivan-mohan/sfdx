({
    loadTableHeader : function(component, event, helper) {
        var detailTableHeaders = [];
        detailTableHeaders.push('First & Last Name');
        detailTableHeaders.push('Record');
        detailTableHeaders.push('Date of birth');
        detailTableHeaders.push('Salary');
        component.set('v.detailTableHeaders', detailTableHeaders);
    },
    
    loadTableRow : function(component, event, helper) {
        var reverse = component.get("v.sortedDirection") !== 'asc';
        if(!reverse) {
            var detailTableRows = [];
            for(var index = 0; index < 5; index++) {
                var row = [];
                for(var cellindex = 0; cellindex < 4; cellindex++) {
                    var cell = new Object();
                    if(cellindex == 0) {
                        cell.fieldLabel = 'Name Old ' + index;
                        cell.fieldValue = 'Name Old ' + index;
                        cell.isLink = false;
                        cell.urlValue = '';
                        cell.isDate = false;
                        cell.isCurrency = false;
                    }
                    if(cellindex == 1) {
                        cell.fieldLabel = 'https://www.google.com';
                        cell.fieldValue = 'https://www.google.com';
                        cell.isLink = true;
                        cell.urlValue = 'https://www.google.com';
                        cell.isDate = false;
                        cell.isCurrency = false;
                    }
                    if(cellindex == 2) {
                        cell.fieldLabel = 'Date of birth ' + index;
                        cell.fieldValue = '31/10/1980';
                        cell.isLink = false;
                        cell.urlValue = '';
                        cell.isDate = true;
                        cell.isCurrency = false;
                    }
                    if(cellindex == 3) {
                        cell.fieldLabel = 'salary ' + index;
                        cell.fieldValue = '1000';
                        cell.isLink = false;
                        cell.urlValue = '';
                        cell.isDate = false;
                        cell.isCurrency = true;
                    }
                    
                    row.push(cell);
                }
                
                detailTableRows.push(row);
            }   
        }
        else {
            var detailTableRows = [];
            for(var index = 4; index > -1; index--) {
                var row = [];
                for(var cellindex = 0; cellindex < 4; cellindex++) {
                    var cell = new Object();
                    if(cellindex == 0) {
                        cell.fieldLabel = 'Name Old ' + index;
                        cell.fieldValue = 'Name Old ' + index;
                        cell.isLink = false;
                        cell.urlValue = '';
                        cell.isDate = false;
                        cell.isCurrency = false;
                    }
                    if(cellindex == 1) {
                        cell.fieldLabel = 'https://www.google.com';
                        cell.fieldValue = 'https://www.google.com';
                        cell.isLink = true;
                        cell.urlValue = 'https://www.google.com';
                        cell.isDate = false;
                        cell.isCurrency = false;
                    }
                    if(cellindex == 2) {
                        cell.fieldLabel = 'Date of birth ' + index;
                        cell.fieldValue = '31/10/1980';
                        cell.isLink = false;
                        cell.urlValue = '';
                        cell.isDate = true;
                        cell.isCurrency = false;
                    }
                    if(cellindex == 3) {
                        cell.fieldLabel = 'salary ' + index;
                        cell.fieldValue = '1000';
                        cell.isLink = false;
                        cell.urlValue = '';
                        cell.isDate = false;
                        cell.isCurrency = true;
                    }
                    
                    row.push(cell);
                }
                
                detailTableRows.push(row);
            }
        }
        
        component.set('v.detailTableRows', detailTableRows);
    }
});