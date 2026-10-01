%dw 2.0
output application/java

var yesterday = ((now() as DateTime) - |P1D|) as String {format: "yyyy-MM-dd"}

---
"SELECT Id, AccountId, Long_Opportunity_ID__c, Bill_To_Email__c, " ++
"Opportunity.Account.Id, Opportunity.Account.Name, " ++
"Opportunity.Account.BillingStreet, Opportunity.Account.BillingCity, " ++
"Opportunity.Account.BillingPostalCode, SPP_Sync_Status__c, " ++
"Opportunity.Account.BillingCountry, Opportunity.Account.BillingStateCode, " ++
"Opportunity.Account.Phone, Opportunity.Account.Fax, Opportunity.Account.Long_Account_ID__c " ++
"FROM Opportunity " ++
"WHERE OA_Project_Trigger_Date__c >= " ++ yesterday ++ " " ++
"AND SPP_Sync_Status__c IN ('Pending', 'Failed')"