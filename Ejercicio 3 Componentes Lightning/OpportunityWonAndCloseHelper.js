({
    listValues : function(component) {
        var action = component.get("c.listValues");
        action.setParams({ idCuenta : component.get("v.recordId")});
        
        var self = this;
        action.setCallback(this, function(actionResult) {
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.Opportunities", actionResult.getReturnValue());
            }            
        });
        $A.enqueueAction(action);
    }
})