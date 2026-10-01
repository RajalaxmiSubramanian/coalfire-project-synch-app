%dw 2.0
output application/json
---
// Transform lineItemResults into Salesforce batch update payload for OpportunityLineItem
// Maps lineItemStatus to Salesforce spp_Sync_Status__c values
{
  // Array of OpportunityLineItem update records (up to 200 per batch)
  lineItemUpdates: vars.lineItemResults map (item) -> {
    // Salesforce OpportunityLineItem Id
    Id: item.lineItemId,
    // OpenAir Project ID (may be null if project creation failed)
    OpenAir_Project_Id__c: item.lineItemProjectId default null,
    // Sync status: map internal status to Salesforce values
    spp_Sync_Status__c: if (item.lineItemStatus == "Success") "Processed" else "Failed"
  },
  // Opportunity-level update record
  opportunityUpdate: {
    Id: vars.opportunityId,
    spp_Sync_Status__c: vars.opportunityStatus
  }
}