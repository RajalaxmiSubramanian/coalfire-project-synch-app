%dw 2.0

var pl4ToNsPracticeIdMap = {
  "ACE Custom": "200836",
  "Amazon": "198662",
  "Analytics/BI": "199670",
  "Application development": "199671",
  "AppSec Advisory Services": "198641",
  "AppSec Assessment Srvcs": "211831",
  "Assurance Solutions": "198637",
  "Attack Surface Mgmt Srvcs": "201293",
  "Call center/BPO": "198983",
  "Cloud Advisory": "200837",
  "Cloud Managed Services": "213879",
  "CompSec Pen Testing": "218201",
  "Content/collaboration/comms": "199672",
  "CRM": "199673",
  "CSP Security": "211833",
  "Cyber Strategy": "198645",
  "Data management": "199674",
  "Enterprise Risk": "198644",
  "ERP/back office operations": "199675",
  "FedRAMP/NIST Advisory": "151078",
  "Financial services": "198670",
  "FinTech": "198671",
  "Global Assurance": "198638",
  "Global consultancies/SIs": "198984",
  "Google": "198665",
  "Healthcare": "198668",
  "Healthcare Advisory": "198669",
  "Healthcare Risk": "198667",
  "IBM": "198664",
  "ISO/SOC Advisory": "198663"
}

fun pl4ToNsPracticeId(pl4: String): String =
  if (isEmpty(pl4 default ""))
    ""
  else
    pl4ToNsPracticeIdMap[pl4] default ("TODO: map PL4 to NetSuite practice ID for " ++ pl4)

fun pl4ToNsPracticeIdOrNull(pl4: String): String | Null =
  if (isEmpty(pl4 default ""))
    null
  else
    pl4ToNsPracticeIdMap[pl4] default null
