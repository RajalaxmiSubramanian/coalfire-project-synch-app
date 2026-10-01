%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
---
{
  ns0#ArrayOfReadRequest: {
    readRequest: {
      method: "equal to",
      fields: "id,name,sfid",
      "type": "oaCustomer",
      objects: {
        oaBase: {
          ns0#oaCustomer: {
            sfid: vars.accountId
          }
        }
      }
    }
  }
}