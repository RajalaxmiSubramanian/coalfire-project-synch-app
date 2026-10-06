%dw 2.0
output application/json
---
vars.existingProjectCreationResults default[]  ++ [{
    	opportunityId: vars.opportunityId,
    	sppCustomerId: vars.sppCustomer.oaCustomerId,
    	sppCustomerStatus: vars.sppCustomer.customerStatus,
        opportunityLineItemId: vars.currentLineItem.Id,
        sppProjectId: vars.sppProject.oaProjectId,
        hasRelatedDocument:  vars.currentLineItem.Bid_Sheet_ContentDocumentId__c != null,
        sfDocumentId: vars.currentLineItem.Bid_Sheet_ContentDocumentId__c,
        sppProjectStatus: "Existing",
        sppAttachmentStatus: "Failed",
        errorReason: (vars.wscError.description default "") ++ "OA Error Code is:" ++ (vars.sfError default ""),
        overallSyncStatus: "Failure"
}]