%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
---
{
  ns0#ArrayOfReadRequest: {
    readRequest: {
      method: "equal to",
      fields: "file_name",
      "type": "Attachment",
       attributes: {
         attribute: {
             name: "limit",
             value: "10"
         }
      },
      objects: {
        oaBase: {
          oaAttachment: {
            ownerid: payload.OA_Project_Id__c,
          }
        }
      }
    }
  }
}

