 %dw 2.0
output application/json
---
{
  apiName: "Openair",
  apiLayer: "External System",
  statusCode: "503",
  description: "Failure",
  apiEnvironment: upper(p('mule.env') default 'dev'),
  timeStamp: now() as String
}
              