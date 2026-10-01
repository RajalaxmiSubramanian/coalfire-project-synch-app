%dw 2.0
output application/xml writeDeclaration = false
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument
var item = vars.currentOpportunity default {}
---
{
    oair#add: {
        objects: {
            oaCustomer: {
                name: item.Account.Name default "",
                company: item.Account.Name default "",
                addr_addr1: item.Account.BillingStreet default "",
                addr_city: item.Account.BillingCity default "",
                addr_state: item.Account.BillingStateCode default "",
                addr_zip: item.Account.BillingPostalCode default "",
                addr_country: item.Account.BillingCountry default "",
                addr_phone: item.Account.Phone default "",
                addr_fax: item.Account.Fax default "",
                customer_sf_id__c:
                    item.Account.Long_Account_ID__c default "",
                addr_email: item.Bill_To_Email__c default "",
                billing_addr_email: item.Bill_To_Email__c default "",
                contact_addr_email: item.Bill_To_Email__c default "",
				active: "1",
				"type": "C",
				export_customer_to_ns__c: "1"
               
            }
        }
    }
}