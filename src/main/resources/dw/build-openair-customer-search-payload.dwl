%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
---
{
	ns0#ArrayOfReadRequest: {
		readRequest: {
			method: "equal to",
			fields: "id,name,customer_sf_id__c",
			"type": "Customer",
			 attributes: {
                attribute: {
                    name: "limit",
                    value: "10"
                }
            },
			objects :{
				oaBase: {
					oaCustomer: {
						//customer_sf_id__c : vars.accountId 
						customer_sf_id__c : vars.accountId  //testing
					}
				}
			}
		}

	}
}