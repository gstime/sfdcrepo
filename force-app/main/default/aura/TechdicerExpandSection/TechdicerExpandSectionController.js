({
    // common function for toggle sections
    toggleSection : function(component, event, helper) {
        var sectionAuraId =  event.currentTarget.getAttribute("data-auraId");
        console.log(sectionAuraId);
        var sectionDiv = component.find(sectionAuraId).getElement();
        console.log(sectionDiv);
        var sectionState = sectionDiv.getAttribute('class').search('slds-is-close'); 
        if(sectionState == -1){
            sectionDiv.setAttribute('class' , 'slds-section slds-is-close');
        }else{
            sectionDiv.setAttribute('class' , 'slds-section slds-is-open');
        }
    },
    doInit: function(cmp) {
        // Set the attribute value. 
        // You could also fire an event here instead.
        let multipleDocument=[1,2,3,4,5];
        cmp.set("v.multipleDocument", multipleDocument);
    }
})