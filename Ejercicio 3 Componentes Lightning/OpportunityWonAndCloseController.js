({
    doInit : function(component, event, helper) {
        helper.listValues(component);
        component.set("v.Id", window.location.origin );
    } 
})