%dw 2.0
output application/xml
ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument

---
oair#add: {
    objects: {
        oaAttachment: {
            file_name: payload.Title default "",
            ownerid: vars.createDocOwnerId,
            base64_data: payload.VersionData[0],
            size: payload.ContentSize,
            owner_type: "Project"
        }
    }
}