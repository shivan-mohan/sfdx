({
    onTabSelect : function (component, event) {
        var tab = event.getSource();
        switch (tab.get('v.id')) {
            case 'lightningdatatable' :
                this.createComponent('c:LightningDataTable', tab);
                break;
            case 'lightningdatatableold' :
                this.createComponent('c:LightningDataTableOld', tab);
                break;
        }
    },
    
    createComponent: function (name, target) {
        $A.createComponent(name, {
        }, function (contentComponent, status, error) {
            if (status === "SUCCESS") {
                target.set('v.body', contentComponent);
            } else {
                throw new Error(error);
            }
        });
    }
});