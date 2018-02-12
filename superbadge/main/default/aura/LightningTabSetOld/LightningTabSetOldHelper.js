({
	changeTab : function(component, event, helper) {
		var targetTab = event.target;
		var activateTabId = targetTab.parentNode.dataset.tabid;
		
		if (!$A.util.hasClass(targetTab.parentElement, 'slds-active')) {
			helper.changeTabVisibility(component, activateTabId);
		}
	},
    
	changeTabVisibility : function(component, activateTabId) {
		var dataTableTabs = component.find('dataTableTabs');
        var dataTablePanels = component.find('dataTablePanels');
		
		for (var i = 0; i < dataTableTabs.length; i++) {
			var tab = dataTableTabs[i].getElement();
			
			if (tab.dataset.tabid === activateTabId) {
				$A.util.addClass(tab, 'slds-active');
			}
			else {
				$A.util.removeClass(tab, 'slds-active');
			}
		}
        
        for (var i = 0; i < dataTablePanels.length; i++) {
			var panel = dataTablePanels[i].getElement();
			
			if (panel.id === activateTabId) {
				$A.util.addClass(panel, 'slds-show');
				$A.util.removeClass(panel, 'slds-hide');
			}
			else {
				$A.util.addClass(panel, 'slds-hide');
				$A.util.removeClass(panel, 'slds-show');
			}
		}
	}
});