 %dw 2.0
output application/json
---
{
  apiName: "Netsuite SPP ",
  apiLayer: "External System",
  statusCode: "200",
  description: "Success",
  apiEnvironment: upper(p('mule.env') default 'dev'),
  timeStamp: now() as String
}
              