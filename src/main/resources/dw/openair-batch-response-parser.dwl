%dw 2.0
output application/json
ns ns0 http://namespaces.soaplite.com/perl
---
// Parse OpenAir batch Add Project response and match to originating Line Items by index
// Returns array of {lineItemId, openAirProjectId, success, errorMessage}
do {
  var updateResults = payload.ns0#ArrayOfUpdateResult.*updateResult default []
  var projectsToCreate = vars.projectsToCreate default []
  ---
  projectsToCreate map (item, index) -> do {
    var result = updateResults[index] default {}
    var resultStatus = result.status default "0"
    var isSuccess = (resultStatus == "1" or resultStatus == "200")
    ---
    {
      // Salesforce Line Item ID for correlation
      lineItemId: item.lineItemId,
      // OpenAir Project ID if creation succeeded
      openAirProjectId: if (isSuccess) (result.id default null) else null,
      // Success flag
      success: isSuccess,
      // Error message if failed
      errorMessage: if (!isSuccess) ("OpenAir project creation failed with status: " ++ resultStatus) else null,
      // Preserve original line item record for document processing
      lineItemRecord: item.lineItemRecord
    }
  }
}