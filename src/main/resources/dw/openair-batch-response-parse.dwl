%dw 2.0
output application/json
// Parse OpenAir batch Project creation SOAP response
// Match each response item to the originating Salesforce Line Item by position
// Input: payload (SOAP XML response), vars.projectsToCreate (original array)
---
do {
  var responseItems = payload.*"Add" default []
  var originals = vars.projectsToCreate default []
  var indexed = responseItems zip originals
  ---
  {
    successfulProjects: indexed 
      filter (pair) -> (pair[0].@status == "1" or pair[0].status == "1")
      map (pair) -> {
        lineItemId: pair[1].Id,
        projectId: pair[0].id default pair[0].Id default "",
        lineItem: pair[1]
      },
    failedProjectCreations: indexed 
      filter (pair) -> (pair[0].@status != "1" and pair[0].status != "1")
      map (pair) -> {
        lineItemId: pair[1].Id,
        errorMessage: pair[0].errors default "OpenAir project creation failed",
        lineItem: pair[1]
      }
  }
}