%dw 2.0
output application/json
---
{
  status: payload.status default null
}