%dw 2.0
output application/xml writeDeclaration = false
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument
---
{
    oair#add: {
        objects: {
            oaAttachment: {
                    file_name: payload.Title default "",
        			ownerid: vars.currentProject.OA_Project_Id__c,
        			base64_data: payload.VersionData default "",
        			size: payload.ContentSize
            }
        }
    }
}