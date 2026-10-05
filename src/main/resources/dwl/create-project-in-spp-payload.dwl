%dw 2.0
output application/xml writeDeclaration = false
import pl4ToNsPracticeIdMap from dwl::PL4_to_NS_lookup

ns oair https://coalfire.app.sandbox.netsuitesuiteprojectspro.com/OAirServiceDocument

fun getClientId(clientControls, id) =
    if (clientControls == "true")
        1969
    else
        id
---
{
  oair#add: {
    objects: {
      (vars.projectsToCreate map (item,index) -> do {
        oaProject: {
          		  name: item.PN__c default "",
				  userid: item.DD_Id__c,
				  budget: item.TotalPrice,
				  notes: item.Line_Description_Pricing_Breakdown__c,
				  project_sf_id__c: item.Id,
				  nppl1__c: item.Practice_Level_1_NEW__c,
				  ppl0__c: item.Practice_Level_0__c,
				  ppl1__c: item.Practice_Level_1__c,
				  ppl2__c: item.Practice_Level_2__c,
				  ppl3__c: item.CFS_Standard__c,
				  //mppl17__c: item.OLI_MPPL17__c, - no longer used
				  opp2__c: item.OLI_Opp_Service_OrderNo__c,
				  opp5__c: item.OLI_Opp_CustPoNo__c,
				  opp11__c: item.OLI_Opp_Name__c,
				  start_date: item.ServiceDate,
				  SFDC_Opportunity_Line_ID__c: item.OpportunityId,
				  //CAP_project__c: item.CAP__c, - no longer used
				  OriginalSFProjectName__c: item.PN__c,
				  opp6__c: item.OLI_Opp_Close_Date__c,
				  Bidsheet_ABR__c: item.Hourly_Rate__c,
				  Bidsheet_GM__c: item.Gross_Margin__c,
				  cfs_optionaladvisory__c: if (item.Optional_Advisory__c == "Yes") "1" else "0",
				  ContractYear__c: item.OLI_Contract_Year__c,
				  TotalYearsInContract__c: item.OLI_Total_Years_in_Contract__c,
				  MultiYear__c: if (item.OLI_Multiyear__c == "Yes") "1" else "0",
				  //ppl1_2020__c: item.X2020_Practice_Level_1__c, - no longer used
				  //ppl2_2020__c: item.X2020_Practice_Level_2__c, - no longer used
				  //ppl3_2020__c: item.X2020_Practice_Level_3__c, - no longer used
				  //ppl4_2020__c: item.X2020_Practice_Level_4__c, - no longer used
				  ParentNameforReporting__c: item.Opportunity.Account.Parent_for_Reporting__c,
				  ParentIDforReporting__c: item.Opportunity.Account.Parent_ID_for_Reporting__c,
				  TopParentAccount__c: item.Opportunity.Account.Top_Parent_Account__c,
				  LongAccountID__c: item.Opportunity.Account.Long_Account_ID__c,
				  TopParentAccountIDforReporting__c: item.Opportunity.Account.Top_Parent_Long_Account_ID_for_Reporting__c,
				  AccountsPayableEmail__c: item.Opportunity.Accounts_Payable_Email__c,
				  BillToEmail__c: item.Opportunity.Bill_To_Email__c,
				  InvoiceToBillingContact__c: item.Opportunity.Bill_To_Name__c,
				  NetSuitePracticeID__c: pl4ToNsPracticeIdMap[item.CFS_Standard__c],
				  po_required__c: if (item.Opportunity.Account.PO_Required__c == "Yes") "1" else "0",
				  work_without_PO__c: item.Opportunity.Allow_Work_without_PO__c,
				  Quantity__c: item.Quantity,
				  Total_Margin__c: item.Total_Margin__c,
				  Cost_Per_Unit_to_Client__c: item.UnitPrice,
				  //DenimGroupReferral__c: if (item.Opportunity.Denim_Group_Referral__c == true) "1" else "0", - no longer used
				  Account_CF400__c__c: if (item.Opportunity.Account_CF400__c == true) "1" else "0",
				  OppOwner__c: item.Opportunity.Owner.OA_ID__c,
				  SFDC_Opportunity_Product_Line_ID_for_Reporting__c: item.Long_Line_Item_ID_for_Reporting__c,
				  ProductIDForReporting__c: item.Product2.Long_Product_ID__c,
				  AI_Notification_Required__c: item.Opportunity.AI_Notification_Required__c,
				  AI_Restrictions__c: item.Opportunity.AI_Restrictions__c,
				  AI_Training_Allowed__c: item.Opportunity.AI_Training_Allowed__c,
				  AI_Usage_Allowed__c: item.Opportunity.AI_Usage_Allowed__c,
				  cfs_projectmanager__c:item.OA_Project_Manager_Id__c,
				  hierarchy_node_ids: pl4ToNsPracticeIdMap[item.CFS_Standard__c],
				  //hierarchy_node_ids:
				  //if (index == 1)
                    //  "data"
                  //else
                    //  pl4ToNsPracticeIdMap[item.CFS_Standard__c],
				  Ship_To_Address_Country__c: item.Opportunity.Associated_Address__r.Shipping_Country__c,
				  Ship_To_Address_State__c: item.Opportunity.Associated_Address__r.Shipping_State__c,
				  Ship_To_Address_City__c: item.Opportunity.Associated_Address__r.Shipping_Address__City__s,
				  Ship_To_Address_Line_1__c: item.Opportunity.Associated_Address__r.Shipping_Address__Street__s,
				  Ship_To_Address_Zip__c: item.Opportunity.Associated_Address__r.Shipping_Address__PostalCode__s,
				  customerid: getClientId(item.Product2.Is_Coalfire_Control__c,vars.sppCustomer.oaCustomerId),
				  customer_name: vars.sppCustomer.oaCustomerName,
				  EndUserAsBooked__c: vars.sppCustomer.oaCustomerName,
				  copy_revenuerecognition_auto_settings: getClientId(item.Product2.Is_Coalfire_Control__c,vars.sppCustomer.oaCustomerId),
				  project_stageid: "15",
				  dd1__c: "Corporate",
				  NetSuiteDepartmentID__c: "57",
				  netsuite_subsidiary__c: "Coalfire Systems, Inc.",
				  netsuite_sub_currency__c: "USA",
				  NetSuiteLocID__c: "21",
				  ppl0_2020__c: "Commercial Services",
				  export_to_ns__c: "1"				  
        }
      })
    }
  }
}