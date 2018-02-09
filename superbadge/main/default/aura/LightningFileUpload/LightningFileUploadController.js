({
    init : function(component, event, handler) {
    },

    handleUploadFinished : function(component, event, handler) {
        alert('File uploaded successfully');
        $A.get('e.force:refreshView').fire();
        $A.get("e.force:closeQuickAction").fire();
    }
});