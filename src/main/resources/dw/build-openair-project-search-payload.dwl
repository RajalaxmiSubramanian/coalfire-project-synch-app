
%dw 2.0
output application/xml
ns ns0 http://namespaces.soaplite.com/perl
---
{
	ns0#ArrayOfReadRequest: {
		readRequest: {
			method: "equal to",
			fields: "id,project_sf_id__c,name",
			"type": "Project",
			 attributes: {
                attribute: {
                    name: "limit",
                    value: "10"
                }
            },
			objects :{
				oaBase: {
					oaProject: {
						project_sf_id__c: vars.oppLineItemId
					}
				}
			}
		}

	}
}

