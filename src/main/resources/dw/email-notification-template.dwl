%dw 2.0
output text/html
// Render the failedOpportunities report as an HTML email body
// Input: vars.failedOpportunitiesReport (full report object)
---
"<!DOCTYPE html>
<html>
<head><style>
  body { font-family: Arial, sans-serif; font-size: 14px; }
  h2 { color: #c0392b; }
  table { border-collapse: collapse; width: 100%; }
  th { background-color: #2c3e50; color: white; padding: 8px; text-align: left; }
  td { border: 1px solid #ddd; padding: 8px; }
  tr:nth-child(even) { background-color: #f2f2f2; }
  .failed { color: #c0392b; font-weight: bold; }
  .section { margin-top: 20px; }
</style></head>
<body>
<h2>SF SPP Opportunity Synchronization — Failure Report</h2>
<p><strong>Correlation ID:</strong> " ++ (vars.failedOpportunitiesReport.correlationId default "") ++ "</p>
<p><strong>Run Timestamp:</strong> " ++ (vars.failedOpportunitiesReport.runTimestamp default "") ++ "</p>
<p><strong>Total Failed Opportunities:</strong> <span class='failed'>" ++ (vars.failedOpportunitiesReport.totalFailedOpportunities as String default "0") ++ "</span></p>
<div class='section'>
<h3>Failed Opportunities</h3>
<table>
<tr><th>Opportunity ID</th><th>Account ID</th><th>Failure Reason</th><th>Failed Line Items</th></tr>
" ++ (vars.failedOpportunitiesReport.failedOpportunities default [] map (opp) ->
  "<tr><td>" ++ (opp.opportunityId default "") ++ "</td><td>" ++ (opp.accountId default "") ++ "</td><td class='failed'>" ++ (opp.failureReason default "") ++ "</td><td>" ++
  (if (sizeOf(opp.failedLineItems default []) == 0) "None"
   else (opp.failedLineItems map (li) ->
     "LineItem: " ++ (li.lineItemId default "") ++ " | ProjectId: " ++ (li.openAirProjectId default "N/A") ++ " | Error: " ++ (li.errorReason default "")
   ) joinBy "<br/>") ++
  "</td></tr>"
) joinBy "" ++ "
</table>
</div>
<p style='color:#7f8c8d;font-size:12px;'>This is an automated notification from sf-spp-opportunity-synch-app. Do not reply to this email.</p>
</body></html>"