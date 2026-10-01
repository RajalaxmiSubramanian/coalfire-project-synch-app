%dw 2.0
output application/json
---
{
  errorType: "APP:SALESFORCE_AUTH_FAILED,APP:SALESFORCE_QUERY_FAILED",
  message: ((error.description default "Internal error") as String),
  detail: (error.detailedDescription default error.cause default "")
}