%dw 2.0
output application/json
---
vars.newProjectCreationResults default[] ++ [{
    	opportunityId: vars.opportunityId,
    	sppCustomerId: vars.sppCustomer.oaCustomerId,
    	sppCustomerStatus: vars.sppCustomer.customerStatus,
        opportunityLineItemId: vars.currentProject.opportunityLineItemId,
        sppProjectId: vars.currentProject.sppProjectId,
        hasRelatedDocument:  vars.currentProject.hasRelatedDocument,
        sfDocumentId: vars.currentProject.sfDocumentId,
        sppProjectStatus:  vars.currentProject.sppProjectStatus,
        sppAttachmentId: if(vars.createAttachmentResult.id != "") vars.createAttachmentResult.id else "",
        sppAttachmentStatus: if(vars.createAttachmentResult.id != "") "Success" else "Failure",
        errorReason: if(vars.createAttachmentResult.id != "") "" else vars.createAttachmentResult.errorReason,
        overallSyncStatus: if(vars.createAttachmentResult.id != "") "Success" else "Failure"
}]