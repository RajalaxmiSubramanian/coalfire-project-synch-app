%dw 2.0
output application/xml
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument

var sessionId = payload.body.oair#loginResponse.loginReturn.sessionId
---
{
  headers: {
    oair#SessionHeader: {
      sessionId: sessionId
    }
  }
}