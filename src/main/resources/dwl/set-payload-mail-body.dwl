%dw 2.0
output application/json
var toMail = Mule::p("graph.toMailbox")
---
{
    message: {
        subject: "[SF-SPP Sync] Opportunity Synchronization Failures: " ++ (vars.runTimestamp default ""),
        body: {
            contentType: "HTML",
            content: vars.emailBody as String
        },
        toRecipients: toMail
            splitBy ","
            map ((email) -> {
                emailAddress: {
                    address: trim(email)
                }
            })
    }
}