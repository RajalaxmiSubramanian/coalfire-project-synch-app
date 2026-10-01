%dw 2.0
output application/xml
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument
---
{
  oair#read: {
    method: {
        ReadRequest: {
          method    : "equal to",
          fields    : "id,project_sf_id__c,name",
          attributes: {
            ReadAttribute: { name: "limit", value: "500" }
          },
          "type"    : "Project",
          objects   : {
            oaProject: {
              project_sf_id__c : vars.opportunityLineItemId
            }
          }
        }      
    }
  }
}