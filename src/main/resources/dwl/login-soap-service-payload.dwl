%dw 2.0
output application/xml
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument
---
{
  oair#login: {
    login: {
      api_namespace: "default",
      api_key      : p('secure::openair.apiKey'),
      company      : p('secure::openair.company'),
      user         : p('secure::openair.user'),
      password     : p('secure::openair.password'),
      version      : "1.0"
    }
  }
}