package com.Bizom.commonUtils;

import java.util.HashMap;
import java.util.Map;

public class ResourceURIS {



    private static final String logout_user ="/users/logout";

    // =====================================================================================
    // RETAILER API ENDPOINTS
    //======================================================================================

    //order

    private static final String getOrderForOutlets = "orders/getOrdersForOutlet/{outletId}";
    private static final String postMultipleEditApi = "/orders/multipleEditApi";
    private static final String getWarehouseListRetailerApi= "warehouses/getWarehouseListRetailerApi/{warehouseId}";
    private static final String getSalereturnReasons=  "salemansalesreturns/getSalereturnReasons";
    private static final String getCompanySettingByName= "settings/getCompanySettingByName/{settingName}";

    private static final String POST_getOutletbalance="outletbalances/getOutletbalance";
    private static final String   POST_getBatchRetailerApi="inventories/getBatchRetailerApi";
        private static final String POST_getTabstypeids_genericform = "/users/getTabstypeids/genericform";

    // Outlets
    private static final String getOutletAndChildOutlet = "/outlets/getOutletAndChildOutlet/{outletId}";
    private static final String getOutletAndChildOutlet_invalid = "/outlets/getOutletAndChildOutlet/invalid";

    // Companies
    private static final String getCompanyInfo = "/companies/getinfo";
    private static final String getCompanyInfo_invalid = "/companies/invalid";
    private static final String getCompanyKycForm = "/companies/getCompanyKycForm";
    private static final String getCompanyKycForm_invalid = "/companies/getCompanyKycForm/invalid";

    // Brands
    private static final String getBrandWiseWarehouseSkusRetailer = "/brands/getBrandWiseWarehouseSkusRetailer";
    private static final String getBrandWiseWarehouseSkusRetailer_invalid = "/brands/getBrandWiseWarehouseSkusRetailer/invalid";

    // =====================================================================================
    // INTEGRATION API ENDPOINTS
    // =====================================================================================

    // Config Users
    private static final String config_user = "/oauth/directLogin/xml";

    // Orders
    private static final String list_orders_positive = "/orders/listorders";
    private static final String postAddOrders = "/orders/addorderapi";
    private static final String postChangeDirectOrderState = "/orders/changeDirectOrderStateApi";
    private static final String Invalid_ChangeDirectOrderState = "/changeDirectOrderStateApi";

    // Users
    private static final String getListUsers= "/users/getusers/{startDate}/{endDate}/{h1}/{h2}/{h3}/{h4}";
    private static final String list_users_positive_withoutPath= "/users/getusers";
    private static final String users_getusers_with_id = "/users/getusers/{id}";
    private static final String users_getusers_with_id_invalid = "/users/getusersInvalid/{id}";
    private static final  String  getUserCustomFields = "/users/getusercustomfields/{type}";
    private static final  String  getUserCustomFields_NoParams = "/users/getusercustomfields";
    private static final  String  postEditUser = "/users/editapi";
    private static final  String  postCreateUsers = "/users/addapi";
    private static final  String  postCreateUserwithHQ = "/users/addapi";
    private static final String  Invalid_PostCreateUsers="/addapi";
    private static final String  postAssignRoleToUser = "/users/apiAssignRoleSpecificId";
    private static final String Invalid_AssignRoleToUser="/apiAssignRoleSpecificId";
    private static final String users_getusersforrole_id="users/getusersforrole/{roleId?}/{designationsId?}";

    // Get Users Data For Entities
    private static final String getUsersDataForEntities = "/users/getUsersDataForEntities/{entityType}/{entityId}";
    private static final String getUsersDataForEntities_invalid = "/users/getUsersDataForEntities_invalid/{entityType}/{entityId}";

    // Product Master API
    private static final  String  getallcompanyskus = "/skunits/getallcompanyskus";
    private static final  String  Product_Master_API = "/skunits/getskus";
    private static final String add_skunits = "/skunits/add/xml";
    private static final String postAddSku = "/skunits/add/xml";
    private static final String invalid_AddSku = "/skunits/xml";
    private static final String post_EditSkunits = "/skunits/updatesku/xml";
    private static final String Invalid_EditSkunits = "/skunits/xml";
    private static final String Invalid_Product_Master_API = "/getskus";
    private static final String Invalid_getallcompanyskus = "/getallcompanyskus";

    // Beats
    private static final  String  getbeatwiseDashboard = "/users/getBeatWiseDashboardData";
    private static final  String  getBeats = "/beats/getbeats";
    private static final  String  postCreateBeat="/users/insertUpdateBeats";
    private static final  String  postRemoveBeat="/beats/removeBeatOutletMappings/xml";
    // GET BEATS CHECK BEAT API
    private static final String beats_checkbeat = "/beats/checkbeat/{beatIds}/{userId}";
    private static final String beats_checkbeat_invalid = "/beats/checkbeatInvalid/{beatIds}/{userId}";

    // Loadouts
    private static final  String  getLoadouts = "/warehouses/getLoadoutsApi";
    private static final  String  getListLoadsheets = "/payments/listloadsheetapi/{type}";
    private static final  String  getListLoadsheets_NoParams = "/payments/listloadsheetapi";
    private static final  String  postApproveLoadouts = "/loadouts/approveallloadout";
    private static final  String  POST_approveAllLoadout = "/loadouts/approveallloadout";
    private static final  String  postApproveLoadouts_invalid = "/loadouts/approveallloadoutInvalid";
    private static final  String  POST_approveAllLoadout_invalid = "/loadouts/approveallloadoutInvalid";
    private static final  String  GET_bulkSettle = "/loadouts/bulkSettle/{fromDate}/{toDate}/{warehouseId}/{userId}";
    private static final  String  GET_bulkSettle_invalid = "/loadouts/bulkSettleInvalid/{fromDate}/{toDate}/{warehouseId}/{userId}";
    private static final  String  GET_reporteeUsers = "/loadouts/reporteeUsers";
    private static final  String  GET_reporteeUsers_invalid = "/loadouts/reporteeUsersInvalid";
    private static final  String  POST_unsettle = "/loadouts/unsettle";
    private static final  String  POST_unsettle_invalid = "/loadouts/unsettleInvalid";
    private static final  String  POST_DeleteLoadOut = "/loadouts/delete";
    private static final  String  postDeleteLoadouts = "/loadouts/delete";
    private static final  String  POST_LoadoutsAutoRejectInTransit = "/loadouts/autorejectintrasit";

    // PJP
    private static final  String  getPjp = "/beats/getpjpmasters";
    private static final  String postUploadPjp="/users/upload_pjps";

    // Generic data
    private static final  String  getGenericData = "/users/getGenericData";

    // Credit & Debit
    private static final  String  getCreditOrDebitNote = "/outlets/getcreditnotesordebitnote";
    private static final  String  postAddCreditNote = "/cdnotes/addMultiple/json";
    private static final String cdnotes_addcreditnote = "cdnotes/addcreditnote";
    private static final String cdnotes_addcreditnote_invalid = "cdnotes/addcreditnoteInvalid";

    // Others
    private static final  String  getOtherLoadouts= "/warehouses/getLoadoutsApi";
    private static final String POST_addageingapi = "/outlets/addageingapi" ;

    // GET CALLS API
    private static final String list_calls = "calls/getcalls";
    private static final String list_calls_neg = "calls/getnocall";
    private static final String calls_add = "/calls/add";
    // Claim Types
    private static final String claimtypes_get_all_combinations = "claimtypes/getAllCombinations/{claimTypeId}";
    private static final String claimtypes_get_all_fields_details = "claimtypes/getAllFieldsDetails/{claimTypeId}";
    private static final String claimtypes_get_claim_type = "claimtypes/getClaimType/{claimTypeId}";
    private static final String claimtypes_get_combination = "claimtypes/getCombination/{claimTypeId}/{combinationId}";

    // GET ATTENDANCE API
    private static final String list_attendance = "users/getAttendances";

    // GET DISCOUNT API
    private static final String list_discount = "discounts/getDiscount";
    private static final String list_discount_neg = "discounts/getnoDiscount";
    private static final String POST_AddDiscount = "discounts/addDiscounts";

    // GET WAREHOUSE API
    private static final String list_warehouse = "warehouses/getallwarehouses";
    private static final String list_warehouse_neg = "warehouses/getallnowarehouses";
    private static final String Post_adddistributor = "warehouses/adddistributor/xml";
    private static final String Post_Outletwarehouse_Balanceupdate = "warehouses/updateBalance/xml";
    private static final String Post_editdistributor = "warehouses/adddistributor/xml";

    // GET and POST ENTITY PRICING APPROVAL API
    private static final String list_pricing = "entityPricingApprovals/getEntitypricingApprovals";
    private static final String list_pricing_neg = "entityPricingApprovals/getnoEntitypricingApprovals";
    private static final String POST_EntityPricingApproval = "entityPricingApprovals/saveEntityPricingApproval";
    private static final String POST_updateWarehousePrice = "inventories/updatewarehouseprice";
    private static final String Invalid_updateWarehousePrice = "inventories/";

    // GET SECONDARY SALES API
    private static final String list_secondary_sales = "payments/getsales";
    private static final String GET_all_skus = "skunits/getallskus";


    // GET COUNTER SALES API
    private static final String list_counter_sales = "payments/getCounterSales";
    private static final String POST_changePaymentState = "payments/changePaymentState";

    // GET SALES RETURN API
    private static final String list_sales_return = "salesreturns/getSalemansalesreturn";
   // private static final String POST_cancelMultipleSalereturn = "Salesreturns/cancelMultipleSalereturn";
    private static final String get_CounterSales = "/payments/getCounterSales";
    private static final String POST_AddPrimarySales="/payments/addprimarysale";
    private static final String POST_AddSaleReturn="/salesreturns/addSaleReturn";
    private static final String POST_ApproveSaleReturn="/salesreturns/approveSaleReturn";
    private static final String POST_CancelSaleReturn="/Salesreturns/cancelMultipleSalereturn";

    // GET SCHEME MASTER API
    private static final String list_scheme_master = "schemes/getSchemeMasterApi";
    private static final String list_scheme_master_invalid = "schemes/getSchemeMasterApiInvalid";
    private static final String POST_addMultiSchemeApi = "schemes/addMultiSchemeApi";
    private static final String POST_createQpsSchemeApi = "/schemes/addMultiSchemeApi/";
    private static final String POST_AssignQpsSchemeApi = "/schemes/assignscheme";

    // GET SCHEME HOLDER API
    private static final String list_scheme_holder = "schemes/getSchemeHolderApi";
    private static final String list_scheme_holder_invalid = "schemes/getSchemeHolderApiInvalid";
    private static final String schemes_get_qps_schemes = "/schemes/getqpsschemes";
    private static final String schemes_get_qps_schemes_invalid = "/schemes/getqpsschemesInvalid";
    private static final String schemes_get_dist_ware_of_zone = "/schemes/getdistwareofzone/{zoneId}";
    private static final String POST_getSchemeDetailsView = "/schemes/getSchemeDetailsView";
    private static final String POST_getSchemeDetailsView_invalid = "/schemes/getSchemeDetailsViewInvalid";
    private static final String schemes_get_dist_ware_of_zone_invalid = "/schemes/getdistwareofzoneInvalid/{zoneId}";

    // GET USER LEAVE API
    private static final String list_user_leaves = "userleaves/getUserLeave/{fromdate}/{todate}/{startseq}/{endseq}/{responsetype}";
    private static final String list_user_leaves_no_params = "userleaves/getUserLeave";
    private static final String Post_Upload_userleaves = "userleaves/uploadUserLeavesApi";

    // GET STATES API
    private static final String list_states = "states/getAllStates/{responsetype}";
    private static final String list_states_no_params = "states/getAllStates";
    private static final String POST_saveStates = "/states/saveStates/json";
    private static final String states_add = "/states/add";
    private static final String states_add_invalid = "/states/addinvalid";

    // GET OUTLET BALANCE API
    private static final String list_outlet_balance = "Outlets/getOutletBalance";

    // Areas
    private static final String list_positive_areas = "/areas/getAreas";
    private static final String list_negative_areas = "/areas/getAreasaa";

    // Inventory
    private static final String inventory_for_warehouse = "/inventories/getInventoryForWarehouse";
    private static final String inventories_get_inventory_for_warehouse = "/inventories/getinventoryforwarehouse/{warehouseId}";
    private static final String inventories_get_inventory_for_warehouse_invalid = "/inventories/getinventoryforwarehouseInvalid/{warehouseId}";
    private static final String inventories_get_total_inventory_for_warehouse = "/inventories/gettotalinventoryforwarehouse/{warehouseId}";
    private static final String inventories_get_total_inventory_for_warehouse_invalid = "/inventories/gettotalinventoryforwarehouseInvalid/{warehouseId}";
    private static final String inventory_transaction = "/inventories/getInventorytransaction";
    private static final String inventories_get_inventory_transaction_api = "/inventories/getInventoryTransactionApi";
    private static final String inventories_get_inventory_transaction_api_invalid = "/inventories/getInventoryTransactionApiInvalid";
    private static final String inventories_approvemultipletransfer = "inventories/approveMultipleTransfer";
    private static final String inventories_approvemultipletransfer_invalid = "inventories/approveMultipleTransferInvalid";
    private static final String inventories_apigetskuforwarehouse = "inventories/apigetSkuforWarehouse";
    private static final String inventories_apigetskuforwarehouse_invalid = "inventories/apigetSkuforWarehouseInvalid";
    private static final String inventories_apigetinventory = "inventories/apiGetInventory";
    private static final String inventories_apigetinventory_invalid = "inventories/apiGetInventoryInvalid";
    private static final String inventories_getinventoryandskuforware = "inventories/getinventoryandskuforware";
    private static final String inventories_getinventoryandskuforware_invalid = "inventories/getinventoryandskuforwareInvalid";
    private static final String inventories_auditinventorytypes = "inventories/auditInventoryTypes";
    private static final String inventories_auditinventorytypes_invalid = "inventories/auditInventoryTypesInvalid";
    private static final String inventories_get_parent_child_inventory_audit_data = "inventories/getParentChildInventoryAuditData/{id}";
    private static final String inventories_get_parent_child_inventory_audit_data_invalid = "inventories/getParentChildInventoryAuditData/invalid";

    // Web API - Inventory Approvals Management
    private static final String inventoryapprovals_getinventoryapprovalsapi = "inventoryapprovals/getInventoryapprovalsApi";
    private static final String inventoryapprovals_getinventoryapprovalsapi_invalid = "inventoryapprovals/getInventoryapprovalsApiInvalid";
    private static final String update_inventory_for_warehouse = "/inventories/updateinventoryforwarehouse";
    private static final String Invalid_inventory_for_warehouse = "/getInventoryForWarehouses";
    private static final String check_available_inventory = "/inventories/checkAvaiInventory/{warehouseId}";
    private static final String check_available_inventory_invalid = "/inventories/checkAvaiInventory/invalid";
    private static final String check_inventory_audit_valid = "/inventories/checkinventoryauditvalid";
    private static final String check_inventory_audit_valid_invalid = "/inventories/checkinventoryauditvalid/invalid";
    private static final String get_warehouse_inventory = "/inventories/getWarehouseInventory/{warehouseId}";
    private static final String get_warehouse_inventory_invalid = "/inventories/getWarehouseInventory/invalid";
    private static final String list_warehouse_inventory = "/inventories/listwarehouseinventory/{warehouseId}";
    private static final String list_warehouse_inventory_invalid = "/inventories/listwarehouseinventory/invalid";
    private static final String inventories_list_warehouse_inventory_with_pagination = "/inventories/listwarehouseinventorywithPagination/{warehouseId}";
    private static final String inventories_list_warehouse_inventory_with_pagination_invalid = "/inventories/listwarehouseinventorywithPaginationInvalid/{warehouseId}";
    private static final String inventories_get_warehouse_in_transit_inventories = "/inventories/getwarehouseintransitinventories";
    private static final String inventories_get_warehouse_in_transit_inventories_invalid = "/inventories/getwarehouseintransitinventoriesInvalid";
    private static final String inventories_get_warehouse_inventories = "/inventories/getwarehouseinventories";
    private static final String inventories_get_warehouse_inventories_invalid = "/inventories/getwarehouseinventoriesInvalid";
    private static final String inventories_inventory_audit_ajax = "/inventories/inventoryauditajax";
    private static final String inventories_inventory_audit_ajax_invalid = "/inventories/inventoryauditajaxInvalid";
    private static final String inventories_transfer_history_api = "/inventories/transferhistoryApi";
    private static final String inventories_transfer_history_api_invalid = "/inventories/transferhistoryApiInvalid";

    // Inventory Types
    private static final String get_all_inventory_types = "/inventorytypes/getAllInventoryTypes";
    private static final String get_all_inventory_types_invalid = "/inventorytypes/getAllInventoryTypes/invalid";
    private static final String get_all_inventory_types_detail = "/inventorytypes/getAllInventoryTypesDetail";
    private static final String get_all_inventory_types_detail_invalid = "/inventorytypes/getAllInventoryTypesDetail/invalid";
    private static final String get_auditable_inventory_types = "/inventorytypes/getAuditableInventoryTypes";
    private static final String get_auditable_inventory_types_invalid = "/inventorytypes/getAuditableInventoryTypes/invalid";
    private static final String get_next_inventory_type = "/inventorytypes/getNextInventoryType/{inventoryTypeId}";
    private static final String get_next_inventory_type_invalid = "/inventorytypes/getNextInventoryType/invalid";
    private static final String get_saleable_inventory_type = "/inventorytypes/getSaleAbleInventoryType";
    private static final String get_saleable_inventory_type_invalid = "/inventorytypes/getSaleAbleInventoryType/invalid";
    private static final String inventorytypes_index = "/inventorytypes/index";
    private static final String inventorytypes_index_invalid = "/inventorytypes/indexInvalid";
    private static final String POST_inventorytypes_add = "/inventorytypes/add";
    private static final String inventorytypes_add_invalid = "/inventorytypes/addInvalid";
    private static final String POST_inventorytypes_edit = "/inventorytypes/edit/{id}";
    private static final String inventorytypes_edit_invalid = "/inventorytypes/editInvalid/{id}";
    private static final String POST_influencers_add = "/influencers/add";
    private static final String influencers_add_invalid = "/influencers/addInvalid";

    // Outlets
    private static final String list_outlets = "/outlets/getoutlets/{fromdate}/{todate}/{startseq}/{endseq}/{warehouse_id}/{responsetype}";
    private static final String postAddoutlet = "/outlets/addoutlet/xml";
    private static final String postAddmulipleoutlet = "outlets/addMultiple/json";
    private static final String postEditoutlet = "outlets/addoutlet/xml";
    private static final String POST_addUpdateOutletTargets = "/outlets/addUpdateOutletTargets";
    private static final String postoutletaddageingapi = "outlets/addageingapi/xml";
    private static final String getEditApprovalDataApi = "outlets/getEditApprovalDataApi";

    // Outlets - GET: get min/max qty value
    private static final String GET_getMinMaxQtyValue = "/outlets/getMinMaxQtyValue";
    private static final String GET_getMinMaxQtyValue_invalid = "/outlets/getMinMaxQtyValueInvalid";

    // Outlets - GET: search outlet by name/code
    private static final String GET_getOutletBySearch = "/outlets/getOutletBySearch";
    private static final String GET_getOutletBySearch_invalid = "/outlets/getOutletBySearchInvalid";

    // Outlets - GET: search outlet by name/code (Api variant)
    private static final String GET_getOutletBySearchApi = "/outlets/getOutletBySearchApi";
    private static final String GET_getOutletBySearchApi_invalid = "/outlets/getOutletBySearchApiInvalid";

    // Collection
    private static final String collection_data = "/collections/getCollections/{fromdate}/{todate}/{startseq}/{endseq}";
    private static final String collection_data_negative = "/collections/getCollections";
    private static final String add_collection_cash = "/Collections/addMultiple";
    private static final String add_collection_check = "/Collections/addMultiple";
    private static final String add_collection_online = "/Collections/addMultiple";
    private static final String add_collection_background = "/Collections/addMultiple";
    private static final String cancel_collection_data = "/collections/cancelCollection";
    private static final String cancel_collection_empty = "/collections/cancelCollection";
    private static final String collections_cancel_collection = "collections/cancelcollection/{collectionId}";
    private static final String collections_cancel_collection_invalid = "collections/cancelcollectionInvalid";
    private static final String collections_connect_api_collection_for_user = "collections/connectApiCollectionForUser/{fromdate}/{todate}/{userId}";
    private static final String collections_connect_api_collection_for_user_invalid = "collections/connectApiCollectionForUserInvalid";
    private static final String collections_get_pending_invoices = "collections/getPendingInvoices";
    private static final String collections_get_pending_invoices_invalid = "collections/getPendingInvoicesInvalid";
    private static final String collections_get_collections = "collections/getcollections/{fromdate}/{todate}/{startseq}/{endseq}";
    private static final String collections_get_collections_invalid = "collections/getcollectionsInvalid/{fromdate}/{todate}/{startseq}/{endseq}";
    private static final String collections_invoice_collection = "collections/invoicecollection";
    private static final String collections_invoice_collection_invalid = "collections/invoicecollectionInvalid";
    private static final String collections_collection_invoice_wise = "collections/collectionInvoicewise";
    private static final String collections_collection_invoice_wise_invalid = "collections/collectionInvoicewiseInvalid";
    private static final String collections_outlet_wise_collection_report = "collections/outletwisecollectionreport/{fromdate}/{todate}/{outletId}";
    private static final String collections_outlet_wise_collection_report_invalid = "collections/outletwisecollectionreportInvalid/{fromdate}/{todate}/{outletId}";

    // Stock
    private static final String stock_at_outlet = "/stockoutlets/getstocks";

    // User Target
    private static final String user_target = "/targets/getTargetsAPIHQ";
    private static final String POST_setUserTarget = "/targets/setUserTargets";

    // Forms
    private static final String activity_form = "/users/getActivities";
    private static final String POST_activities_add = "/activities/add";
    private static final String POST_activities_add_invalid = "/activities/addInvalid";
    // GET ACTIVITIES USER WISE INDEX DATA API
    private static final String activities_userwiseindexdata = "/activities/userwiseindexdata/{startDate}/{endDate}/{userId}";
    private static final String activities_userwiseindexdata_invalid = "/activities/userwiseindexdataInvalid/{startDate}/{endDate}/{userId}";
    private static final String generic_form = "/users/getGenericData";
    private static final String custom_outlet_form = "/outlets/getCustomOutletFields";

    // Attendance
    private static final String attendance_data = "/users/getAttendances";

    // Load In
    private static final String loadin_data = "/warehouses/getLoadinsApi";
    private static final String POST_loadoutSettle = "/loadouts/settle";

    // GRN
    private static final String grn_data = "/payments/getgrndata";
    // Retailer GRN details (Bizom Web API style endpoint used by Retailer tests)
    private static final String getmbretailerGrndetails = "/payments/getmbretailerGrndetails";

    // Delete sale
    private static final String POST_Deletesale = "payments/deletesale";

    //POST sale

    private static final String POST_SalesApi = "payments/saleapi";

    // Skunits
    private static final String GET_Products = "skunits/getskus";
    private static final String list_skunits_master= "/skunits/getallcompanyskus";
    private static final String skunits_get_serial_number_for_warehouse = "/skunits/getSerialnumberForWarehouse";
    private static final String skunits_get_serial_number_for_warehouse_invalid = "/skunits/invalid";
    private static final String skunits_get_sku_id_from_sku_codes = "/skunits/getSkuIdFromSkuCodes/{skuCodes}";
    private static final String skunits_get_sku_id_from_sku_codes_invalid = "/skunits/getSkuIdFromSkuCodes/invalid";
    private static final String skunits_get_sku_level_filters_for_reports = "/skunits/getSkuLevelFiltersForReports";
    private static final String skunits_get_sku_level_filters_for_reports_invalid = "/skunits/invalid";
    private static final String skunits_sku_unit_price_change = "/skunits/skunitpricechange";
    private static final String skunits_sku_unit_price_change_invalid = "/skunits/invalid";

    // =====================================================================================
    // WEB API ENDPOINTS
    // =====================================================================================

    // Web API - User Management
    private static final String webAddUser = "/users/add";
    private static final String webEditUser = "/users/edit/{id}";
    private static final String webAjaxUserIndex = "/users/ajaxuserindex";
    private static final String webAjaxUserIndex_invalid = "/users/ajaxuserindexInvalid";
    private static final String ajaxUserList = "/users/ajaxuserlist";
    private static final String ajaxUserList_invalid = "/users/ajaxuserlist/invalid";
    private static final String changePwdDialog = "/users/changepwddialog/{userId}";
    private static final String changePwdDialog_invalid = "/users/changepwddialog/invalid";
    private static final String POST_changePwd = "/users/changepwd/{userId}";
    private static final String POST_changePwd_invalid = "/users/changepwd/invalid";
    private static final String user_access_token = "/users/getaccesstoken";
    private static final String user_access_token_invalid = "/users/invalid";
    private static final String user_activity_field_for_task = "/users/getActivtyFieldForTask";
    private static final String user_activity_field_for_task_invalid = "/users/invalid";
    private static final String all_reportee_users = "/users/getAllReporteeUsers/{userId}";
    private static final String all_reportee_users_invalid = "/users/invalid";
    private static final String all_users_api = "/users/getAllUsersApi";
    private static final String all_users_api_invalid = "/users/invalid";
    private static final String all_users_new = "/users/getAllUsersNew";
    private static final String all_users_new_invalid = "/users/invalid";
    private static final String api_get_user_list = "/users/apigetUserList";
    private static final String api_get_user_list_invalid = "/users/apigetUserList/invalid";
    private static final String beat_wise_dashboard_data = "/users/getBeatWiseDashboardData";
    private static final String beat_wise_dashboard_data_invalid = "/users/invalid";
    private static final String complete_reporting_hierarchy_for_user = "/users/getCompleteReportingHierarchyForUser/{userId}";
    private static final String complete_reporting_hierarchy_for_user_invalid = "/users/getCompleteReportingHierarchyForUser/invalid";
    private static final String compliance_forms_for_user = "/users/getComplianceFormsForUser/{userId}";
    private static final String compliance_forms_for_user_invalid = "/users/invalid";
    private static final String get_distinct_designations = "/users/getDistinctDesignations";
    private static final String get_distinct_designations_invalid = "/users/invalid";
    private static final String get_headquarter_data = "/users/getHeadQuarterData/{headquarterId}";
    private static final String get_headquarter_data_invalid = "/users/invalid";
    private static final String get_managers_for_user = "/users/getManagersForUser";
    private static final String get_managers_for_user_invalid = "/users/invalid";
    private static final String get_new_jwt_token_for_expiry = "/users/getNewJwtTokenForExpiry";
    private static final String get_new_jwt_token_for_expiry_invalid = "/users/invalid";
    private static final String get_notifications = "/users/getNotifications/{userId}";
    private static final String get_notifications_invalid = "/users/invalid";
    private static final String users_get_notifications = "/users/getNotifications";
    private static final String users_get_notifications_invalid = "/users/getNotifications/invalid";
    private static final String get_reportee_users = "/users/getReporteeUsers";
    private static final String get_reportee_users_invalid = "/users/invalid";
    private static final String get_reporters_for_role = "/users/getReportersforrole/{userId}";
    private static final String get_reporters_for_role_invalid = "/users/invalid";
    private static final String get_task_creator_approver = "/users/getTaskCreatorApprover";
    private static final String get_task_creator_approver_invalid = "/users/invalid";
    private static final String get_unassigned_hq_users = "/users/getUnassingHQUsers";
    private static final String get_unassigned_hq_users_invalid = "/users/invalid";
    private static final String get_user_by_id = "/users/getUserById";
    private static final String get_user_by_id_invalid = "/users/invalid";
    private static final String get_user_custom_fields = "/users/getUserCustomFields";
    private static final String get_user_custom_fields_invalid = "/users/invalid";
    private static final String get_user_for_created_by_user = "/users/getUserForCreatedByUser/{userId}";
    private static final String get_user_for_created_by_user_invalid = "/users/invalid";
    private static final String get_user_reportee_users = "/users/getUserReporteeUsers/{userId}";
    private static final String get_user_reportee_users_invalid = "/users/invalid";
    private static final String get_user_reporting_hierarchy = "/users/getUserReportingHierarchy/{userId}";
    private static final String get_user_reporting_hierarchy_invalid = "/users/invalid";
    private static final String get_user_hierarchy = "/users/getuserhierarchy";
    private static final String get_user_hierarchy_invalid = "/users/invalid";
    private static final String get_dsm_for_sm = "/users/getdsmforsm";
    private static final String get_dsm_for_sm_invalid = "/users/invalid";
    private static final String get_all_users_for_current_zone = "/users/getallusersforcurrentzone";
    private static final String get_all_users_for_current_zone_invalid = "/users/invalid";
    private static final String get_distributors_for_user = "/users/getdistributorsforuser";
    private static final String get_distributors_for_user_invalid = "/users/invalid";
    private static final String get_dse_for_dsm = "/users/getdsefordsm";
    private static final String get_dse_for_dsm_invalid = "/users/invalid";
    private static final String get_all_users = "/users/getallusers";
    private static final String get_all_users_invalid = "/users/invalid";
    private static final String get_warehouses_for_user = "/users/getWarehousesForUser";
    private static final String get_warehouses_for_user_invalid = "/users/invalid";
    private static final String get_users_for_zone_role = "/users/getUsersforzonerole";
    private static final String get_users_for_zone_role_invalid = "/users/invalid";
    private static final String get_users_for_designation = "/users/getUsersfordesignation/{designationId}";
    private static final String get_users_for_designation_invalid = "/users/invalid";
    private static final String get_users_for_subzone_role = "/users/getUsersForSubzoneRole/{subzoneId}";
    private static final String get_users_for_subzone_role_invalid = "/users/invalid";
    private static final String get_users_for_report_with_fields = "/users/getUsersForReportWithFields";
    private static final String get_users_for_report_with_fields_invalid = "/users/invalid";
    private static final String get_users_for_distributor_by_roles = "/users/getUsersForDistributorByRoles/{warehouseId}";
    private static final String get_users_for_distributor_by_roles_invalid = "/users/invalid";
    private static final String get_users_by_hq = "/users/getUsersByHQ/{hqId}";
    private static final String get_users_by_hq_invalid = "/users/invalid";
    private static final String syncapis_index = "/syncapis/index/{companyId}";
    private static final String syncapis_index_invalid = "/syncapis/invalid";
    private static final String tasks_get_approval_tasks = "/tasks/getApprovalTasks";
    private static final String tasks_get_approval_tasks_invalid = "/tasks/invalid";
    private static final String tasks_get_all_trainers = "/tasks/getAllTrainers";
    private static final String tasks_get_all_trainers_invalid = "/tasks/invalid";
    private static final String tasks_get_all_events = "/tasks/getAllEvents";
    private static final String tasks_get_all_events_invalid = "/tasks/invalid";
    private static final String tasks_getdistributorsforrdvisittasks = "/tasks/getDistributorsForRDVisitTasks";
    private static final String tasks_getdistributorsforrdvisittasks_invalid = "/tasks/getDistributorsForRDVisitTasksInvalid";
    private static final String tasks_getsalesmanforjointworktask = "/tasks/getSalesManForJointWorkTask";
    private static final String tasks_getsalesmanforjointworktask_invalid = "/tasks/getSalesManForJointWorkTaskInvalid";
    private static final String tasks_gettaskdata = "/tasks/getTaskdata";
    private static final String tasks_gettaskdata_invalid = "/tasks/getTaskdataInvalid";
    private static final String tasks_gettourprogramtasknotifications = "/tasks/getTourProgramTaskNotifications";
    private static final String tasks_gettourprogramtasknotifications_invalid = "/tasks/getTourProgramTaskNotificationsInvalid";
    private static final String tasks_gettasks = "/tasks/gettasks";
    private static final String tasks_gettasks_invalid = "/tasks/gettasksInvalid";
    private static final String tasks_gettasktypes = "/tasks/gettasktypes";
    private static final String tasks_gettasktypes_invalid = "/tasks/gettasktypesInvalid";
    private static final String tasks_gettrainingactivityformdata = "/tasks/getTrainingActivityFormData";
    private static final String tasks_gettrainingactivityformdata_invalid = "/tasks/getTrainingActivityFormDataInvalid";
    private static final String tasks_get_task_activity_form = "/tasks/getTaskActivityForm";
    private static final String tasks_get_task_activity_form_invalid = "/tasks/getTaskActivityForm/invalid";
    private static final String tasks_tasklist = "tasks/tasklist";
    private static final String tasks_tasklist_invalid = "tasks/tasklistInvalid";
    private static final String tasks_taskreport = "tasks/taskreport";
    private static final String tasks_taskreport_invalid = "tasks/taskreportInvalid";
    private static final String tasks_tasksassign = "tasks/tasksassign";
    private static final String tasks_tasksassign_invalid = "tasks/tasksassignInvalid";
    private static final String tasks_viewtaskassignees = "tasks/viewtaskassignees";
    private static final String tasks_viewtaskassignees_invalid = "tasks/viewtaskassigneesInvalid";
    private static final String tasks_add = "tasks/add";
    private static final String tasks_add_invalid = "tasks/addInvalid";
    private static final String POST_addEvent = "/tasks/addEvent";
    private static final String POST_addEvent_invalid = "/tasks/addEventInvalid";
    private static final String taskstatuses_getstatus = "/taskstatuses/getStatus";
    private static final String taskstatuses_getstatus_invalid = "/taskstatuses/getStatusInvalid";
    private static final String taskstatuses_getstatusbytasktype = "/taskstatuses/getStatusByTaskType";
    private static final String taskstatuses_getstatusbytasktype_invalid = "/taskstatuses/getStatusByTaskTypeInvalid";
    private static final String taskapprovals_index = "/taskapprovals/index";
    private static final String taskapprovals_index_invalid = "/taskapprovals/invalid";
    private static final String taskapprovalstatuses_approveTrainer = "/taskapprovalstatuses/approveTrainer";
    private static final String taskapprovalstatuses_approveTrainer_invalid = "/taskapprovalstatuses/approveTrainerInvalid";
    private static final String taskapprovalstatuses_checktrainer = "/taskapprovalstatuses/checktrainer/{id}";
    private static final String taskapprovalstatuses_checktrainer_invalid = "/taskapprovalstatuses/checktrainerInvalid/{id}";
    private static final String tasklocations_get_tasklocations = "/tasklocations/getTasklocations";
    private static final String tasklocations_get_tasklocations_invalid = "/tasklocations/invalid";
    private static final String taskassignees_approved_contacts = "/taskassignees/approvedContacts";
    private static final String taskassignees_approved_contacts_invalid = "/taskassignees/invalid";
    private static final String POST_markAttendence = "/taskassignees/markAttendence";
    private static final String POST_markAttendence_invalid = "/taskassignees/markAttendenceInvalid";
    private static final String targets_get_user_targets_data = "/targets/getUserTargetsData/{userId}";
    private static final String targets_get_user_targets_data_invalid = "/targets/invalid";
    private static final String targets_achievement = "/targets/achievement/{fromDate}/{toDate}/{userId}";
    private static final String targets_achievement_invalid = "/targets/invalid";
    private static final String targets_achievementmultiuser = "/targets/achievementmultiuser";
    private static final String targets_achievementmultiuser_invalid = "/targets/achievementmultiuserInvalid";
    private static final String targets_achievementmultiusernew = "/targets/achievementmultiusernew";
    private static final String targets_achievementmultiusernew_invalid = "/targets/achievementmultiusernewInvalid";
    private static final String collaterals_get_collaterals_for_sku = "/collaterals/getCollateralsForSKU";
    private static final String collaterals_get_collaterals_for_sku_invalid = "/collaterals/invalid";
    private static final String payeedetails_get_disbursement_mode = "/payeedetails/getDisbursementMode";
    private static final String payeedetails_get_disbursement_mode_invalid = "/payeedetails/invalid";
    private static final String get_stock_transfers = "/stocktransfers/getstocktransfers";
    private static final String get_stock_transfers_invalid = "/stocktransfers/invalid";
    private static final String POST_approveStockTransfer = "/stocktransfers/approvestocktransfer";
    private static final String POST_approveStockTransfer_invalid = "/stocktransfers/approvestocktransferInvalid";
    private static final String get_merchandising_data = "/stockatoutlets/getMerchandisingData";
    private static final String get_merchandising_data_invalid = "/stockatoutlets/invalid";
    private static final String stockatoutlets_getstocks = "/stockatoutlets/getstocks/{startDate}/{endDate}/{warehouseId}/{outletId}";
    private static final String stockatoutlets_getstocks_invalid = "/stockatoutlets/getstocksInvalid/{startDate}/{endDate}/{warehouseId}/{outletId}";
    private static final String get_users_by_filter_api = "/users/getUsersByFilterAPI";
    private static final String get_users_by_filter_api_invalid = "/users/invalid";
    private static final String userinfo = "/users/userinfo";
    private static final String userinfo_invalid = "/users/invalid";
    private static final String user_summary_index_api = "/users/userSummaryIndexApi";
    private static final String user_summary_index_api_invalid = "/users/invalid";
    private static final String get_users_for_zones = "/users/getusersforzones/{zoneId}";
    private static final String get_users_for_zones_invalid = "/users/invalid";
    private static final String get_users_for_warehouse = "/users/getusersforwarehouse/{warehouseId}";
    private static final String get_users_for_warehouse_invalid = "/users/invalid";
    private static final String get_users_for_subzones = "/users/getusersforsubzones/{subzoneId}";
    private static final String get_users_for_subzones_invalid = "/users/invalid";
    private static final String get_users_for_role = "/users/getusersforrole/{roleId}";
    private static final String get_users_for_role_invalid = "/users/invalid";
    private static final String get_users_for_area = "/users/getusersforarea/{areaId}";
    private static final String get_users_for_area_invalid = "/users/invalid";
    private static final String get_user_login_details = "/users/getuserlogindetails";
    private static final String get_user_login_details_invalid = "/users/invalid";
    private static final String get_user_generic_forms = "/users/getusergenericforms";
    private static final String get_user_generic_forms_invalid = "/users/invalid";
    private static final String get_user_app_versions = "/users/getuserappversions";
    private static final String get_user_app_versions_invalid = "/users/invalid";
    private static final String get_user_activity_forms = "/users/getuseractivityforms";
    private static final String get_user_activity_forms_invalid = "/users/invalid";
    private static final String get_user_info = "/users/getuserinfo";
    private static final String get_user_info_invalid = "/users/invalid";
    private static final String get_my_users = "/users/getmyusers";
    private static final String get_my_users_invalid = "/users/invalid";
    private static final String get_my_order_states = "/users/getmyorderstates";
    private static final String get_my_order_states_invalid = "/users/invalid";
    private static final String get_info = "/users/getinfo";
    private static final String get_info_invalid = "/users/invalid";
    private static final String get_ids_for_role = "/users/getidsforrole/{roleId}";
    private static final String get_ids_for_role_invalid = "/users/invalid";
    private static final String get_hqs_for_warehouse = "/users/gethqsforwarehouse/{warehouseId}";
    private static final String get_hqs_for_warehouse_invalid = "/users/invalid";
    private static final String get_enroll_status = "/users/getenrollstatus/{userId}";
    private static final String get_enroll_status_invalid = "/users/invalid";

     // Users - Get Users For Level With Role
    private static final String getUsersForLevelWithRole = "/users/getUsersForLevelWithRole/{levelId}/{role}/{status}/{type}";
    private static final String getUsersForLevelWithRole_invalid = "/users/getUsersForLevelWithRole_invalid/{levelId}/{role}/{status}/{type}";

    private static final String validationrules = "mdms/validationRules";
    private static final String validationrules_invalid = "mdms/validationRulesInvalid";

     // Web API - Orders Management
    private static final String orders_accept = "/orders/accept/{orderId}";
    private static final String orders_accept_invalid = "/orders/acceptInvalid";
     private static final String orders_api_reject_order = "/orders/apiRejectOrder/{orderId}";
     private static final String orders_api_reject_order_invalid = "/orders/apiRejectOrderInvalid/{orderId}";
     private static final String orders_api_view_order = "/orders/apiViewOrder/{orderId}";
     private static final String orders_api_view_order_invalid = "/orders/apiViewOrderInvalid/{orderId}";
     private static final String orders_copyoldorder = "/orders/copyoldorder";
     private static final String orders_copyoldorder_invalid = "/orders/copyoldorder/invalid";
     private static final String orders_get_child_order_details = "/orders/getChildOrderDetails";
     private static final String orders_get_child_order_details_invalid = "/orders/getChildOrderDetailInvalid";
     private static final String orders_get_curr_inv_acc_batch = "/orders/getCurrInvAccBatch/{skuIds}/{batchId}/{inventoryCheckForWareId}/{qtyincases}/{towarehouseid}/{zeroBatchFlag}";
     private static final String orders_get_curr_inv_acc_batch_invalid = "/orders/getCurrInvAccBatchInvalid/{skuIds}/{batchId}/{inventoryCheckForWareId}/{qtyincases}/{towarehouseid}/{zeroBatchFlag}";
     private static final String orders_get_designationwise_users = "/orders/getDesignationwiseUsers";
     private static final String orders_get_designationwise_users_invalid = "/orders/getDesignationwiseUsersinvalid";
     private static final String orders_get_order_invoices = "/orders/getOrderInvoices/{orderId}";
     private static final String orders_get_order_invoices_invalid = "/orders/getOrderInvoicesInvalid/{orderId}";
     private static final String orders_check_credit_limit_validation_mode = "/orders/checkCreditLimitValidationMode";
     private static final String orders_check_credit_limit_validation_mode_invalid = "/orders/checkCreditLimitValidationMode/invalid";
     private static final String orders_get_order_state = "/orders/getOrderState/{orderId}";
     private static final String orders_get_order_state_invalid = "/orders/getOrderStateInvalid/{orderId}";
     private static final String orders_get_order_state_logs = "/orders/getOrderStatelogs/{orderId}";
     private static final String orders_get_order_state_logs_invalid = "/orders/getOrderStatelogsInvalid/{orderId}";
     private static final String orders_get_orders_for_outlet = "/orders/getOrdersForOutlet/{outletId}";
     private static final String orders_get_orders_for_outlet_invalid = "/orders/getOrdersForOutletInvalid/{outletId}";
     private static final String orders_get_rolewise_users = "/orders/getRolewiseUsers";
     private static final String orders_get_rolewise_users_invalid = "/orders/getRolewiseUsersInvalid";
     private static final String orders_get_invoice_for_order = "/orders/getinvoicefororder";
     private static final String orders_get_invoice_for_order_invalid = "/orders/getinvoicefororderInvalid";
     private static final String orders_get_my_unfulfilled_orders = "/orders/getmyunfulfilledorders";
      private static final String orders_get_my_unfulfilled_orders_invalid = "/orders/getmyunfulfilledordersInvalid";
      private static final String orders_get_order_states = "/orders/getorderstates";
      private static final String orders_get_order_states_invalid = "/orders/getorderstatesInvalid";
      private static final String orders_get_order_states_for_report = "/orders/getorderstatesforreport";
      private static final String orders_get_order_states_for_report_invalid = "/orders/getorderstatesforreportInvalid";
      private static final String orders_edited_order_report_data = "/orders/editedorderreportdata";
      private static final String orders_edited_order_report_data_invalid = "/orders/editedorderreportdataInvalid";
      private static final String orders_get_pending_orders = "/orders/getPendingOrders/{userId}/{warehouseId}";
      private static final String orders_get_pending_orders_invalid = "/orders/getPendingOrdersInvalid/{userId}/{warehouseId}";
      private static final String POST_orders_indexwithdate = "/orders/indexwithdate/{startDate}/{endDate}";
      private static final String POST_orders_indexwithdate_invalid = "/orders/indexwithdateInvalid/{startDate}/{endDate}";
      private static final String orders_edit_from_index = "/orders/editfromindex/{orderId}";
      private static final String orders_edit_from_index_invalid = "/orders/editfromindexInvalid/{orderId}";
      private static final String orders_get_retailer_order = "/orders/getretailerorder";
      private static final String orders_get_retailer_order_invalid = "/orders/getretailerorderInvalid";
      private static final String orders_list_orders = "/orders/listorders";
      private static final String orders_list_orders_invalid = "/orders/listordersInvalid";
      private static final String orders_suggested_order_for_loadout = "/orders/suggestedorderforloadout/{orderId}";
      private static final String orders_suggested_order_for_loadout_invalid = "/orders/suggestedorderforloadoutInvalid/{orderId}";
      private static final String orgclaims_get_last_claim_date_for_warehouse = "/orgclaims/getlastclaimdateforwarehouse";
      private static final String orgclaims_get_last_claim_date_for_warehouse_invalid = "/orgclaims/getlastclaimdateforwarehouseInvalid";
      private static final String orderstates_index = "/orderstates/index";
     private static final String orderstates_index_invalid = "/orderstates/indexInvalid";
      private static final String orders_reject = "/orders/reject/{orderId}";
      private static final String orders_reject_invalid = "/orders/rejectInvalid/{orderId}";
     private static final String orders_rerun = "/orders/reRun/{orderId}";
     private static final String orders_rerun_invalid = "/orders/reRunInvalid/{orderId}";
     private static final String payments_sale_place_order_for_distributor = "/payments/sale/placeorderfordistributor";
     private static final String payments_sale_place_order_for_distributor_invalid = "/payments/sale/placeorderfordistributorInvalid";
     private static final String payments_get_loyalty_details = "/payments/getloyaltydetails/{outletId}";
     private static final String payments_get_loyalty_details_invalid = "/payments/getloyaltydetailsInvalid/{outletId}";
    private static final String payments_get_counter_sales = "/payments/getCounterSales";
    private static final String payments_get_counter_sales_invalid = "/payments/invalid";
    private static final String payments_connect_api_get_sale_for_user = "/payments/connectApiGetSaleForUser";
    private static final String payments_connect_api_get_sale_for_user_invalid = "/payments/connectApiGetSaleForUserInvalid";
    private static final String payments_get_scheme_utilization = "/payments/getSchemeUtilization";
    private static final String payments_get_scheme_utilization_invalid = "/payments/getSchemeUtilizationInvalid";
    private static final String payments_get_payment_scheme_details = "/payments/getPaymentSchemedetails";
    private static final String payments_get_payment_scheme_details_invalid = "/payments/getPaymentSchemedetailsInvalid";
    private static final String payments_get_ars_data = "/payments/getArsData";
    private static final String payments_get_ars_data_invalid = "/payments/getArsDataInvalid";
    private static final String POST_payments_getAverageSaleInfoOnSku = "/payments/getAverageSaleInfoOnSku";
    private static final String POST_payments_getAverageSaleInfoOnSku_invalid = "/payments/getAverageSaleInfoOnSkuInvalid";
    private static final String payments_getsalesinfo = "/payments/getsalesinfo/{fromDate}/{toDate}/{warehouseId}/{outletId}/{includeDetails}";
     private static final String payments_getsalesinfo_invalid = "/payments/getsalesinfoInvalid/{fromDate}/{toDate}/{warehouseId}/{outletId}/{includeDetails}";
     private static final String payments_mailtoretailer = "/payments/mailtoretailer/{invoiceId}/{email}";
     private static final String payments_mailtoretailer_invalid = "/payments/mailtoretailerInvalid/{invoiceId}/{email}";
     private static final String payments_get_invoices = "/payments/getInvoices";
     private static final String payments_get_invoices_invalid = "/payments/invalid";
     private static final String payments_get_invoices_for_return = "/payments/getInvoicesForReturn";
     private static final String payments_get_invoices_for_return_invalid = "/payments/invalid";
     private static final String payments_get_multiple_progress_status = "/payments/getMultipleProgressStatus";
     private static final String payments_get_multiple_progress_status_invalid = "/payments/invalid";
     private static final String payments_get_progress_status = "/payments/getProgressStatus/{paymentId}";
     private static final String payments_get_progress_status_invalid = "/payments/getProgressStatus/invalid";
     private static final String payments_get_invoices_data_for_user = "/payments/getinvoicesdataforuser";
     private static final String payments_get_invoices_data_for_user_invalid = "/payments/invalid";
     private static final String payments_get_skus_below_stock_turnover_ratio = "/payments/getSkusBelowStockTurnOverRatio/{id}";
     private static final String payments_get_skus_below_stock_turnover_ratio_invalid = "/payments/getSkusBelowStockTurnOverRatio/invalid";
    private static final String payments_deletepayment = "payments/deletePayment/{paymentId}";
    private static final String payments_deletepayment_invalid = "payments/deletePaymentInvalid/{paymentId}";
    private static final String payments_indexwithdate = "payments/indexwithdate/{fromdate}/{todate}";
    private static final String payments_indexwithdate_invalid = "payments/indexwithdateInvalid/{fromdate}/{todate}";

    private static final String payments_get_loadout_sheet_data = "/payments/getloadoutsheetdata/{fromdate}/{todate}/{filter}";
    private static final String payments_get_loadout_sheet_data_invalid = "/payments/invalid";

    private static final String ewaybills_editcredentials = "/ewaybills/editCredentials";
    private static final String ewaybills_editcredentials_invalid = "ewaybills/invalid";

     // Users Management - Get User List By Area
    private static final String getUserListByArea = "/users/getUserListByArea";
    private static final String getUserListByArea_invalid = "/users/getUserListByArea_invalid";


    // Payee Details API
    private static final String payeedetails_get_document_name_data = "/payeedetails/getDocumentNameData";
    private static final String payeedetails_get_document_name_data_invalid = "/payeedetails/getDocumentNameDataInvalid";

    // Pops API
    private static final String pops_get_pops_data = "/pops/getpopsdata";
    private static final String pops_get_pops_data_invalid = "/pops/getpopsdataInvalid";
    private static final String pops_index_data = "/pops/indexData";
    private static final String pops_index_data_invalid = "/pops/indexDataInvalid";
    private static final String pops_load_pop_details = "/pops/loadpopdetails/{outletId}";
    private static final String pops_load_pop_details_invalid = "/pops/loadpopdetailsInvalid/{outletId}";
    private static final String pops_load_pop_properties = "/pops/loadpopproperties";
    private static final String pops_load_pop_properties_invalid = "/pops/loadpoppropertiesInvalid";
    private static final String pops_get_pop_info = "/pops/getpopinfo";
    private static final String pops_get_pop_info_invalid = "/pops/invalid";

    // Pops Strata API
    private static final String popsstratas_api_get = "/popsstratas/apiGet";
    private static final String popsstratas_api_get_invalid = "/popsstratas/apiGetInvalid";

    // Promotion Types API
    private static final String promotiontypes_index = "/promotiontypes/index";
    private static final String promotiontypes_index_invalid = "/promotiontypes/indexInvalid";

    // Push Registrations API
    private static final String pushregistrations_get_notification_history = "/pushregistrations/getnotificationhistory/{userId}";
    private static final String pushregistrations_get_notification_history_invalid = "/pushregistrations/getnotificationhistoryInvalid/{userId}";

    // Outlet Types API
    private static final String outlettypes_index = "/outletTypes/index";
    private static final String outlettypes_index_invalid = "/outletTypes/indexInvalid";
    private static final String outlettypes_get_outlet_types = "/outletTypes/getoutletttypes";
    private static final String outlettypes_get_outlet_types_invalid = "/outletTypes/getoutletttypesInvalid";
    private static final String outlet_types_get_custom_outlet_fields = "/outlet_Types/getcustomoutletfields";
    private static final String outlet_types_get_custom_outlet_fields_invalid = "/outlet_Types/getcustomoutletfieldsInvalid";

    // Roles API
    private static final String roles_get_roles_for_user = "/roles/getrolesforuser";
    private static final String roles_get_roles_for_user_invalid = "/roles/getrolesforuserInvalid";
    private static final String roles_get_list = "/roles/getlist";
    private static final String roles_get_list_invalid = "/roles/getlistInvalid";
    private static final String roles_get_roles_for_current_user_role = "/roles/getRolesForCurrentUserRole";
    private static final String roles_get_roles_for_current_user_role_invalid = "/roles/getRolesForCurrentUserRoleInvalid";
    private static final String roles_get_roles_by_alias = "/roles/getRolesByAlias";
    private static final String roles_get_roles_by_alias_invalid = "/roles/getRolesByAliasInvalid";
     private static final String orders_run_backgroundprocess_sequence = "/orders/runBackgrounprocessSequence";
     private static final String orders_run_backgroundprocess_sequence_invalid = "/orders/runBackgrounprocessSequenceInvalid";
      private static final String orders_get_order_state_for_reject = "/orders/getorderstateforreject/{orderId}";
      private static final String orders_get_order_state_for_reject_invalid = "/orders/getorderstateforrejectInvalid/{orderId}";

    // Web API - Schemes Management
    private static final String get_scheme_for_forevery_type = "/schemes/getschemeForforeverytype/{typeId}";
    private static final String get_scheme_for_forevery_type_invalid = "/schemes/invalid";
    private static final String get_schemes_api = "/schemes/getschemesApi";
    private static final String get_schemes_api_invalid = "/schemes/invalid";
    private static final String get_schemes_for_outlets = "/schemes/getschemesforoutlets";
    private static final String get_schemes_for_outlets_invalid = "/schemes/invalid";
    private static final String get_schemes_for_warehouses = "/schemes/getschemesforwarehouses";
    private static final String get_schemes_for_warehouses_invalid = "/schemes/invalid";
    private static final String get_schemes_for_ware = "/schemes/getschemesforware/{warehouseId}/{typeId}";
    private static final String get_schemes_for_ware_invalid = "/schemes/invalid/{warehouseId}/{typeId}";
    private static final String get_payment_mode_schemes = "/schemes/getPaymentModeSchemes/{warehouseId}/{outletId}";
    private static final String get_staggered_qps_scheme = "/schemes/getStaggeredQpsScheme/{warehouseId}/{typeId}";
    private static final String get_staggered_qps_scheme_invalid = "/schemes/invalid/{warehouseId}/{typeId}";
    private static final String get_cash_sku_schemes = "/schemes/getcashskuschemes/{warehouseId}/{typeId}";
    private static final String get_cash_sku_schemes_invalid = "/schemes/invalid/{warehouseId}/{typeId}";
    private static final String get_scheme_for_holder = "/schemes/getschemeforholder";
    private static final String get_scheme_for_holder_invalid = "/schemes/invalid";
    private static final String get_trade_schemes = "/schemes/gettradeschemes/{tradeTypeId}";
    private static final String get_trade_schemes_invalid = "/schemes/invalid";
    private static final String schemes_index = "/schemes/index";
    private static final String schemes_index_invalid = "/schemes/invalid";
    private static final String schemes_indextrade = "/schemes/indextrade";
    private static final String schemes_indextrade_invalid = "/schemes/invalid";
    private static final String loyalty_approve_reject = "/schemes/loyaltyapproveReject";
    private static final String loyalty_approve_reject_invalid = "/schemes/invalid";
    private static final String loyalty_list = "/schemes/loyaltylist";
    private static final String loyalty_list_invalid = "/schemes/invalid";
    private static final String schemes_get_forskus_for_schemes = "/schemes/getForskusforSchemes/{schemeId}";
    private static final String schemes_get_forskus_for_schemes_invalid = "/schemes/invalid";
    private static final String schemes_get_available_approvers_for_user = "/schemes/getAvailableApproversForUser";
    private static final String schemes_get_available_approvers_for_user_invalid = "/schemes/invalid";
    private static final String schemes_getshemetail = "schemes/getShemeDetail/{schemeId}";
    private static final String schemes_getshemetail_invalid = "schemes/getShemeDetailInvalid/{schemeId}";
    private static final String POST_getSchemeForSchemeIds = "/schemes/getSchemeForSchemeIds";
    private static final String POST_getSchemeForSchemeIds_invalid = "/schemes/getSchemeForSchemeIdsInvalid";
    private static final String POST_save_scheme_enrolment = "/schemes/saveSchemeEnrolment";
    private static final String POST_save_scheme_enrolment_invalid = "/schemes/invalid";
    private static final String POST_calcPaymentModeScheme = "/schemes/calcPaymentModeScheme/{warehouseId}/{outletId}/{paymentMode}";
    private static final String POST_calcPaymentModeScheme_invalid = "/schemes/calcPaymentModeSchemeInvalid/{warehouseId}/{outletId}/{paymentMode}";
    private static final String POST_getGroupDedupData = "/outlets/getGroupDedupData";
    private static final String POST_getGroupDedupData_invalid = "/outlets/getGroupDedupDataInvalid";
    private static final String POST_getBillNumbers = "/outlets/getBillNumbers";
    private static final String POST_getBillNumbers_invalid = "/outlets/getBillNumbersInvalid";
    private static final String POST_getInventoryForWarehousePaginated = "/inventories/getInventoryForWarehousePaginated";
    private static final String POST_getInventoryForWarehousePaginated_invalid = "/inventories/getInventoryForWarehousePaginatedInvalid";
    private static final String POST_approvemultiple = "/outlets/approvemultiple";
    private static final String POST_approvemultiple_invalid = "/outlets/approvemultipleInvalid";
    private static final String POST_getAgeingReport = "/reports/getageingreport";
    private static final String POST_getAgeingReport_invalid = "/reports/getageingreportInvalid";
    private static final String schemereversalhierarchywises_update_scheme_reversal_hierarchy_data = "/schemereversalhierarchywises/updateSchemeReversalHierarchyData";
    private static final String schemereversalhierarchywises_update_scheme_reversal_hierarchy_data_invalid = "/schemereversalhierarchywises/invalid";
    private static final String schemereversalhierarchywises_index_api = "/schemereversalhierarchywises/indexApi";
    private static final String schemereversalhierarchywises_index_api_invalid = "/schemereversalhierarchywises/invalid";
    private static final String schemereversalhierarchywises_get_skunit_property_id = "/schemereversalhierarchywises/getSkunitPropertyId";
    private static final String schemereversalhierarchywises_get_skunit_property_id_invalid = "/schemereversalhierarchywises/invalid";
    private static final String schemereversalhierarchywises_get_skunit_property = "/schemereversalhierarchywises/getSkunitProperty";
    private static final String schemereversalhierarchywises_get_skunit_property_invalid = "/schemereversalhierarchywises/invalid";
    private static final String schemereversalhierarchywises_get_scheme_reversal_data_for_app = "/schemereversalhierarchywises/getSchemeReversalDataForApp";
    private static final String schemereversalhierarchywises_get_scheme_reversal_data_for_app_invalid = "/schemereversalhierarchywises/invalid";
    private static final String schemereversalhierarchywises_get_organisation_hierarchy = "/schemereversalhierarchywises/getOrganisationHierarchy";
    private static final String schemereversalhierarchywises_get_organisation_hierarchy_invalid = "/schemereversalhierarchywises/invalid";
    private static final String schemereversalhierarchywises_get_org_hierarchy_id = "/schemereversalhierarchywises/getOrgHierarchyId";
    private static final String schemereversalhierarchywises_get_org_hierarchy_id_invalid = "/schemereversalhierarchywises/invalid";
    private static final String schemeholders_index = "/schemeholders/index";
    private static final String schemeholders_index_invalid = "/schemeholders/invalid";
    private static final String schemeholders_assign = "schemeholders/assign";
    private static final String schemeholders_assign_invalid = "schemeholders/assignInvalid";
    private static final String schemeenrollmentassignments_index = "schemeenrollmentassignments/index";
    private static final String schemeenrollmentassignments_index_invalid = "schemeenrollmentassignments/indexInvalid";
    private static final String schemecappings_index = "schemecappings/index";
    private static final String schemecappings_index_invalid = "schemecappings/indexInvalid";
    private static final String schemecappings_edit = "schemecappings/edit";
    private static final String schemecappings_edit_invalid = "schemecappings/editInvalid";
    private static final String schemecappingconfigurations_indexapi = "schemecappingconfigurations/indexApi";
    private static final String schemecappingconfigurations_indexapi_invalid = "schemecappingconfigurations/indexApiInvalid";
    private static final String schemegroups_indextrade = "/schemegroups/indextrade";
    private static final String schemegroups_indextrade_invalid = "/schemegroups/invalid";
    private static final String schemegroups_indexnew = "/schemegroups/indexnew";
    private static final String schemegroups_indexnew_invalid = "/schemegroups/invalid";
    private static final String schemegroups_index_api = "/schemegroups/indexApi";
    private static final String schemegroups_index_api_invalid = "/schemegroups/invalid";
    private static final String schemegroups_get_schemegroups_for_approval = "/schemegroups/getSchemegroupsForApproval/";
    private static final String schemegroups_get_schemegroups_for_approval_invalid = "/schemegroups/invalid";
    private static final String pjps_get_beats_assigned_list = "/pjps/getBeatsAssignedList/{date}/{beatId}";
    private static final String pjps_get_beats_assigned_list_invalid = "/pjps/invalid";
    private static final String pjps_get_users_beats = "/pjps/getusersbeats";
    private static final String pjps_get_users_beats_invalid = "/pjps/getusersbeatsInvalid";
    private static final String pjpplancategories_get_pjp_plan_categories = "/pjpplancategories/getPjpPlanCategories";
    private static final String pjpplancategories_get_pjp_plan_categories_invalid = "/pjpplancategories/getPjpPlanCategoriesInvalid";
    private static final String pjps_get_pjp_start_date_frequency = "/pjps/getpjpstartdatefrequency";
    private static final String pjps_get_pjp_start_date_frequency_invalid = "/pjps/getpjpstartdatefrequencyInvalid";
    private static final String pjps_get_pjps = "/pjps/getpjps";
    private static final String pjps_get_pjps_invalid = "/pjps/getpjpsInvalid";
    private static final String pjp_visit_outlet_rules_index = "/pjpvisitoutletrules/index";
    private static final String pjp_visit_outlet_rules_index_invalid = "/pjpvisitoutletrules/indexInvalid";

    // Web API - Secondary Display Types Management
    private static final String secondarydisplaytypes_index = "/secondarydisplaytypes/index";
    private static final String secondarydisplaytypes_index_invalid = "/secondarydisplaytypes/invalid";

    private static final String getoutletbalance = "/outlets/getoutletbalance";
    private static final String getoutletbalance_invalid = "/outlets/getoutletbalance_invalid";
    private static final String getunapprovedoutlets = "/outlets/getunapprovedoutlets";
    private static final String getunapprovedoutlets_invalid = "/outlets/getunapprovedoutlets_invalid";


    // Web API - States Management
    private static final String states_index = "/states/index";
    private static final String states_index_invalid = "/invalid";
    private static final String states_ajax_index = "/states/ajaxindex";
    private static final String states_ajax_index_invalid = "/states/invalid";
    private static final String api_get = "/states/apiGet";
    private static final String api_get_invalid = "/states/invalid";
    private static final String api_get_states = "/states/apiGetStates";
    private static final String api_get_states_invalid = "/states/invalid";
    private static final String get_states_for_country = "/states/getstateforcountry";
    private static final String get_states_for_country_invalid = "/states/invalid";

    // Web API - Cities Management
    private static final String cities_index = "/cities/index";
    private static final String cities_index_invalid = "/invalid";
    
    // Web API - Districts Management
    private static final String districts_index = "/districts/index";
    private static final String districts_index_invalid = "/invalid";
    private static final String get_districts = "/states/getdistricts";
    private static final String get_districts_invalid = "/states/invalid";

    // Web API - Towns Management
    private static final String towns_index = "/towns/index";
    private static final String towns_index_invalid = "/invalid";
    private static final String towns_get_all_towns = "/towns/getAllTowns";
    private static final String towns_get_all_towns_invalid = "/towns/getAllTowns/invalid";
    private static final String towns_index_api = "/towns/indexApi";
    private static final String towns_index_api_invalid = "/towns/indexApi/invalid";
    private static final String POST_getTownDetails = "/towns/getTownDetails";
    private static final String POST_towns_get_town_details_invalid = "/towns/getTownDetailsInvalid";
    private static final String POST_getTownsByStateDistrictCityPinCode = "/towns/getTownsByStateDistrictCityPinCode";
    private static final String POST_getTownsByStateDistrictCityPinCode_invalid = "/towns/getTownsByStateDistrictCityPinCodeInvalid";

    // Web API - Transporters Management
    private static final String transporters_get_transporters = "/transporters/getTransporters";
    private static final String transporters_get_transporters_invalid = "/transporters/getTransporters/invalid";
    private static final String transporters_index = "/transporters/index";
    private static final String transporters_index_invalid = "/transporters/invalid";
    
    // Web API - User Claim Types Management
    private static final String userclaimtypes_index = "/userclaimtypes/index";
    private static final String userclaimtypes_index_invalid = "/userclaimtypes/index/invalid";
    private static final String userclaimtypes_assign = "/userclaimtypes/assign";
    private static final String userclaimtypes_assign_invalid = "/userclaimtypes/assignInvalid";
    
    // Web API - SK Units Management
    private static final String skunits_index = "/skunits/index";
    private static final String skunits_index_invalid = "/invalid";
    private static final String skunits_get_size = "/skunits/getsize";
    private static final String skunits_get_size_invalid = "/skunits/invalid";
    private static final String skunits_get_categories = "/skunits/getcategories";
    private static final String skunits_get_categories_invalid = "/skunits/invalid";
    private static final String skunits_get_sku_for_filter = "/skunits/getskuforfilter/{filterType}/{filterId}";
    private static final String skunits_get_sku_for_filter_invalid = "/skunits/invalid/{filterType}/{filterId}";
    private static final String POST_get_skunit_by_multiple_filter = "/skunits/getSkunitByMultipleFilter";
    private static final String POST_get_skunit_by_multiple_filter_invalid = "/skunits/invalid";
    private static final String skunits_get_brands = "/skunits/getbrands";
    private static final String skunits_get_brands_invalid = "/skunits/invalid";
    private static final String skunits_get_areawise_categories_products_new_api = "/skunits/getareawisecategoriesproductsNewApi";
    private static final String skunits_get_areawise_categories_products_new_api_invalid = "/skunits/invalid";
    private static final String skunits_get_areawise_categories_products = "/skunits/getareawisecategoriesproducts";
    private static final String skunits_get_areawise_categories_products_invalid = "/skunits/invalid";
    private static final String skunits_get_all_skus_business_units = "/skunits/getallskusbusinessunits";
    private static final String skunits_get_all_skus_business_units_invalid = "/skunits/invalid";
    private static final String skunits_get_all_skus = "/skunits/getallskus";
    private static final String skunits_get_all_skus_invalid = "/skunits/invalid";
    private static final String skunits_get_warehouse_skunit_by_inventories = "/skunits/getWarehouseSkunitByInventories";
    private static final String skunits_get_warehouse_skunit_by_inventories_invalid = "/skunits/invalid";
    private static final String skunits_get_warehouse_inventories = "/skunits/getwarehouseinventories";
    private static final String skunits_get_warehouse_inventories_invalid = "/skunits/invalid";
    private static final String skunits_get_user_skunit = "/skunits/getUserSkunit";
    private static final String skunits_get_user_skunit_invalid = "/skunits/invalid";
    private static final String skunits_get_sku_units_data = "/skunits/getSKUnitsData";
    private static final String skunits_get_sku_units_data_invalid = "/skunits/getSKUnitsDataInvalid";
    private static final String skunits_get_sku_units_data_salesreturn = "/skunits/getSKUnitsData_salesreturn/{param1}/{param2}/{param3}";
    private static final String skunits_get_sku_units_data_salesreturn_invalid = "/skunits/getSKUnitsData_salesreturnInvalid/{param1}/{param2}/{param3}";
    private static final String skunits_get_parent_skus = "/skunits/getParentSkus";
    private static final String skunits_get_parent_skus_invalid = "/skunits/getParentSkusInvalid";
    private static final String skunits_get_skunit_type = "/skunits/getSkunitType";
    private static final String skunits_get_skunit_type_invalid = "/skunits/invalid";
    private static final String skunits_ajax_sku_list = "/skunits/ajaxskulist";
    private static final String skunits_ajax_sku_list_invalid = "/skunits/invalid";
    private static final String skunits_get_skunit_info = "/skunits/getSkunitInfo/{skunitId}";
    private static final String skunits_get_skunit_info_invalid = "/skunits/getSkunitInfo";
    private static final String skunits_get_skunit_price_data = "/skunits/getSkunitPriceData/{skunitId}";
    private static final String skunits_get_skunit_price_data_invalid = "/skunits/getSkunitPriceData";
    private static final String skunits_get_skus_by_subcategories = "/skunits/getSkusBySubcategories/{subcategoryId}";
    private static final String skunits_get_skus_by_subcategories_invalid = "/skunits/getSkusBySubcategories";
    private static final String skunits_get_subcategory = "/skunits/getSubCategory/{categoryId}";
    private static final String skunits_get_subcategory_invalid = "/skunits/getSubCategory";
    private static final String skunits_get_category_sku = "/skunits/getcategorysku/";
    private static final String skunits_get_category_sku_invalid = "/skunits/getcategorysku/invalid";
    private static final String skunits_get_collateral_info = "/skunits/getcollateralinfo";
    private static final String skunits_get_collateral_info_invalid = "/skunits/invalid";
    private static final String skunits_get_list_of_skus = "/skunits/getlistofskus";
    private static final String skunits_get_list_of_skus_invalid = "/skunits/invalid";
    private static final String skunits_get_skunits_list = "/skunits/getSkunitsList";
    private static final String skunits_get_skunits_list_invalid = "/skunits/getSkunitsListInvalid";
    private static final String skunits_add = "/skunits/add";
    private static final String skunits_add_invalid = "/skunits/addInvalid";
    private static final String skunits_get_packaging = "/skunits/getpackaging";
    private static final String skunits_get_packaging_invalid = "/skunits/invalid";
    private static final String skunits_get_products_for_report = "/skunits/getproductsforreport";
    private static final String skunits_get_products_for_report_invalid = "/skunits/invalid";
    private static final String skunits_get_skus = "/skunits/getskus";
    private static final String skunits_get_skus_invalid = "/skunits/invalid";
    private static final String skunits_get_subbrands = "/skunits/getsubbrands";
    private static final String skunits_get_subbrands_invalid = "/skunits/invalid";
    private static final String skunits_get_variants = "/skunits/getvariants";
    private static final String skunits_get_variants_invalid = "/skunits/invalid";
    private static final String skunits_check_distributor_wise_price_change = "/skunits/checkdistributorwisepricechange";
    private static final String skunits_check_distributor_wise_price_change_invalid = "/skunits/checkdistributorwisepricechangeInvalid";
    private static final String skunits_get_skus_by_search = "/skunits/getSkusBySearch";
    private static final String skunits_get_skus_by_search_invalid = "/skunits/invalid";
    private static final String skunits_get_skus_for_brand = "/skunits/getskusforbrand/{brandId}";
    private static final String skunits_get_skus_for_brand_invalid = "/skunits/getskusforbrandinvalid/{brandId}";
  //  private static final String skunits_get_warehouse_inventories = "/skunits/getwarehouseinventories";
  //  private static final String skunits_get_warehouse_inventories_invalid = "/skunits/getwarehouseinventories/invalid";
    private static final String skunits_get_warehouse_skunits_opening_stock = "/skunits/getWarehouseSkunitsOpeningStock";
    private static final String skunits_get_warehouse_skunits_opening_stock_invalid = "/skunits/getWarehouseSkunitsOpeningStock/invalid";
    
    // Web API - SKU Lines Management
    private static final String skulines_index = "/skulines/index";
    private static final String skulines_index_invalid = "/skulines/invalid";
    
    // Web API - SKU Entity Priorities Management
    private static final String skunitentitypriorities_get_priorities = "/skunitentitypriorities/getPriorities";
    private static final String skunitentitypriorities_get_priorities_invalid = "/skunitentitypriorities/invalid";
    
    // Web API - Settings Management
    private static final String settings_all_settings = "/settings/allsettings/{param1}/{param2}";
    private static final String settings_all_settings_invalid = "/settings/allsettings/invalid";
    private static final String settings_all_settings_save = "/settings/allsettingssave";
    private static final String settings_all_settings_save_invalid = "/settings/invalid";
    private static final String settings_all_settings_redirect = "/settings/allsettings";
    private static final String settings_all_settings_redirect_invalid = "/settings/allsettings/invalid";
    private static final String settings_configuration_mapping = "/settings/configurationMapping/{param1}";
    private static final String settings_configuration_mapping_invalid = "/settings/configurationMapping/invalid";
    private static final String settings_get_claim_invoice_sequence_settings = "/settings/getClaimInvoiceSequenceSettings";
    private static final String settings_get_claim_invoice_sequence_settings_invalid = "/settings/getClaimInvoiceSequenceSettings/invalid";
    private static final String settings_get_company_setting_by_name = "/settings/getCompanySettingByName/{settingName}";
    private static final String settings_get_company_setting_by_name_invalid = "/settings/getCompanySettingByName/invalid";
    private static final String settings_get_current_setting = "/settings/getCurrentSetting";
    private static final String settings_get_current_setting_invalid = "/settings/getCurrentSetting/invalid";
    private static final String get_setting_for_warehouse = "/settings/getSettingForWarehouse";
    private static final String get_setting_for_warehouse_invalid = "/settings/invalid";
    private static final String get_entity_approval_data = "/settings/entityApprovalData/{entityType}/{approvalType}";
    private static final String get_entity_approval_data_invalid = "/settings/invalid/{entityType}/{approvalType}";
    private static final String get_user_according_role = "/settings/getUserAccordingRole/{roleId}";
    private static final String get_user_according_role_invalid = "/settings/invalid/{roleId}";
    private static final String settings_get_forms_by_type = "/settings/getFormsByType/{formType}";
    private static final String settings_get_forms_by_type_invalid = "/settings/getFormsByType/invalid";
    private static final String settings_get_role_name = "/settings/getRoleName";
    private static final String settings_get_role_name_invalid = "/settings/getRoleName/invalid";
    private static final String settings_get_noc_sequence_settings = "/settings/getNocSequenceSettings";
    private static final String settings_get_noc_sequence_settings_invalid = "/settings/getNocSequenceSettingsInvalid";
    
    // Web API - SKU GST Slabs Management
    private static final String skunitgstslabs_index_api = "/skunitgstslabs/indexApi";
    private static final String skunitgstslabs_index_api_invalid = "/skunitgstslabs/invalid";

    // Web API - Areas Management
    private static final String areas = "/areas";
    private static final String areas_invalid = "/invalid";
    private static final String areas_add = "/areas/add";
    private static final String areas_add_invalid = "/areas/add/invalid";
    private static final String areas_add_Valid = "/areas/add";
    private static final String areas_add_MissingFields = "/areas/add";
    private static final String areas_add_InvalidData = "/areas/add";
    private static final String areas_add_SQLInjection = "/areas/add";
    private static final String areas_add_XSS = "/areas/add";
    private static final String areas_add_MaxLength = "/areas/add";


    // Users Management - Warehouse Transaction For All Users
    private static final String getWarehouseTransactionForAllUsers = "/users/getWarehouseTransactionForAllUsers";
    private static final String getWarehouseTransactionForAllUsers_invalid = "/users/getWarehouseTransactionForAllUsers_invalid";

    // Users Management - Reporting Users
    private static final String getreportingusers = "/users/getreportingusers";
    private static final String getreportingusers_invalid = "/users/getreportingusers_invalid";
    // Outlets Management - Activities Eligibility
    private static final String getOutletElegibleForActivity = "/outlets/outletElegibleForActivity/{outletId}/{activityType}";
    private static final String getOutletElegibleForActivity_invalid = "/outlets/outletElegibleForActivity_invalid/{outletId}/{activityType}";

    // Web API - Outlets Management
    private static final String view_unapproved_outlets = "/outlets/viewunapprovedoutlets";
    private static final String view_unapproved_outlets_invalid = "/invalid";
    private static final String outlets_unapproved_outlet_list = "/outlets/unapprovedOutletList";
    private static final String outlets_unapproved_outlet_list_invalid = "/outlets/invalid";
    private static final String outlets_approve = "/outlets/approve/{outletId}";
    private static final String outlets_approve_invalid = "/outlets/approveInvalid/{outletId}";
    private static final String outlets_add = "/outlets/add";
    private static final String outlets_add_invalid = "/outlets/add/invalid";
    private static final String outlets_check_is_distributor = "/outlets/checkOutletIsDistributor";
    private static final String outlets_check_is_distributor_invalid = "/outlets/checkOutletIsDistributorInvalid";
    private static final String outlets_connect_get_for_user = "/outlets/connectGetOutletsForUser";
    private static final String outlets_connect_get_for_user_invalid = "/outlets/connectGetOutletsForUserInvalid";
    private static final String outlets_api_get_outlet_for_distributor = "/outlets/apiGetOutletforDistributor";
    private static final String outlets_api_get_outlet_for_distributor_invalid = "/outlets/apiGetOutletforDistributorInvalid";
    private static final String outletbalances_get_by_warehouse = "/outletbalances/getOutletBalanceByWarehouse";
    private static final String outletbalances_get_by_warehouse_invalid = "/outletbalances/getOutletBalanceByWarehouseInvalid";
    private static final String outletbalances_update_from_connect = "/outletbalances/updateOutletBalanceFromConnect";
    private static final String outletbalances_update_from_connect_invalid = "/outletbalances/updateOutletBalanceFromConnectInvalid";
    private static final String outletcategories_api_get = "/outletcategories/apiGetOutletCategory";
    private static final String outletcategories_api_get_invalid = "/outletcategories/apiGetOutletCategoryInvalid";
    private static final String outletcategories_set_category = "/outletcategories/setoutletcategory/{OutletID}";
    private static final String outletcategories_set_category_invalid = "/outletcategories/invalid/{OutletID}";
    private static final String outletcontacts_get_for_other_entity = "/outletcontacts/getOutletContactForOtherEntity";
    private static final String outletcontacts_get_for_other_entity_invalid = "/outletcontacts/getOutletContactForOtherEntityInvalid";
    private static final String outletcontacts_get = "/outletcontacts/getOutletContacts";
    private static final String outletcontacts_get_invalid = "/outletcontacts/getOutletContactsInvalid";
    private static final String outletcontacts_get_user_mapped_outcontact = "/outletcontacts/getusermappedoutcontact";
    private static final String outletcontacts_get_user_mapped_outcontact_invalid = "/outletcontacts/getusermappedoutcontactInvalid";
    private static final String user_outlet_contact_mappings = "/outletcontacts/useroutletcontactmappings/{userId}";
    private static final String user_outlet_contact_mappings_invalid = "/outletcontacts/useroutletcontactmappingsInvalid/{userId}";
    private static final String outlets_distiman_validate_outlet = "/outlets/distiman_validateOutlet";
    private static final String outlets_distiman_validate_outlet_invalid = "/outlets/distiman_validateOutletInvalid";
    private static final String outlets_get_buyer_filter = "/outlets/getBuyerFilter";
    private static final String outlets_get_buyer_filter_invalid = "/outlets/getBuyerFilterInvalid";
    private static final String outlets_get_child_outlets_by_parent = "/outlets/getChildOutletsByParent/{outletId}";
    private static final String outlets_get_child_outlets_by_parent_invalid = "/outlets/getChildOutletsByParentInvalid/{outletId}";
    private static final String outlets_get_duplicates = "/outlets/getDuplicates";
    private static final String outlets_get_duplicates_invalid = "/outlets/getDuplicatesInvalid";
    private static final String outlets_get_focus_skus = "/outlets/getFocusSkus";
    private static final String outlets_get_focus_skus_invalid = "/outlets/getFocusSkusInvalid";
    private static final String outlets_get_frequently_used_product = "/outlets/getFrequentlyusedproduct/{orderId}";
    private static final String outlets_get_frequently_used_product_invalid = "/outlets/getFrequentlyusedproductInvalid/{orderId}";
    private static final String outlets_get_leads_data = "/outlets/getLeadsData";
    private static final String outlets_get_leads_data_invalid = "/outlets/getLeadsDataInvalid";
    private static final String outlets_get_near_by_outlet_by_geo_location = "/outlets/getNearByOutletByGeoLocation";
    private static final String outlets_get_near_by_outlet_by_geo_location_invalid = "/outlets/getNearByOutletByGeoLocationInvalid";
    private static final String outlets_get_nearest_outlets_without_conditions = "/outlets/getNearestOutletsWithoutConditions";
    private static final String outlets_get_nearest_outlets_without_conditions_invalid = "/outlets/getNearestOutletsWithoutConditionsInvalid";
    private static final String outlets_get_outlet_and_child_outlet = "/outlets/getOutletAndChildOutlet/{orderId}";
    private static final String outlets_get_outlet_and_child_outlet_invalid = "/outlets/getOutletAndChildOutletInvalid/{orderId}";
    private static final String outlets_get_outlet_detail_api = "/outlets/getOutletDetailApi/{orderId}";
    private static final String outlets_get_outlet_detail_api_invalid = "/outlets/getOutletDetailApiInvalid/{orderId}";
    private static final String outlets_download_custom_outlet_image = "/outlets/downloadCustomOutletImage";
    private static final String outlets_download_custom_outlet_image_invalid = "/outlets/downloadCustomOutletImageInvalid";
    private static final String outlets_get_outlets_based_on_category = "/outlets/getOutletsBasedOnOutletCategory/{categoryId}";
    private static final String outlets_get_outlets_based_on_category_invalid = "/outlets/getOutletsBasedOnOutletCategoryInvalid/{categoryId}";
    private static final String outlets_get_skus_for_outlet = "/outlets/getSkusForOutlets/{outletId}";
    private static final String outlets_get_skus_for_outlet_invalid = "/outlets/getSkusForOutletsInvalid/{outletId}";
    private static final String outlets_get_all_outlet_details_for_user = "/outlets/getalloutletdetailsforuser/{userId}";
    private static final String outlets_get_all_outlet_details_for_user_invalid = "/outlets/getalloutletdetailsforuserInvalid/{userId}";
    private static final String outlets_get_asset_data_for_outlet = "/outlets/getassestdataforoutlet";
    private static final String outlets_get_asset_data_for_outlet_invalid = "/outlets/getassestdataforoutletInvalid";
    private static final String outlets_get_beat_for_today = "/outlets/getbeatfortoday";
    private static final String outlets_get_beat_for_today_invalid = "/outlets/getbeatfortodayInvalid";
    private static final String outlets_get_beatwise_outlets_new = "/outlets/getbeatwiseoutletsnew";
    private static final String outlets_get_beatwise_outlets_new_invalid = "/outlets/getbeatwiseoutletsnewInvalid";
    private static final String outlets_get_data_for_suggested_order = "/outlets/getdataforsuggestedorder/{orderId}";
    private static final String outlets_get_data_for_suggested_order_invalid = "/outlets/getdataforsuggestedorderInvalid/{orderId}";
    private static final String outlets_get_detail = "/outlets/getDetail/{outletId}";
    private static final String outlets_get_detail_invalid = "/outlets/getDetailInvalid/{outletId}";
    private static final String outlets_get_distributors_for_area = "/outlets/getdistributorsforarea/{areaId}";
    private static final String outlets_get_distributors_for_area_invalid = "/outlets/getdistributorsforareaInvalid/{areaId}";
    private static final String outlets_get_distributors_for_warehouse = "/outlets/getdistributorsforwarehouse";
    private static final String outlets_get_distributors_for_warehouse_invalid = "/outlets/getdistributorsforwarehouseInvalid";
    private static final String outlets_get_duplicate_outlets_new = "/outlets/getduplicateoutletsnew";
    private static final String outlets_get_duplicate_outlets_new_invalid = "/outlets/getduplicateoutletsnewInvalid";
    private static final String outlets_get_last_sale_price_of_sku = "/outlets/getlastsalepriceofsku";
    private static final String outlets_get_last_sale_price_of_sku_invalid = "/outlets/getlastsalepriceofskuInvalid";
    private static final String outlets_get_outlet_level = "/outlets/getoutletlevel/{outletId}";
    private static final String outlets_get_outlet_level_invalid = "/outlets/getoutletlevelInvalid/{outletId}";
    private static final String outlets_get_outletsaleledger = "/outlets/getoutletsaleledger";
    private static final String outlets_get_outletsaleledger_invalid = "/outlets/getoutletsaleledgerInvalid";
    private static final String outlets_get_outlets_for_area = "/outlets/getoutletsforarea/{areaId}";
    private static final String outlets_get_outlets_for_area_invalid = "/outlets/getoutletsforareaInvalid/{areaId}";
    private static final String outlets_get_outlets_for_area_with_beat_details = "/outlets/getoutletsforareawithbeatdetails/{areaId}";
    private static final String outlets_get_outlets_for_area_with_beat_details_invalid = "/outlets/getoutletsforareawithbeatdetailsInvalid/{areaId}";
    private static final String outlets_get_outlets_for_area_with_key_customers = "/outlets/getoutletsforareawithkeycustomers/{areaId}";
    private static final String outlets_get_outlets_for_area_with_key_customers_invalid = "/outlets/getoutletsforareawithkeycustomersInvalid/{areaId}";
    private static final String outlets_get_outlets_for_city = "/outlets/getoutletsforcity/{cityId}";
    private static final String outlets_get_outlets_for_city_invalid = "/outlets/getoutletsforcityInvalid/{cityId}";
    private static final String outlets_get_outlets_for_report = "/outlets/getoutletsforreport";
    private static final String outlets_get_outlets_for_report_invalid = "/outlets/getoutletsforreportInvalid";
    private static final String outlets_get_outlets_for_state = "/outlets/getoutletsforstate/{stateId}";
    private static final String outlets_get_outlets_for_state_invalid = "/outlets/getoutletsforstateInvalid/{stateId}";
    private static final String outlets_get_outlets_for_user = "/outlets/getoutletsforuser/{userId}";
    private static final String outlets_get_outlets_for_user_invalid = "/outlets/getoutletsforuserInvalid/{userId}";
    private static final String outlets_get_outlets_for_warehouses = "/outlets/getoutletsforwarehouses/{warehouseId}";
    private static final String outlets_get_outlets_for_warehouses_invalid = "/outlets/getoutletsforwarehousesInvalid/{warehouseId}";
    private static final String outlets_get_child_outlets = "/outlets/getChildOutlets";
    private static final String outlets_get_child_outlets_invalid = "/outlets/getChildOutletsInvalid";
    private static final String outlets_get_outlets_in_range = "/outlets/getoutletsinrange";
    private static final String outlets_get_outlets_in_range_invalid = "/outlets/getoutletsinrangeInvalid";
    private static final String outlets_get_outlet_types = "/outlets/getoutlettypes";
    private static final String outlets_get_outlet_types_invalid = "/outlets/getoutlettypesInvalid";
    private static final String outlets_get_pending_invoices_multi_distributor = "/outlets/getpendinginvoicesMultiDistributor/{outletId}/{distributorId}";
    private static final String outlets_get_pending_invoices_multi_distributor_invalid = "/outlets/getpendinginvoicesMultiDistributorInvalid/{outletId}/{distributorId}";
    private static final String outlets_get_outlet_creditnote_history = "/outlets/get_outlet_creditnote_history/{outletId}/{startDate}/{endDate}";
    private static final String outlets_get_outlet_creditnote_history_invalid = "/outlets/get_outlet_creditnote_historyInvalid/{outletId}/{startDate}/{endDate}";
    private static final String outlets_get_unmapped_outlets = "/outlets/getunmappedoutlets/{areaId}";
    private static final String outlets_get_unmapped_outlets_invalid = "/outlets/getunmappedoutletsInvalid/{areaId}";
    private static final String outlets_inactive_outlets_for_focus_sku = "/outlets/inactiveoutletsfocussku/{outletId}";
    private static final String outlets_inactive_outlets_for_focus_sku_invalid = "/outlets/inactiveoutletsfocusskuInvalid/{outletId}";
    private static final String outlets_list_outlets_in_area = "/outlets/listoutletsinarea/{areaId}";
    private static final String outlets_list_outlets_in_area_invalid = "/outlets/listoutletsinareaInvalid/{areaId}";
    private static final String outlets_by_warehouse_and_outlet_category = "/outlets/outletsByWarehouseAndOutletCategory";
    private static final String outlets_by_warehouse_and_outlet_category_invalid = "/outlets/outletsByWarehouseAndOutletCategoryInvalid";
    private static final String outlets_under_area = "/outlets/outletsunderarea/{areaId}";
    private static final String outlets_under_area_invalid = "/outlets/outletsunderareaInvalid/{areaId}";
    private static final String outlets_search_taxpayer = "/outlets/searchTaxPayer";
    private static final String outlets_search_taxpayer_invalid = "/outlets/searchTaxPayerInvalid";
    private static final String outlets_reject_outlet = "/outlets/rejectoutlet/{outletId}";
    private static final String outlets_reject_outlet_invalid = "/outlets/rejectoutletInvalid/{outletId}";
    private static final String outlets_search_outlet_by_name_or_id = "/outlets/searchOutletByNameOrId/{id}";
    private static final String outlets_search_outlet_by_name_or_id_invalid = "/outlets/searchOutletByNameOrIdInvalid/{id}";
    private static final String outlets_searchOutletByPhonenumber = "/outlets/searchOutletByPhonenumber";
    private static final String outlets_searchOutletByPhonenumber_invalid = "/outlets/searchOutletByPhonenumberInvalid";
    private static final String outlets_sendOutletVerificationOTP = "/outlets/sendOutletVerificationOTP";
    private static final String outlets_sendOutletVerificationOTP_invalid = "/outlets/sendOutletVerificationOTPInvalid";
    private static final String outlets_removeOrderRestrictionForOutlet = "/outlets/removeOrderRestrictionForOutlet";
    private static final String outlets_removeOrderRestrictionForOutlet_invalid = "/outlets/removeOrderRestrictionForOutletInvalid";


    private static final String outlets_get_outlet = "/outlets/getoutlet/{outletId}";
    private static final String outlets_get_outlet_invalid = "/outlets/getoutletInvalid/{outletId}";
    private static final String outlets_get_outlet_details = "/outlets/getoutletdetails/{outletId}";
    private static final String outlets_get_outlet_details_invalid = "/outlets/getoutletdetailsInvalid/{outletId}";
    private static final String outlets_get_categorized_outlet_for_user = "/outlets/getcategorizedoutletforuser";
    private static final String outlets_get_categorized_outlet_for_user_invalid = "/outlets/getcategorizedoutletforuserInvalid";
    private static final String outlets_get_outlet_info = "/outlets/getoutletinfo/{outletId}";
    private static final String outlets_get_outlet_info_invalid = "/outlets/getoutletinfoInvalid/{outletId}";
    private static final String outlets_stock_at_outlet = "/outlets/stockatoutlet/{outletId}";
    private static final String outlets_stock_at_outlet_invalid = "/outlets/invalidstockatoutlet/{outletId}";
    private static final String outlets_save_payee_data = "/outlets/savePayeeData";
    private static final String outlets_save_payee_data_invalid = "/outlets/invalidSavePayeeData";
    private static final String POST_outlets_getMinMaxOrderqtyvalue = "/outlets/getMinMaxOrderqtyvalue";
    private static final String POST_outlets_getMinMaxOrderqtyvalue_invalid = "/outlets/getMinMaxOrderqtyvalueInvalid";
    private static final String POST_outlets_getOutletByAreaAndOutletType = "/outlets/getOutletByAreaAndOutletType";
    private static final String POST_outlets_getOutletByAreaAndOutletType_invalid = "/outlets/getOutletByAreaAndOutletTypeInvalid";

    private static final String POST_getOutletsInfo = "/outlets/getOutletsinfo";
    private static final String POST_getOutletsInfo_invalid = "/outlets/getOutletsinfoInvalid";

    // Outlet List API
    private static final String getoutletlist = "/outlets/getoutletlist/{outletId}";
    private static final String getoutletlist_invalid = "/outlets/getoutletlistInvalid/{outletId}";

    private static final String outlets_approval_status = "/outlets/approvalStatus/{outletId}";
    private static final String outlets_approval_status_invalid = "/outlets/approvalStatusInvalid/{outletId}";

    // Web API - Outlet Targets Management
    private static final String outlettargets_get_entity_targets = "/outlettargets/getentitytargets";
    private static final String outlettargets_get_entity_targets_invalid = "/outlettargets/getentitytargetsInvalid";
    private static final String outlettargets_outlet_type = "/outlettargets/outlettype/{outletType}";
    private static final String outlettargets_outlet_type_invalid = "/outlettargets/outlettypeInvalid/{outletType}";
    private static final String outlettargets_set_distributor_targets = "/outlettargets/setdistributortargets";
    private static final String outlettargets_set_distributor_targets_invalid = "/outlettargets/setdistributortargetsInvalid";
    private static final String outlettargets_set_target = "/outlettargets/settarget";
    private static final String outlettargets_set_target_invalid = "/outlettargets/settargetInvalid";
    
    // Web API - Subbrands Management
    private static final String subbrands = "/subbrands";
    private static final String subbrands_invalid = "/subbrands/invalid";
    private static final String subbrands_add = "/subbrands/add";
    private static final String subbrands_add_invalid = "/subbrands/add/invalid";
    private static final String subbrands_index = "/subbrands/index";
    private static final String subbrands_add_Valid = "/subbrands/add";
    private static final String subbrands_add_MissingFields = "/subbrands/add";
    private static final String subbrands_add_InvalidData = "/subbrands/add";
    private static final String subbrands_add_SQLInjection = "/subbrands/add";
    private static final String subbrands_add_XSS = "/subbrands/add";
    private static final String subbrands_add_MaxLength = "/subbrands/add";
    
    // Web API - Orders Management
    private static final String orders_newindex = "/orders/newindex";
    private static final String orders_newindex_invalid = "/orders/newindex/invalid";
    
    // Web API - Activities Management
    private static final String activities_getPictures = "/activities/getPictures";
    private static final String activities_getPictures_invalid = "/activities/getPicturesinvalid";
    private static final String activities_getWarehouseforZone = "/activities/getWarehouseforZone";
    private static final String activities_getWarehouseforZone_invalid = "/activities/getWarehouseforZone/invalid";
    private static final String activities_getactivities = "/activities/getactivities/{activityId}";
    private static final String activities_getactivities_invalid = "/activities/getactivitiesinvalid";
    private static final String activities_getfollowupactivities = "/activities/getfollowupactivities";
    private static final String activities_getfollowupactivities_invalid = "/activities/getfollowupactivities/invalid";
    private static final String activities_getnextunauditedactivity = "/activities/getnextunauditedactivity";
    private static final String activities_getnextunauditedactivity_invalid = "/activities/getnextunauditedactivity/invalid";
    private static final String activities_getselectedactivityform = "/activities/getselectedactivityform";
    private static final String activities_getselectedactivityform_invalid = "/activities/getselectedactivityform/invalid";
    
    // Web API - Approval Sequences Management
    private static final String approvalsequences_getuserids = "approvalsequences/getUserIds";
    private static final String approvalsequences_getuserids_invalid = "approvalsequences/getUserIdsInvalid";
    private static final String approvalsequences_getrules = "approvalsequences/getRules";
    private static final String approvalsequences_getrules_invalid = "approvalsequences/getRulesInvalid";
    private static final String approvalsequences_getapprovalsequenceonuserentity = "approvalsequences/getApprovalSequenceOnUserEntity";
    private static final String approvalsequences_getapprovalsequenceonuserentity_invalid = "approvalsequences/getApprovalSequenceOnUserEntityInvalid";
    private static final String approvalsequences_getallmodules = "approvalsequences/getAllModules";
    private static final String approvalsequences_getallmodules_invalid = "approvalsequences/getAllModulesInvalid";
    private static final String schemes_getapprovalsequence = "schemes/getApprovalSequence";
    private static final String schemes_getapprovalsequence_invalid = "schemes/getApprovalSequenceInvalid";
    private static final String schemes_applyqpsscheme = "schemes/applyqpsscheme";
    private static final String schemes_applyqpsscheme_invalid = "schemes/applyqpsschemeInvalid";
    private static final String schemes_assignnewscheme = "schemes/assignnewscheme";
    private static final String schemes_assignnewscheme_invalid = "schemes/assignnewschemeInvalid";
    private static final String schemeoptouts_index = "schemeoptouts/index";
    private static final String schemeoptouts_index_invalid = "schemeoptouts/indexInvalid";

    // Web API - Subcategories Management
    private static final String subcategories_index = "/subcategories/index";
    private static final String subcategories_index_invalid = "/subcategories/invalid";

    // Web API - Shelfs Management
    private static final String shelfs_index = "/shelfs/index";
    private static final String shelfs_index_invalid = "/shelfs/invalid";
    private static final String shelfs_get_shelfdata = "/shelfs/getShelfdata";
    private static final String shelfs_get_shelfdata_invalid = "/shelfs/invalid";
    private static final String shelfs_mappedsku = "/shelfs/mappedsku";
    private static final String shelfs_mappedsku_invalid = "/shelfs/invalid";
    
    // Web API - Dashboard Management
    private static final String companies_dashboard = "/companies/dashboard";
    
    // Web API - Companies Management
    private static final String company_timestamp = "/companies/getTimeStamp";
    private static final String company_timestamp_invalid = "/companies/getTimeStampinvalid";

    // Web API - Variants Management
    private static final String variants = "/variants";
    private static final String variants_invalid = "/variants/invalid";
    private static final String variants_index = "/variants/index";
    private static final String variants_index_invalid = "/variants/index/invalid";
    private static final String variants_api = "/variants/getVariantsApi";
    private static final String variants_api_invalid = "/variants/invalid";

    // Web API - Sizes Management
    private static final String sizes = "/sizes";
    private static final String sizes_invalid = "/sizes/invalid";
    private static final String sizes_get = "/sizes/get";
    private static final String sizes_get_invalid = "/sizes/invalid";
    private static final String sizes_index = "/sizes/index";
    private static final String sizes_index_invalid = "/sizes/invalid";

    // Web API - Workflow Reasons Management
    private static final String workflow_reasons = "/workflowreasons/getworkflowreasons";
    private static final String workflow_reasons_invalid = "/workflowreasons/invalid";

    // Web API - Reasons Management
    private static final String reasons_get_reason_list = "/reasons/getreasonlist";
    private static final String reasons_get_reason_list_invalid = "/reasons/invalid";
    private static final String reasons_get_reasons = "/reasons/getreasons";
    private static final String reasons_get_reasons_invalid = "/reasons/invalid";
    private static final String notvisitedreasons_getreasons = "/notvisitedreasons/getreasons";
    private static final String notvisitedreasons_getreasons_invalid = "/notvisitedreasons/getreasonsInvalid";
    private static final String reasons_get_tag_by_reason_id = "/reasons/getTagByReasonId/{reasonId}";
    private static final String reasons_get_tag_by_reason_id_invalid = "/reasons/getTagByReasonId/invalid";
    private static final String reasons_get_reason_type_data = "/reasons/getreasontypedata/{reasonType}";
    private static final String reasons_get_reason_type_data_invalid = "/reasons/getreasontypedata/invalid";
    private static final String reasons_active_or_deactive_reason = "/reasons/active_or_deactive_reason/{reasonId}";
    private static final String reasons_active_or_deactive_reason_invalid = "/reasons/invalid";

    // Web API - Warehouse Types Management
    private static final String warehouse_types = "/warehousetypes/getbusinesstypes";
    private static final String warehouse_types_invalid = "/warehousetypes/invalid";
    private static final String warehouse_type_single = "/warehousetypes/getWarehouseType";
    private static final String warehouse_type_single_invalid = "/warehousetypes/invalid";

    // Web API - Warehouse SK Units Management
    private static final String warehouse_skunit_list = "/warehouseskunits/getWarehouseSkunitList/{warehouseId}";
    private static final String warehouse_skunit_list_invalid = "/warehouseskunits/invalid";
    private static final String warehouse_skunits_for_warehouse = "/warehouseskunits/getSkunitsForWarehouse/{warehouseId}";
    private static final String warehouse_skunits_for_warehouse_invalid = "/warehouseskunits/invalid";
    private static final String warehouse_skunits_assign_skunit_to_warehouse = "/warehouseskunits/assignskunittowarehouse";
    private static final String warehouse_skunits_assign_skunit_to_warehouse_invalid = "/warehouseskunits/assignskunittowarehouse/invalid";
    private static final String warehouse_skunits_save = "/warehouseskunits/save";
    private static final String warehouse_skunits_save_invalid = "/warehouseskunits/save/invalid";
    private static final String warehouse_edit_bill_sequence_no = "/warehouses/editbillsequenceno/{warehouseId}";
    private static final String warehouse_edit_bill_sequence_no_invalid = "/warehouses/editbillsequenceno/invalid";
    private static final String warehouse_edit_bill_sequence_no_no_params = "/warehouses/editbillsequenceno";

    // Web API - Warehouse Categories Management
    private static final String warehouse_categories = "/warehousecategories/getWarehouseCategories";
    private static final String warehouse_categories_invalid = "/warehousecategories/invalid";

    // Web API - Warehouse Assets Management
    private static final String warehouse_assets_index = "/warehouseassets/index";
    private static final String warehouse_assets_index_invalid = "/warehouseassets/invalid";
    private static final String warehouse_assets_get = "/warehouseassets/getwarehouseassets";
    private static final String warehouse_assets_get_invalid = "/warehouseassets/invalid";

    // Web API - Visiting Types Management
    private static final String visiting_types_index = "/visitingtypes/index";
    private static final String visiting_types_index_invalid = "/visitingtypes/invalid";

    // Web API - Villages Management
    private static final String villages_index = "/villages/getVillagesApi";
    private static final String villages_index_invalid = "/villages/invalid";

    // Web API - Stages Management
    private static final String stages_index_new_v2_api = "/stages/indexNewV2Api";
    private static final String stages_index_new_v2_api_invalid = "/stages/invalid";
    private static final String stages_index_api = "/stages/indexApi";
    private static final String stages_index_api_invalid = "/stages/invalid";
    private static final String stages_get_stages_v2 = "/stages/getstagesv2";
    private static final String stages_get_stages_v2_invalid = "/stages/invalid";
    private static final String stages_get_stages = "/stages/getstages";
    private static final String stages_get_stages_invalid = "/stages/invalid";
    private static final String stages_get_stage_mappings_by_id = "/stages/getstagemappingsbyid";
    private static final String stages_get_stage_mappings_by_id_invalid = "/stages/invalid";
    private static final String POST_stages_add = "/stages/add";
    private static final String stages_add_invalid = "/stages/addInvalid";

    // Web API - SKU Visibilities Management
    private static final String skuvisibilities_get_visibility_details = "/skuvisibilities/getVisibilityDetails";
    private static final String skuvisibilities_get_visibility_details_invalid = "/skuvisibilities/invalid";
    private static final String skuvisibilities_get_sku_visible_skus_list_retailer = "/skuvisibilities/getSkuVisibleskusListRetailer";
    private static final String skuvisibilities_get_sku_visible_skus_list_retailer_invalid = "/skuvisibilities/invalid";
    private static final String skuvisibilities_get_sku_level_data = "/skuvisibilities/getSkuLevelData";
    private static final String skuvisibilities_get_sku_level_data_invalid = "/skuvisibilities/invalid";
    private static final String skuvisibilities_get_sku_visible_skus_list = "/skuvisibilities/getSkuVisibleskusList";
    private static final String skuvisibilities_get_sku_visible_skus_list_invalid = "/skuvisibilities/getSkuVisibleskusListInvalid";

    // Web API - SKU Units Groupings Management
    private static final String skunitsgroupings_index = "/skunitsgroupings/index";
    private static final String skunitsgroupings_index_invalid = "/skunitsgroupings/invalid";
    private static final String skunitsgroupings_get_skunits_groups = "/skunitsgroupings/getSkunitsgroups";
    private static final String skunitsgroupings_get_skunits_groups_invalid = "/skunitsgroupings/invalid";

    // Web API - Group SKU Unit Types Management
    private static final String groupskunittypes_indexapi = "groupskunittypes/indexApi";
    private static final String groupskunittypes_indexapi_invalid = "groupskunittypes/indexApiInvalid";

    // Web API - Group SKU Units Management
    private static final String groupskunits_indexapi = "groupskunits/indexApi";
    private static final String groupskunits_indexapi_invalid = "groupskunits/indexApiInvalid";

    // Web API - Vehicles Management
    private static final String vehicle_capacity = "/vehicles/getvehiclecapacity/{vehicleId}";
    private static final String vehicle_capacity_invalid = "/vehicles/invalid";
    private static final String vehicles = "/vehicles/getVehicles";
    private static final String vehicles_invalid = "/vehicles/invalid";
    private static final String mapped_vehicles = "/vehicles/getMappedVehicles";
    private static final String mapped_vehicles_invalid = "/vehicles/invalid";
    private static final String warehouse_vehicles = "/vehicles/getWarehouseVehicles";
    private static final String warehouse_vehicles_invalid = "/vehicles/invalid";

    // Web API - Activity Form Report Management
    private static final String activity_form_report = "/activityformdatas/activityformdatareport";
    private static final String activity_form_report_invalid = "/activityformdatas/invalid";

    // Web API - Form Definitions Management
    private static final String formdefinitions_get = "formdefinitions/get";
    private static final String formdefinitions_get_invalid = "formdefinitions/getInvalid";
    private static final String formdefinitions_getformfields = "formdefinitions/getFormFields/{formname}";
    private static final String formdefinitions_getformfields_invalid = "formdefinitions/getFormFields/invalid";
    private static final String formdefinitions_index = "formdefinitions/index";
    private static final String formdefinitions_index_invalid = "formdefinitions/indexInvalid";

    // Web API - Activity Types Management
    private static final String getactivitytype = "/activitytypes/getactivitytype";
    private static final String getactivitytype_invalid = "/activitytypes/invalid";

    // Web API - Leave Configurations Management
    private static final String leaveconfigurations_index = "/leaveconfigurations/index";
    private static final String leaveconfigurations_index_invalid = "/leaveconfigurations/indexInvalid";
    private static final String leaveconfigurations_getConfigurationDetails = "/leaveconfigurations/getConfigurationDetails/{id}";
    private static final String leaveconfigurations_getConfigurationDetails_invalid = "/leaveconfigurations/getConfigurationDetailsInvalid/{id}";

    // Web API - App Tab Sequences Management
    private static final String addV2 = "/apptabsequences/addV2";
    private static final String addV2_invalid = "/apptabsequences/invalid";
    private static final String apptabsequences_index = "/apptabsequences/index";
    private static final String apptabsequences_index_invalid = "/apptabsequences/invalid";
    private static final String updateWorkflowAndApptab = "/apptabsequences/updateWorkflowAndApptab";
    private static final String updateWorkflowAndApptab_invalid = "/apptabsequences/invalid";
    private static final String apptabsequences_getapptabandworkflowdata = "/apptabsequences/getApptabAndWorkflowData/{entityType}/{id}";
    private static final String apptabsequences_getapptabandworkflowdata_invalid = "/apptabsequences/getApptabAndWorkflowDataInvalid/{entityType}/{id}";

    // Web API - Area Categories Management
    private static final String areacategories_index = "/areacategories/index";
    private static final String areacategories_index_invalid = "/areacategories/invalid";
    private static final String areacategories_add = "/areacategories/addAreaCategory";
    private static final String areacategories_add_invalid = "/areacategories/addAreaCategoryInvalid";
    private static final String areacategories_change_status = "/areacategories/changeAreaStatus/{id}";
    private static final String areacategories_change_status_invalid = "/areacategories/changeAreaStatusInvalid/{id}";
    private static final String areacategories_edit = "/areacategories/editAreaCategory/{id}";
    private static final String areacategories_edit_invalid = "/areacategories/editAreaCategoryInvalid/{id}";
    private static final String areacategories_delete = "/areacategories/deleteAreaCategory/{id}";
    private static final String areacategories_delete_invalid = "/areacategories/deleteAreaCategoryInvalid/{id}";

  // Web API - Beat Details Management
  private static final String beatdetails_approvebeatchanges = "/beatdetails/approveBeatChanges";
  private static final String beatdetails_approvebeatchanges_invalid = "/beatdetails/invalid";
  private static final String beatdetails_beatadditioncheckforoutlets = "/beatdetails/beatAdditionCheckForOutlets";
  private static final String beatdetails_beatadditioncheckforoutlets_invalid = "/beatdetails/invalid";
  private static final String beatdetails_getoutletsforbeatwitharea = "/beatdetails/getOutletsforbeatwitharea/{areaId}";
  private static final String beatdetails_getoutletsforbeatwitharea_invalid = "/beatdetails/invalid";

    // Web API - Background Processes Management
    private static final String backgroundprocesses_processlist = "/backgroundprocesses/processList";
    private static final String backgroundprocesses_processlist_invalid = "/backgroundprocesses/invalid";

    // Web API - Bank Receipts Management
    private static final String bankreceipts_removedetail = "/bankreceipts/removedetail";
    private static final String bankreceipts_removedetail_invalid = "/bankreceipts/invalid";

    // Activity Form Datas API
    private static final String getactivitiesapi = "/activityformdatas/getActivitiesApi";
    private static final String getactivitiesapi_invalid = "/activityformdatas/invalid";
    private static final String getactivityformdatasbytype = "/activityformdatas/getActivityFormDatasByType";
    private static final String getactivityformdatasbytype_invalid = "/activityformdatas/invalid";
    private static final String getactivityformfields = "/activityformdatas/getActivityFormFields/{fieldId}";
    private static final String getactivityformfields_invalid = "/activityformdatas/getActivityFormFieldsInvalid/{fieldId}";
    private static final String getfieldsbyformname = "/activityformdatas/getFieldsByFormName";
    private static final String getfieldsbyformname_invalid = "/activityformdatas/invalid";
    private static final String getformfeildsbytype = "/activityformdatas/getFormFeildsByType";
    private static final String getformfeildsbytype_invalid = "/activityformdatas/invalid";

    // Outlets - Outlet Flows API
    private static final String outlets_get_outlet_flows_api = "/outlets/getOutletFlowsApi";
    private static final String outlets_get_outlet_flows_api_invalid = "/outlets/getOutletFlowsApiInvalid";

    // Outlets - Outlet Holder Details
    private static final String outlets_get_outlet_holder_details = "/outlets/getOutletHolderDetails/{outletId}";
    private static final String outlets_get_outlet_holder_details_invalid = "/outlets/getOutletHolderDetailsInvalid/{outletId}";

    // Outlets - Outlet KYC Form
    private static final String outlets_get_outlet_kyc_form = "/outlets/getOutletKycForm/{outletId}";
    private static final String outlets_get_outlet_kyc_form_invalid = "/outlets/getOutletKycFormInvalid/{outletId}";

    // Outlets - Outlet Outstanding Data
    private static final String outlets_get_outlet_outstanding_data = "/outlets/getOutletOutstandingData";
    private static final String outlets_get_outlet_outstanding_data_invalid = "/outlets/getOutletOutstandingDataInvalid";

    // Outlets - Get Outlets For Approval
    private static final String outlets_get_outlets_for_approval = "/outlets/getOutletsForApproval";
    private static final String outlets_get_outlets_for_approval_invalid = "/outlets/getOutletsForApprovalInvalid";

    // Outlets - Salesman Beat Summary
    private static final String outlets_get_saleman_beat_summary = "/outlets/getSalemanBeatSummary";
    private static final String outlets_get_saleman_beat_summary_invalid = "/outlets/getSalemanBeatSummaryInvalid";

    // Outlets - Outlet Summary Info
    private static final String outlets_get_outlet_summary_info = "/outlets/getOutletSummaryInfo/{outletId}";
    private static final String outlets_get_outlet_summary_info_invalid = "/outlets/getOutletSummaryInfoInvalid/{outletId}";

    // Outlets - Get All Outlets For Users
    private static final String outlets_get_all_outlets_for_user = "/outlets/getalloutletsforuser";
    private static final String outlets_get_all_outlets_for_user_invalid = "/outlets/getalloutletsforuserInvalid";
    private static final String getoutletwiseremainingfrequencyforactivities = "/activityformdatas/getOutletWiseRemainingFrequencyForActivities";
    private static final String getoutletwiseremainingfrequencyforactivities_invalid = "/activityformdatas/invalid";

    // Users API - Missing endpoints
    private static final String getusersforarea = "/users/getusersforarea";
    private static final String getusersforarea_invalid = "/users/invalidusersforarea";
    private static final String getusersforareadatewise = "/users/getusersforareadatewise";
    private static final String getusersforareadatewise_invalid = "/users/invalidusersforareadatewise";
    private static final String getusersforrole = "/users/getusersforrole";
    private static final String getusersforrole_invalid = "/users/invalidusersforrole";
    private static final String getusersforsubzones = "/users/getusersforsubzones";
    private static final String getusersforsubzones_invalid = "/users/invalidusersforsubzones";
    private static final String getusersforzones = "/users/getusersforzones";
    private static final String getusersforzones_invalid = "/users/invalidusersforzones";
    private static final String getuserinfo = "/users/getuserinfo";
    private static final String getuserinfo_invalid = "/users/invalid";
    private static final String getuserlogindetails = "/users/getuserlogindetails";
    private static final String getuserlogindetails_invalid = "/users/invalidlogindetails";
    private static final String users_apigetusersforthuser = "users/apiGetUsersForThisUser";
    private static final String users_apigetusersforthuser_invalid = "users/apiGetUsersForThisUserInvalid";
    private static final String users_attendancelog = "users/attendancelog/{userId}";
    private static final String users_attendancelog_invalid = "users/attendancelogInvalid/{userId}";
    private static final String users_autorotatepjpconsole = "users/autoRotatePjpConsole";
    private static final String users_autorotatepjpconsole_invalid = "users/autoRotatePjpConsoleInvalid";
    private static final String users_beatwisedashboarddata = "users/beatWiseDashboardData";
    private static final String users_beatwisedashboarddata_invalid = "users/beatWiseDashboardDataInvalid";
    private static final String users_checkcirculardependancy = "users/checkCircularDependancy";
    private static final String users_checkcirculardependancy_invalid = "users/checkCircularDependancyInvalid";
    private static final String users_checkemployeeid = "users/checkemployeeId";
    private static final String users_checkemployeeid_invalid = "users/checkemployeeIdInvalid";
    private static final String users_validatetokenandgeneratecookie = "users/validateTokenAndGenerateCookie";
    private static final String users_validatetokenandgeneratecookie_invalid = "users/validateTokenAndGenerateCookieInvalid";
    private static final String users_isloggedin = "users/isloggedin";
    private static final String users_isloggedin_invalid = "users/isloggedinInvalid";
    private static final String users_logintoken = "users/logintoken";
    private static final String users_logintoken_invalid = "users/logintokenInvalid";
    private static final String users_mixpanel = "users/mixPanel";
    private static final String users_mixpanel_invalid = "users/mixPanelInvalid";
    private static final String users_upload_pjps = "users/upload_pjps";
    private static final String users_upload_pjps_invalid = "users/upload_pjpsInvalid";
    private static final String users_deletesingleimagefroms3 = "users/deletesingleimagefroms3";
    private static final String users_deletesingleimagefroms3_invalid = "users/deletesingleimagefroms3Invalid";
    private static final String users_hierarchyview = "users/hierarchyview";
    private static final String users_hierarchyview_invalid = "users/hierarchyviewInvalid";
    private static final String users_search_users_under_user = "users/searchUsersUnderUser";
    private static final String users_search_users_under_user_invalid = "users/searchUsersUnderUserInvalid";

    // Web API - UI Aliases Management
    private static final String uialiases_get_company_ui_aliases = "uialiases/getCompanyUiAliases";
    private static final String uialiases_get_company_ui_aliases_invalid = "uialiases/getCompanyUiAliasesInvalid";

    // Web API - Activities Management
    private static final String activities_index = "/activities/index";
    private static final String activities_index_invalid = "/activities/invalid";

    // Web API - Brands Management
    private static final String brands_index = "/brands/index";
    private static final String brands_index_invalid = "/brands/invalid";
    private static final String brands_edit = "/brands/edit/4";
    private static final String brands_edit_invalid = "/brands/edit/invalid";

    // Web API - Categories Management
    private static final String categories_index = "/categories/index";
    private static final String categories_index_invalid = "/categories/invalid";
    private static final String categories_edit = "/categories/edit/1";
    private static final String categories_edit_invalid = "/categories/edit/invalid";

    // Web API - Checks Management
    private static final String checks_index = "/checks/index";
    private static final String checks_index_invalid = "/checks/invalid";

    // Web API - Discounts Management
    private static final String discounts_index = "/discounts/index";
    private static final String discounts_index_invalid = "/discounts/invalid";
    private static final String discounts_getentity = "/discounts/getEntity";
    private static final String discounts_getentity_invalid = "/discounts/getEntityInvalid";
    private static final String discounts_getskunits = "/discounts/getSKunits";
    private static final String discounts_getskunits_invalid = "/discounts/getSKunitsInvalid";
    private static final String discounts_getskusforwardiscounts = "/discounts/getSkusforWardiscounts/{discountId}";
    private static final String discounts_getskusforwardiscounts_invalid = "/discounts/getSkusforWardiscountsInvalid/{discountId}";
    private static final String discounts_getdiscountforout = "/discounts/getdiscountforout/{discountId}";
    private static final String discounts_getdiscountforout_invalid = "/discounts/getdiscountforoutInvalid/{discountId}";
    private static final String discounts_getdiscountsforoutlet = "/discounts/getdiscountsforoutlet/{discountId}";
    private static final String discounts_getdiscountsforoutlet_invalid = "/discounts/getdiscountsforoutletInvalid/{discountId}";
    private static final String discounts_updatediscountbyid = "/discounts/updateDiscountById/{discountId}";
    private static final String discounts_updatediscountbyid_invalid = "/discounts/updateDiscountByIdInvalid/{discountId}";
    private static final String discounts_getdiscounts = "/discounts/getDiscounts";
    private static final String discounts_getdiscounts_invalid = "/discounts/getDiscountsInvalid";
    private static final String discounts_get_primary = "/discounts/getPrimaryDiscount";
    private static final String discounts_get_primary_invalid = "/discounts/getPrimaryDiscountInvalid";
    private static final String discounts_getdiscountforoutletsnew = "/discounts/getDiscountForOutletsNew";
    private static final String discounts_getdiscountforoutletsnew_invalid = "/discounts/getDiscountForOutletsNewInvalid";
    private static final String discounts_add = "discounts/add";
    private static final String discounts_add_invalid = "discounts/addInvalid";
    private static final String discounts_addforoutlet = "discounts/addforoutlet/{outletId}";
    private static final String discounts_addforoutlet_invalid = "discounts/addforoutletInvalid/{outletId}";

    // Web API - Discount Categories Management
    private static final String discount_categories_getdiscountcategoriesapi = "/discount_categories/getDiscountCategoriesApi";
    private static final String discount_categories_getdiscountcategoriesapi_invalid = "/discount_categories/getDiscountCategoriesApiInvalid";
    private static final String discount_categories_getpaginateddiscountcategories = "/discount_categories/getPaginatedDiscountCategories/{id}";
    private static final String discount_categories_edit = "/discount_categories/edit/{discountCategoryId}/{parentCategoryId}/{channelId}";
    private static final String discount_categories_getskusforwardiscountcat = "/discount_categories/getSkusforWardiscountcat/{discountCategoryId}";
    private static final String discount_categories_getskusforwardiscountcat_invalid = "/discount_categories/getSkusforWardiscountcatInvalid/{discountCategoryId}";

    // Web API - Units Management
    private static final String units_index = "/units/index";
    private static final String units_index_invalid = "/units/invalid";

    // Web API - Warehouses Management
    private static final String warehouses_index = "/warehouses/index";
    private static final String warehouses_index_invalid = "/warehouses/invalid";

    // Web API - Banks Management
    private static final String banks_getbanksforwarehouses = "/banks/getbanksforwarehouses/{warehouseId}";
    private static final String banks_getbanksforwarehouses_invalid = "/banks/invalid";

    // GET CALLS PROCESS ROC DATA API
    private static final String calls_processrocdata = "calls/processROCData";
    private static final String calls_processrocdata_invalid = "calls/invalid";

    // GET CALLS DAILY SALES REPORT DATA API
    private static final String calls_dailysalesreportdata = "/calls/dailysalesreportdata";
    private static final String calls_dailysalesreportdata_invalid = "/calls/dailysalesreportdataInvalid";

    // GET CATEGORIES DATA BUSINESS UNIT API
    private static final String categories_getcategoriesdatabusinessunit = "categories/getCategoriesDataBusinessUnit";
    private static final String categories_getcategoriesdatabusinessunit_invalid = "categories/invalid";

    // GET CATEGORIES OF BUSINESS UNIT API
    private static final String categories_getcategoriesofbusinessunit = "categories/getCategoriesOfBusinessUnit";
    private static final String categories_getcategoriesofbusinessunit_invalid = "categories/invalid";

    // GET SPECIAL CATEGORIES API
    private static final String categories_getspecialcategories = "categories/getSpecialCategories";
    private static final String categories_getspecialcategories_invalid = "categories/invalid";

    // GET CATEGORIES FOR REPORT API
    private static final String categories_getcategoriesforreport = "categories/getcategoriesforreport";
    private static final String categories_getcategoriesforreport_invalid = "categories/invalid";

    // GET CATEGORY AND BRANDS DETAIL API
    private static final String categories_getcategoryandbrandsdetail = "categories/getcategoryandbrandsdetail";
    private static final String categories_getcategoryandbrandsdetail_invalid = "categories/invalid";

    // GET CLAIM DETAILS INDEX API
    private static final String claimdetails_index = "claimdetails/index";
    private static final String claimdetails_index_invalid = "claimdetails/invalid";
    private static final String claimdetails_getclaimdetails = "claimdetails/getClaimDetails";
    private static final String claimdetails_getclaimdetails_invalid = "claimdetails/getClaimDetailsInvalid";

    // POST CLAIM DETAILS APPROVE CLAIM API
    private static final String claimdetails_approveclaim = "claimdetails/approveclaim";
    private static final String claimdetails_approveclaim_invalid = "claimdetails/approveclaimInvalid";

    // GET CLAIMS KPI API
    private static final String claims_claimkpi = "claims/claimkpi";
    private static final String claims_claimkpi_invalid = "claims/invalid";

    // GET CLAIMS GET CLAIMS API
    private static final String claims_getclaims = "claims/getclaims";
    private static final String claims_getclaims_invalid = "claims/invalid";

    // GET CLAIMS INDEX API
    private static final String claims_index = "claims/index";
    private static final String claims_index_invalid = "claims/invalid";

    // GET CLAIMS GET CLAIM GRAPH VIEW DATA API
    private static final String claims_getclaimgraphviewdata = "claims/getclaimGraphViewData";
    private static final String claims_getclaimgraphviewdata_invalid = "claims/getclaimGraphViewDataInvalid";

    // GET CLAIMS GET NEW CLAIM DETAILS API
    private static final String claims_getnewclaimdetails = "claims/getNewClaimDetails/{fromdate}/{todate}/{userId}";
    private static final String claims_getnewclaimdetails_invalid = "claims/getNewClaimDetailsInvalid/{fromdate}/{todate}/{userId}";
    // GET CLAIMS SEND CLAIM ACTIVITY NOTIFICATION API
    private static final String claims_sendclaimactivitynotification = "claims/sendClaimActivityNotification";
    private static final String claims_sendclaimactivitynotification_invalid = "claims/sendClaimActivityNotificationInvalid";
    // GET CLAIMS API GET CLAIMS USER WISE API
    private static final String claims_apigetclaimsuserwise = "claims/apiGetClaimsUserWise";
    private static final String claims_apigetclaimsuserwise_invalid = "claims/apiGetClaimsUserWiseInvalid";
    // GET CLAIMS API GET ALL CLAIMS API
    private static final String claims_apigetallclaims = "claims/apiGetAllClaims";
    private static final String claims_apigetallclaims_invalid = "claims/apiGetAllClaimsInvalid";
    // GET DAMAGE CLAIMS UPDATE EWAY BILL PROGRESS STATUS FOR DAMAGE CLAIM API
    private static final String damageclaims_updateewaybillprogressstatusfordamageclaim = "damageclaims/updateEwayBillprogressStatusfordamageclaim";
    private static final String damageclaims_updateewaybillprogressstatusfordamageclaim_invalid = "damageclaims/updateEwayBillprogressStatusfordamageclaimInvalid";

    // GET CLAIM TYPES GET ALL CALCULATION TEMPLATES API
    private static final String claimtypes_getallcalculationtemplates = "claimtypes/getAllCalculationTemplates";
    private static final String claimtypes_getallcalculationtemplates_invalid = "claimtypes/invalid";

    // GET CLAIM TYPES GET CLAIM TYPES FOR BLOCKING API
    private static final String claimtypes_getclaimtypesforblocking = "claimtypes/getClaimTypesForBlocking";
    private static final String claimtypes_getclaimtypesforblocking_invalid = "claimtypes/invalid";

    // GET CLAIM TYPES GET ALL COMBINATIONS API
    private static final String claimtypes_getallcombinations = "claimtypes/getAllCombinations/{claimTypeId}";
    private static final String claimtypes_getallcombinations_invalid = "claimtypes/getAllCombinationsInvalid/{claimTypeId}";

    // GET CLAIM TYPES VALIDATE BLOCK CLAIM TYPES API
    private static final String claimtypes_validateblockclaimtypes = "claimtypes/validateBlockClaimTypes/{claimTypeId}/{date}/{outletId}";
    private static final String claimtypes_validateblockclaimtypes_invalid = "claimtypes/validateBlockClaimTypesInvalid/{claimTypeId}/{date}/{outletId}";
    private static final String claimtypes_get_aggregate_and_kpi_default_values = "claimtypes/getAggregateAndKPiDefaultValues/{claimTypeId}/{date}";
    private static final String claimtypes_get_aggregate_and_kpi_default_values_invalid = "claimtypes/getAggregateAndKPiDefaultValuesInvalid/{claimTypeId}/{date}";

    // GET COLLATERALS INDEX API
    private static final String collaterals_index = "collaterals/index";
    private static final String collaterals_index_invalid = "collaterals/invalid";
    private static final String collaterals_active_inactive = "collaterals/activeInactiveCollaterals";
    private static final String collaterals_active_inactive_invalid = "collaterals/activeInactiveCollateralsInvalid";

    // GET COMPANIES API GET ORGANIZATION API
    private static final String companies_apigetorganization = "companies/apiGetOrganization";
    private static final String companies_apigetorganization_invalid = "companies/invalid";

    // GET COMPANIES GET COMPANY ROLES API
    private static final String companies_getcompanyroles = "companies/getCompanyRoles";
    private static final String companies_getcompanyroles_invalid = "companies/invalid";

    // GET COMPANIES GET CUSTOM OUTLET FIELDS API
    private static final String companies_getcustomoutletfields = "companies/getCustomOutletFields";
    private static final String companies_getcustomoutletfields_invalid = "companies/invalid";

    // GET COMPANIES GET FIND MY NEAREST OUTLET LOGO URL FOR COMPANY API
    private static final String companies_getfindmynearestoutletlogourlforcompany = "companies/getFindMyNearestOutletLogoUrlForCompany";
    private static final String companies_getfindmynearestoutletlogourlforcompany_invalid = "companies/invalid";

    // GET COMPANIES GET COMPANY KYC FORM API
    private static final String companies_getcompanykycform = "companies/getCompanyKycForm";
    private static final String companies_getcompanykycform_invalid = "companies/getCompanyKycFormInvalid";

    // GET COMPANIES GET SELECTOR FOR OUTLET DENSITY API
    private static final String companies_getselectorforoutletdensity = "companies/getSelectorforoutletDensity";
    private static final String companies_getselectorforoutletdensity_invalid = "companies/getSelectorforoutletDensityInvalid";
    private static final String companies_getactivityformfields = "companies/getActivityFormFields";
    private static final String companies_getactivityformfields_invalid = "companies/getActivityFormFieldsInvalid";
    private static final String companies_getoutletsdatacount = "companies/getoutletsdatacount";
    private static final String companies_getoutletsdatacount_invalid = "companies/getoutletsdatacountInvalid";
    private static final String companies_getoutletsdata = "companies/getoutletsdata";
    private static final String companies_getoutletsdata_invalid = "companies/getoutletsdataInvalid";
    private static final String companies_getcompanyinfo = "companies/getCompanyinfo";
    private static final String companies_getcompanyinfo_invalid = "companies/getCompanyinfoInvalid";

    // GET COMPANIES CREATE OUTLET DENSITY KML API
    private static final String companies_createoutletdensitykml = "companies/createoutletdensitykml/{param1}/{param2}/{param3}";
    private static final String companies_createoutletdensitykml_invalid = "companies/createoutletdensitykmlInvalid/{param1}/{param2}/{param3}";

    // GET COMPANIES CHECK DISTIMAN DELIVERY API
    private static final String companies_checkdistimandelivery = "companies/checkDistimanDelivery/{companyId}";
    private static final String companies_checkdistimandelivery_invalid = "companies/checkDistimanDeliveryInvalid/{companyId}";

    // GET COMPANIES FEEDBACK API
    private static final String companies_feedback = "companies/feedback/{userId}";
    private static final String companies_feedback_invalid = "companies/feedbackInvalid/{userId}";

    // GET COMPANIES AJAX OUTLET LIST VIEW API
    private static final String companies_ajaxoutletlistview = "companies/ajaxoutletlistview";
    private static final String companies_ajaxoutletlistview_invalid = "companies/ajaxoutletlistviewInvalid";

    // GET COMPANIES GET COMPANY DUE MESSAGE API
    private static final String companies_getcompanyduemessage = "companies/getCompanyDueMessage";
    private static final String companies_getcompanyduemessage_invalid = "companies/getCompanyDueMessageInvalid";

    // GET COMPANIES GET USERS API
    private static final String companies_getusers = "companies/getusers";
    private static final String companies_getusers_invalid = "companies/invalid";

    // GET COMPANIES GET SEARCH RESULT API
    private static final String companies_getsearchresult = "companies/getsearchresult";
    private static final String companies_getsearchresult_invalid = "companies/invalid";

    // Countries
    private static final String getCountries = "/countries/getcountriesinfo";
    private static final String getCountries_invalid = "/countries/getcountries";

    // Currency List
    private static final String getCurrencyList = "/currencies/getcurrencylist";
    private static final String getCurrencyList_invalid = "/currencies/getcurrency";

    // Complaint Statuses
    private static final String getComplaintStatuses = "/complaintconfigurations/getComplaintStatuses";
    private static final String getComplaintStatuses_invalid = "/complaintconfigurations/getStatuses";

    // Complaint Types
    private static final String getComplaintTypes = "/complaintconfigurations/getComplaintTypes";
    private static final String getComplaintTypes_invalid = "/complaintconfigurations/getTypes";

    // Complaint Configurations
    private static final String getComplaintConfigurations = "/complaintconfigurations/getConfigurations";
    private static final String getComplaintConfigurations_invalid = "/complaintconfigurations/getConfig";

    // Competitor SKU Units
    private static final String getCompetitorSkunits = "/competitorskunits/getcompetitorskunits";
    private static final String getCompetitorSkunits_invalid = "/getcompetitorskunits";

    // Disclaimers Management
    private static final String disclaimers_get_disclaimers = "/disclaimers/getDisclaimers";
    private static final String disclaimers_get_disclaimers_invalid = "/disclaimers/getDisclaimersInvalid";
    private static final String disclaimers_index = "/disclaimers/index";
    private static final String disclaimers_index_invalid = "/disclaimers/indexInvalid";
    private static final String disclaimers_approveddisclaimers = "disclaimers/approvedDisclaimers";
    private static final String disclaimers_approveddisclaimers_invalid = "disclaimers/approvedDisclaimersInvalid";
    private static final String disclaimers_add = "disclaimers/add";
    private static final String disclaimers_add_invalid = "disclaimers/addInvalid";

    // ERP Systems Management
    private static final String erpsystems_index = "erpsystems/index";
    private static final String erpsystems_index_invalid = "erpsystems/indexInvalid";

    // GET CLAIM LIMIT GROUPS INDEX API
    private static final String claimlimitgroups_indexapi = "claimlimitgroups/indexApi";
    private static final String claimlimitgroups_indexapi_invalid = "claimlimitgroups/invalid";

    // GET CLAIM FIELD OPTIONS INDEX API
    private static final String claimfieldoptions_index = "claimfieldoptions/index";
    private static final String claimfieldoptions_index_invalid = "claimfieldoptions/invalid";

    // GET CLAIM FIELDS INDEX API
    private static final String claimfields_index = "claimfields/index";
    private static final String claimfields_index_invalid = "claimfields/invalid";

    // GET CREDIT LEVELS INDEX API
    private static final String creditlevels_index = "creditlevels/index";
    private static final String creditlevels_index_invalid = "creditlevels/invalid";

    // GET CREDIT NOTE TYPES INDEX API
    private static final String creditnotetypes_index = "/creditnotetypes/index";
    private static final String creditnotetypes_index_invalid = "/creditnotetypes/indexInvalid";

    // GET COMPLAINT CONFIGURATIONS INDEX API
    private static final String complaintconfigurations_index = "complaintconfigurations/index";
    private static final String complaintconfigurations_index_invalid = "complaintconfigurations/invalid";

    // GET COMPLAINTS INDEX API
    private static final String complaints_index = "complaints/index";
    private static final String complaints_index_invalid = "complaints/invalid";
    // GET COMPLAINTS GET MY COMPLAINTS API
    private static final String complaints_getmycomplaints = "complaints/getMyComplaints";
    private static final String complaints_getmycomplaints_invalid = "complaints/getMyComplaintsInvalid";

    // GET COMPLAINT STATUSES INDEX API
    private static final String complaintstatuses_index = "complaintstatuses/index";
    private static final String complaintstatuses_index_invalid = "complaintstatuses/invalid";

    // GET ASSET DETAILS INDEX API
    private static final String assetdetails_index = "assetdetails/index";
    private static final String assetdetails_index_invalid = "assetdetails/invalid";
    private static final String assetdetails_asset_multilevel_approval_list = "assetdetails/assetMultilevelApprovalList/assetMultiLevelOrderApproval";
    private static final String assetdetails_asset_multilevel_approval_list_invalid = "assetdetails/assetMultilevelApprovalList/assetMultiLevelOrderApprovalInvalid";
    private static final String assetdetails_asset_multilevel_deregister_approval_list = "assetdetails/assetMultilevelDeregisterApprovalList";
    private static final String assetdetails_asset_multilevel_deregister_approval_list_invalid = "assetdetails/assetMultilevelDeregisterApprovalListInvalid";
    private static final String assetdetails_asset_multilevel_order_approval_list = "assetdetails/assetMultilevelOrderApprovalList";
    private static final String assetdetails_asset_multilevel_order_approval_list_invalid = "assetdetails/assetMultilevelOrderApprovalListInvalid";
    private static final String assetdetails_asset_multilevel_register_approval_list = "assetdetails/assetMultilevelRegisterApprovalList";
    private static final String assetdetails_asset_multilevel_register_approval_list_invalid = "assetdetails/assetMultilevelRegisterApprovalListInvalid";
    private static final String assetdetails_deregister_list = "assetdetails/deregisterList";
    private static final String assetdetails_deregister_list_invalid = "assetdetails/deregisterListInvalid";
    private static final String assetdetails_get_requester_data = "assetdetails/getRequesterData";
    private static final String assetdetails_get_requester_data_invalid = "assetdetails/getRequesterDataInvalid";
    private static final String getassetaudits = "assetaudits/getassetaudit";
    private static final String getassetaudits_invalid = "assetaudits/getassetauditInvalid";
    private static final String assetdetails_approvalList = "assetdetails/approvalList";
    private static final String assetdetails_approvalList_invalid = "assetdetails/approvalList/invalid";

    // GET ASSET SERIAL NUMBER TRANSACTIONS API
    private static final String assetserialnumbertransactions_get_total_intransit = "assetserialnumbertransactions/getTotalIntransit";
    private static final String assetserialnumbertransactions_get_total_intransit_invalid = "assetserialnumbertransactions/getTotalIntransitInvalid";
    private static final String assetserialnumbertransactions_get_total_asset_at_warehouse = "assetserialnumbertransactions/getTotalAssetAtWarehouse";
    private static final String assetserialnumbertransactions_get_total_asset_at_warehouse_invalid = "assetserialnumbertransactions/getTotalAssetAtWarehouseInvalid";
    private static final String assetserialnumbertransactions_get_total_asset_at_outlet = "assetserialnumbertransactions/getTotalAssetAtOutlet";
    private static final String assetserialnumbertransactions_get_total_asset_at_outlet_invalid = "assetserialnumbertransactions/getTotalAssetAtOutletInvalid";

    // Web API - Asset Serial Number Mappings Management
    private static final String assetserialnumbermappings_warehousedata = "assetserialnumbermappings/warehouseData";
    private static final String assetserialnumbermappings_warehousedata_invalid = "assetserialnumbermappings/warehouseDataInvalid";
    private static final String assetserialnumbermappings_assettypedata = "assetserialnumbermappings/assetTypeData";
    private static final String assetserialnumbermappings_assettypedata_invalid = "assetserialnumbermappings/assetTypeDataInvalid";
    private static final String assetserialnumbermappings_gettotalqtyassetwise = "assetserialnumbermappings/getTotalQtyAssetwise";
    private static final String assetserialnumbermappings_gettotalqtyassetwise_invalid = "assetserialnumbermappings/getTotalQtyAssetwiseInvalid";

    // GET BID TYPES API
    private static final String bidtypes_api_get_bid_types = "bidtypes/apiGetBidTypes";
    private static final String bidtypes_api_get_bid_types_invalid = "bidtypes/apiGetBidTypesInvalid";

    private static final String cdnotes_get_crn_and_dbn_data = "cdnotes/getCRNandDBNData";
    private static final String cdnotes_get_crn_and_dbn_data_invalid = "cdnotes/getCRNandDBNDataInvalid";
    private static final String cdnotes_get_credit_note_data_idwise = "cdnotes/getCreditnotedataIdwise/{cdnoteId}";
    private static final String cdnotes_get_credit_note_data_idwise_invalid = "cdnotes/getCreditnotedataIdwiseInvalid/{cdnoteId}";
    private static final String cdnotes_get_cdnote_data = "cdnotes/getcdnotedata";
    private static final String cdnotes_get_cdnote_data_invalid = "cdnotes/getcdnotedataInvalid";
    private static final String cdnotes_get_credit_notes_or_debit_note = "cdnotes/getcreditnotesordebitnote";
    private static final String cdnotes_get_credit_notes_or_debit_note_invalid = "cdnotes/getcreditnotesordebitnoteInvalid";
    private static final String cdnotes_getdebitnote = "cdnotes/getdebitnote";
    private static final String cdnotes_getdebitnote_invalid = "cdnotes/getdebitnoteInvalid";
    private static final String cdnotes_get_redeemable_credit_notes = "/cdnotes/getredeemablecreditnotes/{customerId}/{companyId}";
    private static final String cdnotes_get_redeemable_credit_notes_invalid = "/cdnotes/getredeemablecreditnotesInvalid/{customerId}/{companyId}";

    private static final String collections_approve_cash_transaction = "collections/approvecashtransaction/{transactionId}";
    private static final String collections_approve_cash_transaction_invalid = "collections/approvecashtransactionInvalid";
    private static final String collections_approve_online_transaction = "collections/approveonlinetransaction/{transactionId}";
    private static final String collections_approve_online_transaction_invalid = "collections/approveonlinetransactionInvalid";

    // GET ASSET TYPES API
    private static final String assettypes_index = "assettypes/index";
    private static final String assettypes_index_invalid = "assettypes/indexInvalid";

    // Web API - Assets Management
    private static final String assets_index = "assets/index";
    private static final String assets_index_invalid = "assets/indexInvalid";
    private static final String assets_add_edit_assign_api = "assets/addEditAssignApi";
    private static final String assets_add_edit_assign_api_invalid = "assets/addEditAssignApiInvalid";
    private static final String assets_edit = "assets/edit/{id}";
    private static final String assets_edit_invalid = "assets/editInvalid/{id}";
    private static final String POST_assets_edit = "assets/edit/{id}";
    private static final String POST_assets_add = "assets/add";
    private static final String assets_add_invalid = "assets/addInvalid";
    private static final String assets_asset_list_api = "assets/assetListApi";
    private static final String assets_asset_list_api_invalid = "assets/assetListApiInvalid";
    private static final String assets_delete = "assets/delete/{assetId}";
    private static final String assets_delete_invalid = "assets/deleteInvalid/{assetId}";

    // GET ASSET AUDITS API
    private static final String assetaudits_asset_audit_report = "assetaudits/assetauditreport";
    private static final String assetaudits_asset_audit_report_invalid = "assetaudits/assetauditreportInvalid";

    // GET ASSET DETAILS APPROVAL API
    private static final String assetdetails_approval = "assetdetails/approval";
    private static final String assetdetails_approval_invalid = "assetdetails/approvalInvalid";

    // GET ASSET ORDERS API
    private static final String assetorders_get_asset_approvals = "assetorders/getAssetApprovals";
    private static final String assetorders_get_asset_approvals_invalid = "assetorders/getAssetApprovalsInvalid";
    private static final String assetorders_get_outlet_asset_orders = "assetorders/getoutletassetorders/{outletId}";
    private static final String assetorders_get_outlet_asset_orders_invalid = "assetorders/getoutletassetordersInvalid/{outletId}";
    private static final String assetorders_asset_order_report = "assetorders/assetorderreport";
    private static final String assetorders_asset_order_report_invalid = "assetorders/assetorderreportInvalid";

    // GET CHANNELS INDEX API
    private static final String channels_index = "channels/index";
    private static final String channels_index_invalid = "channels/invalid";

    // GET BEATS API
    private static final  String  getbeatsforuser = "/beats/getbeatsforuser";
    private static final  String  getbeatsforuser_invalid = "/beats/invalidbeatsforuser";
    private static final  String  getbeatsforuser_api = "/beats/getbeatsforuserApi/{userId}";
    private static final  String  getbeatsforuser_api_invalid = "/beats/getbeatsforuserApiInvalid/{userId}";
    private static final  String  beats_getuserapplicablebeat = "/beats/getuserapplicablebeat";
    private static final  String  beats_getuserapplicablebeat_invalid = "/beats/getuserapplicablebeatInvalid";
    private static final  String  getbeatsforareas = "/beats/getbeatsforareas/{areaId}";
    private static final  String  getbeatsforareas_invalid = "/beats/getbeatsforareasInvalid/{areaId}";
    private static final  String  active_inactive_beat = "/beats/active_inactive_beat/{beatId}/{status}";
    private static final  String  active_inactive_beat_invalid = "/beats/active_inactive_beatInvalid/{beatId}/{status}";
    private static final  String  endofdayreports_endofday = "/endofdayreports/endofday";
    private static final  String  endofdayreports_endofday_invalid = "/endofdayreports/endofdayInvalid";
    private static final  String  endofdayreports_get_distance_of_user = "/endofdayreports/getDistanceOfUser";
    private static final  String  endofdayreports_get_distance_of_user_invalid = "/endofdayreports/getDistanceOfUserInvalid";
    private static final  String  endofdayreports_get_end_of_days = "/endofdayreports/getendofdays";
    private static final  String  endofdayreports_get_end_of_days_invalid = "/endofdayreports/getendofdaysInvalid";
    private static final  String  endofdayreports_update_eod_distance = "/endofdayreports/updateEODdistance/{userId}/{date}/{distance}";
    private static final  String  endofdayreports_update_eod_distance_invalid = "/endofdayreports/updateEODdistanceInvalid/{userId}/{date}/{distance}";
    private static final  String  endofdayreports_mail_orders_to_distributors = "/endofdayreports/mailorderstodistributorscron/{distributorId}";
    private static final  String  endofdayreports_mail_orders_to_distributors_invalid = "/endofdayreports/mailorderstodistributorscronInvalid/{distributorId}";
    private static final  String  incentiveconfigurations_get_incentive_configurations_for_outlet = "/incentiveconfigurations/getIncentiveConfigurationsForOutlet/{outletId}";
    private static final  String  incentiveconfigurations_get_incentive_configurations_for_outlet_invalid = "/incentiveconfigurations/getIncentiveConfigurationsForOutletInvalid/{outletId}";
    private static final  String  enrolledoutlets_get_enrolled_outlets_for_user = "/enrolledoutlets/getenrolledoutletsforuser";
    private static final  String  enrolledoutlets_get_enrolled_outlets_for_user_invalid = "/enrolledoutlets/getenrolledoutletsforuserInvalid";
    private static final  String  entitywiseproperties_get_all_properties_options_api = "/entitywiseproperties/getAllPropertiesOptionsApi";
    private static final  String  entitywiseproperties_get_all_properties_options_api_invalid = "/entitywiseproperties/getAllPropertiesOptionsApiInvalid";
    private static final  String  entitywiseproperties_get_properties = "/entitywiseproperties/getProperties";
    private static final  String  entitywiseproperties_get_properties_invalid = "/entitywiseproperties/getPropertiesInvalid";
    private static final  String  entitywiseproperties_get_entity_type_properties = "/entitywiseproperties/getEntityTypeProperties";
    private static final  String  entitywiseproperties_get_entity_type_properties_invalid = "/entitywiseproperties/getEntityTypePropertiesInvalid";
    private static final  String  entitywiseproperties_get_property_options = "/entitywiseproperties/getPropertyOptions/{propertyId}";
    private static final  String  entitywiseproperties_get_property_options_invalid = "/entitywiseproperties/getPropertyOptionsInvalid/{propertyId}";
    private static final  String  entitywiseproperties_get_property_type = "/entitywiseproperties/getPropertyType";
    private static final  String  entitywiseproperties_get_property_type_invalid = "/entitywiseproperties/getPropertyTypeInvalid";
    private static final  String  entitytags_get_type_wise_data = "/entitytags/getTypeWiseData/{entityType}";
    private static final  String  entitytags_get_type_wise_data_invalid = "/entitytags/getTypeWiseDataInvalid/{entityType}";
    private static final String POST_tags_edit = "/tags/edit/{id}";
    private static final String POST_tags_edit_invalid = "/tags/editinvalid/{id}";
    private static final  String  backgroundprocesses_process_detail_list = "/backgroundprocesses/processDetailList/{processId}";
    private static final  String  backgroundprocesses_process_detail_list_invalid = "/backgroundprocesses/processDetailListInvalid/{processId}";
    private static final  String  beatjumps_approval_list = "/beatjumps/approvalList";
    private static final  String  beatjumps_approval_list_invalid = "/beatjumps/approvalListInvalid";
    private static final  String  beatjumps_beatjump_for_approval = "/beatjumps/beatjumpForApproval/{userId}/{beatId}";
    private static final  String  beatjumps_beatjump_for_approval_invalid = "/beatjumps/beatjumpForApprovalInvalid/{userId}/{beatId}";
    private static final  String  getoutlets_by_id = "/beats/getoutlets/{outletId}";
    private static final  String  getoutlets_by_id_invalid = "/beats/invalidgetoutlets/{outletId}";
    private static final  String  getoutletsforbeat_by_id = "/beats/getoutletsforbeat/{outletId}";
    private static final  String  getoutletsforbeat_by_id_invalid = "/beats/invalidgetoutletsforbeat/{outletId}";
    private static final  String  getoutletsforbeataccseq_by_id = "/beats/getoutletsforbeataccseq/{outletId}";
    private static final  String  getoutletsforbeataccseq_by_id_invalid = "/beats/invalidgetoutletsforbeataccseq/{outletId}";
    private static final  String  getbeatmapoutelts_by_id = "/beats/getbeatmapoutelts/{beatId}";
    private static final  String  get_area_for_beat = "/beats/getAreaForBeat";
    private static final  String  get_area_for_beat_invalid = "/beats/getAreaForBeatInvalid";
    private static final  String  get_assigned_beats_for_users = "/beats/getAssignedBeatsForUsers/{userId}";
    private static final  String  get_assigned_beats_for_users_invalid = "/beats/getAssignedBeatsForUsersInvalid/{userId}";
    private static final  String  get_beat_wise_areas = "/beats/getBeatWiseAreas";
    private static final  String  get_beat_wise_areas_invalid = "/beats/getBeatWiseAreasInvalid";
    private static final  String  get_beat_detail_by_name = "/beats/getbeatdetailbyname";
    private static final  String  get_beat_detail_by_name_invalid = "/beats/getbeatdetailbynameInvalid";
    private static final  String  get_all_active_inactive_beat = "/beats/getallactiveinactivebeat/{userId}";
    private static final  String  get_all_active_inactive_beat_invalid = "/beats/getallactiveinactivebeatInvalid/{userId}";
    private static final  String  beats_checkactiveoutletsforbeats = "/beats/checkActiveOutletsForBeats/{beatId}";
    private static final  String  beats_checkactiveoutletsforbeats_invalid = "/beats/checkActiveOutletsForBeatsInvalid/{beatId}";
    private static final  String  beatdetails_apply_approval_changes = "/beatdetails/applyApprovalChanges/{beatId}";
    private static final  String  beatdetails_apply_approval_changes_invalid = "/beatdetails/applyApprovalChangesInvalid/{beatId}";
    private static final  String  benefit_capping_masters_index_api = "/benefitcappingmasters/indexApi";
    private static final  String  benefit_capping_masters_index_api_invalid = "/benefitcappingmasters/indexApiInvalid";
    private static final  String  benefit_capping_masters_index_api_new = "/benefitcappingmasters/indexApiNew";
    private static final  String  benefit_capping_masters_index_api_new_invalid = "/benefitcappingmasters/indexApiNewInvalid";
    private static final String benefitcappings_indexapi = "benefitcappings/indexApi";
    private static final String benefitcappings_indexapi_invalid = "benefitcappings/indexApiInvalid";
    private static final String benefitcappings_getuserunderuserforbenefitcapping = "benefitcappings/getUserUnderUserForBenefitCapping";
    private static final String benefitcappings_getuserunderuserforbenefitcapping_invalid = "benefitcappings/getUserUnderUserForBenefitCappingInvalid";
    private static final String benefitcappings_getreportingtouserforbenefitcapping = "benefitcappings/getReportingToUserForBenefitCapping";
    private static final String benefitcappings_getreportingtouserforbenefitcapping_invalid = "benefitcappings/getReportingToUserForBenefitCappingInvalid";
    private static final String benefitcappingplans_viewcappingplanapi = "benefitcappingplans/viewCappingPlanApi";
    private static final String benefitcappingplans_viewcappingplanapi_invalid = "benefitcappingplans/viewCappingPlanApiInvalid";
    private static final String benefitcappingplans_cappingplanapprovalapi = "benefitcappingplans/cappingPlanApprovalApi";
    private static final String benefitcappingplans_cappingplanapprovalapi_invalid = "benefitcappingplans/cappingPlanApprovalApiInvalid";
    private static final String benefitcappingplans_approverejectmultiple = "benefitcappingplans/approveRejectMultiple";
    private static final String benefitcappingplans_approverejectmultiple_invalid = "benefitcappingplans/approveRejectMultipleInvalid";
    private static final  String  getbeatmapoutelts_by_id_invalid = "/beats/invalidgetbeatmapoutelts/{beatId}";
    private static final  String  inventories_get_batch_names_for_sku = "/inventories/getBatchNamesForSku/{warehouseId}/{skuId}";
    private static final  String  inventories_get_batch_names_for_sku_invalid = "/inventories/getBatchNamesForSkuInvalid/{warehouseId}/{skuId}";
    private static final  String  inventories_get_sku_inventory_for_inventory_type = "/inventories/getSkuInventoryForInventoryType/{warehouseId}/{skuId}/{inventoryTypeId}/{batchId}";
    private static final  String  inventories_get_sku_inventory_for_inventory_type_invalid = "/inventories/getSkuInventoryForInventoryTypeInvalid/{warehouseId}/{skuId}/{inventoryTypeId}/{batchId}";

    // Ageing Outlets Management
    private static final String ageingoutlets_get_ageing_value_for_outlet = "/ageingoutlets/getageingvalueforoutlet/{outletId}";
    private static final String ageingoutlets_get_ageing_value_for_outlet_invalid = "/ageingoutlets/getageingvalueforoutletInvalid/{outletId}";

    // Aggregate Types Management
    private static final String aggregatetypes_get_all_aggregate_types = "/aggregatetypes/getAllAggregateTypes";
    private static final String aggregatetypes_get_all_aggregate_types_invalid = "/aggregatetypes/getAllAggregateTypesInvalid";
    private static final String aggregatetypes_index = "aggregatetypes/index";
    private static final String aggregatetypes_index_invalid = "aggregatetypes/indexInvalid";

    // Claim Limit Configurations Management
    private static final String claimlimitconfigurations_indexapi = "/claimlimitconfigurations/indexApi";
    private static final String claimlimitconfigurations_indexapi_invalid = "/claimlimitconfigurations/indexApiInvalid";

    // Custom Reports Management
    private static final String customreports_apibilledoutlets = "/customreports/apibilledoutlets";
    private static final String customreports_apibilledoutlets_invalid = "/customreports/apibilledoutletsInvalid";
    private static final String customreports_apicallsmade = "/customreports/apicallsmade";
    private static final String customreports_apicallsmade_invalid = "/customreports/apicallsmadeInvalid";
    private static final String customreports_apimtdreport = "/customreports/apimtdreport";
    private static final String customreports_apimtdreport_invalid = "/customreports/apimtdreportInvalid";
    private static final String customreports_apisalesorderreport = "/customreports/apisalesorderreport";
    private static final String customreports_apisalesorderreport_invalid = "/customreports/apisalesorderreportInvalid";
    private static final String customreports_getordersstats = "/customreports/getordersstats";
    private static final String customreports_getordersstats_invalid = "/customreports/getordersstatsInvalid";
    private static final String customreports_getbrandsjson = "/customreports/getbrandsjson";
    private static final String customreports_getbrandsjson_invalid = "/customreports/getbrandsjsonInvalid";
    private static final String customreports_getusersjson = "/customreports/getusersjson";
    private static final String customreports_getusersjson_invalid = "/customreports/getusersjsonInvalid";
    private static final String customreports_hierarchyreport = "/customreports/hierarchyreport";
    private static final String customreports_hierarchyreport_invalid = "/customreports/hierarchyreportInvalid";
    private static final String customreports_usertrackinggraphicreport = "/customreports/usertrackingGraphicreport";
    private static final String customreports_usertrackinggraphicreport_invalid = "/customreports/usertrackingGraphicreportInvalid";
    private static final String customreports_usertrackingreport = "/customreports/usertrackingreport";
    private static final String customreports_usertrackingreport_invalid = "/customreports/usertrackingreportInvalid";
    private static final String customreports_trafficlightdashboardparams = "/customreports/trafficlightdashboardparams/{userId}/{date}";
    private static final String customreports_trafficlightdashboardparams_invalid = "/customreports/trafficlightdashboardparamsInvalid/{userId}/{date}";

    // Web API - Report Groups Management
    private static final String reportgroups_index = "/reportgroups/index";
    private static final String reportgroups_index_invalid = "/reportgroups/invalid";
    private static final String reportgroups_get_erp_groups = "/reportgroups/getERPGroups";
    private static final String reportgroups_get_erp_groups_invalid = "/reportgroups/invalid";

    // Web API - Report Mappings Management
    private static final String reportmappings_get_report_urls = "/reportmappings/getreporturls";
    private static final String reportmappings_get_report_urls_invalid = "/reportmappings/invalid";

    // Web API - Reports Management
    private static final String reports_get_beat_performance = "/reports/getBeatPerformance/{beatId}";
    private static final String reports_get_beat_performance_invalid = "/reports/getBeatPerformance/invalid";
    private static final String reports_performance_report = "/reports/performanceReport";
    private static final String reports_performance_report_invalid = "/reports/invalid";
    private static final String reports_compliance_report = "/reports/complaianceReport";
    private static final String reports_compliance_report_invalid = "/reports/invalid";
    private static final String reports_get_order = "/reports/getorder";
    private static final String reports_get_order_invalid = "/reports/invalid";
    private static final String reports_get_order_achievement = "/reports/getorderachievement";
    private static final String reports_get_order_achievement_invalid = "/reports/invalid";
    private static final String reports_outletwise_orders_with_date = "/reports/outletwiseorderswithdate";
    private static final String reports_outletwise_orders_with_date_invalid = "/reports/invalid";
    private static final String reports_outletwise_payments_with_date = "/reports/outletwisepaymentswithdate";
    private static final String reports_outletwise_payments_with_date_invalid = "/reports/invalid";
    private static final String reports_oxynew_call_download = "/reports/oxynewcallDownload";
    private static final String reports_oxynew_call_download_invalid = "/reports/invalid";
    private static final String reports_traffic_light_dashboard_report = "/reports/trafficlightdashboardreport";
    private static final String reports_traffic_light_dashboard_report_invalid = "/reports/invalid";
    private static final String reports_visited_productive_not_visited_data = "/reports/vistitedproductivenotvisiteddata";
    private static final String reports_visited_productive_not_visited_data_invalid = "/reports/invalid";

    // Web API - Tour Budgets Management
    private static final String GET_planfeed = "/tourbudgets/planfeed/{id}";
    private static final String GET_planfeed_invalid = "/tourbudgets/planfeedinvalid";
    private static final String GET_getTourBudget = "/tourbudgets/getTourBudget";
    private static final String GET_getTourBudget_invalid = "/tourbudgets/getTourBudgetInvalid";
    private static final String POST_budgetValidation = "/tourbudgets/budgetValidation";
    private static final String POST_budgetValidation_invalid = "/tourbudgets/budgetValidationInvalid";
    private static final String GET_approveTourBudget = "/tourbudgets/approveTourBudget";
    private static final String GET_approveTourBudget_invalid = "/tourbudgets/approveTourBudgetInvalid";

    // Web API - Salesman Sales Returns Management
    private static final String salemansalesreturns_get_sales_return = "/salemansalesreturns/getsalesreturn";
    private static final String salemansalesreturns_get_sales_return_invalid = "/salemansalesreturns/invalid";
    private static final String salemansalesreturns_get_sales_return_reason = "/salemansalesreturns/getsalesreturnreason";
    private static final String salemansalesreturns_get_sales_return_reason_invalid = "/salemansalesreturns/invalid";
    private static final String salemansalesreturns_sale_returns = "/salemansalesreturns/salereturns";
    private static final String salemansalesreturns_sale_returns_invalid = "/salemansalesreturns/invalid";
    private static final String salemansalesreturns_connectapigetsalereturnforuser = "/salemansalesreturns/connectApiGetSaleReturnForUser";
    private static final String salemansalesreturns_connectapigetsalereturnforuser_invalid = "/salemansalesreturns/connectApiGetSaleReturnForUserInvalid";
    private static final String salemansalesreturns_cancelsalereturn = "/salemansalesreturns/cancelsalereturn/{salereturnId}";
    private static final String salemansalesreturns_cancelsalereturn_invalid = "/salemansalesreturns/cancelsalereturnInvalid/{salereturnId}";
    private static final String inventories_get_searched_sku_data = "/inventories/getSearchedSKUData/{param1}/{param2}/{param3}/{param4}";
    private static final String inventories_get_searched_sku_data_invalid = "/inventories/getSearchedSKUDataInvalid/{param1}/{param2}/{param3}/{param4}";
    private static final String inventories_showstocktransfersbycondition = "/inventories/showstocktransfersbycondition/{fromDate}/{toDate}";
    private static final String inventories_showstocktransfersbycondition_invalid = "/inventories/showstocktransfersbyconditionInvalid/{fromDate}/{toDate}";
    private static final String inventories_updatealertlevel = "/inventories/updatealertlevel/{inventoryId}/{warehouseId}";
    private static final String inventories_updatealertlevel_invalid = "/inventories/updatealertlevelInvalid/{inventoryId}/{warehouseId}";
    private static final String skunits_get_expired_batch = "/skunits/getExpiredBatch";

    // Web API - Sale Return Approval Configurations Management
    private static final String salereturnapprovalconfigurations_get_approval_configurations = "/salereturnapprovalconfigurations/getApprovalConfigurations";
    private static final String salereturnapprovalconfigurations_get_approval_configurations_invalid = "/salereturnapprovalconfigurations/invalid";

    // Web API - Hierarchies Management
    private static final String hierarchies_gethierarchies = "hierarchies/getHierarchies";
    private static final String hierarchies_gethierarchies_invalid = "hierarchies/getHierarchiesInvalid";

    // Headquarters Management
    private static final String headquarters_suggestions = "headquarters/suggestions";
    private static final String headquarters_suggestions_invalid = "headquarters/suggestionsInvalid";
    private static final String headquarters_add = "headquarters/add";
    private static final String headquarters_add_invalid = "headquarters/addInvalid";
    // Web API - Users Management
    private static final String getusers = "/users/getusers/{userId}";
    private static final String getusers_invalid = "/users/invalid";

    // Web API - Tour Budgets Management
    private static final String tourbudgets_get_beats_for_reportee = "/tourbudgets/getBeatsForReportee";
    private static final String tourbudgets_get_beats_for_reportee_invalid = "/tourbudgets/invalid";
    private static final String tourbudgets_get_reportee_for_warehouses = "/tourbudgets/getReporteeForWarehouses/{warehouseId}";
    private static final String tourbudgets_get_reportee_for_warehouses_invalid = "/tourbudgets/getReporteeForWarehouses/invalid";
    private static final String tourbudgets_get_repetition_budget = "/tourbudgets/getRepetitionBudget/{warehouseId}";
    private static final String tourbudgets_get_repetition_budget_invalid = "/tourbudgets/getRepetitionBudget/invalid";
    private static final String tourbudgets_get_pcp_details_by_user_and_date = "/tourbudgets/getPcpDetailsByUserAndDate/{userId}/{date}";
    private static final String tourbudgets_get_pcp_details_by_user_and_date_invalid = "/tourbudgets/getPcpDetailsByUserAndDate/invalid";
    private static final String tourbudgets_get_tour_types_api = "/tourbudgets/getTourTypesApi";
    private static final String tourbudgets_get_tour_types_api_invalid = "/tourbudgets/invalid";
    private static final String tourbudgets_get_assignee_datas = "/tourbudgets/getassigneedatas/{warehouseId}";
    private static final String tourbudgets_get_assignee_datas_invalid = "/tourbudgets/getassigneedatas/invalid";
    private static final String tourbudgets_index_api = "/tourbudgets/indexApi";
    private static final String tourbudgets_index_api_invalid = "/tourbudgets/invalid";
    private static final String tourbudgets_edit_budget = "/tourbudgets/editBudget";
    private static final String tourbudgets_edit_budget_invalid = "/tourbudgets/editBudgetInvalid";

    // Web API - Dashboards Management
    private static final String dashboards_orglevelnames = "/dashboards/orgLevelNames";
    private static final String dashboards_orglevelnames_invalid = "/dashboards/orgLevelNamesInvalid";
    private static final String dashboards_orgnisationhierarchy = "dashboards/orgnisationhierarchy";
    private static final String dashboards_orgnisationhierarchy_invalid = "dashboards/orgnisationhierarchyInvalid";

    // Web API - Distributor Transfers Management
    private static final String distributortransfers_index = "/distributortransfers/index";
    private static final String distributortransfers_index_invalid = "/distributortransfers/indexInvalid";

    // Web API - Delivery Shifts Management
    private static final String deliveryshifts_index = "/deliveryshifts/index";
    private static final String deliveryshifts_index_invalid = "/deliveryshifts/indexInvalid";

    // Web API - Delivery Challans Management
    private static final String deliverychallans_getavailableskudcinventorybypaymentid = "deliverychallans/getAvailableSKUDCInventoryByPaymentID";
    private static final String deliverychallans_getavailableskudcinventorybypaymentid_invalid = "deliverychallans/getAvailableSKUDCInventoryByPaymentIDInvalid";
    private static final String deliverychallans_indexapi = "deliverychallans/indexApi";
    private static final String deliverychallans_indexapi_invalid = "deliverychallans/indexApiInvalid";

    // Web API - Delivery Challan States Management
    private static final String deliverychallanstates_getdeliverychallanstates = "deliverychallanstates/getDeliveryChallanStates";
    private static final String deliverychallanstates_getdeliverychallanstates_invalid = "deliverychallanstates/getDeliveryChallanStatesInvalid";
    private static final String deliverychallanstates_index = "deliverychallanstates/index";
    private static final String deliverychallanstates_index_invalid = "deliverychallanstates/indexInvalid";

    // Web API - Delivery Challan Types Management
    private static final String deliverychallantypes_getdeliverychallantypes = "deliverychallantypes/getDeliveryChallanTypes";
    private static final String deliverychallantypes_getdeliverychallantypes_invalid = "deliverychallantypes/getDeliveryChallanTypesInvalid";
    private static final String deliverychallantypes_indexapi = "deliverychallantypes/indexApi";
    private static final String deliverychallantypes_indexapi_invalid = "deliverychallantypes/indexApiInvalid";

    // Web API - Eway Bills Management
    private static final String ewaybills_getwarehouselist = "ewaybills/getWarehouseList";
    private static final String ewaybills_getwarehouselist_invalid = "ewaybills/getWarehouseListInvalid";
    private static final String ewaybills_checkactiveewaybillbypaymentid = "ewaybills/checkactiveEwaybillbyPaymentId/{paymentId}";
    private static final String ewaybills_checkactiveewaybillbypaymentid_invalid = "ewaybills/checkactiveEwaybillbyPaymentIdInvalid/{paymentId}";
    private static final String ewaybills_checkactiveewaybillbyvaliditypaymentid = "ewaybills/checkactiveEwaybillbyValidityPaymentId/{paymentId}";
    private static final String ewaybills_checkactiveewaybillbyvaliditypaymentid_invalid = "ewaybills/checkactiveEwaybillbyValidityPaymentIdInvalid/{paymentId}";
    private static final String ewaybills_getdetails = "ewaybills/getDetails/{param1}/{param2}/{param3}/{param4}";
    private static final String ewaybills_getdetails_invalid = "ewaybills/getDetailsInvalid/{param1}/{param2}/{param3}/{param4}";

    // Web API - Online Invoices Management
    private static final String onlineinvoices_getwarehouselist = "onlineinvoices/getWarehouseList";
    private static final String onlineinvoices_getwarehouselist_invalid = "onlineinvoices/getWarehouseListInvalid";
    private static final String onlineinvoices_getrequestlogs = "onlineinvoices/getRequestLogs";
    private static final String onlineinvoices_getrequestlogs_invalid = "onlineinvoices/getRequestLogsInvalid";
    private static final String onlineinvoices_editcredentials = "onlineinvoices/editCredentials";
    private static final String onlineinvoices_editcredentials_invalid = "onlineinvoices/editCredentialsInvalid";

    // Web API - Online Nepal Invoices Management
    private static final String onlinenepalinvoices_editcredentials = "onlinenepalinvoices/editCredentials";
    private static final String onlinenepalinvoices_editcredentials_invalid = "onlinenepalinvoices/editCredentialsInvalid";

    // Web API - No Due Certificates Management
    private static final String noduecertificates_getsprintdetails = "noduecertificates/getSprintDetails";
    private static final String noduecertificates_getsprintdetails_invalid = "noduecertificates/getSprintDetailsInvalid";
    private static final String noduecertificates_getsprintdetails_with_params = "/noduecertificates/getSprintDetails/{sprintId}";
    private static final String noduecertificates_getsprintdetails_with_params_invalid = "/noduecertificates/getSprintDetailsInvalid/{sprintId}";
    private static final String noduecertificates_getdocuments = "noduecertificates/getDocuments";
    private static final String noduecertificates_getdocuments_invalid = "noduecertificates/getDocumentsInvalid";

    // Web API - GRNs Management
    private static final String grns_getmygrnsapi = "grns/getMyGrnsApi";
    private static final String grns_getmygrnsapi_invalid = "grns/getMyGrnsApiInvalid";
    private static final String grns_get_grn_details = "grns/getGrnDetails";
    private static final String grns_get_grn_details_invalid = "grns/getGrnDetailsInvalid";

    // Web API - Games Management
    private static final String games_getmeasures = "games/getMeasures";
    private static final String games_getmeasures_invalid = "games/getMeasuresInvalid";
    private static final String games_getgamedetail = "games/getGameDetail";
    private static final String games_getgamedetail_invalid = "games/getGameDetailInvalid";
    private static final String games_getscore = "games/getScore";
    private static final String games_getscore_invalid = "games/getScoreInvalid";

    // Web API - Designations Management
    private static final String designations_getdesignations = "designations/getDesignations";
    private static final String designations_getdesignations_invalid = "designations/getDesignationsInvalid";
    private static final String designations_index = "designations/index";
    private static final String designations_index_invalid = "designations/indexInvalid";

    // Web API - Shifts Management
    private static final String shifts_ajaxindexnew = "/shifts/ajaxindexNew";
    private static final String shifts_ajaxindexnew_invalid = "/shifts/invalid";

    // Web API - Shift Timings Management
    private static final String shifttimings_ajaxindexnew = "/shifttimings/ajaxindexNew";
    private static final String shifttimings_ajaxindexnew_invalid = "/shifttimings/invalid";

    // Web API - Depo Margins Management
    private static final String depomargins_index = "/depomargins/index";
    private static final String depomargins_index_invalid = "/depomargins/indexInvalid";
    private static final String POST_saveMultipleDepomargins = "/depomargins/saveMultipleDepomargins";
    private static final String POST_saveMultipleDepomargins_invalid = "/depomargins/saveMultipleDepomarginsInvalid";

    // Web API - Segment Change Requests Management
    private static final String segmentchangerequests_indexapi = "/segmentchangerequests/indexApi";
    private static final String segmentchangerequests_indexapi_invalid = "/segmentchangerequests/invalid";

    // Web API - Invoice Requests Management
    private static final String invoicerequests_index = "/invoicerequests/index";
    private static final String invoicerequests_index_invalid = "/invoicerequests/index/invalid";

    // Web API - Invoice Template Mappings Management
    private static final String invoicetemplatemappings_index = "/Invoicetemplatemappings/index/{id}";
    private static final String invoicetemplatemappings_index_invalid = "/Invoicetemplatemappings/index/invalid";
    private static final String invoicetemplatemappings_edit = "/invoicetemplatemappings/edit";
    private static final String invoicetemplatemappings_edit_invalid = "/invoicetemplatemappings/editInvalid";

    // Web API - Invoice Forms Management
    private static final String invoiceforms_getinvoiceforms = "invoiceforms/getinvoiceforms";
    private static final String invoiceforms_getinvoiceforms_invalid = "invoiceforms/getinvoiceformsInvalid";

    // Web API - Languages Management
    private static final String get_languages = "/languages/getLanguages";
    private static final String get_languages_invalid = "/languages/getLanguages/invalid";
    private static final String languages_ajaxindexnew = "/languages/ajaxindexNew";
    private static final String languages_ajaxindexnew_invalid = "/languages/ajaxindexNew/invalid";

    // Web API - Leave Types Management
    private static final String get_leave_types = "/leavetypes/getLeaveTypes";
    private static final String get_leave_types_invalid = "/leavetypes/getLeaveTypes/invalid";

    // Web API - Load Ins Management
    private static final String get_loadins_api = "/loadins/getLoadinsApi";
    private static final String get_loadins_api_invalid = "/loadins/getLoadinsApi/invalid";
    private static final String get_user_loadin_info = "/loadins/getuserloadininfo/{userId}";
    private static final String get_user_loadin_info_invalid = "/loadins/getuserloadininfo/invalid";
    private static final String get_user_loadin_info_web = "/loadins/getuserloadininfoweb/{userId}";
    private static final String get_user_loadin_info_web_invalid = "/loadins/getuserloadininfoweb/invalid";

    // Web API - Loadouts Management
    private static final String get_loadin_info = "/loadouts/getloadininfo";
    private static final String get_loadin_info_invalid = "/loadouts/getloadininfo/invalid";
    private static final String loadouts_getbatchestoaddloadout = "/loadouts/getBatchesToAddLoadout";
    private static final String loadouts_getbatchestoaddloadout_invalid = "/loadouts/getBatchesToAddLoadoutInvalid";
    private static final String loadouts_isloadoutsettled = "/loadouts/isloadoutsettled";
    private static final String loadouts_isloadoutsettled_invalid = "/loadouts/isloadoutsettledInvalid";
    private static final String loadouts_getloadoutforusers = "/loadouts/getloadoutforusers";
    private static final String loadouts_getloadoutforusers_invalid = "/loadouts/getloadoutforusersInvalid";
    private static final String loadoutsheets_get_loadoutsheet_datas = "loadoutsheets/getLoadoutsheetDatas";
    private static final String loadoutsheets_get_loadoutsheet_datas_invalid = "loadoutsheets/getLoadoutsheetDatasInvalid";
    private static final String loadoutsheets_user_loadsheet_data = "loadoutsheets/userloadsheetdata";
    private static final String loadoutsheets_user_loadsheet_data_invalid = "loadoutsheets/userloadsheetdataInvalid";
    private static final String POST_findDetailsByBillOrLoadsheet = "/loadoutsheets/finddetailsbybillorloadsheet";
    private static final String POST_findDetailsByBillOrLoadsheet_invalid = "/loadoutsheets/finddetailsbybillorloadsheetInvalid";
    private static final String POST_markLoadsheetDispatch = "/loadoutsheets/markLoadsheetDispatch";
    private static final String POST_markLoadsheetDispatch_invalid = "/loadoutsheets/markLoadsheetDispatchInvalid";

    // Web API - Manager Roles Management
    private static final String manageroles_getusers = "/manageroles/getusers";
    private static final String manageroles_getusers_invalid = "/manageroles/getusersinvalid";
    private static final String manageroles_get_role_acc_warehouse_details = "manageroles/getRoleAccWarehouseDetails";
    private static final String manageroles_get_role_acc_warehouse_details_invalid = "manageroles/getRoleAccWarehouseDetailsInvalid";

    // Web API - Mappings Management
    private static final String get_all_mappings = "/mappings/getAllMappings";
    private static final String get_all_mappings_invalid = "/mappings/getAllMappingsinvalid";

    // Web API - MDMs Management
    private static final String all_mdms = "/mdms/allMdms";
    private static final String all_mdms_invalid = "/mdms/allMdms/invalid";
    private static final String all_tables = "/mdms/allTables";
    private static final String all_tables_invalid = "/mdms/allTablesinvalid";
    private static final String mdms_categories = "/mdms/categories";
    private static final String mdms_categories_invalid = "/mdms/categories/invalid";
    private static final String get_mdm_detail = "/mdms/getDetail/{mdmId}";
    private static final String get_mdm_detail_invalid = "/mdms/getDetail/invalid";
    private static final String get_mdm = "/mdms/getMdm/{mdmId}";
    private static final String get_mdm_invalid = "/mdms/getMdminvalid";
    private static final String mdms_foreign_keys_in_table = "/mdms/foreignKeysInTable/{id}";
    private static final String mdms_foreign_keys_in_table_invalid = "/mdms/foreignKeysInTableInvalid/{id}";
    private static final String mdms_status = "/mdms/status";
    private static final String mdms_status_invalid = "/mdms/status/invalid";
    private static final String mdms_getupdate = "mdms/getupdate";
    private static final String mdms_getupdate_invalid = "mdms/getupdateInvalid";
    private static final String mdms_getupdate_with_params = "/mdms/getupdate/{mdmsId}/{status}";
    private static final String mdms_getupdate_with_params_invalid = "/mdms/getupdateInvalid/{mdmsId}/{status}";
    private static final String mdms_getsingularise_table_name = "/mdms/getsingulariseTableName/{entityType}";
    private static final String mdms_getsingularise_table_name_invalid = "/mdms/getsingulariseTableNameInvalid/{entityType}";

    // Web API - Menus Management
    private static final String menus_get = "/menus/get";
    private static final String menus_get_invalid = "/menus/get/invalid";
    private static final String menus_get_configure_menus = "/menus/getConfigureMenus";
    private static final String menus_get_configure_menus_invalid = "/menus/getConfigureMenus/invalid";
    private static final String menus_getmenuforsellingpoint = "/menus/getmenuforsellingpoint";
    private static final String menus_getmenuforsellingpoint_invalid = "/menus/getmenuforsellingpoint/invalid";

    // Web API - Merchandising Shelf Types Management
    private static final String merchandisingshelftypes_index = "/merchandisingshelftypes/index";
    private static final String merchandisingshelftypes_index_invalid = "/merchandisingshelftypes/index/invalid";

    // Web API - Segments Management
    private static final String segments_indexapi = "/segments/indexApi";
    private static final String segments_indexapi_invalid = "/segments/invalid";
    private static final String segments_get_segments = "/segments/getSegments";
    private static final String segments_get_segments_invalid = "/segments/getSegmentsInvalid";
    private static final String segments_get_configurations = "/segments/getConfigurations";
    private static final String segments_get_configurations_invalid = "/segments/getConfigurationsInvalid";
    
    // Web API - Segment Rules Management
    private static final String segmentrules_index_api = "/segmentrules/indexApi";
    private static final String segmentrules_index_api_invalid = "/segmentrules/indexApiInvalid";
    private static final String segmentrules_get_supported_entities = "/segmentrules/getSupportedEntities";
    private static final String segmentrules_get_supported_entities_invalid = "/segmentrules/getSupportedEntitiesInvalid";
    private static final String segmentrules_get_segment_rule_configuration_for_beat = "/segmentrules/getSegmentRuleConfigurationForBeat";
    private static final String segmentrules_get_segment_rule_configuration_for_beat_invalid = "/segmentrules/getSegmentRuleConfigurationForBeatInvalid";
    
    // Web API - Scheme Trade Type Masters Management
    private static final String schemetradetypemasters_index = "/schemetradetypemasters/index";
    private static final String schemetradetypemasters_index_invalid = "/schemetradetypemasters/indexInvalid";
    
    // Web API - MSLs Management
    private static final String msls_get_achievement_for_msl = "/msls/getAchievementForMsl";
    private static final String msls_get_achievement_for_msl_invalid = "/msls/getAchievementForMslInvalid";
    private static final String msls_index = "/msls/index";
    private static final String msls_index_invalid = "/msls/indexInvalid";
    private static final String msls_assign = "/msls/assign";
    private static final String msls_assign_invalid = "/msls/assignInvalid";
    private static final String msls_get_msl_assigned_data = "/msls/getmslassigneedata";
    private static final String msls_get_msl_assigned_data_invalid = "/msls/getmslassigneedataInvalid";

    private static final  String  getbeatsforzone_by_id = "/beats/getbeatsforzone/{zoneId}";
    private static final  String  getbeatsforzone_by_id_invalid = "/beats/invalidbeatsforzone/{zoneId}";

    // GET BIDS API
    private static final  String  apigetmybids = "/bids/apiGetMyBids";
    private static final  String  apigetmybids_invalid = "/bids/invalidApiGetMyBids";

    // GET BUSINESS TYPES API
    private static final  String  businesstypelist = "/businesstypes/businesstypeList";
    private static final  String  businesstypelist_invalid = "/businesstypes/invalidBusinesstypeList";
    private static final String getbusinesstypes = "/businesstypes/getbusinesstypes";
    private static final String getbusinesstypes_invalid = "/businesstypes/invalidGetbusinesstypes";
    private static final String getapprovers = "/claimapprovals/getapprovers";
    private static final String getapprovers_invalid = "/claimapprovals/invalidGetapprovers";
    private static final String getreporteelist = "/claimapprovals/getreporteelist";
    private static final String getreporteelist_invalid = "/claimapprovals/invalidGetreporteelist";
    private static final String getreportees = "/claimapprovals/getreportees";
    private static final String getreportees_invalid = "/claimapprovals/invalidGetreportees";
    private static final String beattypes_index = "/beattypes/index";
    private static final String beattypes_index_invalid = "/beattypes/invalidIndex";
    private static final String businessunits_index = "/businessunits/index";
    private static final String businessunits_index_invalid = "/businessunits/invalidIndex";
    private static final String claimapprovals_index = "/claimapprovals/index";
    private static final String claimapprovals_index_invalid = "/claimapprovals/invalidIndex";

    // Web API - Entity Mappings
    private static final String inactivateEntityMappingsIndex = "/inactivateentitymappings/index";

    // =====================================================================================
    // MDM API ENDPOINTS
    //======================================================================================

    private static final String getMdmDetails="mdms/getMdmDetails";
    private static final String insertMdmData_subzone_MDM="mdms/insertMdmData";
    private static final String insertMdmData_area_MDM="mdms/insertMdmData";
    private static final String insertBulkMdmData_subzone_MDM = "mdms/insertMdmData";
    private static final String insertBulkMdmData_area_MDM="mdms/insertMdmData";
    private static final String insertMdmData_brand_MDM="mdms/insertMdmData/";
    private static final String insertBulkMdmData_brand_MDM="mdms/insertMdmData/";
    private static final String insertMdmData_outletcategories_MDM="mdms/insertMdmData/";
    private static final String insertBulkMdmData_outletcategories_MDM= "mdms/insertMdmData/";
    private static final String insertMdmData_categories_MDM="mdms/insertMdmData/";
    private static final String insertBulkMdmData_categories_MDM="mdms/insertMdmData/";
    private static final String insertMdmData_subbrand_mdm="mdms/insertMdmData/";
    private static final String insertBulkMdmData_subbrand_mdm="mdms/insertMdmData/";
    private static final String insertMdmData_Servesizes_mdm="mdms/insertMdmData/";
    private static final String insertBulkMdmData_Servesizes_mdm="mdms/insertMdmData/";
    private static final String insertMdmData_variants_MDM="mdms/insertMdmData/";
    private static final String insertBulkMdmData_variants_MDM="mdms/insertMdmData/";
    private static final String insertMdmData_subcategories_MDM="mdms/insertMdmData/";
    private static final String insertBulkMdmData_subcategories_MDM="mdms/insertMdmData/";
    private static final String insertMdmData_apptabsequence_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_apptabsequence_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_assetAuditMdmUpload_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_assetAuditMdmUpload_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_updateAssetSerialno_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_updateAssetSerialno_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_assetDeregisterMdm_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_assetDeregisterMdm_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_addAssets_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_addAssets_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_metaBisonBrandName_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_metaBisonBrandName_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_billCutPerDay_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_billCutPerDay_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_discountsMdmUpload_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_discountsMdmUpload_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_businessNormsMdmUpload_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_businessNormsMdmUpload_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_bulkClaimApproval_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_bulkClaimApproval_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_claimlimitConfigs_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_claimlimitConfigs_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_biwsCiwsRequestDetailsMdm_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_biwsCiwsRequestDetailsMdm_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_physicalClaimReceipt_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_physicalClaimReceipt_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_brandisMdmUploadForSaleReturn_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_brandisMdmUploadForSaleReturn_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_businessUnitMapping_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_businessUnitMapping_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_collateralAddAndUpdate_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_collateralAddAndUpdate_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_categorySubcategoryMapping_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_categorySubcategoryMapping_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_bidrequestMdm_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_bidrequestMdm_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_configurationMappings_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_configurationMappings_MDM = "mdms/insertBulkMdmData/";
    private static final String insertMdmData_primarydiscountConfigs_MDM = "mdms/insertMdmData/";
    private static final String insertBulkMdmData_primarydiscountConfigs_MDM = "mdms/insertBulkMdmData/";


    private static final Map<String, String> resourceUriMap = new HashMap<>();

    static {
        initializeResourceUriMap();
    }

    private static void initializeResourceUriMap() {
        resourceUriMap.put("getusers", getusers);
        resourceUriMap.put("getusers_invalid", getusers_invalid);
        resourceUriMap.put("getWarehouseTransactionForAllUsers", getWarehouseTransactionForAllUsers);
        resourceUriMap.put("getWarehouseTransactionForAllUsers_invalid", getWarehouseTransactionForAllUsers_invalid);
        resourceUriMap.put("getreportingusers", getreportingusers);
        resourceUriMap.put("getreportingusers_invalid", getreportingusers_invalid);
        resourceUriMap.put("getUsersForLevelWithRole", getUsersForLevelWithRole);
        resourceUriMap.put("getUsersForLevelWithRole_invalid", getUsersForLevelWithRole_invalid);
        resourceUriMap.put("getUsersDataForEntities", getUsersDataForEntities);
        resourceUriMap.put("getUsersDataForEntities_invalid", getUsersDataForEntities_invalid);
        resourceUriMap.put("logout_user", logout_user);
        resourceUriMap.put("getOrderForOutlets", getOrderForOutlets);
        resourceUriMap.put("getWarehouseListRetailerApi", getWarehouseListRetailerApi);
        resourceUriMap.put("getSalereturnReasons", getSalereturnReasons);
        resourceUriMap.put("getCompanySettingByName", getCompanySettingByName);
        resourceUriMap.put("config_user", config_user);
        resourceUriMap.put("list_orders_positive", list_orders_positive);
        resourceUriMap.put("orders_accept", orders_accept);
        resourceUriMap.put("orders_accept_invalid", orders_accept_invalid);
        resourceUriMap.put("orders_api_reject_order", orders_api_reject_order);
        resourceUriMap.put("orders_api_reject_order_invalid", orders_api_reject_order_invalid);
        resourceUriMap.put("orders_api_view_order", orders_api_view_order);
        resourceUriMap.put("orders_api_view_order_invalid", orders_api_view_order_invalid);
        resourceUriMap.put("orders_copyoldorder", orders_copyoldorder);
        resourceUriMap.put("orders_copyoldorder_invalid", orders_copyoldorder_invalid);
        resourceUriMap.put("orders_get_child_order_details", orders_get_child_order_details);
        resourceUriMap.put("orders_get_child_order_details_invalid", orders_get_child_order_details_invalid);
        resourceUriMap.put("orders_get_curr_inv_acc_batch", orders_get_curr_inv_acc_batch);
        resourceUriMap.put("orders_get_curr_inv_acc_batch_invalid", orders_get_curr_inv_acc_batch_invalid);
        resourceUriMap.put("orders_get_designationwise_users", orders_get_designationwise_users);
        resourceUriMap.put("orders_get_designationwise_users_invalid", orders_get_designationwise_users_invalid);
        resourceUriMap.put("orders_get_order_invoices", orders_get_order_invoices);
        resourceUriMap.put("orders_get_order_invoices_invalid", orders_get_order_invoices_invalid);
        resourceUriMap.put("orders_check_credit_limit_validation_mode", orders_check_credit_limit_validation_mode);
        resourceUriMap.put("orders_check_credit_limit_validation_mode_invalid", orders_check_credit_limit_validation_mode_invalid);
        resourceUriMap.put("orders_get_order_state", orders_get_order_state);
        resourceUriMap.put("orders_get_order_state_invalid", orders_get_order_state_invalid);
        resourceUriMap.put("orders_get_order_state_logs", orders_get_order_state_logs);
        resourceUriMap.put("orders_get_order_state_logs_invalid", orders_get_order_state_logs_invalid);
        resourceUriMap.put("orders_get_orders_for_outlet", orders_get_orders_for_outlet);
        resourceUriMap.put("orders_get_orders_for_outlet_invalid", orders_get_orders_for_outlet_invalid);
        resourceUriMap.put("list_positive_areas", list_positive_areas);
        resourceUriMap.put("list_negative_areas", list_negative_areas);
        resourceUriMap.put("inventory_for_warehouse", inventory_for_warehouse);
        resourceUriMap.put("inventories_get_inventory_for_warehouse", inventories_get_inventory_for_warehouse);
        resourceUriMap.put("inventories_get_inventory_for_warehouse_invalid", inventories_get_inventory_for_warehouse_invalid);
        resourceUriMap.put("inventories_get_total_inventory_for_warehouse", inventories_get_total_inventory_for_warehouse);
        resourceUriMap.put("inventories_get_total_inventory_for_warehouse_invalid", inventories_get_total_inventory_for_warehouse_invalid);
        resourceUriMap.put("inventory_transaction", inventory_transaction);
        resourceUriMap.put("inventories_get_inventory_transaction_api", inventories_get_inventory_transaction_api);
        resourceUriMap.put("inventories_get_inventory_transaction_api_invalid", inventories_get_inventory_transaction_api_invalid);
        resourceUriMap.put("inventories_approvemultipletransfer", inventories_approvemultipletransfer);
        resourceUriMap.put("inventories_approvemultipletransfer_invalid", inventories_approvemultipletransfer_invalid);
        resourceUriMap.put("inventories_apigetskuforwarehouse", inventories_apigetskuforwarehouse);
        resourceUriMap.put("inventories_apigetskuforwarehouse_invalid", inventories_apigetskuforwarehouse_invalid);
        resourceUriMap.put("inventories_apigetinventory", inventories_apigetinventory);
        resourceUriMap.put("inventories_getinventoryandskuforware", inventories_getinventoryandskuforware);
        resourceUriMap.put("inventories_getinventoryandskuforware_invalid", inventories_getinventoryandskuforware_invalid);
        resourceUriMap.put("inventories_apigetinventory_invalid", inventories_apigetinventory_invalid);
        resourceUriMap.put("inventories_auditinventorytypes", inventories_auditinventorytypes);
        resourceUriMap.put("inventories_auditinventorytypes_invalid", inventories_auditinventorytypes_invalid);
        resourceUriMap.put("inventories_get_parent_child_inventory_audit_data", inventories_get_parent_child_inventory_audit_data);
        resourceUriMap.put("inventories_get_parent_child_inventory_audit_data_invalid", inventories_get_parent_child_inventory_audit_data_invalid);
        resourceUriMap.put("inventoryapprovals_getinventoryapprovalsapi", inventoryapprovals_getinventoryapprovalsapi);
        resourceUriMap.put("inventoryapprovals_getinventoryapprovalsapi_invalid", inventoryapprovals_getinventoryapprovalsapi_invalid);
        resourceUriMap.put("check_available_inventory", check_available_inventory);
        resourceUriMap.put("check_available_inventory_invalid", check_available_inventory_invalid);
        resourceUriMap.put("check_inventory_audit_valid", check_inventory_audit_valid);
        resourceUriMap.put("check_inventory_audit_valid_invalid", check_inventory_audit_valid_invalid);
        resourceUriMap.put("get_warehouse_inventory", get_warehouse_inventory);
        resourceUriMap.put("get_warehouse_inventory_invalid", get_warehouse_inventory_invalid);
        resourceUriMap.put("list_warehouse_inventory", list_warehouse_inventory);
        resourceUriMap.put("list_warehouse_inventory_invalid", list_warehouse_inventory_invalid);
        resourceUriMap.put("inventories_list_warehouse_inventory_with_pagination", inventories_list_warehouse_inventory_with_pagination);
        resourceUriMap.put("inventories_list_warehouse_inventory_with_pagination_invalid", inventories_list_warehouse_inventory_with_pagination_invalid);
        resourceUriMap.put("inventories_get_warehouse_in_transit_inventories", inventories_get_warehouse_in_transit_inventories);
        resourceUriMap.put("inventories_get_warehouse_in_transit_inventories_invalid", inventories_get_warehouse_in_transit_inventories_invalid);
        resourceUriMap.put("inventories_get_warehouse_inventories", inventories_get_warehouse_inventories);
        resourceUriMap.put("inventories_get_warehouse_inventories_invalid", inventories_get_warehouse_inventories_invalid);
        resourceUriMap.put("inventories_inventory_audit_ajax", inventories_inventory_audit_ajax);
        resourceUriMap.put("inventories_inventory_audit_ajax_invalid", inventories_inventory_audit_ajax_invalid);
        resourceUriMap.put("inventories_transfer_history_api", inventories_transfer_history_api);
        resourceUriMap.put("inventories_transfer_history_api_invalid", inventories_transfer_history_api_invalid);
        resourceUriMap.put("get_all_inventory_types", get_all_inventory_types);
        resourceUriMap.put("get_all_inventory_types_invalid", get_all_inventory_types_invalid);
        resourceUriMap.put("get_all_inventory_types_detail", get_all_inventory_types_detail);
        resourceUriMap.put("get_all_inventory_types_detail_invalid", get_all_inventory_types_detail_invalid);
        resourceUriMap.put("get_auditable_inventory_types", get_auditable_inventory_types);
        resourceUriMap.put("get_auditable_inventory_types_invalid", get_auditable_inventory_types_invalid);
        resourceUriMap.put("get_next_inventory_type", get_next_inventory_type);
        resourceUriMap.put("get_next_inventory_type_invalid", get_next_inventory_type_invalid);
        resourceUriMap.put("get_saleable_inventory_type", get_saleable_inventory_type);
        resourceUriMap.put("get_saleable_inventory_type_invalid", get_saleable_inventory_type_invalid);
        resourceUriMap.put("inventorytypes_index", inventorytypes_index);
        resourceUriMap.put("inventorytypes_index_invalid", inventorytypes_index_invalid);
        resourceUriMap.put("POST_inventorytypes_add", POST_inventorytypes_add);
        resourceUriMap.put("inventorytypes_add_invalid", inventorytypes_add_invalid);
        resourceUriMap.put("POST_inventorytypes_edit", POST_inventorytypes_edit);
        resourceUriMap.put("inventorytypes_edit_invalid", inventorytypes_edit_invalid);
        resourceUriMap.put("POST_influencers_add", POST_influencers_add);
        resourceUriMap.put("influencers_add_invalid", influencers_add_invalid);
        resourceUriMap.put("POST_Deletesale", POST_Deletesale);
        resourceUriMap.put("update_inventory_for_warehouse", update_inventory_for_warehouse);
        resourceUriMap.put("inventories_get_batch_names_for_sku", inventories_get_batch_names_for_sku);
        resourceUriMap.put("inventories_get_batch_names_for_sku_invalid", inventories_get_batch_names_for_sku_invalid);
        resourceUriMap.put("inventories_get_sku_inventory_for_inventory_type", inventories_get_sku_inventory_for_inventory_type);
        resourceUriMap.put("inventories_get_sku_inventory_for_inventory_type_invalid", inventories_get_sku_inventory_for_inventory_type_invalid);
        resourceUriMap.put("ageingoutlets_get_ageing_value_for_outlet", ageingoutlets_get_ageing_value_for_outlet);
        resourceUriMap.put("ageingoutlets_get_ageing_value_for_outlet_invalid", ageingoutlets_get_ageing_value_for_outlet_invalid);
        resourceUriMap.put("aggregatetypes_get_all_aggregate_types", aggregatetypes_get_all_aggregate_types);
        resourceUriMap.put("aggregatetypes_get_all_aggregate_types_invalid", aggregatetypes_get_all_aggregate_types_invalid);
        resourceUriMap.put("aggregatetypes_index", aggregatetypes_index);
        resourceUriMap.put("aggregatetypes_index_invalid", aggregatetypes_index_invalid);
        resourceUriMap.put("list_outlets", list_outlets);
        resourceUriMap.put("collection_data", collection_data);
        resourceUriMap.put("collection_data_negative", collection_data_negative);
        resourceUriMap.put("add_collection_cash", add_collection_cash);
        resourceUriMap.put("add_collection_check", add_collection_check);
        resourceUriMap.put("add_collection_online", add_collection_online);
        resourceUriMap.put("add_collection_background", add_collection_background);
        resourceUriMap.put("cancel_collection_data", cancel_collection_data);
        resourceUriMap.put("cancel_collection_empty", cancel_collection_empty);
        resourceUriMap.put("collections_cancel_collection", collections_cancel_collection);
        resourceUriMap.put("collections_cancel_collection_invalid", collections_cancel_collection_invalid);
        resourceUriMap.put("collections_connect_api_collection_for_user", collections_connect_api_collection_for_user);
        resourceUriMap.put("collections_connect_api_collection_for_user_invalid", collections_connect_api_collection_for_user_invalid);
        resourceUriMap.put("collections_get_pending_invoices", collections_get_pending_invoices);
        resourceUriMap.put("collections_get_pending_invoices_invalid", collections_get_pending_invoices_invalid);
        resourceUriMap.put("collections_get_collections", collections_get_collections);
        resourceUriMap.put("collections_get_collections_invalid", collections_get_collections_invalid);
        resourceUriMap.put("collections_invoice_collection", collections_invoice_collection);
        resourceUriMap.put("collections_invoice_collection_invalid", collections_invoice_collection_invalid);
        resourceUriMap.put("collections_collection_invoice_wise", collections_collection_invoice_wise);
        resourceUriMap.put("collections_collection_invoice_wise_invalid", collections_collection_invoice_wise_invalid);
        resourceUriMap.put("collections_outlet_wise_collection_report", collections_outlet_wise_collection_report);
        resourceUriMap.put("collections_outlet_wise_collection_report_invalid", collections_outlet_wise_collection_report_invalid);
        resourceUriMap.put("collections_approve_cash_transaction", collections_approve_cash_transaction);
        resourceUriMap.put("collections_approve_cash_transaction_invalid", collections_approve_cash_transaction_invalid);
        resourceUriMap.put("collections_approve_online_transaction", collections_approve_online_transaction);
        resourceUriMap.put("collections_approve_online_transaction_invalid", collections_approve_online_transaction_invalid);
        resourceUriMap.put("stock_at_outlet", stock_at_outlet);
        resourceUriMap.put("user_target", user_target);
        resourceUriMap.put("POST_setUserTarget", POST_setUserTarget);
        resourceUriMap.put("POST_addUpdateOutletTargets", POST_addUpdateOutletTargets);
        resourceUriMap.put("postoutletaddageingapi", postoutletaddageingapi);
        resourceUriMap.put("getEditApprovalDataApi", getEditApprovalDataApi);
        resourceUriMap.put("activity_form", activity_form);
        resourceUriMap.put("POST_activities_add", POST_activities_add);
        resourceUriMap.put("POST_activities_add_invalid", POST_activities_add_invalid);
        resourceUriMap.put("activities_userwiseindexdata", activities_userwiseindexdata);
        resourceUriMap.put("activities_userwiseindexdata_invalid", activities_userwiseindexdata_invalid);
        resourceUriMap.put("generic_form", generic_form);
        resourceUriMap.put("custom_outlet_form", custom_outlet_form);
        resourceUriMap.put("list_attendance", list_attendance);
        resourceUriMap.put("attendance_data", attendance_data);
        resourceUriMap.put("loadin_data", loadin_data);
        resourceUriMap.put("POST_loadoutSettle", POST_loadoutSettle);
        resourceUriMap.put("POST_unsettle", POST_unsettle);
        resourceUriMap.put("POST_unsettle_invalid", POST_unsettle_invalid);
        resourceUriMap.put("grn_data", grn_data);
        resourceUriMap.put("grns_get_grn_details", grns_get_grn_details);
        resourceUriMap.put("grns_get_grn_details_invalid", grns_get_grn_details_invalid);
        resourceUriMap.put("getListUsers", getListUsers);
        resourceUriMap.put("users_getusersforrole_id", users_getusersforrole_id);
        resourceUriMap.put("postCreateUsers", postCreateUsers);
        resourceUriMap.put("postCreateUserwithHQ", postCreateUserwithHQ);
        resourceUriMap.put("postEditUser", postEditUser);
        resourceUriMap.put("list_users_positive_withoutPath", list_users_positive_withoutPath);
        resourceUriMap.put("users_getusers_with_id", users_getusers_with_id);
        resourceUriMap.put("users_getusers_with_id_invalid", users_getusers_with_id_invalid);
        resourceUriMap.put("getallcompanyskus", getallcompanyskus);
        resourceUriMap.put("Product_Master_API", Product_Master_API);
        resourceUriMap.put("add_skunits", add_skunits);
        resourceUriMap.put("getBeats", getBeats);
        resourceUriMap.put("beats_checkbeat", beats_checkbeat);
        resourceUriMap.put("beats_checkbeat_invalid", beats_checkbeat_invalid);
        resourceUriMap.put("getbeatsforuser", getbeatsforuser);
        resourceUriMap.put("getbeatsforuser_invalid", getbeatsforuser_invalid);
        resourceUriMap.put("getbeatsforuser_api", getbeatsforuser_api);
        resourceUriMap.put("getbeatsforuser_api_invalid", getbeatsforuser_api_invalid);
        resourceUriMap.put("beats_getuserapplicablebeat", beats_getuserapplicablebeat);
        resourceUriMap.put("beats_getuserapplicablebeat_invalid", beats_getuserapplicablebeat_invalid);
        resourceUriMap.put("getbeatsforareas", getbeatsforareas);
        resourceUriMap.put("getbeatsforareas_invalid", getbeatsforareas_invalid);
        resourceUriMap.put("active_inactive_beat", active_inactive_beat);
        resourceUriMap.put("active_inactive_beat_invalid", active_inactive_beat_invalid);
        resourceUriMap.put("endofdayreports_endofday", endofdayreports_endofday);
        resourceUriMap.put("endofdayreports_endofday_invalid", endofdayreports_endofday_invalid);
        resourceUriMap.put("endofdayreports_get_distance_of_user", endofdayreports_get_distance_of_user);
        resourceUriMap.put("endofdayreports_get_distance_of_user_invalid", endofdayreports_get_distance_of_user_invalid);
        resourceUriMap.put("endofdayreports_get_end_of_days", endofdayreports_get_end_of_days);
        resourceUriMap.put("endofdayreports_get_end_of_days_invalid", endofdayreports_get_end_of_days_invalid);
        resourceUriMap.put("endofdayreports_update_eod_distance", endofdayreports_update_eod_distance);
        resourceUriMap.put("endofdayreports_update_eod_distance_invalid", endofdayreports_update_eod_distance_invalid);
        resourceUriMap.put("endofdayreports_mail_orders_to_distributors", endofdayreports_mail_orders_to_distributors);
        resourceUriMap.put("endofdayreports_mail_orders_to_distributors_invalid", endofdayreports_mail_orders_to_distributors_invalid);
        resourceUriMap.put("incentiveconfigurations_get_incentive_configurations_for_outlet", incentiveconfigurations_get_incentive_configurations_for_outlet);
        resourceUriMap.put("incentiveconfigurations_get_incentive_configurations_for_outlet_invalid", incentiveconfigurations_get_incentive_configurations_for_outlet_invalid);
        resourceUriMap.put("enrolledoutlets_get_enrolled_outlets_for_user", enrolledoutlets_get_enrolled_outlets_for_user);
        resourceUriMap.put("enrolledoutlets_get_enrolled_outlets_for_user_invalid", enrolledoutlets_get_enrolled_outlets_for_user_invalid);
        resourceUriMap.put("entitywiseproperties_get_all_properties_options_api", entitywiseproperties_get_all_properties_options_api);
        resourceUriMap.put("entitywiseproperties_get_all_properties_options_api_invalid", entitywiseproperties_get_all_properties_options_api_invalid);
        resourceUriMap.put("entitywiseproperties_get_properties", entitywiseproperties_get_properties);
        resourceUriMap.put("entitywiseproperties_get_properties_invalid", entitywiseproperties_get_properties_invalid);
        resourceUriMap.put("entitywiseproperties_get_entity_type_properties", entitywiseproperties_get_entity_type_properties);
        resourceUriMap.put("entitywiseproperties_get_entity_type_properties_invalid", entitywiseproperties_get_entity_type_properties_invalid);
        resourceUriMap.put("entitywiseproperties_get_property_options", entitywiseproperties_get_property_options);
        resourceUriMap.put("entitywiseproperties_get_property_options_invalid", entitywiseproperties_get_property_options_invalid);
        resourceUriMap.put("entitywiseproperties_get_property_type", entitywiseproperties_get_property_type);
        resourceUriMap.put("entitywiseproperties_get_property_type_invalid", entitywiseproperties_get_property_type_invalid);
        resourceUriMap.put("entitytags_get_type_wise_data", entitytags_get_type_wise_data);
        resourceUriMap.put("entitytags_get_type_wise_data_invalid", entitytags_get_type_wise_data_invalid);
        resourceUriMap.put("POST_EditTag", POST_tags_edit);
        resourceUriMap.put("POST_EditTag_invalid", POST_tags_edit_invalid);
        resourceUriMap.put("backgroundprocesses_process_detail_list", backgroundprocesses_process_detail_list);
        resourceUriMap.put("backgroundprocesses_process_detail_list_invalid", backgroundprocesses_process_detail_list_invalid);
        resourceUriMap.put("beatjumps_approval_list", beatjumps_approval_list);
        resourceUriMap.put("beatjumps_approval_list_invalid", beatjumps_approval_list_invalid);
        resourceUriMap.put("beatjumps_beatjump_for_approval", beatjumps_beatjump_for_approval);
        resourceUriMap.put("beatjumps_beatjump_for_approval_invalid", beatjumps_beatjump_for_approval_invalid);
        resourceUriMap.put("getoutlets_by_id", getoutlets_by_id);
        resourceUriMap.put("getoutlets_by_id_invalid", getoutlets_by_id_invalid);
        resourceUriMap.put("getoutletsforbeat_by_id", getoutletsforbeat_by_id);
        resourceUriMap.put("getoutletsforbeat_by_id_invalid", getoutletsforbeat_by_id_invalid);
        resourceUriMap.put("getoutletsforbeataccseq_by_id", getoutletsforbeataccseq_by_id);
        resourceUriMap.put("getoutletsforbeataccseq_by_id_invalid", getoutletsforbeataccseq_by_id_invalid);
        resourceUriMap.put("getbeatmapoutelts_by_id", getbeatmapoutelts_by_id);
        resourceUriMap.put("get_area_for_beat", get_area_for_beat);
        resourceUriMap.put("get_area_for_beat_invalid", get_area_for_beat_invalid);
        resourceUriMap.put("get_assigned_beats_for_users", get_assigned_beats_for_users);
        resourceUriMap.put("get_assigned_beats_for_users_invalid", get_assigned_beats_for_users_invalid);
        resourceUriMap.put("get_beat_wise_areas", get_beat_wise_areas);
        resourceUriMap.put("get_beat_wise_areas_invalid", get_beat_wise_areas_invalid);
        resourceUriMap.put("get_beat_detail_by_name", get_beat_detail_by_name);
        resourceUriMap.put("get_beat_detail_by_name_invalid", get_beat_detail_by_name_invalid);
        resourceUriMap.put("get_all_active_inactive_beat", get_all_active_inactive_beat);
        resourceUriMap.put("get_all_active_inactive_beat_invalid", get_all_active_inactive_beat_invalid);
        resourceUriMap.put("beats_checkactiveoutletsforbeats", beats_checkactiveoutletsforbeats);
        resourceUriMap.put("beats_checkactiveoutletsforbeats_invalid", beats_checkactiveoutletsforbeats_invalid);
        resourceUriMap.put("beatdetails_apply_approval_changes", beatdetails_apply_approval_changes);
        resourceUriMap.put("beatdetails_apply_approval_changes_invalid", beatdetails_apply_approval_changes_invalid);
        resourceUriMap.put("benefit_capping_masters_index_api", benefit_capping_masters_index_api);
        resourceUriMap.put("benefit_capping_masters_index_api_invalid", benefit_capping_masters_index_api_invalid);
        resourceUriMap.put("benefit_capping_masters_index_api_new", benefit_capping_masters_index_api_new);
        resourceUriMap.put("benefit_capping_masters_index_api_new_invalid", benefit_capping_masters_index_api_new_invalid);
        resourceUriMap.put("benefitcappings_indexapi", benefitcappings_indexapi);
        resourceUriMap.put("benefitcappings_indexapi_invalid", benefitcappings_indexapi_invalid);
        resourceUriMap.put("benefitcappings_getuserunderuserforbenefitcapping", benefitcappings_getuserunderuserforbenefitcapping);
        resourceUriMap.put("benefitcappings_getuserunderuserforbenefitcapping_invalid", benefitcappings_getuserunderuserforbenefitcapping_invalid);
        resourceUriMap.put("benefitcappings_getreportingtouserforbenefitcapping", benefitcappings_getreportingtouserforbenefitcapping);
        resourceUriMap.put("benefitcappings_getreportingtouserforbenefitcapping_invalid", benefitcappings_getreportingtouserforbenefitcapping_invalid);
        resourceUriMap.put("benefitcappingplans_viewcappingplanapi", benefitcappingplans_viewcappingplanapi);
        resourceUriMap.put("benefitcappingplans_viewcappingplanapi_invalid", benefitcappingplans_viewcappingplanapi_invalid);
        resourceUriMap.put("benefitcappingplans_cappingplanapprovalapi", benefitcappingplans_cappingplanapprovalapi);
        resourceUriMap.put("benefitcappingplans_cappingplanapprovalapi_invalid", benefitcappingplans_cappingplanapprovalapi_invalid);
        resourceUriMap.put("benefitcappingplans_approverejectmultiple", benefitcappingplans_approverejectmultiple);
        resourceUriMap.put("benefitcappingplans_approverejectmultiple_invalid", benefitcappingplans_approverejectmultiple_invalid);
        resourceUriMap.put("getbeatmapoutelts_by_id_invalid", getbeatmapoutelts_by_id_invalid);
        resourceUriMap.put("claimlimitconfigurations_indexapi", claimlimitconfigurations_indexapi);
        resourceUriMap.put("claimlimitconfigurations_indexapi_invalid", claimlimitconfigurations_indexapi_invalid);
        resourceUriMap.put("customreports_apibilledoutlets", customreports_apibilledoutlets);
        resourceUriMap.put("customreports_apibilledoutlets_invalid", customreports_apibilledoutlets_invalid);
        resourceUriMap.put("customreports_apicallsmade", customreports_apicallsmade);
        resourceUriMap.put("customreports_apicallsmade_invalid", customreports_apicallsmade_invalid);
        resourceUriMap.put("customreports_apimtdreport", customreports_apimtdreport);
        resourceUriMap.put("customreports_apimtdreport_invalid", customreports_apimtdreport_invalid);
        resourceUriMap.put("customreports_apisalesorderreport", customreports_apisalesorderreport);
        resourceUriMap.put("customreports_apisalesorderreport_invalid", customreports_apisalesorderreport_invalid);
        resourceUriMap.put("customreports_getordersstats", customreports_getordersstats);
        resourceUriMap.put("customreports_getordersstats_invalid", customreports_getordersstats_invalid);
        resourceUriMap.put("customreports_getbrandsjson", customreports_getbrandsjson);
        resourceUriMap.put("customreports_getbrandsjson_invalid", customreports_getbrandsjson_invalid);
        resourceUriMap.put("customreports_getusersjson", customreports_getusersjson);
        resourceUriMap.put("customreports_getusersjson_invalid", customreports_getusersjson_invalid);
        resourceUriMap.put("customreports_hierarchyreport", customreports_hierarchyreport);
        resourceUriMap.put("customreports_hierarchyreport_invalid", customreports_hierarchyreport_invalid);
        resourceUriMap.put("customreports_usertrackinggraphicreport", customreports_usertrackinggraphicreport);
        resourceUriMap.put("customreports_usertrackinggraphicreport_invalid", customreports_usertrackinggraphicreport_invalid);
        resourceUriMap.put("customreports_usertrackingreport", customreports_usertrackingreport);
        resourceUriMap.put("customreports_usertrackingreport_invalid", customreports_usertrackingreport_invalid);
        resourceUriMap.put("customreports_trafficlightdashboardparams", customreports_trafficlightdashboardparams);
        resourceUriMap.put("customreports_trafficlightdashboardparams_invalid", customreports_trafficlightdashboardparams_invalid);
        resourceUriMap.put("reportgroups_index", reportgroups_index);
        resourceUriMap.put("reportgroups_index_invalid", reportgroups_index_invalid);
        resourceUriMap.put("reportgroups_get_erp_groups", reportgroups_get_erp_groups);
        resourceUriMap.put("reportgroups_get_erp_groups_invalid", reportgroups_get_erp_groups_invalid);
        resourceUriMap.put("reportmappings_get_report_urls", reportmappings_get_report_urls);
        resourceUriMap.put("reportmappings_get_report_urls_invalid", reportmappings_get_report_urls_invalid);
        resourceUriMap.put("reports_get_beat_performance", reports_get_beat_performance);
        resourceUriMap.put("reports_get_beat_performance_invalid", reports_get_beat_performance_invalid);
        resourceUriMap.put("reports_performance_report", reports_performance_report);
        resourceUriMap.put("reports_performance_report_invalid", reports_performance_report_invalid);
        resourceUriMap.put("reports_compliance_report", reports_compliance_report);
        resourceUriMap.put("reports_compliance_report_invalid", reports_compliance_report_invalid);
        resourceUriMap.put("reports_get_order", reports_get_order);
        resourceUriMap.put("reports_get_order_invalid", reports_get_order_invalid);
        resourceUriMap.put("reports_get_order_achievement", reports_get_order_achievement);
        resourceUriMap.put("reports_get_order_achievement_invalid", reports_get_order_achievement_invalid);
        resourceUriMap.put("reports_outletwise_orders_with_date", reports_outletwise_orders_with_date);
        resourceUriMap.put("reports_outletwise_orders_with_date_invalid", reports_outletwise_orders_with_date_invalid);
        resourceUriMap.put("reports_outletwise_payments_with_date", reports_outletwise_payments_with_date);
        resourceUriMap.put("reports_outletwise_payments_with_date_invalid", reports_outletwise_payments_with_date_invalid);
        resourceUriMap.put("reports_oxynew_call_download", reports_oxynew_call_download);
        resourceUriMap.put("reports_oxynew_call_download_invalid", reports_oxynew_call_download_invalid);
        resourceUriMap.put("reports_traffic_light_dashboard_report", reports_traffic_light_dashboard_report);
        resourceUriMap.put("reports_traffic_light_dashboard_report_invalid", reports_traffic_light_dashboard_report_invalid);
        resourceUriMap.put("reports_visited_productive_not_visited_data", reports_visited_productive_not_visited_data);
        resourceUriMap.put("reports_visited_productive_not_visited_data_invalid", reports_visited_productive_not_visited_data_invalid);
        resourceUriMap.put("GET_planfeed", GET_planfeed);
        resourceUriMap.put("GET_planfeed_invalid", GET_planfeed_invalid);
        resourceUriMap.put("GET_getTourBudget", GET_getTourBudget);
        resourceUriMap.put("GET_getTourBudget_invalid", GET_getTourBudget_invalid);
        resourceUriMap.put("POST_budgetValidation", POST_budgetValidation);
        resourceUriMap.put("POST_budgetValidation_invalid", POST_budgetValidation_invalid);
        resourceUriMap.put("GET_approveTourBudget", GET_approveTourBudget);
        resourceUriMap.put("GET_approveTourBudget_invalid", GET_approveTourBudget_invalid);
        resourceUriMap.put("salemansalesreturns_get_sales_return", salemansalesreturns_get_sales_return);
        resourceUriMap.put("salemansalesreturns_get_sales_return_invalid", salemansalesreturns_get_sales_return_invalid);
        resourceUriMap.put("salemansalesreturns_get_sales_return_reason", salemansalesreturns_get_sales_return_reason);
        resourceUriMap.put("salemansalesreturns_get_sales_return_reason_invalid", salemansalesreturns_get_sales_return_reason_invalid);
        resourceUriMap.put("salemansalesreturns_sale_returns", salemansalesreturns_sale_returns);
        resourceUriMap.put("salemansalesreturns_sale_returns_invalid", salemansalesreturns_sale_returns_invalid);
        resourceUriMap.put("salemansalesreturns_connectapigetsalereturnforuser", salemansalesreturns_connectapigetsalereturnforuser);
        resourceUriMap.put("salemansalesreturns_connectapigetsalereturnforuser_invalid", salemansalesreturns_connectapigetsalereturnforuser_invalid);
        resourceUriMap.put("salemansalesreturns_cancelsalereturn", salemansalesreturns_cancelsalereturn);
        resourceUriMap.put("salemansalesreturns_cancelsalereturn_invalid", salemansalesreturns_cancelsalereturn_invalid);
        resourceUriMap.put("inventories_get_searched_sku_data", inventories_get_searched_sku_data);
        resourceUriMap.put("inventories_get_searched_sku_data_invalid", inventories_get_searched_sku_data_invalid);
        resourceUriMap.put("inventories_showstocktransfersbycondition", inventories_showstocktransfersbycondition);
        resourceUriMap.put("inventories_showstocktransfersbycondition_invalid", inventories_showstocktransfersbycondition_invalid);
        resourceUriMap.put("inventories_updatealertlevel", inventories_updatealertlevel);
        resourceUriMap.put("inventories_updatealertlevel_invalid", inventories_updatealertlevel_invalid);
        resourceUriMap.put("salereturnapprovalconfigurations_get_approval_configurations", salereturnapprovalconfigurations_get_approval_configurations);
        resourceUriMap.put("salereturnapprovalconfigurations_get_approval_configurations_invalid", salereturnapprovalconfigurations_get_approval_configurations_invalid);
        resourceUriMap.put("hierarchies_gethierarchies", hierarchies_gethierarchies);
        resourceUriMap.put("hierarchies_gethierarchies_invalid", hierarchies_gethierarchies_invalid);
        resourceUriMap.put("headquarters_suggestions", headquarters_suggestions);
        resourceUriMap.put("headquarters_suggestions_invalid", headquarters_suggestions_invalid);
        resourceUriMap.put("headquarters_add", headquarters_add);
        resourceUriMap.put("headquarters_add_invalid", headquarters_add_invalid);
        resourceUriMap.put("tourbudgets_get_beats_for_reportee", tourbudgets_get_beats_for_reportee);
        resourceUriMap.put("tourbudgets_get_beats_for_reportee_invalid", tourbudgets_get_beats_for_reportee_invalid);
        resourceUriMap.put("tourbudgets_get_reportee_for_warehouses", tourbudgets_get_reportee_for_warehouses);
        resourceUriMap.put("tourbudgets_get_reportee_for_warehouses_invalid", tourbudgets_get_reportee_for_warehouses_invalid);
        resourceUriMap.put("tourbudgets_get_repetition_budget", tourbudgets_get_repetition_budget);
        resourceUriMap.put("tourbudgets_get_repetition_budget_invalid", tourbudgets_get_repetition_budget_invalid);
        resourceUriMap.put("tourbudgets_get_pcp_details_by_user_and_date", tourbudgets_get_pcp_details_by_user_and_date);
        resourceUriMap.put("tourbudgets_get_pcp_details_by_user_and_date_invalid", tourbudgets_get_pcp_details_by_user_and_date_invalid);
        resourceUriMap.put("tourbudgets_get_tour_types_api", tourbudgets_get_tour_types_api);
        resourceUriMap.put("tourbudgets_get_tour_types_api_invalid", tourbudgets_get_tour_types_api_invalid);
        resourceUriMap.put("tourbudgets_get_assignee_datas", tourbudgets_get_assignee_datas);
        resourceUriMap.put("tourbudgets_get_assignee_datas_invalid", tourbudgets_get_assignee_datas_invalid);
        resourceUriMap.put("tourbudgets_index_api", tourbudgets_index_api);
        resourceUriMap.put("tourbudgets_index_api_invalid", tourbudgets_index_api_invalid);
        resourceUriMap.put("tourbudgets_edit_budget", tourbudgets_edit_budget);
        resourceUriMap.put("tourbudgets_edit_budget_invalid", tourbudgets_edit_budget_invalid);
        resourceUriMap.put("dashboards_orglevelnames", dashboards_orglevelnames);
        resourceUriMap.put("dashboards_orglevelnames_invalid", dashboards_orglevelnames_invalid);
        resourceUriMap.put("dashboards_orgnisationhierarchy", dashboards_orgnisationhierarchy);
        resourceUriMap.put("dashboards_orgnisationhierarchy_invalid", dashboards_orgnisationhierarchy_invalid);
        resourceUriMap.put("distributortransfers_index", distributortransfers_index);
        resourceUriMap.put("distributortransfers_index_invalid", distributortransfers_index_invalid);
        resourceUriMap.put("deliveryshifts_index", deliveryshifts_index);
        resourceUriMap.put("deliveryshifts_index_invalid", deliveryshifts_index_invalid);
        resourceUriMap.put("deliverychallans_getavailableskudcinventorybypaymentid", deliverychallans_getavailableskudcinventorybypaymentid);
        resourceUriMap.put("deliverychallans_getavailableskudcinventorybypaymentid_invalid", deliverychallans_getavailableskudcinventorybypaymentid_invalid);
        resourceUriMap.put("deliverychallans_indexapi", deliverychallans_indexapi);
        resourceUriMap.put("deliverychallans_indexapi_invalid", deliverychallans_indexapi_invalid);
        resourceUriMap.put("deliverychallanstates_getdeliverychallanstates", deliverychallanstates_getdeliverychallanstates);
        resourceUriMap.put("deliverychallanstates_getdeliverychallanstates_invalid", deliverychallanstates_getdeliverychallanstates_invalid);
        resourceUriMap.put("deliverychallanstates_index", deliverychallanstates_index);
        resourceUriMap.put("deliverychallanstates_index_invalid", deliverychallanstates_index_invalid);
        resourceUriMap.put("deliverychallantypes_getdeliverychallantypes", deliverychallantypes_getdeliverychallantypes);
        resourceUriMap.put("deliverychallantypes_getdeliverychallantypes_invalid", deliverychallantypes_getdeliverychallantypes_invalid);
        resourceUriMap.put("deliverychallantypes_indexapi", deliverychallantypes_indexapi);
        resourceUriMap.put("deliverychallantypes_indexapi_invalid", deliverychallantypes_indexapi_invalid);
        resourceUriMap.put("ewaybills_getwarehouselist", ewaybills_getwarehouselist);
        resourceUriMap.put("ewaybills_getwarehouselist_invalid", ewaybills_getwarehouselist_invalid);
        resourceUriMap.put("ewaybills_checkactiveewaybillbypaymentid", ewaybills_checkactiveewaybillbypaymentid);
        resourceUriMap.put("ewaybills_checkactiveewaybillbypaymentid_invalid", ewaybills_checkactiveewaybillbypaymentid_invalid);
        resourceUriMap.put("ewaybills_checkactiveewaybillbyvaliditypaymentid", ewaybills_checkactiveewaybillbyvaliditypaymentid);
        resourceUriMap.put("ewaybills_checkactiveewaybillbyvaliditypaymentid_invalid", ewaybills_checkactiveewaybillbyvaliditypaymentid_invalid);
        resourceUriMap.put("ewaybills_getdetails", ewaybills_getdetails);
        resourceUriMap.put("ewaybills_getdetails_invalid", ewaybills_getdetails_invalid);
        resourceUriMap.put("onlineinvoices_getwarehouselist", onlineinvoices_getwarehouselist);
        resourceUriMap.put("onlineinvoices_getwarehouselist_invalid", onlineinvoices_getwarehouselist_invalid);
        resourceUriMap.put("onlineinvoices_getrequestlogs", onlineinvoices_getrequestlogs);
        resourceUriMap.put("onlineinvoices_getrequestlogs_invalid", onlineinvoices_getrequestlogs_invalid);
        resourceUriMap.put("onlineinvoices_editcredentials", onlineinvoices_editcredentials);
        resourceUriMap.put("onlineinvoices_editcredentials_invalid", onlineinvoices_editcredentials_invalid);
        resourceUriMap.put("onlinenepalinvoices_editcredentials", onlinenepalinvoices_editcredentials);
        resourceUriMap.put("onlinenepalinvoices_editcredentials_invalid", onlinenepalinvoices_editcredentials_invalid);
        resourceUriMap.put("noduecertificates_getsprintdetails", noduecertificates_getsprintdetails);
        resourceUriMap.put("noduecertificates_getsprintdetails_invalid", noduecertificates_getsprintdetails_invalid);
        resourceUriMap.put("noduecertificates_getsprintdetails_with_params", noduecertificates_getsprintdetails_with_params);
        resourceUriMap.put("noduecertificates_getsprintdetails_with_params_invalid", noduecertificates_getsprintdetails_with_params_invalid);
        resourceUriMap.put("noduecertificates_getdocuments", noduecertificates_getdocuments);
        resourceUriMap.put("noduecertificates_getdocuments_invalid", noduecertificates_getdocuments_invalid);
        resourceUriMap.put("grns_getmygrnsapi", grns_getmygrnsapi);
        resourceUriMap.put("grns_getmygrnsapi_invalid", grns_getmygrnsapi_invalid);
        resourceUriMap.put("games_getmeasures", games_getmeasures);
        resourceUriMap.put("games_getmeasures_invalid", games_getmeasures_invalid);
        resourceUriMap.put("games_getgamedetail", games_getgamedetail);
        resourceUriMap.put("games_getgamedetail_invalid", games_getgamedetail_invalid);
        resourceUriMap.put("games_getscore", games_getscore);
        resourceUriMap.put("games_getscore_invalid", games_getscore_invalid);
        resourceUriMap.put("designations_getdesignations", designations_getdesignations);
        resourceUriMap.put("designations_getdesignations_invalid", designations_getdesignations_invalid);
        resourceUriMap.put("designations_index", designations_index);
        resourceUriMap.put("designations_index_invalid", designations_index_invalid);
        resourceUriMap.put("shifts_ajaxindexnew", shifts_ajaxindexnew);
        resourceUriMap.put("shifts_ajaxindexnew_invalid", shifts_ajaxindexnew_invalid);
        resourceUriMap.put("shifttimings_ajaxindexnew", shifttimings_ajaxindexnew);
        resourceUriMap.put("shifttimings_ajaxindexnew_invalid", shifttimings_ajaxindexnew_invalid);
        resourceUriMap.put("depomargins_index", depomargins_index);
        resourceUriMap.put("depomargins_index_invalid", depomargins_index_invalid);
        resourceUriMap.put("POST_saveMultipleDepomargins", POST_saveMultipleDepomargins);
        resourceUriMap.put("POST_saveMultipleDepomargins_invalid", POST_saveMultipleDepomargins_invalid);
        resourceUriMap.put("segmentchangerequests_indexapi", segmentchangerequests_indexapi);
        resourceUriMap.put("segmentchangerequests_indexapi_invalid", segmentchangerequests_indexapi_invalid);
        resourceUriMap.put("invoicerequests_index", invoicerequests_index);
        resourceUriMap.put("invoicerequests_index_invalid", invoicerequests_index_invalid);
        resourceUriMap.put("invoicetemplatemappings_index", invoicetemplatemappings_index);
        resourceUriMap.put("invoicetemplatemappings_index_invalid", invoicetemplatemappings_index_invalid);
        resourceUriMap.put("invoicetemplatemappings_edit", invoicetemplatemappings_edit);
        resourceUriMap.put("invoicetemplatemappings_edit_invalid", invoicetemplatemappings_edit_invalid);
        resourceUriMap.put("invoiceforms_getinvoiceforms", invoiceforms_getinvoiceforms);
        resourceUriMap.put("invoiceforms_getinvoiceforms_invalid", invoiceforms_getinvoiceforms_invalid);
        resourceUriMap.put("get_languages", get_languages);
        resourceUriMap.put("get_languages_invalid", get_languages_invalid);
        resourceUriMap.put("languages_ajaxindexnew", languages_ajaxindexnew);
        resourceUriMap.put("languages_ajaxindexnew_invalid", languages_ajaxindexnew_invalid);
        resourceUriMap.put("get_leave_types", get_leave_types);
        resourceUriMap.put("get_leave_types_invalid", get_leave_types_invalid);
        resourceUriMap.put("get_loadins_api", get_loadins_api);
        resourceUriMap.put("get_loadins_api_invalid", get_loadins_api_invalid);
        resourceUriMap.put("get_user_loadin_info", get_user_loadin_info);
        resourceUriMap.put("get_user_loadin_info_invalid", get_user_loadin_info_invalid);
        resourceUriMap.put("get_user_loadin_info_web", get_user_loadin_info_web);
        resourceUriMap.put("get_user_loadin_info_web_invalid", get_user_loadin_info_web_invalid);
        resourceUriMap.put("get_loadin_info", get_loadin_info);
        resourceUriMap.put("get_loadin_info_invalid", get_loadin_info_invalid);
        resourceUriMap.put("loadouts_getbatchestoaddloadout", loadouts_getbatchestoaddloadout);
        resourceUriMap.put("loadouts_getbatchestoaddloadout_invalid", loadouts_getbatchestoaddloadout_invalid);
        resourceUriMap.put("loadouts_isloadoutsettled", loadouts_isloadoutsettled);
        resourceUriMap.put("loadouts_isloadoutsettled_invalid", loadouts_isloadoutsettled_invalid);
        resourceUriMap.put("loadouts_getloadoutforusers", loadouts_getloadoutforusers);
        resourceUriMap.put("loadouts_getloadoutforusers_invalid", loadouts_getloadoutforusers_invalid);
        resourceUriMap.put("GET_bulkSettle", GET_bulkSettle);
        resourceUriMap.put("GET_bulkSettle_invalid", GET_bulkSettle_invalid);
        resourceUriMap.put("GET_reporteeUsers", GET_reporteeUsers);
        resourceUriMap.put("GET_reporteeUsers_invalid", GET_reporteeUsers_invalid);
        resourceUriMap.put("loadoutsheets_get_loadoutsheet_datas", loadoutsheets_get_loadoutsheet_datas);
        resourceUriMap.put("loadoutsheets_get_loadoutsheet_datas_invalid", loadoutsheets_get_loadoutsheet_datas_invalid);
        resourceUriMap.put("loadoutsheets_user_loadsheet_data", loadoutsheets_user_loadsheet_data);
        resourceUriMap.put("loadoutsheets_user_loadsheet_data_invalid", loadoutsheets_user_loadsheet_data_invalid);
        resourceUriMap.put("POST_findDetailsByBillOrLoadsheet", POST_findDetailsByBillOrLoadsheet);
        resourceUriMap.put("POST_findDetailsByBillOrLoadsheet_invalid", POST_findDetailsByBillOrLoadsheet_invalid);
        resourceUriMap.put("POST_markLoadsheetDispatch", POST_markLoadsheetDispatch);
        resourceUriMap.put("POST_markLoadsheetDispatch_invalid", POST_markLoadsheetDispatch_invalid);
        resourceUriMap.put("manageroles_getusers", manageroles_getusers);
        resourceUriMap.put("manageroles_getusers_invalid", manageroles_getusers_invalid);
        resourceUriMap.put("manageroles_get_role_acc_warehouse_details", manageroles_get_role_acc_warehouse_details);
        resourceUriMap.put("manageroles_get_role_acc_warehouse_details_invalid", manageroles_get_role_acc_warehouse_details_invalid);
        resourceUriMap.put("get_all_mappings", get_all_mappings);
        resourceUriMap.put("get_all_mappings_invalid", get_all_mappings_invalid);
        resourceUriMap.put("all_mdms", all_mdms);
        resourceUriMap.put("all_mdms_invalid", all_mdms_invalid);
        resourceUriMap.put("all_tables", all_tables);
        resourceUriMap.put("all_tables_invalid", all_tables_invalid);
        resourceUriMap.put("mdms_categories", mdms_categories);
        resourceUriMap.put("mdms_categories_invalid", mdms_categories_invalid);
        resourceUriMap.put("get_mdm_detail", get_mdm_detail);
        resourceUriMap.put("get_mdm_detail_invalid", get_mdm_detail_invalid);
        resourceUriMap.put("get_mdm", get_mdm);
        resourceUriMap.put("get_mdm_invalid", get_mdm_invalid);
        resourceUriMap.put("mdms_foreign_keys_in_table", mdms_foreign_keys_in_table);
        resourceUriMap.put("mdms_foreign_keys_in_table_invalid", mdms_foreign_keys_in_table_invalid);
        resourceUriMap.put("mdms_status", mdms_status);
        resourceUriMap.put("mdms_status_invalid", mdms_status_invalid);
        resourceUriMap.put("mdms_getupdate", mdms_getupdate);
        resourceUriMap.put("mdms_getupdate_invalid", mdms_getupdate_invalid);
        resourceUriMap.put("mdms_getupdate_with_params", mdms_getupdate_with_params);
        resourceUriMap.put("mdms_getupdate_with_params_invalid", mdms_getupdate_with_params_invalid);
        resourceUriMap.put("mdms_getsingularise_table_name", mdms_getsingularise_table_name);
        resourceUriMap.put("mdms_getsingularise_table_name_invalid", mdms_getsingularise_table_name_invalid);
        resourceUriMap.put("menus_get", menus_get);
        resourceUriMap.put("menus_get_invalid", menus_get_invalid);
        resourceUriMap.put("menus_get_configure_menus", menus_get_configure_menus);
        resourceUriMap.put("menus_get_configure_menus_invalid", menus_get_configure_menus_invalid);
        resourceUriMap.put("GET_GetMenuForSellingPoint", menus_getmenuforsellingpoint);
        resourceUriMap.put("GET_GetMenuForSellingPoint_invalid", menus_getmenuforsellingpoint_invalid);
        resourceUriMap.put("merchandisingshelftypes_index", merchandisingshelftypes_index);
        resourceUriMap.put("merchandisingshelftypes_index_invalid", merchandisingshelftypes_index_invalid);
        resourceUriMap.put("segments_indexapi", segments_indexapi);
        resourceUriMap.put("segments_indexapi_invalid", segments_indexapi_invalid);
        resourceUriMap.put("segments_get_segments", segments_get_segments);
        resourceUriMap.put("segments_get_segments_invalid", segments_get_segments_invalid);
        resourceUriMap.put("segments_get_configurations", segments_get_configurations);
        resourceUriMap.put("segments_get_configurations_invalid", segments_get_configurations_invalid);
        resourceUriMap.put("segmentrules_index_api", segmentrules_index_api);
        resourceUriMap.put("segmentrules_index_api_invalid", segmentrules_index_api_invalid);
        resourceUriMap.put("segmentrules_get_supported_entities", segmentrules_get_supported_entities);
        resourceUriMap.put("segmentrules_get_supported_entities_invalid", segmentrules_get_supported_entities_invalid);
        resourceUriMap.put("segmentrules_get_segment_rule_configuration_for_beat", segmentrules_get_segment_rule_configuration_for_beat);
        resourceUriMap.put("segmentrules_get_segment_rule_configuration_for_beat_invalid", segmentrules_get_segment_rule_configuration_for_beat_invalid);
        resourceUriMap.put("schemetradetypemasters_index", schemetradetypemasters_index);
        resourceUriMap.put("schemetradetypemasters_index_invalid", schemetradetypemasters_index_invalid);
        resourceUriMap.put("msls_get_achievement_for_msl", msls_get_achievement_for_msl);
        resourceUriMap.put("msls_get_achievement_for_msl_invalid", msls_get_achievement_for_msl_invalid);
        resourceUriMap.put("msls_index", msls_index);
        resourceUriMap.put("msls_index_invalid", msls_index_invalid);
        resourceUriMap.put("msls_assign", msls_assign);
        resourceUriMap.put("msls_assign_invalid", msls_assign_invalid);
        resourceUriMap.put("msls_get_msl_assigned_data", msls_get_msl_assigned_data);
        resourceUriMap.put("msls_get_msl_assigned_data_invalid", msls_get_msl_assigned_data_invalid);
        resourceUriMap.put("getbeatsforzone_by_id", getbeatsforzone_by_id);
        resourceUriMap.put("getbeatsforzone_by_id_invalid", getbeatsforzone_by_id_invalid);
        resourceUriMap.put("apigetmybids", apigetmybids);
        resourceUriMap.put("apigetmybids_invalid", apigetmybids_invalid);
        resourceUriMap.put("businesstypelist", businesstypelist);
        resourceUriMap.put("businesstypelist_invalid", businesstypelist_invalid);
        resourceUriMap.put("getbusinesstypes", getbusinesstypes);
        resourceUriMap.put("getbusinesstypes_invalid", getbusinesstypes_invalid);
        resourceUriMap.put("getapprovers", getapprovers);
        resourceUriMap.put("getapprovers_invalid", getapprovers_invalid);
        resourceUriMap.put("getreporteelist", getreporteelist);
        resourceUriMap.put("getreporteelist_invalid", getreporteelist_invalid);
        resourceUriMap.put("getreportees", getreportees);
        resourceUriMap.put("getreportees_invalid", getreportees_invalid);
        resourceUriMap.put("beattypes_index", beattypes_index);
        resourceUriMap.put("beattypes_index_invalid", beattypes_index_invalid);
        resourceUriMap.put("businessunits_index", businessunits_index);
        resourceUriMap.put("businessunits_index_invalid", businessunits_index_invalid);
        resourceUriMap.put("claimapprovals_index", claimapprovals_index);
        resourceUriMap.put("claimapprovals_index_invalid", claimapprovals_index_invalid);
        resourceUriMap.put("getbeatwiseDashboard", getbeatwiseDashboard);
        resourceUriMap.put("postCreateBeat", postCreateBeat);
        resourceUriMap.put("postRemoveBeat", postRemoveBeat);
        resourceUriMap.put("getLoadouts", getLoadouts);
        resourceUriMap.put("getListLoadsheets", getListLoadsheets);
        resourceUriMap.put("getListLoadsheets_NoParams", getListLoadsheets_NoParams);
        resourceUriMap.put("postApproveLoadouts", postApproveLoadouts);
        resourceUriMap.put("POST_approveAllLoadout", POST_approveAllLoadout);
        resourceUriMap.put("postApproveLoadouts_invalid", postApproveLoadouts_invalid);
        resourceUriMap.put("POST_approveAllLoadout_invalid", POST_approveAllLoadout_invalid);
        resourceUriMap.put("POST_LoadoutsAutoRejectInTransit", POST_LoadoutsAutoRejectInTransit);
        resourceUriMap.put("getUserCustomFields", getUserCustomFields);
        resourceUriMap.put("getUserCustomFields_NoParams", getUserCustomFields_NoParams);
        resourceUriMap.put("getPjp", getPjp);
        resourceUriMap.put("postUploadPjp", postUploadPjp);
        resourceUriMap.put("getGenericData", getGenericData);
        resourceUriMap.put("getCountries", getCountries);
        resourceUriMap.put("getCountries_invalid", getCountries_invalid);
        resourceUriMap.put("getCurrencyList", getCurrencyList);
        resourceUriMap.put("getCurrencyList_invalid", getCurrencyList_invalid);
        resourceUriMap.put("getComplaintStatuses", getComplaintStatuses);
        resourceUriMap.put("getComplaintStatuses_invalid", getComplaintStatuses_invalid);
        resourceUriMap.put("getComplaintTypes", getComplaintTypes);
        resourceUriMap.put("getComplaintTypes_invalid", getComplaintTypes_invalid);
        resourceUriMap.put("getComplaintConfigurations", getComplaintConfigurations);
        resourceUriMap.put("getComplaintConfigurations_invalid", getComplaintConfigurations_invalid);
        resourceUriMap.put("getCompetitorSkunits", getCompetitorSkunits);
        resourceUriMap.put("getCompetitorSkunits_invalid", getCompetitorSkunits_invalid);
        resourceUriMap.put("disclaimers_get_disclaimers", disclaimers_get_disclaimers);
        resourceUriMap.put("disclaimers_get_disclaimers_invalid", disclaimers_get_disclaimers_invalid);
        resourceUriMap.put("disclaimers_index", disclaimers_index);
        resourceUriMap.put("disclaimers_index_invalid", disclaimers_index_invalid);
        resourceUriMap.put("disclaimers_approveddisclaimers", disclaimers_approveddisclaimers);
        resourceUriMap.put("disclaimers_approveddisclaimers_invalid", disclaimers_approveddisclaimers_invalid);
        resourceUriMap.put("disclaimers_add", disclaimers_add);
        resourceUriMap.put("disclaimers_add_invalid", disclaimers_add_invalid);
        resourceUriMap.put("erpsystems_index", erpsystems_index);
        resourceUriMap.put("erpsystems_index_invalid", erpsystems_index_invalid);
        resourceUriMap.put("getCreditOrDebitNote", getCreditOrDebitNote);
        resourceUriMap.put("postAddCreditNote", postAddCreditNote);
        resourceUriMap.put("cdnotes_addcreditnote", cdnotes_addcreditnote);
        resourceUriMap.put("cdnotes_addcreditnote_invalid", cdnotes_addcreditnote_invalid);
        resourceUriMap.put("cdnotes_get_crn_and_dbn_data", cdnotes_get_crn_and_dbn_data);
        resourceUriMap.put("cdnotes_get_crn_and_dbn_data_invalid", cdnotes_get_crn_and_dbn_data_invalid);
        resourceUriMap.put("cdnotes_get_credit_note_data_idwise", cdnotes_get_credit_note_data_idwise);
        resourceUriMap.put("cdnotes_get_credit_note_data_idwise_invalid", cdnotes_get_credit_note_data_idwise_invalid);
        resourceUriMap.put("cdnotes_get_cdnote_data", cdnotes_get_cdnote_data);
        resourceUriMap.put("cdnotes_get_cdnote_data_invalid", cdnotes_get_cdnote_data_invalid);
        resourceUriMap.put("cdnotes_get_credit_notes_or_debit_note", cdnotes_get_credit_notes_or_debit_note);
        resourceUriMap.put("cdnotes_get_credit_notes_or_debit_note_invalid", cdnotes_get_credit_notes_or_debit_note_invalid);
        resourceUriMap.put("cdnotes_getdebitnote", cdnotes_getdebitnote);
        resourceUriMap.put("cdnotes_getdebitnote_invalid", cdnotes_getdebitnote_invalid);
        resourceUriMap.put("cdnotes_get_redeemable_credit_notes", cdnotes_get_redeemable_credit_notes);
        resourceUriMap.put("cdnotes_get_redeemable_credit_notes_invalid", cdnotes_get_redeemable_credit_notes_invalid);
        resourceUriMap.put("getOtherLoadouts", getOtherLoadouts);
        resourceUriMap.put("POST_addageingapi", POST_addageingapi);
        resourceUriMap.put("POST_createQpsSchemeApi", POST_createQpsSchemeApi);
        resourceUriMap.put("POST_DeleteLoadOut", POST_DeleteLoadOut);
        resourceUriMap.put("postAddOrders", postAddOrders);
        resourceUriMap.put("postChangeDirectOrderState", postChangeDirectOrderState);
        resourceUriMap.put("postAddSku", postAddSku);
        resourceUriMap.put("invalid_AddSku", invalid_AddSku);
        resourceUriMap.put("list_calls", list_calls);
        resourceUriMap.put("list_calls_neg", list_calls_neg);
        resourceUriMap.put("calls_add", calls_add);
        resourceUriMap.put("claimtypes_get_all_combinations", claimtypes_get_all_combinations);
        resourceUriMap.put("claimtypes_get_all_fields_details", claimtypes_get_all_fields_details);
        resourceUriMap.put("claimtypes_get_claim_type", claimtypes_get_claim_type);
        resourceUriMap.put("claimtypes_get_combination", claimtypes_get_combination);
        resourceUriMap.put("calls_processrocdata", calls_processrocdata);
        resourceUriMap.put("calls_processrocdata_invalid", calls_processrocdata_invalid);
        resourceUriMap.put("calls_dailysalesreportdata", calls_dailysalesreportdata);
        resourceUriMap.put("calls_dailysalesreportdata_invalid", calls_dailysalesreportdata_invalid);
        resourceUriMap.put("categories_getcategoriesdatabusinessunit", categories_getcategoriesdatabusinessunit);
        resourceUriMap.put("categories_getcategoriesdatabusinessunit_invalid", categories_getcategoriesdatabusinessunit_invalid);
        resourceUriMap.put("categories_getcategoriesofbusinessunit", categories_getcategoriesofbusinessunit);
        resourceUriMap.put("categories_getcategoriesofbusinessunit_invalid", categories_getcategoriesofbusinessunit_invalid);
        resourceUriMap.put("categories_getspecialcategories", categories_getspecialcategories);
        resourceUriMap.put("categories_getspecialcategories_invalid", categories_getspecialcategories_invalid);
        resourceUriMap.put("categories_getcategoriesforreport", categories_getcategoriesforreport);
        resourceUriMap.put("categories_getcategoriesforreport_invalid", categories_getcategoriesforreport_invalid);
        resourceUriMap.put("categories_getcategoryandbrandsdetail", categories_getcategoryandbrandsdetail);
        resourceUriMap.put("categories_getcategoryandbrandsdetail_invalid", categories_getcategoryandbrandsdetail_invalid);
        resourceUriMap.put("claimdetails_index", claimdetails_index);
        resourceUriMap.put("claimdetails_index_invalid", claimdetails_index_invalid);
        resourceUriMap.put("claimdetails_approveclaim", claimdetails_approveclaim);
        resourceUriMap.put("claimdetails_approveclaim_invalid", claimdetails_approveclaim_invalid);
        resourceUriMap.put("claimdetails_getclaimdetails", claimdetails_getclaimdetails);
        resourceUriMap.put("claimdetails_getclaimdetails_invalid", claimdetails_getclaimdetails_invalid);
        resourceUriMap.put("claims_claimkpi", claims_claimkpi);
        resourceUriMap.put("claims_claimkpi_invalid", claims_claimkpi_invalid);
        resourceUriMap.put("claims_getclaims", claims_getclaims);
        resourceUriMap.put("claims_getclaims_invalid", claims_getclaims_invalid);
        resourceUriMap.put("claims_index", claims_index);
        resourceUriMap.put("claims_index_invalid", claims_index_invalid);
        resourceUriMap.put("claims_getclaimgraphviewdata", claims_getclaimgraphviewdata);
        resourceUriMap.put("claims_getclaimgraphviewdata_invalid", claims_getclaimgraphviewdata_invalid);
        resourceUriMap.put("claims_getnewclaimdetails", claims_getnewclaimdetails);
        resourceUriMap.put("claims_getnewclaimdetails_invalid", claims_getnewclaimdetails_invalid);
        resourceUriMap.put("claims_sendclaimactivitynotification", claims_sendclaimactivitynotification);
        resourceUriMap.put("claims_sendclaimactivitynotification_invalid", claims_sendclaimactivitynotification_invalid);
        resourceUriMap.put("claims_apigetclaimsuserwise", claims_apigetclaimsuserwise);
        resourceUriMap.put("claims_apigetclaimsuserwise_invalid", claims_apigetclaimsuserwise_invalid);
        resourceUriMap.put("claims_apigetallclaims", claims_apigetallclaims);
        resourceUriMap.put("claims_apigetallclaims_invalid", claims_apigetallclaims_invalid);
        resourceUriMap.put("damageclaims_updateewaybillprogressstatusfordamageclaim", damageclaims_updateewaybillprogressstatusfordamageclaim);
        resourceUriMap.put("damageclaims_updateewaybillprogressstatusfordamageclaim_invalid", damageclaims_updateewaybillprogressstatusfordamageclaim_invalid);
        resourceUriMap.put("claimtypes_getallcalculationtemplates", claimtypes_getallcalculationtemplates);
        resourceUriMap.put("claimtypes_getallcalculationtemplates_invalid", claimtypes_getallcalculationtemplates_invalid);
        resourceUriMap.put("claimtypes_getclaimtypesforblocking", claimtypes_getclaimtypesforblocking);
        resourceUriMap.put("claimtypes_getclaimtypesforblocking_invalid", claimtypes_getclaimtypesforblocking_invalid);
        resourceUriMap.put("claimtypes_getallcombinations", claimtypes_getallcombinations);
        resourceUriMap.put("claimtypes_getallcombinations_invalid", claimtypes_getallcombinations_invalid);
        resourceUriMap.put("claimtypes_validateblockclaimtypes", claimtypes_validateblockclaimtypes);
        resourceUriMap.put("claimtypes_validateblockclaimtypes_invalid", claimtypes_validateblockclaimtypes_invalid);
        resourceUriMap.put("claimtypes_get_aggregate_and_kpi_default_values", claimtypes_get_aggregate_and_kpi_default_values);
        resourceUriMap.put("claimtypes_get_aggregate_and_kpi_default_values_invalid", claimtypes_get_aggregate_and_kpi_default_values_invalid);
        resourceUriMap.put("collaterals_index", collaterals_index);
        resourceUriMap.put("collaterals_index_invalid", collaterals_index_invalid);
        resourceUriMap.put("collaterals_active_inactive", collaterals_active_inactive);
        resourceUriMap.put("collaterals_active_inactive_invalid", collaterals_active_inactive_invalid);
        resourceUriMap.put("collaterals_get_collaterals_for_sku", collaterals_get_collaterals_for_sku);
        resourceUriMap.put("collaterals_get_collaterals_for_sku_invalid", collaterals_get_collaterals_for_sku_invalid);
        resourceUriMap.put("companies_apigetorganization", companies_apigetorganization);
        resourceUriMap.put("companies_apigetorganization_invalid", companies_apigetorganization_invalid);
        resourceUriMap.put("companies_getcompanyroles", companies_getcompanyroles);
        resourceUriMap.put("companies_getcompanyroles_invalid", companies_getcompanyroles_invalid);
        resourceUriMap.put("companies_getcustomoutletfields", companies_getcustomoutletfields);
        resourceUriMap.put("companies_getcustomoutletfields_invalid", companies_getcustomoutletfields_invalid);
        resourceUriMap.put("companies_getfindmynearestoutletlogourlforcompany", companies_getfindmynearestoutletlogourlforcompany);
        resourceUriMap.put("companies_getfindmynearestoutletlogourlforcompany_invalid", companies_getfindmynearestoutletlogourlforcompany_invalid);
        resourceUriMap.put("companies_getcompanykycform", companies_getcompanykycform);
        resourceUriMap.put("companies_getcompanykycform_invalid", companies_getcompanykycform_invalid);
        resourceUriMap.put("companies_getselectorforoutletdensity", companies_getselectorforoutletdensity);
        resourceUriMap.put("companies_getselectorforoutletdensity_invalid", companies_getselectorforoutletdensity_invalid);
        resourceUriMap.put("companies_getactivityformfields", companies_getactivityformfields);
        resourceUriMap.put("companies_getactivityformfields_invalid", companies_getactivityformfields_invalid);
        resourceUriMap.put("companies_getoutletsdatacount", companies_getoutletsdatacount);
        resourceUriMap.put("companies_getoutletsdatacount_invalid", companies_getoutletsdatacount_invalid);
        resourceUriMap.put("companies_getoutletsdata", companies_getoutletsdata);
        resourceUriMap.put("companies_getoutletsdata_invalid", companies_getoutletsdata_invalid);
        resourceUriMap.put("companies_getcompanyinfo", companies_getcompanyinfo);
        resourceUriMap.put("companies_getcompanyinfo_invalid", companies_getcompanyinfo_invalid);
        resourceUriMap.put("companies_createoutletdensitykml", companies_createoutletdensitykml);
        resourceUriMap.put("companies_createoutletdensitykml_invalid", companies_createoutletdensitykml_invalid);
        resourceUriMap.put("companies_checkdistimandelivery", companies_checkdistimandelivery);
        resourceUriMap.put("companies_checkdistimandelivery_invalid", companies_checkdistimandelivery_invalid);
        resourceUriMap.put("companies_feedback", companies_feedback);
        resourceUriMap.put("companies_feedback_invalid", companies_feedback_invalid);
        resourceUriMap.put("companies_ajaxoutletlistview", companies_ajaxoutletlistview);
        resourceUriMap.put("companies_ajaxoutletlistview_invalid", companies_ajaxoutletlistview_invalid);
        resourceUriMap.put("companies_getcompanyduemessage", companies_getcompanyduemessage);
        resourceUriMap.put("companies_getcompanyduemessage_invalid", companies_getcompanyduemessage_invalid);
        resourceUriMap.put("companies_getusers", companies_getusers);
        resourceUriMap.put("companies_getusers_invalid", companies_getusers_invalid);
        resourceUriMap.put("companies_getsearchresult", companies_getsearchresult);
        resourceUriMap.put("companies_getsearchresult_invalid", companies_getsearchresult_invalid);
        resourceUriMap.put("claimlimitgroups_indexapi", claimlimitgroups_indexapi);
        resourceUriMap.put("claimlimitgroups_indexapi_invalid", claimlimitgroups_indexapi_invalid);
        resourceUriMap.put("claimfieldoptions_index", claimfieldoptions_index);
        resourceUriMap.put("claimfieldoptions_index_invalid", claimfieldoptions_index_invalid);
        resourceUriMap.put("claimfields_index", claimfields_index);
        resourceUriMap.put("claimfields_index_invalid", claimfields_index_invalid);
        resourceUriMap.put("creditlevels_index", creditlevels_index);
        resourceUriMap.put("creditlevels_index_invalid", creditlevels_index_invalid);
        resourceUriMap.put("creditnotetypes_index", creditnotetypes_index);
        resourceUriMap.put("creditnotetypes_index_invalid", creditnotetypes_index_invalid);
        resourceUriMap.put("complaintconfigurations_index", complaintconfigurations_index);
        resourceUriMap.put("complaintconfigurations_index_invalid", complaintconfigurations_index_invalid);
        resourceUriMap.put("complaints_index", complaints_index);
        resourceUriMap.put("complaints_index_invalid", complaints_index_invalid);
        resourceUriMap.put("complaints_getmycomplaints", complaints_getmycomplaints);
        resourceUriMap.put("complaints_getmycomplaints_invalid", complaints_getmycomplaints_invalid);
        resourceUriMap.put("complaintstatuses_index", complaintstatuses_index);
        resourceUriMap.put("complaintstatuses_index_invalid", complaintstatuses_index_invalid);
        resourceUriMap.put("assetdetails_index", assetdetails_index);
        resourceUriMap.put("assetdetails_index_invalid", assetdetails_index_invalid);
        resourceUriMap.put("assetdetails_asset_multilevel_approval_list", assetdetails_asset_multilevel_approval_list);
        resourceUriMap.put("assetdetails_asset_multilevel_approval_list_invalid", assetdetails_asset_multilevel_approval_list_invalid);
        resourceUriMap.put("assetdetails_asset_multilevel_deregister_approval_list", assetdetails_asset_multilevel_deregister_approval_list);
        resourceUriMap.put("assetdetails_asset_multilevel_deregister_approval_list_invalid", assetdetails_asset_multilevel_deregister_approval_list_invalid);
        resourceUriMap.put("assetdetails_asset_multilevel_order_approval_list", assetdetails_asset_multilevel_order_approval_list);
        resourceUriMap.put("assetdetails_asset_multilevel_order_approval_list_invalid", assetdetails_asset_multilevel_order_approval_list_invalid);
        resourceUriMap.put("assetdetails_asset_multilevel_register_approval_list", assetdetails_asset_multilevel_register_approval_list);
        resourceUriMap.put("assetdetails_asset_multilevel_register_approval_list_invalid", assetdetails_asset_multilevel_register_approval_list_invalid);
        resourceUriMap.put("assetdetails_deregister_list", assetdetails_deregister_list);
        resourceUriMap.put("assetdetails_deregister_list_invalid", assetdetails_deregister_list_invalid);
        resourceUriMap.put("assetdetails_get_requester_data", assetdetails_get_requester_data);
        resourceUriMap.put("assetdetails_get_requester_data_invalid", assetdetails_get_requester_data_invalid);
        resourceUriMap.put("assetserialnumbertransactions_get_total_intransit", assetserialnumbertransactions_get_total_intransit);
        resourceUriMap.put("assetserialnumbertransactions_get_total_intransit_invalid", assetserialnumbertransactions_get_total_intransit_invalid);
        resourceUriMap.put("assetserialnumbertransactions_get_total_asset_at_warehouse", assetserialnumbertransactions_get_total_asset_at_warehouse);
        resourceUriMap.put("assetserialnumbertransactions_get_total_asset_at_warehouse_invalid", assetserialnumbertransactions_get_total_asset_at_warehouse_invalid);
        resourceUriMap.put("assetserialnumbertransactions_get_total_asset_at_outlet", assetserialnumbertransactions_get_total_asset_at_outlet);
        resourceUriMap.put("assetserialnumbertransactions_get_total_asset_at_outlet_invalid", assetserialnumbertransactions_get_total_asset_at_outlet_invalid);
        resourceUriMap.put("assetserialnumbermappings_warehousedata", assetserialnumbermappings_warehousedata);
        resourceUriMap.put("assetserialnumbermappings_warehousedata_invalid", assetserialnumbermappings_warehousedata_invalid);
        resourceUriMap.put("assetserialnumbermappings_assettypedata", assetserialnumbermappings_assettypedata);
        resourceUriMap.put("assetserialnumbermappings_assettypedata_invalid", assetserialnumbermappings_assettypedata_invalid);
        resourceUriMap.put("assetserialnumbermappings_gettotalqtyassetwise", assetserialnumbermappings_gettotalqtyassetwise);
        resourceUriMap.put("assetserialnumbermappings_gettotalqtyassetwise_invalid", assetserialnumbermappings_gettotalqtyassetwise_invalid);
        resourceUriMap.put("bidtypes_api_get_bid_types", bidtypes_api_get_bid_types);
        resourceUriMap.put("bidtypes_api_get_bid_types_invalid", bidtypes_api_get_bid_types_invalid);
        resourceUriMap.put("assettypes_index", assettypes_index);
        resourceUriMap.put("assettypes_index_invalid", assettypes_index_invalid);
        resourceUriMap.put("assets_index", assets_index);
        resourceUriMap.put("assets_index_invalid", assets_index_invalid);
        resourceUriMap.put("assets_add_edit_assign_api", assets_add_edit_assign_api);
        resourceUriMap.put("assets_add_edit_assign_api_invalid", assets_add_edit_assign_api_invalid);
        resourceUriMap.put("assets_edit", assets_edit);
        resourceUriMap.put("assets_edit_invalid", assets_edit_invalid);
        resourceUriMap.put("POST_assets_edit", POST_assets_edit);
        resourceUriMap.put("POST_assets_add", POST_assets_add);
        resourceUriMap.put("assets_add_invalid", assets_add_invalid);
        resourceUriMap.put("assets_asset_list_api", assets_asset_list_api);
        resourceUriMap.put("assets_asset_list_api_invalid", assets_asset_list_api_invalid);
        resourceUriMap.put("GET_DeleteAsset", assets_delete);
        resourceUriMap.put("GET_DeleteAsset_invalid", assets_delete_invalid);
        resourceUriMap.put("assetaudits_asset_audit_report", assetaudits_asset_audit_report);
        resourceUriMap.put("assetaudits_asset_audit_report_invalid", assetaudits_asset_audit_report_invalid);
        resourceUriMap.put("assetdetails_approval", assetdetails_approval);
        resourceUriMap.put("assetdetails_approval_invalid", assetdetails_approval_invalid);
        resourceUriMap.put("assetorders_get_asset_approvals", assetorders_get_asset_approvals);
        resourceUriMap.put("assetorders_get_asset_approvals_invalid", assetorders_get_asset_approvals_invalid);
        resourceUriMap.put("assetorders_get_outlet_asset_orders", assetorders_get_outlet_asset_orders);
        resourceUriMap.put("assetorders_get_outlet_asset_orders_invalid", assetorders_get_outlet_asset_orders_invalid);
        resourceUriMap.put("assetorders_asset_order_report", assetorders_asset_order_report);
        resourceUriMap.put("assetorders_asset_order_report_invalid", assetorders_asset_order_report_invalid);
        resourceUriMap.put("channels_index", channels_index);
        resourceUriMap.put("channels_index_invalid", channels_index_invalid);
        resourceUriMap.put("list_discount", list_discount);
        resourceUriMap.put("list_discount_neg", list_discount_neg);
        resourceUriMap.put("list_warehouse", list_warehouse);
        resourceUriMap.put("list_warehouse_neg", list_warehouse_neg);
        resourceUriMap.put("Post_adddistributor", Post_adddistributor);
        resourceUriMap.put("Post_editdistributor", Post_editdistributor);
        resourceUriMap.put("Post_Outletwarehouse_Balanceupdate", Post_Outletwarehouse_Balanceupdate);
        resourceUriMap.put("list_pricing", list_pricing);
        resourceUriMap.put("list_pricing_neg", list_pricing_neg);
        resourceUriMap.put("POST_EntityPricingApproval", POST_EntityPricingApproval);
        resourceUriMap.put("POST_updateWarehousePrice", POST_updateWarehousePrice);
        resourceUriMap.put("list_secondary_sales", list_secondary_sales);
        resourceUriMap.put("GET_all_skus", GET_all_skus);
        resourceUriMap.put("list_counter_sales", list_counter_sales);
        resourceUriMap.put("POST_changePaymentState", POST_changePaymentState);
        resourceUriMap.put("list_sales_return", list_sales_return);
        resourceUriMap.put("POST_AddSaleReturn", POST_AddSaleReturn);
        resourceUriMap.put("POST_ApproveSaleReturn", POST_ApproveSaleReturn);
        resourceUriMap.put("POST_CancelSaleReturn", POST_CancelSaleReturn);
        resourceUriMap.put("list_scheme_master", list_scheme_master);
        resourceUriMap.put("list_scheme_master_invalid", list_scheme_master_invalid);
        resourceUriMap.put("POST_addMultiSchemeApi", POST_addMultiSchemeApi);
        resourceUriMap.put("POST_AssignQpsSchemeApi", POST_AssignQpsSchemeApi);
        resourceUriMap.put("list_scheme_holder", list_scheme_holder);
        resourceUriMap.put("list_scheme_holder_invalid", list_scheme_holder_invalid);
        resourceUriMap.put("schemes_get_qps_schemes", schemes_get_qps_schemes);
        resourceUriMap.put("schemes_get_qps_schemes_invalid", schemes_get_qps_schemes_invalid);
        resourceUriMap.put("POST_getSchemeDetailsView", POST_getSchemeDetailsView);
        resourceUriMap.put("POST_getSchemeDetailsView_invalid", POST_getSchemeDetailsView_invalid);
        resourceUriMap.put("schemes_get_dist_ware_of_zone", schemes_get_dist_ware_of_zone);
        resourceUriMap.put("schemes_get_dist_ware_of_zone_invalid", schemes_get_dist_ware_of_zone_invalid);
        resourceUriMap.put("list_user_leaves", list_user_leaves);
        resourceUriMap.put("Post_Upload_userleaves", Post_Upload_userleaves);
        resourceUriMap.put("list_user_leaves_no_params", list_user_leaves_no_params);
        resourceUriMap.put("list_states", list_states);
        resourceUriMap.put("list_states_no_params", list_states_no_params);
        resourceUriMap.put("POST_saveStates", POST_saveStates);
        resourceUriMap.put("GET_AddState", states_add);
        resourceUriMap.put("GET_AddState_invalid", states_add_invalid);
        resourceUriMap.put("get_CounterSales", get_CounterSales);
        resourceUriMap.put("list_outlet_balance", list_outlet_balance);
        resourceUriMap.put("post_EditSkunits", post_EditSkunits);
        resourceUriMap.put("Invalid_EditSkunits", Invalid_EditSkunits);
        resourceUriMap.put("Invalid_updateWarehousePrice", Invalid_updateWarehousePrice);
        resourceUriMap.put("Invalid_ChangeDirectOrderState", Invalid_ChangeDirectOrderState);
        resourceUriMap.put("POST_AddPrimarySales", POST_AddPrimarySales);
        resourceUriMap.put("POST_AddDiscount", POST_AddDiscount);
        resourceUriMap.put("postAddoutlet", postAddoutlet);
        resourceUriMap.put("GET_getMinMaxQtyValue", GET_getMinMaxQtyValue);
        resourceUriMap.put("GET_getMinMaxQtyValue_invalid", GET_getMinMaxQtyValue_invalid);
        resourceUriMap.put("GET_getOutletBySearch", GET_getOutletBySearch);
        resourceUriMap.put("GET_getOutletBySearch_invalid", GET_getOutletBySearch_invalid);
        resourceUriMap.put("GET_getOutletBySearchApi", GET_getOutletBySearchApi);
        resourceUriMap.put("GET_getOutletBySearchApi_invalid", GET_getOutletBySearchApi_invalid);
        resourceUriMap.put("postAddmulipleoutlet", postAddmulipleoutlet);
        resourceUriMap.put("postEditoutlet", postEditoutlet);
        resourceUriMap.put("GET_Products", GET_Products);
        resourceUriMap.put("list_skunits_master", list_skunits_master);
        resourceUriMap.put("skunits_get_serial_number_for_warehouse", skunits_get_serial_number_for_warehouse);
        resourceUriMap.put("skunits_get_serial_number_for_warehouse_invalid", skunits_get_serial_number_for_warehouse_invalid);
        resourceUriMap.put("skunits_get_sku_id_from_sku_codes", skunits_get_sku_id_from_sku_codes);
        resourceUriMap.put("skunits_get_sku_id_from_sku_codes_invalid", skunits_get_sku_id_from_sku_codes_invalid);
        resourceUriMap.put("skunits_get_sku_level_filters_for_reports", skunits_get_sku_level_filters_for_reports);
        resourceUriMap.put("skunits_get_sku_level_filters_for_reports_invalid", skunits_get_sku_level_filters_for_reports_invalid);
        resourceUriMap.put("skunits_sku_unit_price_change", skunits_sku_unit_price_change);
        resourceUriMap.put("skunits_sku_unit_price_change_invalid", skunits_sku_unit_price_change_invalid);
        resourceUriMap.put("skunits_get_expired_batch", skunits_get_expired_batch);
        resourceUriMap.put("Invalid_PostCreateUsers", Invalid_PostCreateUsers);
        resourceUriMap.put("postAssignRoleToUser", postAssignRoleToUser);
        resourceUriMap.put("Invalid_AssignRoleToUser", Invalid_AssignRoleToUser);
        resourceUriMap.put("Invalid_Product_Master_API", Invalid_Product_Master_API);
        resourceUriMap.put("Invalid_getallcompanyskus", Invalid_getallcompanyskus);
        resourceUriMap.put("Invalid_inventory_for_warehouse", Invalid_inventory_for_warehouse);
        resourceUriMap.put("webAddUser", webAddUser);
        resourceUriMap.put("webEditUser", webEditUser);
        resourceUriMap.put("webAjaxUserIndex", webAjaxUserIndex);
        resourceUriMap.put("webAjaxUserIndex_invalid", webAjaxUserIndex_invalid);
        resourceUriMap.put("GET_AjaxUserList", ajaxUserList);
        resourceUriMap.put("GET_AjaxUserList_invalid", ajaxUserList_invalid);
        resourceUriMap.put("GET_ChangePwdDialog", changePwdDialog);
        resourceUriMap.put("GET_ChangePwdDialog_invalid", changePwdDialog_invalid);
        resourceUriMap.put("POST_ChangePwd", POST_changePwd);
        resourceUriMap.put("POST_ChangePwd_invalid", POST_changePwd_invalid);
        resourceUriMap.put("user_access_token", user_access_token);
        resourceUriMap.put("user_access_token_invalid", user_access_token_invalid);
        resourceUriMap.put("user_activity_field_for_task", user_activity_field_for_task);
        resourceUriMap.put("user_activity_field_for_task_invalid", user_activity_field_for_task_invalid);
        resourceUriMap.put("all_reportee_users", all_reportee_users);
        resourceUriMap.put("all_reportee_users_invalid", all_reportee_users_invalid);
        resourceUriMap.put("all_users_api", all_users_api);
        resourceUriMap.put("all_users_api_invalid", all_users_api_invalid);
        resourceUriMap.put("all_users_new", all_users_new);
        resourceUriMap.put("all_users_new_invalid", all_users_new_invalid);
        resourceUriMap.put("api_get_user_list", api_get_user_list);
        resourceUriMap.put("api_get_user_list_invalid", api_get_user_list_invalid);
        resourceUriMap.put("beat_wise_dashboard_data", beat_wise_dashboard_data);
        resourceUriMap.put("beat_wise_dashboard_data_invalid", beat_wise_dashboard_data_invalid);
        resourceUriMap.put("complete_reporting_hierarchy_for_user", complete_reporting_hierarchy_for_user);
        resourceUriMap.put("complete_reporting_hierarchy_for_user_invalid", complete_reporting_hierarchy_for_user_invalid);
        resourceUriMap.put("compliance_forms_for_user", compliance_forms_for_user);
        resourceUriMap.put("compliance_forms_for_user_invalid", compliance_forms_for_user_invalid);
        resourceUriMap.put("get_distinct_designations", get_distinct_designations);
        resourceUriMap.put("get_distinct_designations_invalid", get_distinct_designations_invalid);
        resourceUriMap.put("get_headquarter_data", get_headquarter_data);
        resourceUriMap.put("get_headquarter_data_invalid", get_headquarter_data_invalid);
        resourceUriMap.put("get_managers_for_user", get_managers_for_user);
        resourceUriMap.put("get_managers_for_user_invalid", get_managers_for_user_invalid);
        resourceUriMap.put("get_new_jwt_token_for_expiry", get_new_jwt_token_for_expiry);
        resourceUriMap.put("get_new_jwt_token_for_expiry_invalid", get_new_jwt_token_for_expiry_invalid);
        resourceUriMap.put("get_notifications", get_notifications);
        resourceUriMap.put("get_notifications_invalid", get_notifications_invalid);
        resourceUriMap.put("users_get_notifications", users_get_notifications);
        resourceUriMap.put("users_get_notifications_invalid", users_get_notifications_invalid);
        resourceUriMap.put("get_reportee_users", get_reportee_users);
        resourceUriMap.put("get_reportee_users_invalid", get_reportee_users_invalid);
        resourceUriMap.put("get_reporters_for_role", get_reporters_for_role);
        resourceUriMap.put("get_reporters_for_role_invalid", get_reporters_for_role_invalid);
        resourceUriMap.put("get_task_creator_approver", get_task_creator_approver);
        resourceUriMap.put("get_task_creator_approver_invalid", get_task_creator_approver_invalid);
        resourceUriMap.put("get_unassigned_hq_users", get_unassigned_hq_users);
        resourceUriMap.put("get_unassigned_hq_users_invalid", get_unassigned_hq_users_invalid);
        resourceUriMap.put("get_user_by_id", get_user_by_id);
        resourceUriMap.put("get_user_by_id_invalid", get_user_by_id_invalid);
        resourceUriMap.put("get_user_custom_fields", get_user_custom_fields);
        resourceUriMap.put("get_user_custom_fields_invalid", get_user_custom_fields_invalid);
        resourceUriMap.put("get_user_for_created_by_user", get_user_for_created_by_user);
        resourceUriMap.put("get_user_for_created_by_user_invalid", get_user_for_created_by_user_invalid);
        resourceUriMap.put("get_user_reportee_users", get_user_reportee_users);
        resourceUriMap.put("get_user_reportee_users_invalid", get_user_reportee_users_invalid);
        resourceUriMap.put("get_user_reporting_hierarchy", get_user_reporting_hierarchy);
        resourceUriMap.put("get_user_reporting_hierarchy_invalid", get_user_reporting_hierarchy_invalid);
        resourceUriMap.put("get_user_hierarchy", get_user_hierarchy);
        resourceUriMap.put("get_user_hierarchy_invalid", get_user_hierarchy_invalid);
        resourceUriMap.put("get_dsm_for_sm", get_dsm_for_sm);
        resourceUriMap.put("get_dsm_for_sm_invalid", get_dsm_for_sm_invalid);
        resourceUriMap.put("get_all_users_for_current_zone", get_all_users_for_current_zone);
        resourceUriMap.put("get_all_users_for_current_zone_invalid", get_all_users_for_current_zone_invalid);
        resourceUriMap.put("get_distributors_for_user", get_distributors_for_user);
        resourceUriMap.put("get_distributors_for_user_invalid", get_distributors_for_user_invalid);
        resourceUriMap.put("get_dse_for_dsm", get_dse_for_dsm);
        resourceUriMap.put("get_dse_for_dsm_invalid", get_dse_for_dsm_invalid);
        resourceUriMap.put("get_all_users", get_all_users);
        resourceUriMap.put("get_all_users_invalid", get_all_users_invalid);
        resourceUriMap.put("get_warehouses_for_user", get_warehouses_for_user);
        resourceUriMap.put("get_warehouses_for_user_invalid", get_warehouses_for_user_invalid);
        resourceUriMap.put("get_users_for_zone_role", get_users_for_zone_role);
        resourceUriMap.put("get_users_for_zone_role_invalid", get_users_for_zone_role_invalid);
        resourceUriMap.put("get_users_for_designation", get_users_for_designation);
        resourceUriMap.put("get_users_for_designation_invalid", get_users_for_designation_invalid);
        resourceUriMap.put("get_users_for_subzone_role", get_users_for_subzone_role);
        resourceUriMap.put("get_users_for_subzone_role_invalid", get_users_for_subzone_role_invalid);
        resourceUriMap.put("get_users_for_report_with_fields", get_users_for_report_with_fields);
        resourceUriMap.put("get_users_for_report_with_fields_invalid", get_users_for_report_with_fields_invalid);
        resourceUriMap.put("get_users_for_distributor_by_roles", get_users_for_distributor_by_roles);
        resourceUriMap.put("get_users_for_distributor_by_roles_invalid", get_users_for_distributor_by_roles_invalid);
        resourceUriMap.put("get_users_by_hq", get_users_by_hq);
        resourceUriMap.put("get_users_by_hq_invalid", get_users_by_hq_invalid);
        resourceUriMap.put("syncapis_index", syncapis_index);
        resourceUriMap.put("syncapis_index_invalid", syncapis_index_invalid);
        resourceUriMap.put("tasks_get_approval_tasks", tasks_get_approval_tasks);
        resourceUriMap.put("tasks_get_approval_tasks_invalid", tasks_get_approval_tasks_invalid);
        resourceUriMap.put("tasks_get_all_trainers", tasks_get_all_trainers);
        resourceUriMap.put("tasks_get_all_trainers_invalid", tasks_get_all_trainers_invalid);
        resourceUriMap.put("tasks_get_all_events", tasks_get_all_events);
        resourceUriMap.put("tasks_get_all_events_invalid", tasks_get_all_events_invalid);
        resourceUriMap.put("tasks_getdistributorsforrdvisittasks", tasks_getdistributorsforrdvisittasks);
        resourceUriMap.put("tasks_getdistributorsforrdvisittasks_invalid", tasks_getdistributorsforrdvisittasks_invalid);
        resourceUriMap.put("tasks_getsalesmanforjointworktask", tasks_getsalesmanforjointworktask);
        resourceUriMap.put("tasks_getsalesmanforjointworktask_invalid", tasks_getsalesmanforjointworktask_invalid);
        resourceUriMap.put("tasks_gettaskdata", tasks_gettaskdata);
        resourceUriMap.put("tasks_gettaskdata_invalid", tasks_gettaskdata_invalid);
        resourceUriMap.put("tasks_gettourprogramtasknotifications", tasks_gettourprogramtasknotifications);
        resourceUriMap.put("tasks_gettourprogramtasknotifications_invalid", tasks_gettourprogramtasknotifications_invalid);
        resourceUriMap.put("tasks_gettasks", tasks_gettasks);
        resourceUriMap.put("tasks_gettasks_invalid", tasks_gettasks_invalid);
        resourceUriMap.put("tasks_gettasktypes", tasks_gettasktypes);
        resourceUriMap.put("tasks_gettasktypes_invalid", tasks_gettasktypes_invalid);
        resourceUriMap.put("tasks_gettrainingactivityformdata", tasks_gettrainingactivityformdata);
        resourceUriMap.put("tasks_gettrainingactivityformdata_invalid", tasks_gettrainingactivityformdata_invalid);
        resourceUriMap.put("GET_GetTaskActivityForm", tasks_get_task_activity_form);
        resourceUriMap.put("GET_GetTaskActivityForm_invalid", tasks_get_task_activity_form_invalid);
        resourceUriMap.put("tasks_tasklist", tasks_tasklist);
        resourceUriMap.put("tasks_tasklist_invalid", tasks_tasklist_invalid);
        resourceUriMap.put("tasks_taskreport", tasks_taskreport);
        resourceUriMap.put("tasks_taskreport_invalid", tasks_taskreport_invalid);
        resourceUriMap.put("tasks_tasksassign", tasks_tasksassign);
        resourceUriMap.put("tasks_tasksassign_invalid", tasks_tasksassign_invalid);
        resourceUriMap.put("tasks_viewtaskassignees", tasks_viewtaskassignees);
        resourceUriMap.put("tasks_viewtaskassignees_invalid", tasks_viewtaskassignees_invalid);
        resourceUriMap.put("tasks_add", tasks_add);
        resourceUriMap.put("tasks_add_invalid", tasks_add_invalid);
        resourceUriMap.put("POST_addEvent", POST_addEvent);
        resourceUriMap.put("POST_addEvent_invalid", POST_addEvent_invalid);
        resourceUriMap.put("taskstatuses_getstatus", taskstatuses_getstatus);
        resourceUriMap.put("taskstatuses_getstatus_invalid", taskstatuses_getstatus_invalid);
        resourceUriMap.put("taskstatuses_getstatusbytasktype", taskstatuses_getstatusbytasktype);
        resourceUriMap.put("taskstatuses_getstatusbytasktype_invalid", taskstatuses_getstatusbytasktype_invalid);
        resourceUriMap.put("taskapprovals_index", taskapprovals_index);
        resourceUriMap.put("taskapprovals_index_invalid", taskapprovals_index_invalid);
        resourceUriMap.put("taskapprovalstatuses_approveTrainer", taskapprovalstatuses_approveTrainer);
        resourceUriMap.put("taskapprovalstatuses_approveTrainer_invalid", taskapprovalstatuses_approveTrainer_invalid);
        resourceUriMap.put("taskapprovalstatuses_checktrainer", taskapprovalstatuses_checktrainer);
        resourceUriMap.put("taskapprovalstatuses_checktrainer_invalid", taskapprovalstatuses_checktrainer_invalid);
        resourceUriMap.put("tasklocations_get_tasklocations", tasklocations_get_tasklocations);
        resourceUriMap.put("tasklocations_get_tasklocations_invalid", tasklocations_get_tasklocations_invalid);
        resourceUriMap.put("taskassignees_approved_contacts", taskassignees_approved_contacts);
        resourceUriMap.put("taskassignees_approved_contacts_invalid", taskassignees_approved_contacts_invalid);
        resourceUriMap.put("POST_markAttendence", POST_markAttendence);
        resourceUriMap.put("POST_markAttendence_invalid", POST_markAttendence_invalid);
        resourceUriMap.put("targets_get_user_targets_data", targets_get_user_targets_data);
        resourceUriMap.put("targets_get_user_targets_data_invalid", targets_get_user_targets_data_invalid);
        resourceUriMap.put("targets_achievement", targets_achievement);
        resourceUriMap.put("targets_achievement_invalid", targets_achievement_invalid);
        resourceUriMap.put("targets_achievementmultiuser", targets_achievementmultiuser);
        resourceUriMap.put("targets_achievementmultiuser_invalid", targets_achievementmultiuser_invalid);
        resourceUriMap.put("targets_achievementmultiusernew", targets_achievementmultiusernew);
        resourceUriMap.put("targets_achievementmultiusernew_invalid", targets_achievementmultiusernew_invalid);
        resourceUriMap.put("get_stock_transfers", get_stock_transfers);
        resourceUriMap.put("get_stock_transfers_invalid", get_stock_transfers_invalid);
        resourceUriMap.put("POST_approveStockTransfer", POST_approveStockTransfer);
        resourceUriMap.put("POST_approveStockTransfer_invalid", POST_approveStockTransfer_invalid);
        resourceUriMap.put("get_merchandising_data", get_merchandising_data);
        resourceUriMap.put("get_merchandising_data_invalid", get_merchandising_data_invalid);
        resourceUriMap.put("stockatoutlets_getstocks", stockatoutlets_getstocks);
        resourceUriMap.put("stockatoutlets_getstocks_invalid", stockatoutlets_getstocks_invalid);
        resourceUriMap.put("get_users_by_filter_api", get_users_by_filter_api);
        resourceUriMap.put("get_users_by_filter_api_invalid", get_users_by_filter_api_invalid);
        resourceUriMap.put("userinfo", userinfo);
        resourceUriMap.put("userinfo_invalid", userinfo_invalid);
        resourceUriMap.put("user_summary_index_api", user_summary_index_api);
        resourceUriMap.put("user_summary_index_api_invalid", user_summary_index_api_invalid);
        resourceUriMap.put("get_users_for_zones", get_users_for_zones);
        resourceUriMap.put("get_users_for_zones_invalid", get_users_for_zones_invalid);
        resourceUriMap.put("get_users_for_warehouse", get_users_for_warehouse);
        resourceUriMap.put("get_users_for_warehouse_invalid", get_users_for_warehouse_invalid);
        resourceUriMap.put("get_users_for_subzones", get_users_for_subzones);
        resourceUriMap.put("get_users_for_subzones_invalid", get_users_for_subzones_invalid);
        resourceUriMap.put("get_users_for_role", get_users_for_role);
        resourceUriMap.put("get_users_for_role_invalid", get_users_for_role_invalid);
        resourceUriMap.put("get_users_for_area", get_users_for_area);
        resourceUriMap.put("get_users_for_area_invalid", get_users_for_area_invalid);
        resourceUriMap.put("get_user_login_details", get_user_login_details);
        resourceUriMap.put("get_user_login_details_invalid", get_user_login_details_invalid);
        resourceUriMap.put("get_user_generic_forms", get_user_generic_forms);
        resourceUriMap.put("get_user_generic_forms_invalid", get_user_generic_forms_invalid);
        resourceUriMap.put("get_user_app_versions", get_user_app_versions);
        resourceUriMap.put("get_user_app_versions_invalid", get_user_app_versions_invalid);
        resourceUriMap.put("get_user_activity_forms", get_user_activity_forms);
        resourceUriMap.put("get_user_activity_forms_invalid", get_user_activity_forms_invalid);
        resourceUriMap.put("get_user_info", get_user_info);
        resourceUriMap.put("get_user_info_invalid", get_user_info_invalid);
        resourceUriMap.put("get_my_users", get_my_users);
        resourceUriMap.put("get_my_users_invalid", get_my_users_invalid);
        resourceUriMap.put("get_my_order_states", get_my_order_states);
        resourceUriMap.put("get_my_order_states_invalid", get_my_order_states_invalid);
        resourceUriMap.put("get_info", get_info);
        resourceUriMap.put("get_info_invalid", get_info_invalid);
        resourceUriMap.put("get_ids_for_role", get_ids_for_role);
        resourceUriMap.put("get_ids_for_role_invalid", get_ids_for_role_invalid);
        resourceUriMap.put("get_hqs_for_warehouse", get_hqs_for_warehouse);
        resourceUriMap.put("get_hqs_for_warehouse_invalid", get_hqs_for_warehouse_invalid);
        resourceUriMap.put("get_enroll_status", get_enroll_status);
        resourceUriMap.put("get_enroll_status_invalid", get_enroll_status_invalid);
        resourceUriMap.put("get_scheme_for_forevery_type", get_scheme_for_forevery_type);
        resourceUriMap.put("get_scheme_for_forevery_type_invalid", get_scheme_for_forevery_type_invalid);
        resourceUriMap.put("get_schemes_api", get_schemes_api);
        resourceUriMap.put("get_schemes_api_invalid", get_schemes_api_invalid);
        resourceUriMap.put("get_schemes_for_outlets", get_schemes_for_outlets);
        resourceUriMap.put("get_schemes_for_outlets_invalid", get_schemes_for_outlets_invalid);
        resourceUriMap.put("get_schemes_for_warehouses", get_schemes_for_warehouses);
        resourceUriMap.put("get_schemes_for_warehouses_invalid", get_schemes_for_warehouses_invalid);
        resourceUriMap.put("get_schemes_for_ware", get_schemes_for_ware);
        resourceUriMap.put("get_schemes_for_ware_invalid", get_schemes_for_ware_invalid);
        resourceUriMap.put("get_payment_mode_schemes", get_payment_mode_schemes);
        resourceUriMap.put("get_staggered_qps_scheme", get_staggered_qps_scheme);
        resourceUriMap.put("get_staggered_qps_scheme_invalid", get_staggered_qps_scheme_invalid);
        resourceUriMap.put("get_cash_sku_schemes", get_cash_sku_schemes);
        resourceUriMap.put("get_cash_sku_schemes_invalid", get_cash_sku_schemes_invalid);
        resourceUriMap.put("get_scheme_for_holder", get_scheme_for_holder);
        resourceUriMap.put("get_scheme_for_holder_invalid", get_scheme_for_holder_invalid);
        resourceUriMap.put("get_trade_schemes", get_trade_schemes);
        resourceUriMap.put("get_trade_schemes_invalid", get_trade_schemes_invalid);
        resourceUriMap.put("schemes_index", schemes_index);
        resourceUriMap.put("schemes_index_invalid", schemes_index_invalid);
        resourceUriMap.put("schemes_indextrade", schemes_indextrade);
        resourceUriMap.put("schemes_indextrade_invalid", schemes_indextrade_invalid);
        resourceUriMap.put("secondarydisplaytypes_index", secondarydisplaytypes_index);
        resourceUriMap.put("secondarydisplaytypes_index_invalid", secondarydisplaytypes_index_invalid);
        resourceUriMap.put("loyalty_approve_reject", loyalty_approve_reject);
        resourceUriMap.put("loyalty_approve_reject_invalid", loyalty_approve_reject_invalid);
        resourceUriMap.put("loyalty_list", loyalty_list);
        resourceUriMap.put("loyalty_list_invalid", loyalty_list_invalid);
        resourceUriMap.put("schemes_get_forskus_for_schemes", schemes_get_forskus_for_schemes);
        resourceUriMap.put("schemes_get_forskus_for_schemes_invalid", schemes_get_forskus_for_schemes_invalid);
        resourceUriMap.put("schemes_get_available_approvers_for_user", schemes_get_available_approvers_for_user);
        resourceUriMap.put("schemes_get_available_approvers_for_user_invalid", schemes_get_available_approvers_for_user_invalid);
        resourceUriMap.put("schemes_getshemetail", schemes_getshemetail);
        resourceUriMap.put("schemes_getshemetail_invalid", schemes_getshemetail_invalid);
        resourceUriMap.put("POST_getSchemeForSchemeIds", POST_getSchemeForSchemeIds);
        resourceUriMap.put("POST_getSchemeForSchemeIds_invalid", POST_getSchemeForSchemeIds_invalid);
        resourceUriMap.put("POST_save_scheme_enrolment", POST_save_scheme_enrolment);
        resourceUriMap.put("POST_save_scheme_enrolment_invalid", POST_save_scheme_enrolment_invalid);
        resourceUriMap.put("POST_calcPaymentModeScheme", POST_calcPaymentModeScheme);
        resourceUriMap.put("POST_calcPaymentModeScheme_invalid", POST_calcPaymentModeScheme_invalid);
        resourceUriMap.put("POST_getGroupDedupData", POST_getGroupDedupData);
        resourceUriMap.put("POST_getGroupDedupData_invalid", POST_getGroupDedupData_invalid);
        resourceUriMap.put("POST_getBillNumbers", POST_getBillNumbers);
        resourceUriMap.put("POST_getBillNumbers_invalid", POST_getBillNumbers_invalid);
        resourceUriMap.put("POST_getInventoryForWarehousePaginated", POST_getInventoryForWarehousePaginated);
        resourceUriMap.put("POST_getInventoryForWarehousePaginated_invalid", POST_getInventoryForWarehousePaginated_invalid);
        resourceUriMap.put("POST_approvemultiple", POST_approvemultiple);
        resourceUriMap.put("POST_approvemultiple_invalid", POST_approvemultiple_invalid);
        resourceUriMap.put("POST_getAgeingReport", POST_getAgeingReport);
        resourceUriMap.put("POST_getAgeingReport_invalid", POST_getAgeingReport_invalid);
        resourceUriMap.put("schemereversalhierarchywises_update_scheme_reversal_hierarchy_data", schemereversalhierarchywises_update_scheme_reversal_hierarchy_data);
        resourceUriMap.put("schemereversalhierarchywises_update_scheme_reversal_hierarchy_data_invalid", schemereversalhierarchywises_update_scheme_reversal_hierarchy_data_invalid);
        resourceUriMap.put("schemereversalhierarchywises_index_api", schemereversalhierarchywises_index_api);
        resourceUriMap.put("schemereversalhierarchywises_index_api_invalid", schemereversalhierarchywises_index_api_invalid);
        resourceUriMap.put("schemereversalhierarchywises_get_skunit_property_id", schemereversalhierarchywises_get_skunit_property_id);
        resourceUriMap.put("schemereversalhierarchywises_get_skunit_property_id_invalid", schemereversalhierarchywises_get_skunit_property_id_invalid);
        resourceUriMap.put("schemereversalhierarchywises_get_skunit_property", schemereversalhierarchywises_get_skunit_property);
        resourceUriMap.put("schemereversalhierarchywises_get_skunit_property_invalid", schemereversalhierarchywises_get_skunit_property_invalid);
        resourceUriMap.put("schemereversalhierarchywises_get_scheme_reversal_data_for_app", schemereversalhierarchywises_get_scheme_reversal_data_for_app);
        resourceUriMap.put("schemereversalhierarchywises_get_scheme_reversal_data_for_app_invalid", schemereversalhierarchywises_get_scheme_reversal_data_for_app_invalid);
        resourceUriMap.put("schemereversalhierarchywises_get_organisation_hierarchy", schemereversalhierarchywises_get_organisation_hierarchy);
        resourceUriMap.put("schemereversalhierarchywises_get_organisation_hierarchy_invalid", schemereversalhierarchywises_get_organisation_hierarchy_invalid);
        resourceUriMap.put("schemereversalhierarchywises_get_org_hierarchy_id", schemereversalhierarchywises_get_org_hierarchy_id);
        resourceUriMap.put("schemereversalhierarchywises_get_org_hierarchy_id_invalid", schemereversalhierarchywises_get_org_hierarchy_id_invalid);
        resourceUriMap.put("schemeholders_index", schemeholders_index);
        resourceUriMap.put("schemeholders_index_invalid", schemeholders_index_invalid);
        resourceUriMap.put("schemeholders_assign", schemeholders_assign);
        resourceUriMap.put("schemeholders_assign_invalid", schemeholders_assign_invalid);
        resourceUriMap.put("schemeenrollmentassignments_index", schemeenrollmentassignments_index);
        resourceUriMap.put("schemeenrollmentassignments_index_invalid", schemeenrollmentassignments_index_invalid);
        resourceUriMap.put("schemecappings_index", schemecappings_index);
        resourceUriMap.put("schemecappings_index_invalid", schemecappings_index_invalid);
        resourceUriMap.put("schemecappings_edit", schemecappings_edit);
        resourceUriMap.put("schemecappings_edit_invalid", schemecappings_edit_invalid);
        resourceUriMap.put("schemecappingconfigurations_indexapi", schemecappingconfigurations_indexapi);
        resourceUriMap.put("schemecappingconfigurations_indexapi_invalid", schemecappingconfigurations_indexapi_invalid);
        resourceUriMap.put("schemegroups_indextrade", schemegroups_indextrade);
        resourceUriMap.put("schemegroups_indextrade_invalid", schemegroups_indextrade_invalid);
        resourceUriMap.put("schemegroups_indexnew", schemegroups_indexnew);
        resourceUriMap.put("schemegroups_indexnew_invalid", schemegroups_indexnew_invalid);
        resourceUriMap.put("schemegroups_index_api", schemegroups_index_api);
        resourceUriMap.put("schemegroups_index_api_invalid", schemegroups_index_api_invalid);
        resourceUriMap.put("schemegroups_get_schemegroups_for_approval", schemegroups_get_schemegroups_for_approval);
        resourceUriMap.put("schemegroups_get_schemegroups_for_approval_invalid", schemegroups_get_schemegroups_for_approval_invalid);
        resourceUriMap.put("pjps_get_beats_assigned_list", pjps_get_beats_assigned_list);
        resourceUriMap.put("pjps_get_beats_assigned_list_invalid", pjps_get_beats_assigned_list_invalid);
        resourceUriMap.put("pjps_get_users_beats", pjps_get_users_beats);
        resourceUriMap.put("pjps_get_users_beats_invalid", pjps_get_users_beats_invalid);
        resourceUriMap.put("pjpplancategories_get_pjp_plan_categories", pjpplancategories_get_pjp_plan_categories);
        resourceUriMap.put("pjpplancategories_get_pjp_plan_categories_invalid", pjpplancategories_get_pjp_plan_categories_invalid);
        resourceUriMap.put("pjps_get_pjp_start_date_frequency", pjps_get_pjp_start_date_frequency);
        resourceUriMap.put("pjps_get_pjp_start_date_frequency_invalid", pjps_get_pjp_start_date_frequency_invalid);
        resourceUriMap.put("pjps_get_pjps", pjps_get_pjps);
        resourceUriMap.put("pjps_get_pjps_invalid", pjps_get_pjps_invalid);
        resourceUriMap.put("pjp_visit_outlet_rules_index", pjp_visit_outlet_rules_index);
        resourceUriMap.put("pjp_visit_outlet_rules_index_invalid", pjp_visit_outlet_rules_index_invalid);
        resourceUriMap.put("states_index", states_index);
        resourceUriMap.put("states_index_invalid", states_index_invalid);
        resourceUriMap.put("states_ajax_index", states_ajax_index);
        resourceUriMap.put("states_ajax_index_invalid", states_ajax_index_invalid);
        resourceUriMap.put("api_get", api_get);
        resourceUriMap.put("api_get_invalid", api_get_invalid);
        resourceUriMap.put("api_get_states", api_get_states);
        resourceUriMap.put("api_get_states_invalid", api_get_states_invalid);
        resourceUriMap.put("get_states_for_country", get_states_for_country);
        resourceUriMap.put("get_states_for_country_invalid", get_states_for_country_invalid);
        resourceUriMap.put("cities_index", cities_index);
        resourceUriMap.put("cities_index_invalid", cities_index_invalid);
        resourceUriMap.put("districts_index", districts_index);
        resourceUriMap.put("districts_index_invalid", districts_index_invalid);
        resourceUriMap.put("get_districts", get_districts);
        resourceUriMap.put("get_districts_invalid", get_districts_invalid);
        resourceUriMap.put("towns_index", towns_index);
        resourceUriMap.put("towns_index_invalid", towns_index_invalid);
        resourceUriMap.put("towns_get_all_towns", towns_get_all_towns);
        resourceUriMap.put("towns_get_all_towns_invalid", towns_get_all_towns_invalid);
        resourceUriMap.put("towns_index_api", towns_index_api);
        resourceUriMap.put("towns_index_api_invalid", towns_index_api_invalid);
        resourceUriMap.put("POST_getTownsByStateDistrictCityPinCode", POST_getTownsByStateDistrictCityPinCode);
        resourceUriMap.put("POST_getTownsByStateDistrictCityPinCode_invalid", POST_getTownsByStateDistrictCityPinCode_invalid);
        resourceUriMap.put("POST_getTownDetails", POST_getTownDetails);
        resourceUriMap.put("POST_towns_get_town_details_invalid", POST_towns_get_town_details_invalid);
        resourceUriMap.put("transporters_get_transporters", transporters_get_transporters);
        resourceUriMap.put("transporters_get_transporters_invalid", transporters_get_transporters_invalid);
        resourceUriMap.put("transporters_index", transporters_index);
        resourceUriMap.put("transporters_index_invalid", transporters_index_invalid);
        resourceUriMap.put("userclaimtypes_index", userclaimtypes_index);
        resourceUriMap.put("userclaimtypes_index_invalid", userclaimtypes_index_invalid);
        resourceUriMap.put("userclaimtypes_assign", userclaimtypes_assign);
        resourceUriMap.put("userclaimtypes_assign_invalid", userclaimtypes_assign_invalid);
        resourceUriMap.put("skunits_index", skunits_index);
        resourceUriMap.put("skunits_index_invalid", skunits_index_invalid);
        resourceUriMap.put("skunits_get_size", skunits_get_size);
        resourceUriMap.put("skunits_get_size_invalid", skunits_get_size_invalid);
        resourceUriMap.put("skunits_get_categories", skunits_get_categories);
        resourceUriMap.put("skunits_get_categories_invalid", skunits_get_categories_invalid);
        resourceUriMap.put("skunits_get_sku_for_filter", skunits_get_sku_for_filter);
        resourceUriMap.put("skunits_get_sku_for_filter_invalid", skunits_get_sku_for_filter_invalid);
        resourceUriMap.put("POST_get_skunit_by_multiple_filter", POST_get_skunit_by_multiple_filter);
        resourceUriMap.put("POST_get_skunit_by_multiple_filter_invalid", POST_get_skunit_by_multiple_filter_invalid);
        resourceUriMap.put("skunits_get_brands", skunits_get_brands);
        resourceUriMap.put("skunits_get_brands_invalid", skunits_get_brands_invalid);
        resourceUriMap.put("skunits_get_areawise_categories_products_new_api", skunits_get_areawise_categories_products_new_api);
        resourceUriMap.put("skunits_get_areawise_categories_products_new_api_invalid", skunits_get_areawise_categories_products_new_api_invalid);
        resourceUriMap.put("skunits_get_areawise_categories_products", skunits_get_areawise_categories_products);
        resourceUriMap.put("skunits_get_areawise_categories_products_invalid", skunits_get_areawise_categories_products_invalid);
        resourceUriMap.put("skunits_get_all_skus_business_units", skunits_get_all_skus_business_units);
        resourceUriMap.put("skunits_get_all_skus_business_units_invalid", skunits_get_all_skus_business_units_invalid);
        resourceUriMap.put("skunits_get_all_skus", skunits_get_all_skus);
        resourceUriMap.put("skunits_get_all_skus_invalid", skunits_get_all_skus_invalid);
        resourceUriMap.put("skunits_get_warehouse_skunit_by_inventories", skunits_get_warehouse_skunit_by_inventories);
        resourceUriMap.put("skunits_get_warehouse_skunit_by_inventories_invalid", skunits_get_warehouse_skunit_by_inventories_invalid);
        resourceUriMap.put("skunits_get_warehouse_inventories_invalid", skunits_get_warehouse_inventories_invalid);
        resourceUriMap.put("skunits_get_user_skunit", skunits_get_user_skunit);
        resourceUriMap.put("skunits_get_user_skunit_invalid", skunits_get_user_skunit_invalid);
        resourceUriMap.put("skunits_get_sku_units_data", skunits_get_sku_units_data);
        resourceUriMap.put("skunits_get_sku_units_data_invalid", skunits_get_sku_units_data_invalid);
        resourceUriMap.put("skunits_get_sku_units_data_salesreturn", skunits_get_sku_units_data_salesreturn);
        resourceUriMap.put("skunits_get_sku_units_data_salesreturn_invalid", skunits_get_sku_units_data_salesreturn_invalid);
        resourceUriMap.put("skunits_get_parent_skus", skunits_get_parent_skus);
        resourceUriMap.put("skunits_get_parent_skus_invalid", skunits_get_parent_skus_invalid);
        resourceUriMap.put("skunits_get_skunit_type", skunits_get_skunit_type);
        resourceUriMap.put("skunits_get_skunit_type_invalid", skunits_get_skunit_type_invalid);
        resourceUriMap.put("skunits_ajax_sku_list", skunits_ajax_sku_list);
        resourceUriMap.put("skunits_ajax_sku_list_invalid", skunits_ajax_sku_list_invalid);
        resourceUriMap.put("skunits_get_skunit_info", skunits_get_skunit_info);
        resourceUriMap.put("skunits_get_skunit_info_invalid", skunits_get_skunit_info_invalid);
        resourceUriMap.put("skunits_get_skunit_price_data", skunits_get_skunit_price_data);
        resourceUriMap.put("skunits_get_skunit_price_data_invalid", skunits_get_skunit_price_data_invalid);
        resourceUriMap.put("skunits_get_skus_by_subcategories", skunits_get_skus_by_subcategories);
        resourceUriMap.put("skunits_get_skus_by_subcategories_invalid", skunits_get_skus_by_subcategories_invalid);
        resourceUriMap.put("skunits_get_subcategory", skunits_get_subcategory);
        resourceUriMap.put("skunits_get_subcategory_invalid", skunits_get_subcategory_invalid);
        resourceUriMap.put("GET_GetCategorySku", skunits_get_category_sku);
        resourceUriMap.put("GET_GetCategorySku_invalid", skunits_get_category_sku_invalid);
        resourceUriMap.put("skunits_get_collateral_info", skunits_get_collateral_info);
        resourceUriMap.put("skunits_get_collateral_info_invalid", skunits_get_collateral_info_invalid);
        resourceUriMap.put("skunits_get_list_of_skus", skunits_get_list_of_skus);
        resourceUriMap.put("skunits_get_list_of_skus_invalid", skunits_get_list_of_skus_invalid);
        resourceUriMap.put("skunits_get_skunits_list", skunits_get_skunits_list);
        resourceUriMap.put("skunits_get_skunits_list_invalid", skunits_get_skunits_list_invalid);
        resourceUriMap.put("POST_AddSkunit", skunits_add);
        resourceUriMap.put("skunits_add_invalid", skunits_add_invalid);
        resourceUriMap.put("skunits_get_packaging", skunits_get_packaging);
        resourceUriMap.put("skunits_get_packaging_invalid", skunits_get_packaging_invalid);
        resourceUriMap.put("skunits_get_products_for_report", skunits_get_products_for_report);
        resourceUriMap.put("skunits_get_products_for_report_invalid", skunits_get_products_for_report_invalid);
        resourceUriMap.put("skunits_get_skus", skunits_get_skus);
        resourceUriMap.put("skunits_get_skus_invalid", skunits_get_skus_invalid);
        resourceUriMap.put("skunits_get_subbrands", skunits_get_subbrands);
        resourceUriMap.put("skunits_get_subbrands_invalid", skunits_get_subbrands_invalid);
        resourceUriMap.put("skunits_get_variants", skunits_get_variants);
        resourceUriMap.put("skunits_get_variants_invalid", skunits_get_variants_invalid);
        resourceUriMap.put("skunits_check_distributor_wise_price_change", skunits_check_distributor_wise_price_change);
        resourceUriMap.put("skunits_check_distributor_wise_price_change_invalid", skunits_check_distributor_wise_price_change_invalid);
        resourceUriMap.put("skunits_get_skus_by_search", skunits_get_skus_by_search);
        resourceUriMap.put("skunits_get_skus_by_search_invalid", skunits_get_skus_by_search_invalid);
        resourceUriMap.put("skunits_get_skus_for_brand", skunits_get_skus_for_brand);
        resourceUriMap.put("skunits_get_skus_for_brand_invalid", skunits_get_skus_for_brand_invalid);
        resourceUriMap.put("skunits_get_warehouse_skunits_opening_stock", skunits_get_warehouse_skunits_opening_stock);
        resourceUriMap.put("skunits_get_warehouse_skunits_opening_stock_invalid", skunits_get_warehouse_skunits_opening_stock_invalid);
        resourceUriMap.put("skulines_index", skulines_index);
        resourceUriMap.put("skulines_index_invalid", skulines_index_invalid);
        resourceUriMap.put("skunitentitypriorities_get_priorities", skunitentitypriorities_get_priorities);
        resourceUriMap.put("skunitentitypriorities_get_priorities_invalid", skunitentitypriorities_get_priorities_invalid);
        resourceUriMap.put("settings_all_settings", settings_all_settings);
        resourceUriMap.put("settings_all_settings_invalid", settings_all_settings_invalid);
        resourceUriMap.put("settings_all_settings_save", settings_all_settings_save);
        resourceUriMap.put("settings_all_settings_save_invalid", settings_all_settings_save_invalid);
        resourceUriMap.put("settings_all_settings_redirect", settings_all_settings_redirect);
        resourceUriMap.put("settings_all_settings_redirect_invalid", settings_all_settings_redirect_invalid);
        resourceUriMap.put("settings_configuration_mapping", settings_configuration_mapping);
        resourceUriMap.put("settings_configuration_mapping_invalid", settings_configuration_mapping_invalid);
        resourceUriMap.put("settings_get_claim_invoice_sequence_settings", settings_get_claim_invoice_sequence_settings);
        resourceUriMap.put("settings_get_claim_invoice_sequence_settings_invalid", settings_get_claim_invoice_sequence_settings_invalid);
        resourceUriMap.put("settings_get_company_setting_by_name", settings_get_company_setting_by_name);
        resourceUriMap.put("settings_get_company_setting_by_name_invalid", settings_get_company_setting_by_name_invalid);
        resourceUriMap.put("settings_get_current_setting", settings_get_current_setting);
        resourceUriMap.put("settings_get_current_setting_invalid", settings_get_current_setting_invalid);
        resourceUriMap.put("get_setting_for_warehouse", get_setting_for_warehouse);
        resourceUriMap.put("get_setting_for_warehouse_invalid", get_setting_for_warehouse_invalid);
        resourceUriMap.put("get_entity_approval_data", get_entity_approval_data);
        resourceUriMap.put("get_entity_approval_data_invalid", get_entity_approval_data_invalid);
        resourceUriMap.put("get_user_according_role", get_user_according_role);
        resourceUriMap.put("get_user_according_role_invalid", get_user_according_role_invalid);
        resourceUriMap.put("settings_get_forms_by_type", settings_get_forms_by_type);
        resourceUriMap.put("settings_get_forms_by_type_invalid", settings_get_forms_by_type_invalid);
        resourceUriMap.put("settings_get_role_name", settings_get_role_name);
        resourceUriMap.put("settings_get_role_name_invalid", settings_get_role_name_invalid);
        resourceUriMap.put("settings_get_noc_sequence_settings", settings_get_noc_sequence_settings);
        resourceUriMap.put("settings_get_noc_sequence_settings_invalid", settings_get_noc_sequence_settings_invalid);
        resourceUriMap.put("skunitgstslabs_index_api", skunitgstslabs_index_api);
        resourceUriMap.put("skunitgstslabs_index_api_invalid", skunitgstslabs_index_api_invalid);
        resourceUriMap.put("areas", areas);
        resourceUriMap.put("areas_invalid", areas_invalid);
        resourceUriMap.put("areas_add", areas_add);
        resourceUriMap.put("areas_add_invalid", areas_add_invalid);
        resourceUriMap.put("areas_add_Valid", areas_add_Valid);
        resourceUriMap.put("areas_add_MissingFields", areas_add_MissingFields);
        resourceUriMap.put("areas_add_InvalidData", areas_add_InvalidData);
        resourceUriMap.put("areas_add_SQLInjection", areas_add_SQLInjection);
        resourceUriMap.put("areas_add_XSS", areas_add_XSS);
        resourceUriMap.put("areas_add_MaxLength", areas_add_MaxLength);
        resourceUriMap.put("view_unapproved_outlets", view_unapproved_outlets);
        resourceUriMap.put("view_unapproved_outlets_invalid", view_unapproved_outlets_invalid);
        resourceUriMap.put("outlets_unapproved_outlet_list", outlets_unapproved_outlet_list);
        resourceUriMap.put("outlets_unapproved_outlet_list_invalid", outlets_unapproved_outlet_list_invalid);
        resourceUriMap.put("outlets_approve", outlets_approve);
        resourceUriMap.put("outlets_approve_invalid", outlets_approve_invalid);
        resourceUriMap.put("GET_AddOutlet", outlets_add);
        resourceUriMap.put("GET_AddOutlet_invalid", outlets_add_invalid);
        resourceUriMap.put("outlets_check_is_distributor", outlets_check_is_distributor);
        resourceUriMap.put("outlets_check_is_distributor_invalid", outlets_check_is_distributor_invalid);
        resourceUriMap.put("outlets_connect_get_for_user", outlets_connect_get_for_user);
        resourceUriMap.put("outlets_connect_get_for_user_invalid", outlets_connect_get_for_user_invalid);
        resourceUriMap.put("outlets_api_get_outlet_for_distributor", outlets_api_get_outlet_for_distributor);
        resourceUriMap.put("outlets_api_get_outlet_for_distributor_invalid", outlets_api_get_outlet_for_distributor_invalid);
        resourceUriMap.put("subbrands", subbrands);
        resourceUriMap.put("subbrands_invalid", subbrands_invalid);
        resourceUriMap.put("subbrands_add", subbrands_add);
        resourceUriMap.put("subbrands_add_invalid", subbrands_add_invalid);
        resourceUriMap.put("subbrands_index", subbrands_index);
        resourceUriMap.put("subbrands_add_Valid", subbrands_add_Valid);
        resourceUriMap.put("subbrands_add_MissingFields", subbrands_add_MissingFields);
        resourceUriMap.put("subbrands_add_InvalidData", subbrands_add_InvalidData);
        resourceUriMap.put("subbrands_add_SQLInjection", subbrands_add_SQLInjection);
        resourceUriMap.put("subbrands_add_XSS", subbrands_add_XSS);
        resourceUriMap.put("subbrands_add_MaxLength", subbrands_add_MaxLength);
        resourceUriMap.put("orders_newindex", orders_newindex);
        resourceUriMap.put("orders_newindex_invalid", orders_newindex_invalid);
        resourceUriMap.put("activities_getPictures", activities_getPictures);
        resourceUriMap.put("activities_getPictures_invalid", activities_getPictures_invalid);
        resourceUriMap.put("activities_getWarehouseforZone", activities_getWarehouseforZone);
        resourceUriMap.put("activities_getWarehouseforZone_invalid", activities_getWarehouseforZone_invalid);
        resourceUriMap.put("activities_getactivities", activities_getactivities);
        resourceUriMap.put("activities_getactivities_invalid", activities_getactivities_invalid);
        resourceUriMap.put("activities_getfollowupactivities", activities_getfollowupactivities);
        resourceUriMap.put("activities_getfollowupactivities_invalid", activities_getfollowupactivities_invalid);
        resourceUriMap.put("activities_getnextunauditedactivity", activities_getnextunauditedactivity);
        resourceUriMap.put("activities_getnextunauditedactivity_invalid", activities_getnextunauditedactivity_invalid);
        resourceUriMap.put("activities_getselectedactivityform", activities_getselectedactivityform);
        resourceUriMap.put("activities_getselectedactivityform_invalid", activities_getselectedactivityform_invalid);
        resourceUriMap.put("approvalsequences_getuserids", approvalsequences_getuserids);
        resourceUriMap.put("approvalsequences_getuserids_invalid", approvalsequences_getuserids_invalid);
        resourceUriMap.put("approvalsequences_getrules", approvalsequences_getrules);
        resourceUriMap.put("approvalsequences_getrules_invalid", approvalsequences_getrules_invalid);
        resourceUriMap.put("approvalsequences_getapprovalsequenceonuserentity", approvalsequences_getapprovalsequenceonuserentity);
        resourceUriMap.put("approvalsequences_getapprovalsequenceonuserentity_invalid", approvalsequences_getapprovalsequenceonuserentity_invalid);
        resourceUriMap.put("approvalsequences_getallmodules", approvalsequences_getallmodules);
        resourceUriMap.put("approvalsequences_getallmodules_invalid", approvalsequences_getallmodules_invalid);
        resourceUriMap.put("schemes_getapprovalsequence", schemes_getapprovalsequence);
        resourceUriMap.put("schemes_getapprovalsequence_invalid", schemes_getapprovalsequence_invalid);
        resourceUriMap.put("schemes_applyqpsscheme", schemes_applyqpsscheme);
        resourceUriMap.put("schemes_applyqpsscheme_invalid", schemes_applyqpsscheme_invalid);
        resourceUriMap.put("schemes_assignnewscheme", schemes_assignnewscheme);
        resourceUriMap.put("schemes_assignnewscheme_invalid", schemes_assignnewscheme_invalid);
        resourceUriMap.put("schemeoptouts_index", schemeoptouts_index);
        resourceUriMap.put("schemeoptouts_index_invalid", schemeoptouts_index_invalid);
        resourceUriMap.put("subcategories_index", subcategories_index);
        resourceUriMap.put("subcategories_index_invalid", subcategories_index_invalid);
        resourceUriMap.put("shelfs_index", shelfs_index);
        resourceUriMap.put("shelfs_index_invalid", shelfs_index_invalid);
        resourceUriMap.put("shelfs_get_shelfdata", shelfs_get_shelfdata);
        resourceUriMap.put("shelfs_get_shelfdata_invalid", shelfs_get_shelfdata_invalid);
        resourceUriMap.put("shelfs_mappedsku", shelfs_mappedsku);
        resourceUriMap.put("shelfs_mappedsku_invalid", shelfs_mappedsku_invalid);
        resourceUriMap.put("companies_dashboard", companies_dashboard);
        resourceUriMap.put("company_timestamp", company_timestamp);
        resourceUriMap.put("company_timestamp_invalid", company_timestamp_invalid);
        resourceUriMap.put("variants", variants);
        resourceUriMap.put("variants_invalid", variants_invalid);
        resourceUriMap.put("variants_index", variants_index);
        resourceUriMap.put("variants_index_invalid", variants_index_invalid);
        resourceUriMap.put("variants_api", variants_api);
        resourceUriMap.put("variants_api_invalid", variants_api_invalid);
        resourceUriMap.put("sizes", sizes);
        resourceUriMap.put("sizes_invalid", sizes_invalid);
        resourceUriMap.put("sizes_get", sizes_get);
        resourceUriMap.put("sizes_get_invalid", sizes_get_invalid);
        resourceUriMap.put("sizes_index", sizes_index);
        resourceUriMap.put("sizes_index_invalid", sizes_index_invalid);
        resourceUriMap.put("workflow_reasons", workflow_reasons);
        resourceUriMap.put("workflow_reasons_invalid", workflow_reasons_invalid);
        resourceUriMap.put("reasons_get_reason_list", reasons_get_reason_list);
        resourceUriMap.put("reasons_get_reason_list_invalid", reasons_get_reason_list_invalid);
        resourceUriMap.put("reasons_get_reasons", reasons_get_reasons);
        resourceUriMap.put("reasons_get_reasons_invalid", reasons_get_reasons_invalid);
        resourceUriMap.put("notvisitedreasons_getreasons", notvisitedreasons_getreasons);
        resourceUriMap.put("notvisitedreasons_getreasons_invalid", notvisitedreasons_getreasons_invalid);
        resourceUriMap.put("reasons_get_tag_by_reason_id", reasons_get_tag_by_reason_id);
        resourceUriMap.put("reasons_get_tag_by_reason_id_invalid", reasons_get_tag_by_reason_id_invalid);
        resourceUriMap.put("reasons_get_reason_type_data", reasons_get_reason_type_data);
        resourceUriMap.put("reasons_get_reason_type_data_invalid", reasons_get_reason_type_data_invalid);
        resourceUriMap.put("reasons_active_or_deactive_reason", reasons_active_or_deactive_reason);
        resourceUriMap.put("reasons_active_or_deactive_reason_invalid", reasons_active_or_deactive_reason_invalid);
        resourceUriMap.put("warehouse_types", warehouse_types);
        resourceUriMap.put("warehouse_types_invalid", warehouse_types_invalid);
        resourceUriMap.put("warehouse_type_single", warehouse_type_single);
        resourceUriMap.put("warehouse_type_single_invalid", warehouse_type_single_invalid);
        resourceUriMap.put("warehouse_skunit_list", warehouse_skunit_list);
        resourceUriMap.put("warehouse_skunit_list_invalid", warehouse_skunit_list_invalid);
        resourceUriMap.put("warehouse_skunits_for_warehouse", warehouse_skunits_for_warehouse);
        resourceUriMap.put("warehouse_skunits_for_warehouse_invalid", warehouse_skunits_for_warehouse_invalid);
        resourceUriMap.put("POST_AssignSkunitToWarehouse", warehouse_skunits_assign_skunit_to_warehouse);
        resourceUriMap.put("POST_AssignSkunitToWarehouse_invalid", warehouse_skunits_assign_skunit_to_warehouse_invalid);
        resourceUriMap.put("GET_SaveWarehouseSkunit", warehouse_skunits_save);
        resourceUriMap.put("GET_SaveWarehouseSkunit_invalid", warehouse_skunits_save_invalid);
        resourceUriMap.put("warehouse_categories", warehouse_categories);
        resourceUriMap.put("warehouse_categories_invalid", warehouse_categories_invalid);

        resourceUriMap.put("warehouse_assets_index", warehouse_assets_index);

        resourceUriMap.put("warehouse_assets_index_invalid", warehouse_assets_index_invalid);
        resourceUriMap.put("warehouse_assets_get", warehouse_assets_get);
        resourceUriMap.put("warehouse_assets_get_invalid", warehouse_assets_get_invalid);
        resourceUriMap.put("visiting_types_index", visiting_types_index);
        resourceUriMap.put("visiting_types_index_invalid", visiting_types_index_invalid);
        resourceUriMap.put("villages_index", villages_index);
        resourceUriMap.put("villages_index_invalid", villages_index_invalid);
        resourceUriMap.put("vehicle_capacity", vehicle_capacity);
        resourceUriMap.put("vehicle_capacity_invalid", vehicle_capacity_invalid);
        resourceUriMap.put("activity_form_report", activity_form_report);
        resourceUriMap.put("activity_form_report_invalid", activity_form_report_invalid);
        resourceUriMap.put("formdefinitions_get", formdefinitions_get);
        resourceUriMap.put("formdefinitions_get_invalid", formdefinitions_get_invalid);
        resourceUriMap.put("formdefinitions_getformfields", formdefinitions_getformfields);
        resourceUriMap.put("formdefinitions_getformfields_invalid", formdefinitions_getformfields_invalid);
        resourceUriMap.put("formdefinitions_index", formdefinitions_index);
        resourceUriMap.put("formdefinitions_index_invalid", formdefinitions_index_invalid);
        resourceUriMap.put("ewaybills_editcredentials", ewaybills_editcredentials);
        resourceUriMap.put("ewaybills_editcredentials_invalid", ewaybills_editcredentials_invalid);
        resourceUriMap.put("vehicles", vehicles);
        resourceUriMap.put("vehicles_invalid", vehicles_invalid);
        resourceUriMap.put("mapped_vehicles", mapped_vehicles);
        resourceUriMap.put("mapped_vehicles_invalid", mapped_vehicles_invalid);
        resourceUriMap.put("warehouse_vehicles", warehouse_vehicles);
        resourceUriMap.put("warehouse_vehicles_invalid", warehouse_vehicles_invalid);
        resourceUriMap.put("outletbalances_get_by_warehouse", outletbalances_get_by_warehouse);
        resourceUriMap.put("outletbalances_get_by_warehouse_invalid", outletbalances_get_by_warehouse_invalid);
        resourceUriMap.put("outletbalances_update_from_connect", outletbalances_update_from_connect);
        resourceUriMap.put("outletbalances_update_from_connect_invalid", outletbalances_update_from_connect_invalid);
        resourceUriMap.put("outletcategories_api_get", outletcategories_api_get);
        resourceUriMap.put("outletcategories_api_get_invalid", outletcategories_api_get_invalid);
        resourceUriMap.put("outletcategories_set_category", outletcategories_set_category);
        resourceUriMap.put("outletcategories_set_category_invalid", outletcategories_set_category_invalid);
        resourceUriMap.put("outletcontacts_get_for_other_entity", outletcontacts_get_for_other_entity);
        resourceUriMap.put("outletcontacts_get_for_other_entity_invalid", outletcontacts_get_for_other_entity_invalid);
        resourceUriMap.put("outletcontacts_get", outletcontacts_get);
        resourceUriMap.put("outletcontacts_get_invalid", outletcontacts_get_invalid);
        resourceUriMap.put("outletcontacts_get_user_mapped_outcontact", outletcontacts_get_user_mapped_outcontact);
        resourceUriMap.put("outletcontacts_get_user_mapped_outcontact_invalid", outletcontacts_get_user_mapped_outcontact_invalid);
        resourceUriMap.put("user_outlet_contact_mappings", user_outlet_contact_mappings);
        resourceUriMap.put("user_outlet_contact_mappings_invalid", user_outlet_contact_mappings_invalid);
        resourceUriMap.put("outlets_distiman_validate_outlet", outlets_distiman_validate_outlet);
        resourceUriMap.put("outlets_distiman_validate_outlet_invalid", outlets_distiman_validate_outlet_invalid);
        resourceUriMap.put("outlets_get_buyer_filter", outlets_get_buyer_filter);
        resourceUriMap.put("outlets_get_buyer_filter_invalid", outlets_get_buyer_filter_invalid);
        resourceUriMap.put("outlets_get_child_outlets_by_parent", outlets_get_child_outlets_by_parent);
        resourceUriMap.put("outlets_get_child_outlets_by_parent_invalid", outlets_get_child_outlets_by_parent_invalid);
        resourceUriMap.put("outlets_get_duplicates", outlets_get_duplicates);
        resourceUriMap.put("outlets_get_duplicates_invalid", outlets_get_duplicates_invalid);
        resourceUriMap.put("outlets_get_focus_skus", outlets_get_focus_skus);
        resourceUriMap.put("outlets_get_focus_skus_invalid", outlets_get_focus_skus_invalid);
        resourceUriMap.put("outlets_get_frequently_used_product", outlets_get_frequently_used_product);
        resourceUriMap.put("outlets_get_frequently_used_product_invalid", outlets_get_frequently_used_product_invalid);
        resourceUriMap.put("outlets_get_leads_data", outlets_get_leads_data);
        resourceUriMap.put("outlets_get_leads_data_invalid", outlets_get_leads_data_invalid);
        resourceUriMap.put("outlets_get_near_by_outlet_by_geo_location", outlets_get_near_by_outlet_by_geo_location);
        resourceUriMap.put("outlets_get_near_by_outlet_by_geo_location_invalid", outlets_get_near_by_outlet_by_geo_location_invalid);
        resourceUriMap.put("outlets_get_nearest_outlets_without_conditions", outlets_get_nearest_outlets_without_conditions);
        resourceUriMap.put("outlets_get_nearest_outlets_without_conditions_invalid", outlets_get_nearest_outlets_without_conditions_invalid);
        resourceUriMap.put("outlets_get_outlet_and_child_outlet", outlets_get_outlet_and_child_outlet);
        resourceUriMap.put("outlets_get_outlet_and_child_outlet_invalid", outlets_get_outlet_and_child_outlet_invalid);
        resourceUriMap.put("outlets_get_outlet_detail_api", outlets_get_outlet_detail_api);
        resourceUriMap.put("outlets_get_outlet_detail_api_invalid", outlets_get_outlet_detail_api_invalid);
        resourceUriMap.put("outlets_download_custom_outlet_image", outlets_download_custom_outlet_image);
        resourceUriMap.put("outlets_download_custom_outlet_image_invalid", outlets_download_custom_outlet_image_invalid);
        resourceUriMap.put("outlets_get_outlets_based_on_category", outlets_get_outlets_based_on_category);
        resourceUriMap.put("outlets_get_outlets_based_on_category_invalid", outlets_get_outlets_based_on_category_invalid);
        resourceUriMap.put("outlets_get_skus_for_outlet", outlets_get_skus_for_outlet);
        resourceUriMap.put("outlets_get_skus_for_outlet_invalid", outlets_get_skus_for_outlet_invalid);
        resourceUriMap.put("outlets_get_all_outlet_details_for_user", outlets_get_all_outlet_details_for_user);
        resourceUriMap.put("outlets_get_all_outlet_details_for_user_invalid", outlets_get_all_outlet_details_for_user_invalid);
        resourceUriMap.put("outlets_get_asset_data_for_outlet", outlets_get_asset_data_for_outlet);
        resourceUriMap.put("outlets_get_asset_data_for_outlet_invalid", outlets_get_asset_data_for_outlet_invalid);
        resourceUriMap.put("outlets_get_beat_for_today", outlets_get_beat_for_today);
        resourceUriMap.put("outlets_get_beat_for_today_invalid", outlets_get_beat_for_today_invalid);
        resourceUriMap.put("outlets_get_beatwise_outlets_new", outlets_get_beatwise_outlets_new);
        resourceUriMap.put("outlets_get_beatwise_outlets_new_invalid", outlets_get_beatwise_outlets_new_invalid);
        resourceUriMap.put("outlets_get_data_for_suggested_order", outlets_get_data_for_suggested_order);
        resourceUriMap.put("outlets_get_data_for_suggested_order_invalid", outlets_get_data_for_suggested_order_invalid);
        resourceUriMap.put("outlets_get_detail", outlets_get_detail);
        resourceUriMap.put("outlets_get_detail_invalid", outlets_get_detail_invalid);
        resourceUriMap.put("outlets_get_distributors_for_area", outlets_get_distributors_for_area);
        resourceUriMap.put("outlets_get_distributors_for_area_invalid", outlets_get_distributors_for_area_invalid);
        resourceUriMap.put("outlets_get_distributors_for_warehouse", outlets_get_distributors_for_warehouse);
        resourceUriMap.put("outlets_get_distributors_for_warehouse_invalid", outlets_get_distributors_for_warehouse_invalid);
        resourceUriMap.put("outlets_get_duplicate_outlets_new", outlets_get_duplicate_outlets_new);
        resourceUriMap.put("outlets_get_duplicate_outlets_new_invalid", outlets_get_duplicate_outlets_new_invalid);
        resourceUriMap.put("outlets_get_last_sale_price_of_sku", outlets_get_last_sale_price_of_sku);
        resourceUriMap.put("outlets_get_last_sale_price_of_sku_invalid", outlets_get_last_sale_price_of_sku_invalid);
        resourceUriMap.put("outlets_get_outlet_level", outlets_get_outlet_level);
        resourceUriMap.put("outlets_get_outlet_level_invalid", outlets_get_outlet_level_invalid);
        resourceUriMap.put("outlets_get_outletsaleledger", outlets_get_outletsaleledger);
        resourceUriMap.put("outlets_get_outletsaleledger_invalid", outlets_get_outletsaleledger_invalid);
        resourceUriMap.put("outlets_get_outlets_for_area", outlets_get_outlets_for_area);
        resourceUriMap.put("outlets_get_outlets_for_area_invalid", outlets_get_outlets_for_area_invalid);
        resourceUriMap.put("outlets_get_outlets_for_area_with_beat_details", outlets_get_outlets_for_area_with_beat_details);
        resourceUriMap.put("outlets_get_outlets_for_area_with_beat_details_invalid", outlets_get_outlets_for_area_with_beat_details_invalid);
        resourceUriMap.put("outlets_get_outlets_for_area_with_key_customers", outlets_get_outlets_for_area_with_key_customers);
        resourceUriMap.put("outlets_get_outlets_for_area_with_key_customers_invalid", outlets_get_outlets_for_area_with_key_customers_invalid);
        resourceUriMap.put("outlets_get_outlets_for_city", outlets_get_outlets_for_city);
        resourceUriMap.put("outlets_get_outlets_for_city_invalid", outlets_get_outlets_for_city_invalid);
        resourceUriMap.put("outlets_get_outlets_for_report", outlets_get_outlets_for_report);
        resourceUriMap.put("outlets_get_outlets_for_report_invalid", outlets_get_outlets_for_report_invalid);
        resourceUriMap.put("outlets_get_outlets_for_state", outlets_get_outlets_for_state);
        resourceUriMap.put("outlets_get_outlets_for_state_invalid", outlets_get_outlets_for_state_invalid);
        resourceUriMap.put("outlets_get_outlets_for_user", outlets_get_outlets_for_user);
        resourceUriMap.put("outlets_get_outlets_for_user_invalid", outlets_get_outlets_for_user_invalid);
        resourceUriMap.put("outlets_get_outlets_for_warehouses", outlets_get_outlets_for_warehouses);
        resourceUriMap.put("outlets_get_outlets_for_warehouses_invalid", outlets_get_outlets_for_warehouses_invalid);
        resourceUriMap.put("outlets_get_child_outlets", outlets_get_child_outlets);
        resourceUriMap.put("outlets_get_child_outlets_invalid", outlets_get_child_outlets_invalid);
        resourceUriMap.put("outlets_get_outlets_in_range", outlets_get_outlets_in_range);
        resourceUriMap.put("outlets_get_outlets_in_range_invalid", outlets_get_outlets_in_range_invalid);
        resourceUriMap.put("outlets_get_outlet_types", outlets_get_outlet_types);
        resourceUriMap.put("outlets_get_outlet_types_invalid", outlets_get_outlet_types_invalid);
        resourceUriMap.put("outlets_get_pending_invoices_multi_distributor", outlets_get_pending_invoices_multi_distributor);
        resourceUriMap.put("outlets_get_pending_invoices_multi_distributor_invalid", outlets_get_pending_invoices_multi_distributor_invalid);
        resourceUriMap.put("outlets_get_outlet_creditnote_history", outlets_get_outlet_creditnote_history);
        resourceUriMap.put("outlets_get_outlet_creditnote_history_invalid", outlets_get_outlet_creditnote_history_invalid);
        resourceUriMap.put("outlets_get_unmapped_outlets", outlets_get_unmapped_outlets);
        resourceUriMap.put("outlets_get_unmapped_outlets_invalid", outlets_get_unmapped_outlets_invalid);
        resourceUriMap.put("outlets_inactive_outlets_for_focus_sku", outlets_inactive_outlets_for_focus_sku);
        resourceUriMap.put("outlets_inactive_outlets_for_focus_sku_invalid", outlets_inactive_outlets_for_focus_sku_invalid);
        resourceUriMap.put("outlets_list_outlets_in_area", outlets_list_outlets_in_area);
        resourceUriMap.put("outlets_list_outlets_in_area_invalid", outlets_list_outlets_in_area_invalid);
        resourceUriMap.put("outlets_by_warehouse_and_outlet_category", outlets_by_warehouse_and_outlet_category);
        resourceUriMap.put("outlets_by_warehouse_and_outlet_category_invalid", outlets_by_warehouse_and_outlet_category_invalid);
        resourceUriMap.put("outlets_under_area", outlets_under_area);
        resourceUriMap.put("outlets_under_area_invalid", outlets_under_area_invalid);
        resourceUriMap.put("outlets_reject_outlet", outlets_reject_outlet);
        resourceUriMap.put("outlets_reject_outlet_invalid", outlets_reject_outlet_invalid);
        resourceUriMap.put("outlets_search_taxpayer", outlets_search_taxpayer);
        resourceUriMap.put("outlets_search_taxpayer_invalid", outlets_search_taxpayer_invalid);
        resourceUriMap.put("outlets_search_outlet_by_name_or_id", outlets_search_outlet_by_name_or_id);
        resourceUriMap.put("outlets_search_outlet_by_name_or_id_invalid", outlets_search_outlet_by_name_or_id_invalid);
        resourceUriMap.put("outlets_searchOutletByPhonenumber", outlets_searchOutletByPhonenumber);
        resourceUriMap.put("outlets_searchOutletByPhonenumber_invalid", outlets_searchOutletByPhonenumber_invalid);
        resourceUriMap.put("outlets_sendOutletVerificationOTP", outlets_sendOutletVerificationOTP);
        resourceUriMap.put("outlets_sendOutletVerificationOTP_invalid", outlets_sendOutletVerificationOTP_invalid);
        resourceUriMap.put("outlets_removeOrderRestrictionForOutlet", outlets_removeOrderRestrictionForOutlet);
        resourceUriMap.put("outlets_removeOrderRestrictionForOutlet_invalid", outlets_removeOrderRestrictionForOutlet_invalid);
        resourceUriMap.put("outlets_get_outlet", outlets_get_outlet);
        resourceUriMap.put("outlets_get_outlet_invalid", outlets_get_outlet_invalid);
        resourceUriMap.put("outlets_get_outlet_details", outlets_get_outlet_details);
        resourceUriMap.put("outlets_get_outlet_details_invalid", outlets_get_outlet_details_invalid);
        resourceUriMap.put("outlets_get_categorized_outlet_for_user", outlets_get_categorized_outlet_for_user);
        resourceUriMap.put("outlets_get_categorized_outlet_for_user_invalid", outlets_get_categorized_outlet_for_user_invalid);
        resourceUriMap.put("outlets_approval_status", outlets_approval_status);
        resourceUriMap.put("outlets_approval_status_invalid", outlets_approval_status_invalid);
        resourceUriMap.put("outlettargets_get_entity_targets", outlettargets_get_entity_targets);
        resourceUriMap.put("outlettargets_get_entity_targets_invalid", outlettargets_get_entity_targets_invalid);
        resourceUriMap.put("outlettargets_outlet_type", outlettargets_outlet_type);
        resourceUriMap.put("outlettargets_outlet_type_invalid", outlettargets_outlet_type_invalid);
        resourceUriMap.put("outlettargets_set_distributor_targets", outlettargets_set_distributor_targets);
        resourceUriMap.put("outlettargets_set_distributor_targets_invalid", outlettargets_set_distributor_targets_invalid);
        resourceUriMap.put("outlettargets_set_target", outlettargets_set_target);
        resourceUriMap.put("outlettargets_set_target_invalid", outlettargets_set_target_invalid);
        resourceUriMap.put("outlets_get_outlet_info", outlets_get_outlet_info);
        resourceUriMap.put("outlets_get_outlet_info_invalid", outlets_get_outlet_info_invalid);
        resourceUriMap.put("outlets_stock_at_outlet", outlets_stock_at_outlet);
        resourceUriMap.put("outlets_stock_at_outlet_invalid", outlets_stock_at_outlet_invalid);
        resourceUriMap.put("outlets_save_payee_data", outlets_save_payee_data);
        resourceUriMap.put("outlets_save_payee_data_invalid", outlets_save_payee_data_invalid);
        resourceUriMap.put("POST_outlets_getMinMaxOrderqtyvalue", POST_outlets_getMinMaxOrderqtyvalue);
        resourceUriMap.put("POST_outlets_getMinMaxOrderqtyvalue_invalid", POST_outlets_getMinMaxOrderqtyvalue_invalid);
        resourceUriMap.put("POST_outlets_getOutletByAreaAndOutletType", POST_outlets_getOutletByAreaAndOutletType);
        resourceUriMap.put("POST_outlets_getOutletByAreaAndOutletType_invalid", POST_outlets_getOutletByAreaAndOutletType_invalid);
        resourceUriMap.put("outlets_get_outlet_flows_api", outlets_get_outlet_flows_api);
        resourceUriMap.put("outlets_get_outlet_flows_api_invalid", outlets_get_outlet_flows_api_invalid);
        resourceUriMap.put("outlets_get_outlet_holder_details", outlets_get_outlet_holder_details);
        resourceUriMap.put("outlets_get_outlet_holder_details_invalid", outlets_get_outlet_holder_details_invalid);
        resourceUriMap.put("outlets_get_outlet_kyc_form", outlets_get_outlet_kyc_form);
        resourceUriMap.put("outlets_get_outlet_kyc_form_invalid", outlets_get_outlet_kyc_form_invalid);
        resourceUriMap.put("outlets_get_outlet_outstanding_data", outlets_get_outlet_outstanding_data);
        resourceUriMap.put("outlets_get_outlet_outstanding_data_invalid", outlets_get_outlet_outstanding_data_invalid);
        resourceUriMap.put("outlets_get_outlets_for_approval", outlets_get_outlets_for_approval);
        resourceUriMap.put("outlets_get_outlets_for_approval_invalid", outlets_get_outlets_for_approval_invalid);
        resourceUriMap.put("outlets_get_saleman_beat_summary", outlets_get_saleman_beat_summary);
        resourceUriMap.put("outlets_get_saleman_beat_summary_invalid", outlets_get_saleman_beat_summary_invalid);
        resourceUriMap.put("outlets_get_outlet_summary_info", outlets_get_outlet_summary_info);
        resourceUriMap.put("outlets_get_outlet_summary_info_invalid", outlets_get_outlet_summary_info_invalid);
        resourceUriMap.put("outlets_get_all_outlets_for_user", outlets_get_all_outlets_for_user);
        resourceUriMap.put("outlets_get_all_outlets_for_user_invalid", outlets_get_all_outlets_for_user_invalid);
        resourceUriMap.put("getOutletElegibleForActivity", getOutletElegibleForActivity);
        resourceUriMap.put("getOutletElegibleForActivity_invalid", getOutletElegibleForActivity_invalid);
        resourceUriMap.put("POST_getOutletsInfo", POST_getOutletsInfo);
        resourceUriMap.put("POST_getOutletsInfo_invalid", POST_getOutletsInfo_invalid);
        resourceUriMap.put("getactivitytype", getactivitytype);
        resourceUriMap.put("getactivitytype_invalid", getactivitytype_invalid);
        resourceUriMap.put("leaveconfigurations_index", leaveconfigurations_index);
        resourceUriMap.put("leaveconfigurations_index_invalid", leaveconfigurations_index_invalid);
        resourceUriMap.put("leaveconfigurations_getConfigurationDetails", leaveconfigurations_getConfigurationDetails);
        resourceUriMap.put("leaveconfigurations_getConfigurationDetails_invalid", leaveconfigurations_getConfigurationDetails_invalid);
        resourceUriMap.put("addV2", addV2);
        resourceUriMap.put("addV2_invalid", addV2_invalid);
        resourceUriMap.put("apptabsequences_index", apptabsequences_index);
        resourceUriMap.put("apptabsequences_index_invalid", apptabsequences_index_invalid);
        resourceUriMap.put("apptabsequences_getapptabandworkflowdata", apptabsequences_getapptabandworkflowdata);
        resourceUriMap.put("apptabsequences_getapptabandworkflowdata_invalid", apptabsequences_getapptabandworkflowdata_invalid);
        resourceUriMap.put("updateWorkflowAndApptab", updateWorkflowAndApptab);
        resourceUriMap.put("updateWorkflowAndApptab_invalid", updateWorkflowAndApptab_invalid);
        resourceUriMap.put("areacategories_index", areacategories_index);
        resourceUriMap.put("areacategories_index_invalid", areacategories_index_invalid);
        resourceUriMap.put("POST_AddAreaCategory", areacategories_add);
        resourceUriMap.put("areacategories_add_invalid", areacategories_add_invalid);
        resourceUriMap.put("POST_ChangeAreaStatus", areacategories_change_status);
        resourceUriMap.put("areacategories_change_status_invalid", areacategories_change_status_invalid);
        resourceUriMap.put("POST_EditAreaCategory", areacategories_edit);
        resourceUriMap.put("areacategories_edit_invalid", areacategories_edit_invalid);
        resourceUriMap.put("POST_DeleteAreaCategory", areacategories_delete);
        resourceUriMap.put("areacategories_delete_invalid", areacategories_delete_invalid);
        resourceUriMap.put("backgroundprocesses_processlist", backgroundprocesses_processlist);
        resourceUriMap.put("backgroundprocesses_processlist_invalid", backgroundprocesses_processlist_invalid);
        resourceUriMap.put("bankreceipts_removedetail", bankreceipts_removedetail);
        resourceUriMap.put("bankreceipts_removedetail_invalid", bankreceipts_removedetail_invalid);
        resourceUriMap.put("getactivitiesapi", getactivitiesapi);
        resourceUriMap.put("getactivitiesapi_invalid", getactivitiesapi_invalid);
        resourceUriMap.put("getactivityformdatasbytype", getactivityformdatasbytype);
        resourceUriMap.put("getactivityformdatasbytype_invalid", getactivityformdatasbytype_invalid);
        resourceUriMap.put("getactivityformfields", getactivityformfields);
        resourceUriMap.put("getactivityformfields_invalid", getactivityformfields_invalid);
        resourceUriMap.put("getfieldsbyformname", getfieldsbyformname);
        resourceUriMap.put("getfieldsbyformname_invalid", getfieldsbyformname_invalid);
        resourceUriMap.put("getformfeildsbytype", getformfeildsbytype);
        resourceUriMap.put("getformfeildsbytype_invalid", getformfeildsbytype_invalid);
        resourceUriMap.put("getoutletwiseremainingfrequencyforactivities", getoutletwiseremainingfrequencyforactivities);
        resourceUriMap.put("getoutletwiseremainingfrequencyforactivities_invalid", getoutletwiseremainingfrequencyforactivities_invalid);
        resourceUriMap.put("getusersforarea", getusersforarea);
        resourceUriMap.put("getusersforarea_invalid", getusersforarea_invalid);
        resourceUriMap.put("getusersforareadatewise", getusersforareadatewise);
        resourceUriMap.put("getusersforareadatewise_invalid", getusersforareadatewise_invalid);
        resourceUriMap.put("getusersforrole", getusersforrole);
        resourceUriMap.put("getusersforrole_invalid", getusersforrole_invalid);
        resourceUriMap.put("getusersforsubzones", getusersforsubzones);
        resourceUriMap.put("getusersforsubzones_invalid", getusersforsubzones_invalid);
        resourceUriMap.put("getusersforzones", getusersforzones);
        resourceUriMap.put("getusersforzones_invalid", getusersforzones_invalid);
        resourceUriMap.put("getuserinfo", getuserinfo);
        resourceUriMap.put("getuserinfo_invalid", getuserinfo_invalid);
        resourceUriMap.put("getuserlogindetails", getuserlogindetails);
        resourceUriMap.put("getuserlogindetails_invalid", getuserlogindetails_invalid);
        resourceUriMap.put("users_apigetusersforthuser", users_apigetusersforthuser);
        resourceUriMap.put("users_apigetusersforthuser_invalid", users_apigetusersforthuser_invalid);
        resourceUriMap.put("users_attendancelog", users_attendancelog);
        resourceUriMap.put("users_attendancelog_invalid", users_attendancelog_invalid);
        resourceUriMap.put("users_autorotatepjpconsole", users_autorotatepjpconsole);
        resourceUriMap.put("users_autorotatepjpconsole_invalid", users_autorotatepjpconsole_invalid);
        resourceUriMap.put("users_beatwisedashboarddata", users_beatwisedashboarddata);
        resourceUriMap.put("users_beatwisedashboarddata_invalid", users_beatwisedashboarddata_invalid);
        resourceUriMap.put("users_checkcirculardependancy", users_checkcirculardependancy);
        resourceUriMap.put("users_checkcirculardependancy_invalid", users_checkcirculardependancy_invalid);
        resourceUriMap.put("users_checkemployeeid", users_checkemployeeid);
        resourceUriMap.put("users_checkemployeeid_invalid", users_checkemployeeid_invalid);
        resourceUriMap.put("users_validatetokenandgeneratecookie", users_validatetokenandgeneratecookie);
        resourceUriMap.put("users_validatetokenandgeneratecookie_invalid", users_validatetokenandgeneratecookie_invalid);
        resourceUriMap.put("users_isloggedin", users_isloggedin);
        resourceUriMap.put("users_isloggedin_invalid", users_isloggedin_invalid);
        resourceUriMap.put("users_logintoken", users_logintoken);
        resourceUriMap.put("users_logintoken_invalid", users_logintoken_invalid);
        resourceUriMap.put("users_mixpanel", users_mixpanel);
        resourceUriMap.put("users_mixpanel_invalid", users_mixpanel_invalid);
        resourceUriMap.put("users_upload_pjps", users_upload_pjps);
        resourceUriMap.put("users_upload_pjps_invalid", users_upload_pjps_invalid);
        resourceUriMap.put("users_deletesingleimagefroms3", users_deletesingleimagefroms3);
        resourceUriMap.put("users_deletesingleimagefroms3_invalid", users_deletesingleimagefroms3_invalid);
        resourceUriMap.put("users_hierarchyview", users_hierarchyview);
        resourceUriMap.put("users_hierarchyview_invalid", users_hierarchyview_invalid);
        resourceUriMap.put("users_search_users_under_user", users_search_users_under_user);
        resourceUriMap.put("users_search_users_under_user_invalid", users_search_users_under_user_invalid);
        resourceUriMap.put("uialiases_get_company_ui_aliases", uialiases_get_company_ui_aliases);
        resourceUriMap.put("uialiases_get_company_ui_aliases_invalid", uialiases_get_company_ui_aliases_invalid);
        resourceUriMap.put("activities_index", activities_index);
        resourceUriMap.put("activities_index_invalid", activities_index_invalid);
        resourceUriMap.put("brands_index", brands_index);
        resourceUriMap.put("brands_index_invalid", brands_index_invalid);
        resourceUriMap.put("brands_edit", brands_edit);
        resourceUriMap.put("brands_edit_invalid", brands_edit_invalid);
        resourceUriMap.put("categories_index", categories_index);
        resourceUriMap.put("categories_index_invalid", categories_index_invalid);
        resourceUriMap.put("categories_edit", categories_edit);
        resourceUriMap.put("categories_edit_invalid", categories_edit_invalid);
        resourceUriMap.put("checks_index", checks_index);
        resourceUriMap.put("checks_index_invalid", checks_index_invalid);
        resourceUriMap.put("discounts_index", discounts_index);
        resourceUriMap.put("discounts_index_invalid", discounts_index_invalid);
        resourceUriMap.put("discounts_getentity", discounts_getentity);
        resourceUriMap.put("discounts_getentity_invalid", discounts_getentity_invalid);
        resourceUriMap.put("discounts_getskunits", discounts_getskunits);
        resourceUriMap.put("discounts_getskunits_invalid", discounts_getskunits_invalid);
        resourceUriMap.put("discounts_getskusforwardiscounts", discounts_getskusforwardiscounts);
        resourceUriMap.put("discounts_getskusforwardiscounts_invalid", discounts_getskusforwardiscounts_invalid);
        resourceUriMap.put("discounts_getdiscountforout", discounts_getdiscountforout);
        resourceUriMap.put("discounts_getdiscountforout_invalid", discounts_getdiscountforout_invalid);
        resourceUriMap.put("discounts_getdiscountsforoutlet", discounts_getdiscountsforoutlet);
        resourceUriMap.put("discounts_getdiscountsforoutlet_invalid", discounts_getdiscountsforoutlet_invalid);
        resourceUriMap.put("discounts_updatediscountbyid", discounts_updatediscountbyid);
        resourceUriMap.put("discounts_updatediscountbyid_invalid", discounts_updatediscountbyid_invalid);
        resourceUriMap.put("discounts_getdiscounts", discounts_getdiscounts);
        resourceUriMap.put("discounts_getdiscounts_invalid", discounts_getdiscounts_invalid);
        resourceUriMap.put("discounts_get_primary", discounts_get_primary);
        resourceUriMap.put("discounts_get_primary_invalid", discounts_get_primary_invalid);
        resourceUriMap.put("discounts_getdiscountforoutletsnew", discounts_getdiscountforoutletsnew);
        resourceUriMap.put("discounts_getdiscountforoutletsnew_invalid", discounts_getdiscountforoutletsnew_invalid);
        resourceUriMap.put("discounts_add", discounts_add);
        resourceUriMap.put("discounts_add_invalid", discounts_add_invalid);
        resourceUriMap.put("discounts_addforoutlet", discounts_addforoutlet);
        resourceUriMap.put("discounts_addforoutlet_invalid", discounts_addforoutlet_invalid);
        resourceUriMap.put("discount_categories_getdiscountcategoriesapi", discount_categories_getdiscountcategoriesapi);
        resourceUriMap.put("discount_categories_getdiscountcategoriesapi_invalid", discount_categories_getdiscountcategoriesapi_invalid);
        resourceUriMap.put("discount_categories_getpaginateddiscountcategories", discount_categories_getpaginateddiscountcategories);
        resourceUriMap.put("discount_categories_edit", discount_categories_edit);
        resourceUriMap.put("discount_categories_getskusforwardiscountcat", discount_categories_getskusforwardiscountcat);
        resourceUriMap.put("discount_categories_getskusforwardiscountcat_invalid", discount_categories_getskusforwardiscountcat_invalid);
        resourceUriMap.put("units_index", units_index);
        resourceUriMap.put("units_index_invalid", units_index_invalid);
        resourceUriMap.put("warehouses_index", warehouses_index);
        resourceUriMap.put("warehouses_index_invalid", warehouses_index_invalid);
        resourceUriMap.put("banks_getbanksforwarehouses", banks_getbanksforwarehouses);
        resourceUriMap.put("banks_getbanksforwarehouses_invalid", banks_getbanksforwarehouses_invalid);
        resourceUriMap.put("beatdetails_approvebeatchanges", beatdetails_approvebeatchanges);
        resourceUriMap.put("beatdetails_approvebeatchanges_invalid", beatdetails_approvebeatchanges_invalid);
        resourceUriMap.put("beatdetails_beatadditioncheckforoutlets", beatdetails_beatadditioncheckforoutlets);
        resourceUriMap.put("beatdetails_beatadditioncheckforoutlets_invalid", beatdetails_beatadditioncheckforoutlets_invalid);
        resourceUriMap.put("beatdetails_getoutletsforbeatwitharea", beatdetails_getoutletsforbeatwitharea);
        resourceUriMap.put("beatdetails_getoutletsforbeatwitharea_invalid", beatdetails_getoutletsforbeatwitharea_invalid);
        resourceUriMap.put("POST_SalesApi", POST_SalesApi);
        resourceUriMap.put("stages_index_new_v2_api", stages_index_new_v2_api);
        resourceUriMap.put("stages_index_new_v2_api_invalid", stages_index_new_v2_api_invalid);
        resourceUriMap.put("stages_index_api", stages_index_api);
        resourceUriMap.put("stages_index_api_invalid", stages_index_api_invalid);
        resourceUriMap.put("stages_get_stages_v2", stages_get_stages_v2);
        resourceUriMap.put("stages_get_stages_v2_invalid", stages_get_stages_v2_invalid);
        resourceUriMap.put("stages_get_stages", stages_get_stages);
        resourceUriMap.put("stages_get_stages_invalid", stages_get_stages_invalid);
        resourceUriMap.put("stages_get_stage_mappings_by_id", stages_get_stage_mappings_by_id);
        resourceUriMap.put("stages_get_stage_mappings_by_id_invalid", stages_get_stage_mappings_by_id_invalid);
        resourceUriMap.put("POST_stages_add", POST_stages_add);
        resourceUriMap.put("stages_add_invalid", stages_add_invalid);
        resourceUriMap.put("skuvisibilities_get_visibility_details", skuvisibilities_get_visibility_details);
        resourceUriMap.put("skuvisibilities_get_visibility_details_invalid", skuvisibilities_get_visibility_details_invalid);
        resourceUriMap.put("skuvisibilities_get_sku_visible_skus_list_retailer", skuvisibilities_get_sku_visible_skus_list_retailer);
        resourceUriMap.put("skuvisibilities_get_sku_visible_skus_list_retailer_invalid", skuvisibilities_get_sku_visible_skus_list_retailer_invalid);
        resourceUriMap.put("skuvisibilities_get_sku_level_data", skuvisibilities_get_sku_level_data);
        resourceUriMap.put("skuvisibilities_get_sku_level_data_invalid", skuvisibilities_get_sku_level_data_invalid);
        resourceUriMap.put("skuvisibilities_get_sku_visible_skus_list", skuvisibilities_get_sku_visible_skus_list);
        resourceUriMap.put("skuvisibilities_get_sku_visible_skus_list_invalid", skuvisibilities_get_sku_visible_skus_list_invalid);
        resourceUriMap.put("skunitsgroupings_index", skunitsgroupings_index);
        resourceUriMap.put("skunitsgroupings_index_invalid", skunitsgroupings_index_invalid);
        resourceUriMap.put("skunitsgroupings_get_skunits_groups", skunitsgroupings_get_skunits_groups);
        resourceUriMap.put("skunitsgroupings_get_skunits_groups_invalid", skunitsgroupings_get_skunits_groups_invalid);
        resourceUriMap.put("groupskunittypes_indexapi", groupskunittypes_indexapi);
        resourceUriMap.put("groupskunittypes_indexapi_invalid", groupskunittypes_indexapi_invalid);
        resourceUriMap.put("groupskunits_indexapi", groupskunits_indexapi);
        resourceUriMap.put("groupskunits_indexapi_invalid", groupskunits_indexapi_invalid);
        resourceUriMap.put("orders_get_rolewise_users", orders_get_rolewise_users);
        resourceUriMap.put("orders_get_rolewise_users_invalid", orders_get_rolewise_users_invalid);
        resourceUriMap.put("orders_get_invoice_for_order", orders_get_invoice_for_order);
        resourceUriMap.put("orders_get_invoice_for_order_invalid", orders_get_invoice_for_order_invalid);
        resourceUriMap.put("orders_get_my_unfulfilled_orders", orders_get_my_unfulfilled_orders);
        resourceUriMap.put("orders_get_my_unfulfilled_orders_invalid", orders_get_my_unfulfilled_orders_invalid);
        resourceUriMap.put("orders_get_order_states", orders_get_order_states);
        resourceUriMap.put("orders_get_order_states_invalid", orders_get_order_states_invalid);
        resourceUriMap.put("orders_get_order_states_for_report", orders_get_order_states_for_report);
        resourceUriMap.put("orders_get_order_states_for_report_invalid", orders_get_order_states_for_report_invalid);
        resourceUriMap.put("orders_edited_order_report_data", orders_edited_order_report_data);
        resourceUriMap.put("orders_edited_order_report_data_invalid", orders_edited_order_report_data_invalid);
        resourceUriMap.put("orders_edit_from_index", orders_edit_from_index);
        resourceUriMap.put("orders_edit_from_index_invalid", orders_edit_from_index_invalid);
        resourceUriMap.put("orders_get_pending_orders", orders_get_pending_orders);
        resourceUriMap.put("orders_get_pending_orders_invalid", orders_get_pending_orders_invalid);
        resourceUriMap.put("POST_orders_indexwithdate", POST_orders_indexwithdate);
        resourceUriMap.put("POST_orders_indexwithdate_invalid", POST_orders_indexwithdate_invalid);
        resourceUriMap.put("orders_get_retailer_order", orders_get_retailer_order);
        resourceUriMap.put("orders_get_retailer_order_invalid", orders_get_retailer_order_invalid);
        resourceUriMap.put("orders_list_orders", orders_list_orders);
        resourceUriMap.put("orders_list_orders_invalid", orders_list_orders_invalid);
        resourceUriMap.put("orders_suggested_order_for_loadout", orders_suggested_order_for_loadout);
        resourceUriMap.put("orders_suggested_order_for_loadout_invalid", orders_suggested_order_for_loadout_invalid);
        resourceUriMap.put("orgclaims_get_last_claim_date_for_warehouse", orgclaims_get_last_claim_date_for_warehouse);
        resourceUriMap.put("orgclaims_get_last_claim_date_for_warehouse_invalid", orgclaims_get_last_claim_date_for_warehouse_invalid);
        resourceUriMap.put("orderstates_index", orderstates_index);
        resourceUriMap.put("orderstates_index_invalid", orderstates_index_invalid);
        resourceUriMap.put("orders_reject", orders_reject);
        resourceUriMap.put("orders_reject_invalid", orders_reject_invalid);
        resourceUriMap.put("orders_rerun", orders_rerun);
        resourceUriMap.put("orders_rerun_invalid", orders_rerun_invalid);
        resourceUriMap.put("payments_sale_place_order_for_distributor", payments_sale_place_order_for_distributor);
        resourceUriMap.put("payments_sale_place_order_for_distributor_invalid", payments_sale_place_order_for_distributor_invalid);
        resourceUriMap.put("payments_get_loyalty_details", payments_get_loyalty_details);
        resourceUriMap.put("payments_get_loyalty_details_invalid", payments_get_loyalty_details_invalid);
        resourceUriMap.put("payments_get_counter_sales", payments_get_counter_sales);
        resourceUriMap.put("payments_get_counter_sales_invalid", payments_get_counter_sales_invalid);
        resourceUriMap.put("payments_connect_api_get_sale_for_user", payments_connect_api_get_sale_for_user);
        resourceUriMap.put("payments_connect_api_get_sale_for_user_invalid", payments_connect_api_get_sale_for_user_invalid);
        resourceUriMap.put("payments_get_scheme_utilization", payments_get_scheme_utilization);
        resourceUriMap.put("payments_get_scheme_utilization_invalid", payments_get_scheme_utilization_invalid);
        resourceUriMap.put("payments_get_payment_scheme_details", payments_get_payment_scheme_details);
        resourceUriMap.put("payments_get_payment_scheme_details_invalid", payments_get_payment_scheme_details_invalid);
        resourceUriMap.put("payments_get_ars_data", payments_get_ars_data);
        resourceUriMap.put("payments_get_ars_data_invalid", payments_get_ars_data_invalid);
        resourceUriMap.put("POST_payments_getAverageSaleInfoOnSku", POST_payments_getAverageSaleInfoOnSku);
        resourceUriMap.put("POST_payments_getAverageSaleInfoOnSku_invalid", POST_payments_getAverageSaleInfoOnSku_invalid);
        resourceUriMap.put("payments_getsalesinfo", payments_getsalesinfo);
        resourceUriMap.put("payments_getsalesinfo_invalid", payments_getsalesinfo_invalid);
        resourceUriMap.put("payments_mailtoretailer", payments_mailtoretailer);
        resourceUriMap.put("payments_mailtoretailer_invalid", payments_mailtoretailer_invalid);
        resourceUriMap.put("payments_get_invoices", payments_get_invoices);
        resourceUriMap.put("payments_get_invoices_invalid", payments_get_invoices_invalid);
        resourceUriMap.put("payments_get_loadout_sheet_data", payments_get_loadout_sheet_data);
        resourceUriMap.put("payments_get_loadout_sheet_data_invalid", payments_get_loadout_sheet_data_invalid);
        resourceUriMap.put("payments_get_invoices_for_return", payments_get_invoices_for_return);
        resourceUriMap.put("payments_get_invoices_for_return_invalid", payments_get_invoices_for_return_invalid);
        resourceUriMap.put("payments_get_multiple_progress_status", payments_get_multiple_progress_status);
        resourceUriMap.put("payments_get_multiple_progress_status_invalid", payments_get_multiple_progress_status_invalid);
        resourceUriMap.put("payments_get_progress_status", payments_get_progress_status);
        resourceUriMap.put("payments_get_progress_status_invalid", payments_get_progress_status_invalid);
        resourceUriMap.put("payments_get_invoices_data_for_user", payments_get_invoices_data_for_user);
        resourceUriMap.put("payments_get_invoices_data_for_user_invalid", payments_get_invoices_data_for_user_invalid);
        resourceUriMap.put("payments_indexwithdate", payments_indexwithdate);
        resourceUriMap.put("payments_indexwithdate_invalid", payments_indexwithdate_invalid);
        resourceUriMap.put("payments_get_skus_below_stock_turnover_ratio", payments_get_skus_below_stock_turnover_ratio);
        resourceUriMap.put("payments_get_skus_below_stock_turnover_ratio_invalid", payments_get_skus_below_stock_turnover_ratio_invalid);
        resourceUriMap.put("payeedetails_get_document_name_data", payeedetails_get_document_name_data);
        resourceUriMap.put("payeedetails_get_document_name_data_invalid", payeedetails_get_document_name_data_invalid);
        resourceUriMap.put("payeedetails_get_disbursement_mode", payeedetails_get_disbursement_mode);
        resourceUriMap.put("payeedetails_get_disbursement_mode_invalid", payeedetails_get_disbursement_mode_invalid);
        resourceUriMap.put("pops_get_pops_data", pops_get_pops_data);
        resourceUriMap.put("pops_get_pops_data_invalid", pops_get_pops_data_invalid);
        resourceUriMap.put("pops_index_data", pops_index_data);
        resourceUriMap.put("pops_index_data_invalid", pops_index_data_invalid);
        resourceUriMap.put("pops_load_pop_details", pops_load_pop_details);
        resourceUriMap.put("pops_load_pop_details_invalid", pops_load_pop_details_invalid);
        resourceUriMap.put("pops_load_pop_properties", pops_load_pop_properties);
        resourceUriMap.put("pops_load_pop_properties_invalid", pops_load_pop_properties_invalid);
        resourceUriMap.put("pops_get_pop_info", pops_get_pop_info);
        resourceUriMap.put("pops_get_pop_info_invalid", pops_get_pop_info_invalid);
        resourceUriMap.put("popsstratas_api_get", popsstratas_api_get);
        resourceUriMap.put("popsstratas_api_get_invalid", popsstratas_api_get_invalid);
        resourceUriMap.put("promotiontypes_index", promotiontypes_index);
        resourceUriMap.put("promotiontypes_index_invalid", promotiontypes_index_invalid);
        resourceUriMap.put("pushregistrations_get_notification_history", pushregistrations_get_notification_history);
        resourceUriMap.put("pushregistrations_get_notification_history_invalid", pushregistrations_get_notification_history_invalid);
        resourceUriMap.put("outlettypes_index", outlettypes_index);
        resourceUriMap.put("outlettypes_index_invalid", outlettypes_index_invalid);
        resourceUriMap.put("outlettypes_get_outlet_types", outlettypes_get_outlet_types);
        resourceUriMap.put("outlettypes_get_outlet_types_invalid", outlettypes_get_outlet_types_invalid);
        resourceUriMap.put("outlet_types_get_custom_outlet_fields", outlet_types_get_custom_outlet_fields);
        resourceUriMap.put("outlet_types_get_custom_outlet_fields_invalid", outlet_types_get_custom_outlet_fields_invalid);
        resourceUriMap.put("roles_get_roles_for_user", roles_get_roles_for_user);
        resourceUriMap.put("roles_get_roles_for_user_invalid", roles_get_roles_for_user_invalid);
        resourceUriMap.put("roles_get_list", roles_get_list);
        resourceUriMap.put("roles_get_list_invalid", roles_get_list_invalid);
        resourceUriMap.put("roles_get_roles_for_current_user_role", roles_get_roles_for_current_user_role);
        resourceUriMap.put("roles_get_roles_for_current_user_role_invalid", roles_get_roles_for_current_user_role_invalid);
        resourceUriMap.put("roles_get_roles_by_alias", roles_get_roles_by_alias);
        resourceUriMap.put("roles_get_roles_by_alias_invalid", roles_get_roles_by_alias_invalid);
        resourceUriMap.put("getmbretailerGrndetails", getmbretailerGrndetails);
        resourceUriMap.put("orders_run_backgroundprocess_sequence", orders_run_backgroundprocess_sequence);
        resourceUriMap.put("orders_run_backgroundprocess_sequence_invalid", orders_run_backgroundprocess_sequence_invalid);
        resourceUriMap.put("orders_get_order_state_for_reject", orders_get_order_state_for_reject);
        resourceUriMap.put("orders_get_order_state_for_reject_invalid", orders_get_order_state_for_reject_invalid);
        resourceUriMap.put("getMdmDetails", getMdmDetails);
        resourceUriMap.put("insertMdmData_subzone_MDM", insertMdmData_subzone_MDM);
        resourceUriMap.put("insertBulkMdmData_subzone_MDM", insertBulkMdmData_subzone_MDM);
        resourceUriMap.put("insertMdmData_area_MDM", insertMdmData_area_MDM);
        resourceUriMap.put("insertBulkMdmData_area_MDM", insertBulkMdmData_area_MDM);
        resourceUriMap.put("insertMdmData_brand_MDM", insertMdmData_brand_MDM);
        resourceUriMap.put("insertBulkMdmData_brand_MDM", insertBulkMdmData_brand_MDM);
        resourceUriMap.put("insertMdmData_outletcategories_MDM", insertMdmData_outletcategories_MDM);
        resourceUriMap.put("insertBulkMdmData_outletcategories_MDM", insertBulkMdmData_outletcategories_MDM);
        resourceUriMap.put("insertMdmData_categories_MDM", insertMdmData_categories_MDM);
        resourceUriMap.put("insertBulkMdmData_categories_MDM", insertBulkMdmData_categories_MDM);
        resourceUriMap.put("insertMdmData_subbrand_mdm", insertMdmData_subbrand_mdm);
        resourceUriMap.put("insertBulkMdmData_subbrand_mdm", insertBulkMdmData_subbrand_mdm);
        resourceUriMap.put("postApproveLoadouts_empty", postApproveLoadouts);
        resourceUriMap.put("postApproveLoadouts_multiple", postApproveLoadouts);
        resourceUriMap.put("postDeleteLoadouts_empty", postDeleteLoadouts);
        resourceUriMap.put("postDeleteLoadouts_invalid", postDeleteLoadouts);
        resourceUriMap.put("postDeleteLoadouts", postDeleteLoadouts);
        resourceUriMap.put("insertMdmData_Servesizes_mdm", insertMdmData_Servesizes_mdm);
        resourceUriMap.put("insertBulkMdmData_Servesizes_mdm", insertBulkMdmData_Servesizes_mdm);
        resourceUriMap.put("insertMdmData_variants_MDM", insertMdmData_variants_MDM);
        resourceUriMap.put("insertBulkMdmData_variants_MDM", insertBulkMdmData_variants_MDM);
        resourceUriMap.put("insertMdmData_subcategories_MDM", insertMdmData_subcategories_MDM);
        resourceUriMap.put("insertBulkMdmData_subcategories_MDM", insertBulkMdmData_subcategories_MDM);
        resourceUriMap.put("insertMdmData_apptabsequence_MDM", insertMdmData_apptabsequence_MDM);
        resourceUriMap.put("insertBulkMdmData_apptabsequence_MDM", insertBulkMdmData_apptabsequence_MDM);
        resourceUriMap.put("insertMdmData_assetAuditMdmUpload_MDM", insertMdmData_assetAuditMdmUpload_MDM);
        resourceUriMap.put("insertBulkMdmData_assetAuditMdmUpload_MDM", insertBulkMdmData_assetAuditMdmUpload_MDM);
        resourceUriMap.put("insertMdmData_updateAssetSerialno_MDM", insertMdmData_updateAssetSerialno_MDM);
        resourceUriMap.put("insertBulkMdmData_updateAssetSerialno_MDM", insertBulkMdmData_updateAssetSerialno_MDM);
        resourceUriMap.put("insertMdmData_assetDeregisterMdm_MDM", insertMdmData_assetDeregisterMdm_MDM);
        resourceUriMap.put("insertBulkMdmData_assetDeregisterMdm_MDM", insertBulkMdmData_assetDeregisterMdm_MDM);
        resourceUriMap.put("insertMdmData_addAssets_MDM", insertMdmData_addAssets_MDM);
        resourceUriMap.put("insertBulkMdmData_addAssets_MDM", insertBulkMdmData_addAssets_MDM);
        resourceUriMap.put("insertMdmData_metaBisonBrandName_MDM", insertMdmData_metaBisonBrandName_MDM);
        resourceUriMap.put("insertBulkMdmData_metaBisonBrandName_MDM", insertBulkMdmData_metaBisonBrandName_MDM);
        resourceUriMap.put("insertMdmData_billCutPerDay_MDM", insertMdmData_billCutPerDay_MDM);
        resourceUriMap.put("insertBulkMdmData_billCutPerDay_MDM", insertBulkMdmData_billCutPerDay_MDM);
        resourceUriMap.put("insertMdmData_discountsMdmUpload_MDM", insertMdmData_discountsMdmUpload_MDM);
        resourceUriMap.put("insertBulkMdmData_discountsMdmUpload_MDM", insertBulkMdmData_discountsMdmUpload_MDM);
        resourceUriMap.put("insertMdmData_businessNormsMdmUpload_MDM", insertMdmData_businessNormsMdmUpload_MDM);
        resourceUriMap.put("insertBulkMdmData_businessNormsMdmUpload_MDM", insertBulkMdmData_businessNormsMdmUpload_MDM);
        resourceUriMap.put("insertMdmData_bulkClaimApproval_MDM", insertMdmData_bulkClaimApproval_MDM);
        resourceUriMap.put("insertBulkMdmData_bulkClaimApproval_MDM", insertBulkMdmData_bulkClaimApproval_MDM);
        resourceUriMap.put("insertMdmData_claimlimitConfigs_MDM", insertMdmData_claimlimitConfigs_MDM);
        resourceUriMap.put("insertBulkMdmData_claimlimitConfigs_MDM", insertBulkMdmData_claimlimitConfigs_MDM);
        resourceUriMap.put("insertMdmData_biwsCiwsRequestDetailsMdm_MDM", insertMdmData_biwsCiwsRequestDetailsMdm_MDM);
        resourceUriMap.put("insertBulkMdmData_biwsCiwsRequestDetailsMdm_MDM", insertBulkMdmData_biwsCiwsRequestDetailsMdm_MDM);
        resourceUriMap.put("insertMdmData_physicalClaimReceipt_MDM", insertMdmData_physicalClaimReceipt_MDM);
        resourceUriMap.put("insertBulkMdmData_physicalClaimReceipt_MDM", insertBulkMdmData_physicalClaimReceipt_MDM);
        resourceUriMap.put("insertMdmData_brandisMdmUploadForSaleReturn_MDM", insertMdmData_brandisMdmUploadForSaleReturn_MDM);
        resourceUriMap.put("insertBulkMdmData_brandisMdmUploadForSaleReturn_MDM", insertBulkMdmData_brandisMdmUploadForSaleReturn_MDM);
        resourceUriMap.put("insertMdmData_businessUnitMapping_MDM", insertMdmData_businessUnitMapping_MDM);
        resourceUriMap.put("insertBulkMdmData_businessUnitMapping_MDM", insertBulkMdmData_businessUnitMapping_MDM);
        resourceUriMap.put("insertMdmData_collateralAddAndUpdate_MDM", insertMdmData_collateralAddAndUpdate_MDM);
        resourceUriMap.put("insertBulkMdmData_collateralAddAndUpdate_MDM", insertBulkMdmData_collateralAddAndUpdate_MDM);
        resourceUriMap.put("insertMdmData_categorySubcategoryMapping_MDM", insertMdmData_categorySubcategoryMapping_MDM);
        resourceUriMap.put("insertBulkMdmData_categorySubcategoryMapping_MDM", insertBulkMdmData_categorySubcategoryMapping_MDM);
        resourceUriMap.put("insertMdmData_bidrequestMdm_MDM", insertMdmData_bidrequestMdm_MDM);
        resourceUriMap.put("insertBulkMdmData_bidrequestMdm_MDM", insertBulkMdmData_bidrequestMdm_MDM);
        resourceUriMap.put("insertMdmData_configurationMappings_MDM", insertMdmData_configurationMappings_MDM);
        resourceUriMap.put("insertBulkMdmData_configurationMappings_MDM", insertBulkMdmData_configurationMappings_MDM);
        resourceUriMap.put("insertMdmData_primarydiscountConfigs_MDM", insertMdmData_primarydiscountConfigs_MDM);
        resourceUriMap.put("insertBulkMdmData_primarydiscountConfigs_MDM", insertBulkMdmData_primarydiscountConfigs_MDM);
        resourceUriMap.put("payments_deletepayment", payments_deletepayment);
        resourceUriMap.put("payments_deletepayment_invalid", payments_deletepayment_invalid);
        resourceUriMap.put("getOutletAndChildOutlet", getOutletAndChildOutlet);
        resourceUriMap.put("getOutletAndChildOutlet_invalid", getOutletAndChildOutlet_invalid);
        resourceUriMap.put("getCompanyInfo", getCompanyInfo);
        resourceUriMap.put("getCompanyInfo_invalid", getCompanyInfo_invalid);
        resourceUriMap.put("getCompanyKycForm", getCompanyKycForm);
        resourceUriMap.put("getCompanyKycForm_invalid", getCompanyKycForm_invalid);
        resourceUriMap.put("getBrandWiseWarehouseSkusRetailer", getBrandWiseWarehouseSkusRetailer);
        resourceUriMap.put("getBrandWiseWarehouseSkusRetailer_invalid", getBrandWiseWarehouseSkusRetailer_invalid);
        resourceUriMap.put("getUserListByArea", getUserListByArea);
        resourceUriMap.put("getUserListByArea_invalid", getUserListByArea_invalid);
        resourceUriMap.put("POST_getOutletbalance", POST_getOutletbalance);
        resourceUriMap.put("POST_getBatchRetailerApi", POST_getBatchRetailerApi);
        resourceUriMap.put("POST_getTabstypeids_genericform", POST_getTabstypeids_genericform);
        resourceUriMap.put("getoutletbalance", getoutletbalance);
        resourceUriMap.put("getoutletbalance_invalid", getoutletbalance_invalid);
        resourceUriMap.put("getunapprovedoutlets", getunapprovedoutlets);
        resourceUriMap.put("getunapprovedoutlets_invalid", getunapprovedoutlets_invalid);
        resourceUriMap.put("getoutletlist", getoutletlist);
        resourceUriMap.put("getoutletlist_invalid", getoutletlist_invalid);
        resourceUriMap.put("validationrules", validationrules);
        resourceUriMap.put("validationrules_invalid", validationrules_invalid);
        resourceUriMap.put("getassetaudits", getassetaudits);
        resourceUriMap.put("getassetaudits_invalid", getassetaudits_invalid);
        resourceUriMap.put("assetdetails_approvalList", assetdetails_approvalList);
        resourceUriMap.put("assetdetails_approvalList_invalid", assetdetails_approvalList_invalid);
        resourceUriMap.put("inactivateEntityMappingsIndex", inactivateEntityMappingsIndex);
        resourceUriMap.put("warehouse_edit_bill_sequence_no", warehouse_edit_bill_sequence_no);
        resourceUriMap.put("warehouse_edit_bill_sequence_no_invalid", warehouse_edit_bill_sequence_no_invalid);
        resourceUriMap.put("warehouse_edit_bill_sequence_no_no_params", warehouse_edit_bill_sequence_no_no_params);
    }

    public static String getResourceURI(String requestName) {
        String uri = resourceUriMap.get(requestName);
        if (uri == null) {
            throw new RuntimeException("Resource uri not defined for the specific file name - " + requestName);
        }
        return uri;
    }
}

