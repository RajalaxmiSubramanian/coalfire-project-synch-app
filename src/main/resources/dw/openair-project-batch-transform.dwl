%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
---
// Transform projectsToCreate list into OpenAir batch Add Project SOAP payload
// Each Line Item becomes one oaProject element in the batch
// SFID is set to Salesforce Line Item ID for idempotency
{
  ArrayOfoaBase: (vars.projectsToCreate map (item, index) -> {
    oaBase: {
      ns0#oaProject: {
        // Project name from Salesforce Line Item / Product
        name: item.lineItemRecord.Product2.Name default ("Project-" ++ item.lineItemId),
        // Set SFID to Salesforce Line Item ID for idempotency
        sfid: item.lineItemId,
        // Link to OpenAir Customer
        customerid: vars.openAirCustomerId,
        // Status: active
        active: "1",
        // Start date from Opportunity trigger date
        startdate: {
          ns0#Date: {
            year: (item.lineItemRecord.OA_Project_Trigger_Date__c default now()) as Date {format: "yyyy-MM-dd"} as String {format: "yyyy"},
            month: (item.lineItemRecord.OA_Project_Trigger_Date__c default now()) as Date {format: "yyyy-MM-dd"} as String {format: "MM"},
            day: (item.lineItemRecord.OA_Project_Trigger_Date__c default now()) as Date {format: "yyyy-MM-dd"} as String {format: "dd"}
          }
        },
        // Description from Line Item
        description: item.lineItemRecord.Description default ""
      }
    }
  })
}