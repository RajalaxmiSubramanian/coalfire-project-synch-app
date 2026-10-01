%dw 2.0
output application/json

---
(vars.combinedLineItemResults default []) filter ((item) -> !isEmpty(item.sppProjectId default "")) map ((item) -> {
        Id: item.opportunityLineItemId default "",
        OA_Internal_Id__c: item.sppProjectId
    })