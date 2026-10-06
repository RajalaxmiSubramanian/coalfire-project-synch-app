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
				  userid: item.DD_Id__c default "",
				  budget: item.TotalPrice default "",
				  notes: item.Line_Description_Pricing_Breakdown__c default "",
				  project_sf_id__c: item.Id default "",
				  nppl1__c: item.Practice_Level_1_NEW__c default "",
				  ppl0__c: item.Practice_Level_0__c default "",
				  ppl1__c: item.Practice_Level_1__c default "",
				  ppl2__c: item.Practice_Level_2__c default "",
				  ppl3__c: item.CFS_Standard__c default "",
				  //mppl17__c: item.OLI_MPPL17__c, - no longer used
				  opp2__c: item.OLI_Opp_Service_OrderNo__c default "",
				  opp5__c: item.OLI_Opp_CustPoNo__c default "",
				  opp11__c: item.OLI_Opp_Name__c default "",
				  start_date: item.ServiceDate default "",
				  SFDC_Opportunity_Line_ID__c: item.OpportunityId default "",
				  //CAP_project__c: item.CAP__c, - no longer used
				  OriginalSFProjectName__c: item.PN__c default "",
				  opp6__c: item.OLI_Opp_Close_Date__c default "",
				  Bidsheet_ABR__c: item.Hourly_Rate__c default "",
				  Bidsheet_GM__c: item.Gross_Margin__c default "",
				  cfs_optionaladvisory__c: if (item.Optional_Advisory__c == "Yes") "1" else "0",
				  ContractYear__c: item.OLI_Contract_Year__c default "",
				  TotalYearsInContract__c: item.OLI_Total_Years_in_Contract__c default "",
				  MultiYear__c: if (item.OLI_Multiyear__c == "Yes") "1" else "0",
				  //ppl1_2020__c: item.X2020_Practice_Level_1__c, - no longer used
				  //ppl2_2020__c: item.X2020_Practice_Level_2__c, - no longer used
				  //ppl3_2020__c: item.X2020_Practice_Level_3__c, - no longer used
				  //ppl4_2020__c: item.X2020_Practice_Level_4__c, - no longer used
				  ParentNameforReporting__c: item.Opportunity.Account.Parent_for_Reporting__c default "",
				  ParentIDforReporting__c: item.Opportunity.Account.Parent_ID_for_Reporting__c default "",
				  TopParentAccount__c: item.Opportunity.Account.Top_Parent_Account__c default "",
				  LongAccountID__c: item.Opportunity.Account.Long_Account_ID__c default "",
				  TopParentAccountIDforReporting__c: item.Opportunity.Account.Top_Parent_Long_Account_ID_for_Reporting__c default "",
				  AccountsPayableEmail__c: item.Opportunity.Accounts_Payable_Email__c default "",
				  BillToEmail__c: item.Opportunity.Bill_To_Email__c default "",
				  InvoiceToBillingContact__c: item.Opportunity.Bill_To_Name__c default "",
				  NetSuitePracticeID__c: pl4ToNsPracticeIdMap[item.CFS_Standard__c] default "",
				  po_required__c: if (item.Opportunity.Account.PO_Required__c == "Yes") "1" else "0",
				  work_without_PO__c: item.Opportunity.Allow_Work_without_PO__c default "",
				  Quantity__c: item.Quantity default "",
				  Total_Margin__c: item.Total_Margin__c default "",
				  Cost_Per_Unit_to_Client__c: item.UnitPrice default "",
				  //DenimGroupReferral__c: if (item.Opportunity.Denim_Group_Referral__c == true) "1" else "0", - no longer used
				  Account_CF400__c__c: if (item.Opportunity.Account_CF400__c == true) "1" else "0",
				  OppOwner__c: item.Opportunity.Owner.OA_ID__c default "",
				  SFDC_Opportunity_Product_Line_ID_for_Reporting__c: item.Long_Line_Item_ID_for_Reporting__c default "",
				  ProductIDForReporting__c: item.Product2.Long_Product_ID__c default "",
				  AI_Notification_Required__c: item.Opportunity.AI_Notification_Required__c default "",
				  AI_Restrictions__c: item.Opportunity.AI_Restrictions__c default "",
				  AI_Training_Allowed__c: item.Opportunity.AI_Training_Allowed__c default "",
				  AI_Usage_Allowed__c: item.Opportunity.AI_Usage_Allowed__c default "",
				  cfs_projectmanager__c:item.OA_Project_Manager_Id__c default "",
				  hierarchy_node_ids: pl4ToNsPracticeIdMap[item.CFS_Standard__c] default "",
				  //hierarchy_node_ids:
				  //if (index == 1)
                    //  "data"
                  //else
                    //  pl4ToNsPracticeIdMap[item.CFS_Standard__c],
				  Ship_To_Address_Country__c: item.Opportunity.Associated_Address__r.Shipping_Country__c default "",
				  Ship_To_Address_State__c: item.Opportunity.Associated_Address__r.Shipping_State__c default "",
				  Ship_To_Address_City__c: item.Opportunity.Associated_Address__r.Shipping_Address__City__s default "",
				  Ship_To_Address_Line_1__c: item.Opportunity.Associated_Address__r.Shipping_Address__Street__s default "",
				  Ship_To_Address_Zip__c: item.Opportunity.Associated_Address__r.Shipping_Address__PostalCode__s default "",
				  customerid: getClientId(item.Product2.Is_Coalfire_Control__c,vars.sppCustomer.oaCustomerId) default "",
				  customer_name: vars.sppCustomer.oaCustomerName default "",
				  EndUserAsBooked__c: vars.sppCustomer.oaCustomerName default "",
				  copy_revenuerecognition_auto_settings: getClientId(item.Product2.Is_Coalfire_Control__c,vars.sppCustomer.oaCustomerId) default "",
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