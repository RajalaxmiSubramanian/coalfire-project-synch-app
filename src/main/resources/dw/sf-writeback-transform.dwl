%dw 2.0
output application/json
// Build Salesforce composite/sobjects batch PATCH payload for Line Item updates
// Input: vars.lineItemResults (Array of {lineItemId, openAirProjectId, status})
// Output: Salesforce Composite API body (up to 200 records per request)
---
{
  allOrNone: false,
  records: vars.lineItemResults map (item) -> {
    attributes: {
      type: "OpportunityLineItem"
    },
    Id: item.lineItemId,
    OpenAir_Project_ID__c: item.openAirProjectId default null,
    spp_Sync_Status__c: item.status default "Failed"
  }
}