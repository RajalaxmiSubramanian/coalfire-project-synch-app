%dw 2.0
output application/json
---
vars.projectsToCreate map ((lineItem, index) -> {
    	opportunityId: vars.projectsToCreate[index].OpportunityId default '',
    	sppCustomerId: vars.sppCustomer.oaCustomerId default '',
    	sppCustomerStatus: vars.sppCustomer.customerStatus default '',
        opportunityLineItemId: vars.projectsToCreate[index].Id default '',
        sppProjectId: "",
        hasRelatedDocument:  vars.projectsToCreate[index].Bid_Sheet_ContentDocumentId__c != null,
        sfDocumentId: vars.projectsToCreate[index].Bid_Sheet_ContentDocumentId__c,
        sppProjectStatus: "Failure",
        errorReason: vars.wscError.description default "",
        sppAttachementId: "",
        sppAttachmentStatus: "",
        overallSyncStatus: "Failure",
       
    })