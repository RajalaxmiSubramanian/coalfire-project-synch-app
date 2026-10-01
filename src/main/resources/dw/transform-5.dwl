%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
---
{
  ns0#ArrayOfReadRequest: {
    readRequest: {
      method: "equal to",
      fields: "id,name,ownerid",
      "type": "oaAttachment",
      objects: {
        oaBase: {
          ns0#oaAttachment: {
            ownerid: vars.lineItemProjectId,
            name: vars.currentLineItem.Document_Name__c default ''
          }
        }
      }
    }
  }
}