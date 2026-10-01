
%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
var item = vars.currentOpportunity default {}
---
{
	ArrayOfoaBase: {
		oaBase: {
			ns0#oaCustomer: {
				name: item.Account.Name default "" ++ " Mule test 10",
			    company: item.Account.Name default "",
			    addr_addr1: item.Account.BillingStreet default "",
			    addr_city: item.Account.BillingCity default "",
			    addr_state: item.Account.BillingStateCode default "",
			    addr_zip: item.Account.BillingPostalCode default "",
			    addr_country: item.Account.BillingCountry default "",
			    addr_phone: item.Account.Phone default "",
			    addr_fax: item.Account.Fax default "",
			    customer_sf_id__c: item.Account.Long_Account_ID__c default "" ++ "Mule test 10" ,
			    addr_email: item.Bill_To_Email__c default "",
			    billing_addr_email: item.Bill_To_Email__c default "",
			    contact_addr_email: item.Bill_To_Email__c default "",
			    field_270: "C",
			    field_256: "1",
			    field_361: "1"			    
			 }
		 }
	  }
	
}