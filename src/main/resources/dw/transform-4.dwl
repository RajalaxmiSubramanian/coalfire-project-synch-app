%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
---
{
  ns0#ArrayOfReadRequest: {
    readRequest: {
      method: "equal to",
      fields: "id,name,sfid",
      "type": "oaProject",
      objects: {
        oaBase: {
          ns0#oaProject: {
            sfid: vars.lineItemId
          }
        }
      }
    }
  }
}