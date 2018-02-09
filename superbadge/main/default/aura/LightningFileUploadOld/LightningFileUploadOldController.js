({
	uploadFileClient : function(component, event, helper) {
        var newFile = event.getSource().get("v.files")[0];
        var newFileContents;
        var reader = new FileReader();
        reader.readAsDataURL(newFile, "UTF-8");
        reader.onload = function (evt) {
            newFileContents = evt.target.result;
            var base64Mark = 'base64,';
            var dataStart = newFileContents.indexOf(base64Mark) + base64Mark.length;

            newFileContents = newFileContents.substring(dataStart);
            var action = component.get("c.uploadFile");
            
            action.setParams({
                parentId: component.get("v.recordId"),
                fileName: newFile.name,
                base64Data: newFileContents,
                contentType: newFile.type
            });
            
            action.setCallback(this, function(res) {
                var state = res.getState();
                if (state == 'ERROR') {
                    alert('File size exceeding heap size. File was not uploaded successfully');
                }
                else {
                    alert('File uploaded successfully');
                    $A.get('e.force:refreshView').fire();
                    $A.get("e.force:closeQuickAction").fire();
                }
            });
            
            $A.enqueueAction(action);
        }
	}
});