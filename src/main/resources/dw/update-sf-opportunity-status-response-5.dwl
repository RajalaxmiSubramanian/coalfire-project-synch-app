%dw 2.0
output application/json
---
{ spp_Sync_Status__c: vars.opportunityStatusToSet default 'Failed' }