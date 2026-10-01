%dw 2.0
output application/xml
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument
---
{
  oair#read: {
    method: {
        ReadRequest: {
          method    : "equal to",
          fields    : "id,name,customer_sf_id__c",
          attributes: {
            ReadAttribute: { name: "limit", value: "1" }
          },
          "type"    : "Customer",
          objects   : {
            oaCustomer: {
              customer_sf_id__c : "123"
            }
          }
        }      
    }
  }
}