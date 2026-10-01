%dw 2.0
output application/json
---
{
  errorType: "APP:LINE_ITEMS_QUERY_FAILED",
  message: ((error.description default "Internal error") as String),
  detail: (error.detailedDescription default error.cause default "")
}