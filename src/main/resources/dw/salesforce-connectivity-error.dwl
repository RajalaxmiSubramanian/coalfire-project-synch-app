%dw 2.0
output application/json
---
{
  errorType: "SALESFORCE:CONNECTIVITY",
  message: ((error.description default "Internal error") as String),
  detail: (error.detailedDescription default error.cause default "")
}