%dw 2.0
output application/xml
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument
---
{
  oair#read: {
    method: {
        ReadRequest: {
          method    : "equal to",
          fields    : "file_name,id,ownerid",
          attributes: {
            ReadAttribute: { name: "limit", value: "10" }
          },
          "type"    : "Attachment",
          objects   : {
            oaAttachment: {
              owner_type : "Project",
              ownerid: vars.sppProject.oaProjectId
            }
          }
        }      
    }
  }
}