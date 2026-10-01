%dw 2.0
output application/json
var errorDescription = vars.errorMessage splitBy ("\n")
---
{
 "errors" :
 	{
 		"errorCode" : vars.errorCode,
 		"errorType" : vars.errorType,
 		"errorMessage" : errorDescription,
 		"correlationId" : vars.correlationId,
 		"timestamp" : now(),
 		"environment": p('mule.env'),
 		"endpoint": vars.resourcePath
 	}	
}