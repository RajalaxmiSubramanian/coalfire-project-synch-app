%dw 2.0
output application/x-www-form-urlencoded
---
{
  client_id: p('secure::graph.clientId'),
  client_secret: p('secure::graph.clientSecret'),
  scope: "https://graph.microsoft.com/.default",
  grant_type: "client_credentials"
}