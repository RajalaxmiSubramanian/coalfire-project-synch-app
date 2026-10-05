%dw 2.0
output text/plain
---
"<html>
<body>
<p>Hi Team,</p>

<p>
The Opportunity Project Sync process has completed.
The following Opportunities failed during processing:
</p>"
++
(
    (vars.failedOpportunitiesList default [])
        map ((opp) ->
            "<p>
            <b>Opportunity ID:</b> " ++ (opp.opportunityId default "N/A") ++ "<br/>
            <b>Account ID:</b> " ++ (opp.accountId default "N/A") ++ "<br/>
            <b>Failure Reason:</b> " ++ (opp.failureReason default "N/A") ++
            "</p>

            <p><b>Failed Line Items:</b><br/>" ++
            (
                (opp.processResult default [])
                    map ((item) ->
                        "&nbsp;&nbsp;• Line Item ID: " ++
                        (item.opportunityLineItemId default "N/A") ++
                        "<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;SPP Project ID: " ++
                        (item.sppProjectId default "N/A") ++
                        "<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;Error: " ++
                        (item.errorReason default "N/A") ++
                        "<br/>"
                    )
                    joinBy "<br/>"
            ) ++
            "</p>
            <hr/>"
        )
        joinBy ""
)
++
"
<p>Please review the above Opportunities and take the necessary action.</p>

<p>Thanks,<br/>
Integration Team</p>

</body>
</html>"