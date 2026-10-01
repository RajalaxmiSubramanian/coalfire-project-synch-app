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
            ReadAttribute: { name: "limit", value: "500" }
          },
          "type"    : "Attachment",
          objects   : {
            oaProject: {
              owner_type : "Project",
              ownerid: vars.sppProject.oaProjectId
            }
          }
        }      
    }
  }
}