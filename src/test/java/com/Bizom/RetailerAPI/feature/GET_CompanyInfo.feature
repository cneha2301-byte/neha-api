@Retailer @Companies @Sanity @allGet
Feature: This feature file contains testcases for GET endpoint getCompanyInfo

  @CompaniesPositive
  Scenario: TC_01 getCompanyInfo - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $[0].Company.id          | "470212" |
      | $[0].Company.name        | "ui" |
      | $[0].Company.currency    | "INR" |
      | $[0].Company.timezone    | "Asia/Kolkata" |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_02 getCompanyInfo - verify response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].Company                        |
      | $[0].Company.id                     |
      | $[0].Company.name                   |
      | $[0].Company.address                |
      | $[0].Company.phoneno                |
      | $[0].Company.email                  |
      | $[0].Company.taxno                  |
      | $[0].Company.logo_url               |
      | $[0].Company.url                    |
      | $[0].Company.userslimit             |
      | $[0].Company.recordslimit           |
      | $[0].Company.rateperuser            |
      | $[0].Company.rateperrecord          |
      | $[0].Company.currentbalance         |
      | $[0].Company.support_emailid        |
      | $[0].Company.support_phoneno        |
      | $[0].Company.created                |
      | $[0].Company.modified               |
      | $[0].Company.cstno                  |
      | $[0].Company.tnc                    |
      | $[0].Company.currency               |
      | $[0].Company.currencyname           |
      | $[0].Company.version                 |
      | $[0].Company.timezone                |
      | $[0].Company.footer_text             |
      | $[0].Company.quickbooks_id          |
      | $[0].Company.kycForm                |
      | $[0].Company.nocsequence            |
      | $[0].Company.prefix_noc             |
      | $[0].Company.suffix_noc             |
      | $[0].Company.currency_id            |
      | $[0].Company.xplorazzishelf_id      |
      | $[0].Company.findmynearestoutlet_settings |
      | $[0].Company.serviceinvoicedata     |
      | $[0].Company.vendor_configurations  |
      | $[0].Company.nearpay_uuid           |
      | $[0].Company.nearpay_terminal_id    |
      | $[0].Company.payment_due_message    |
      | $[0].Company.hide_made_in           |
      | $[0].Company.portalconfigurationstatus |
      | $[0].Company.s3bucket               |
      | $[0].Company.omspics                |
      | $[0].Company.dbname                 |
      | $[0].Company.domainname             |
      | $[0].Company.countryCode            |
      | $[0].Setting                        |
      | $[0].Workflow                        |
      | $[0].Uialias                        |
      | $[0].UialiasList                    |
      | $[0].Leavetypes                     |
      | $[0].Rejectedreasons                |
      | $[0].Exceptionreason                |
      | $[0].attendanceApprovalReason       |
      | $[0].Presenttypes                   |
      | $[0].Ordertypes                     |
      | $[0].Activitytypes                  |
      | $[0].attendanceSetting              |
      | $[0].attendanceStatus               |
      | $[0].Outletcategories               |
      | $[0].Uploadtypes                    |
      | $[0].Date                           |
      | $[0].PrinterConfig                  |
      | $[0].MobilePrinterConfig            |
      | $[0].outletKycForm                  |
      | $[0].currencyExchangeRate           |
      | $[0].merchandisingData              |
      | $[0].outletFrequency                |
      | $[0].tataMotorSyncConfig            |
      | $[0].outletRequiredFields           |
      | $[0].WarehouseRequiredFields        |
      | $[0].isEditApprovalField            |
      | $[0].mslPropertyReasonLimit         |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_03 getCompanyInfo - verify company settings structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].Setting.isBluetoothDIG         |
      | $[0].Setting.EnableBluetoothLaodoutDIG |
      | $[0].Setting.EnableBluetoothSaleReturnDIG |
      | $[0].Setting.EnableBluetoothCollectionDIG |
      | $[0].Setting.Cash_Reconciliation    |
      | $[0].Setting.stocktaking            |
      | $[0].Setting.claims                |
      | $[0].Setting.isoutletcustomized     |
      | $[0].Setting.ispaymentcustomized   |
      | $[0].Setting.isordercustomized      |
      | $[0].Setting.autoloadoutapprove     |
      | $[0].Setting.autooutletapprove      |
      | $[0].Setting.autoorderapprove       |
      | $[0].Setting.autoorderfulfill       |
      | $[0].Setting.salereturntoinventory  |
      | $[0].Setting.salereturntouserbalance |
      | $[0].Setting.loadincashcheck        |
      | $[0].Setting.shufflepjpbeats        |
      | $[0].Setting.qtyincases             |
      | $[0].Setting.outletloc              |
      | $[0].Setting.applyscheme            |
      | $[0].Setting.applyvariablediscount  |
      | $[0].Setting.fbvarszform            |
      | $[0].Setting.attendanceimage        |
      | $[0].Setting.compstk                |
      | $[0].Setting.valaddstk              |
      | $[0].Setting.autoapproveattendance  |
      | $[0].Setting.markreporteeattendance  |
      | $[0].Setting.isusercustomized       |
      | $[0].Setting.customsmsgateway       |
      | $[0].Setting.customsmsgatewayapi    |
      | $[0].Setting.maxlogincountperday    |
      | $[0].Setting.priceperunit           |
      | $[0].Setting.editorder              |
      | $[0].Setting.detailedoutletinfo     |
      | $[0].Setting.outletdetailcount      |
      | $[0].Setting.genericform            |
      | $[0].Setting.delpaymentpermissionid |
      | $[0].Setting.applyvariablediscountskuwise |
      | $[0].Setting.addloadintonextday     |
      | $[0].Setting.editdiscountpermissionid |
      | $[0].Setting.edituserpermissionid   |
      | $[0].Setting.editoutletpermissionid |
      | $[0].Setting.checkavailableinventory |
      | $[0].Setting.unitcaseunit           |
      | $[0].Setting.unitcasevalue          |
      | $[0].Setting.showquantityinunitcase |
      | $[0].Setting.dashboardattendancegraphview |
      | $[0].Setting.consumptiononuserview  |
      | $[0].Setting.attendencesummary      |
      | $[0].Setting.listpaymentsettings    |
      | $[0].Setting.newcalltype            |
      | $[0].Setting.activityform           |
      | $[0].Setting.skusortorder           |
      | $[0].Setting.amountvisible          |
      | $[0].Setting.applycategorydiscount  |
      | $[0].Setting.addoutletpermissionid  |
      | $[0].Setting.tcpcnc1withcategory    |
      | $[0].Setting.setdiscountcategorypermissionid |
      | $[0].Setting.makekeycustomerpermissionid |
      | $[0].Setting.orderretailerpic       |
      | $[0].Setting.paymentwisecolor       |
      | $[0].Setting.iscontactcustomized   |
      | $[0].Setting.editpaymentpermissionid |
      | $[0].Setting.showstockwithordersale |
      | $[0].Setting.lms                    |
      | $[0].Setting.reversefulfilorder     |
      | $[0].Setting.cutoffdeleteinvoice    |
      | $[0].Setting.cutoffeditinvoice     |
      | $[0].Setting.cutofffulfillorder     |
      | $[0].Setting.autoorderapprovefordistributor |
      | $[0].Setting.tgtachineod            |
      | $[0].Setting.keycustdisunitshow     |
      | $[0].Setting.stuckopportunity       |
      | $[0].Setting.showordersign          |
      | $[0].Setting.qtyincasesformobile    |
      | $[0].Setting.distridiscountonout    |
      | $[0].Setting.readGeoLocation        |
      | $[0].Setting.throughsale             |
      | $[0].Setting.fulfillall             |
      | $[0].Setting.useloadoutasproductioninput |
      | $[0].Setting.salesreturnsapproval   |
      | $[0].Setting.profilepiccompulsary   |
      | $[0].Setting.powerproductno         |
      | $[0].Setting.poweroutletno          |
      | $[0].Setting.freeskuprice           |
      | $[0].Setting.editinactiveuser       |
      | $[0].Setting.prefix_to_billno       |
      | $[0].Setting.suffix_to_billno       |
      | $[0].Setting.disschoption           |
      | $[0].Setting.disschpriority         |
      | $[0].Setting.trackgeolocationtime   |
      | $[0].Setting.freeskulowestprice     |
      | $[0].Setting.maxmonthleave          |
      | $[0].Setting.categorywiseendofdayreport |
      | $[0].Setting.tcpcnc1withcategorynosku |
      | $[0].Setting.roundinvoice           |
      | $[0].Setting.userbalancecheckinloadout |
      | $[0].Setting.tasks                  |
      | $[0].Setting.onlocationoption       |
      | $[0].Setting.compstkineod           |
      | $[0].Setting.showPrintReceiptskuCodewise |
      | $[0].Setting.enablebillsequencenoforall |
      | $[0].Setting.outletfields           |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_04 getCompanyInfo - verify workflow configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $[0].Workflow.sms       | "1"   |
      | $[0].Workflow.oms       | "1"   |
      | $[0].Workflow.dms       | "0"   |
      | $[0].Workflow.userclaims| "0"   |
      | $[0].Workflow.bidmgmt   | "0"   |
      | $[0].Workflow.orgclaims | "0"   |
      | $[0].Workflow.activity  | "1"   |
      | $[0].Workflow.attendance| "1"   |
      | $[0].Workflow.assettrack| "1"   |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_05 getCompanyInfo - verify UI alias configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].Uialias.ZONE                  |
      | $[0].Uialias.WAREHOUSE             |
      | $[0].Uialias.AREA                  |
      | $[0].Uialias.DISTRIBUTOR           |
      | $[0].Uialias.ADMIN                 |
      | $[0].Uialias.ZONE_MANAGER          |
      | $[0].Uialias.SALES_MANAGER         |
      | $[0].Uialias.WAREHOUSE_MANAGER     |
      | $[0].Uialias.DISTRIBUTOR_MANAGER   |
      | $[0].Uialias.DISTRIBUTOR_SALES_MANAGER |
      | $[0].Uialias.SALESMAN              |
      | $[0].Uialias.DISTRIBUTOR_SALESMAN  |
      | $[0].Uialias.REPORT_ADMIN         |
      | $[0].Uialias.EXECUTION_AUDITOR     |
      | $[0].Uialias.KEYCUSTOMER           |
      | $[0].Uialias.ORDER                 |
      | $[0].Uialias.OUTLET                |
      | $[0].Uialias.INVENTORY_MANAGER     |
      | $[0].Uialias.VENDOR                |
      | $[0].Uialias.RETAILER              |
      | $[0].Uialias.valueaddedstock       |
      | $[0].Uialias.DEPOT                 |
      | $[0].Uialias.ORDER_FULFILLMENT     |
      | $[0].Uialias.SUBZONE               |
      | $[0].Uialias.ERP API USER          |
      | $[0].Uialias.ADD_ORDER             |
      | $[0].Uialias.COLLATERAL            |
      | $[0].Uialias.STOCK_AT_WAREHOUSE    |
      | $[0].Uialias.POP                   |
      | $[0].Uialias.UNIT                  |
      | $[0].Uialias.ACTIVITY_FORM         |
      | $[0].Uialias.CASE                  |
      | $[0].Uialias.ADD_COMMENT           |
      | $[0].Uialias.BEAT                  |
      | $[0].Uialias.OUTLET_TYPE           |
      | $[0].Uialias.OUTLET_CATEGORY       |
      | $[0].Uialias.GENERIC_FORM          |
      | $[0].Uialias.ASSET                 |
      | $[0].Uialias.BALANCE               |
      | $[0].Uialias.SUGGESTED_ORDER_COLUMN |
      | $[0].Uialias.SALE_RETURN           |
      | $[0].Uialias.OUTLET_HEADING        |
      | $[0].Uialias.ADD_ACTIVITY          |
      | $[0].Uialias.CLEAR_DATA            |
      | $[0].Uialias.START_CALL            |
      | $[0].Uialias.TASK                  |
      | $[0].Uialias.TRAINER               |
      | $[0].Uialias.CONTACT               |
      | $[0].Uialias.LOCATION              |
      | $[0].Uialias.QPS_CASH_SCHEME       |
      | $[0].Uialias.STOCKS                |
      | $[0].Uialias.MRP                   |
      | $[0].Uialias.SUPPORT_PHONE         |
      | $[0].Uialias.DELIVERY DATE         |
      | $[0].Uialias.MYINFO_TRANSACTIONS   |
      | $[0].Uialias.OUTLET_TRANSACTIONS   |
      | $[0].Uialias.order_challan         |
      | $[0].Uialias.CONVERTED_CASES       |
      | $[0].Uialias.L1                    |
      | $[0].Uialias.L2                    |
      | $[0].Uialias.U1                    |
      | $[0].Uialias.U2                    |
      | $[0].Uialias.ADD_SALE              |
      | $[0].Uialias.TRAINING_START        |
      | $[0].Uialias.TRAINING_END          |
      | $[0].Uialias.REMARKS               |
      | $[0].Uialias.INSTALLED             |
      | $[0].Uialias.LIST                  |
      | $[0].Uialias.MAP                   |
      | $[0].Uialias.PROFILE               |
      | $[0].Uialias.REPORTS               |
      | $[0].Uialias.PHONE_IN_ORDER        |
      | $[0].Uialias.EVENT_FORMS           |
      | $[0].Uialias.APPROVED_OUTLETS      |
      | $[0].Uialias.FOCUS_SKU             |
      | $[0].Uialias.DATE_OF_DELIVERY      |
      | $[0].Uialias.DIRECT_SALE           |
      | $[0].Uialias.VALUE_ADDED_STOCK     |
      | $[0].Uialias.STOCK_HEADING         |
      | $[0].Uialias.BRAND                 |
      | $[0].Uialias.SUBBRAND              |
      | $[0].Uialias.SIZE                  |
      | $[0].Uialias.VARIANT               |
      | $[0].Uialias.PACKAGING             |
      | $[0].Uialias.SUBCATEGORY           |
      | $[0].Uialias.CATEGORY              |
      | $[0].Uialias.SECONDARY_GRN         |
      | $[0].Uialias.PJP                   |
      | $[0].Uialias.PRICE                 |
      | $[0].Uialias.LOADSHEET             |
      | $[0].Uialias.ISSUES                |
      | $[0].Uialias.CUSTOM_INVOICE        |
      | $[0].Uialias.PO_NO                 |
      | $[0].Uialias.GRN_NO                |
      | $[0].Uialias.INVOICE_DATE           |
      | $[0].Uialias.CUSTOM_INVOICE_DATE   |
      | $[0].Uialias.TOUR_PROGRAM          |
      | $[0].Uialias.CREDIT_NOTE_NO        |
      | $[0].Uialias.SALES_INVOICES        |
      | $[0].Uialias.BEAT_CREATE           |
      | $[0].Uialias.BEAT_EDIT             |
      | $[0].Uialias.BEAT_VIEW             |
      | $[0].Uialias.PJP_PLAN              |
      | $[0].Uialias.TASK_ASSIGN           |
      | $[0].Uialias.UNIQUE_PRODUCTIVE_CALLS |
      | $[0].Uialias.TOTAL_PRODUCTIVE_CALLS |
      | $[0].Uialias.EXISTING ASSET        |
      | $[0].Uialias.ASSET AUDIT           |
      | $[0].Uialias.BUDGET                |
      | $[0].Uialias.ONLINE_PAYMENT        |
      | $[0].Uialias.PENDING_AMOUNT        |
      | $[0].Uialias.REMAINING_CREDIT      |
      | $[0].Uialias.ORDER_AMOUNT           |
      | $[0].Uialias.STANDARD_CASE         |
      | $[0].Uialias.UNITCASE              |
      | $[0].Uialias.SUBPACKS              |
      | $[0].Uialias.DESCRIPTION           |
      | $[0].Uialias.ERPGROUP_ID           |
      | $[0].Uialias.BATCHES               |
      | $[0].Uialias.OUTLET_CATEGORIES_FILTER |
      | $[0].Uialias.OUTLET_VERTICALS_FILTER |
      | $[0].Uialias.CITIES_HIERARCHY_FILTER |
      | $[0].Uialias.PERCENTAGE_DISCOUNT   |
      | $[0].Uialias.ABSOLUTE_DISCOUNT     |
      | $[0].Uialias.ORDER_ON_PHONE        |
      | $[0].Uialias.GST_NOTE              |
      | $[0].Uialias.FREE                  |
      | $[0].Uialias.PRIMARY_STOCK         |
      | $[0].Uialias.OPENING_AUDIT_STOCK   |
      | $[0].Uialias.TOTAL_QUANTITY_ENTERED_FOR_CHILD_SKUS |
      | $[0].Uialias.DESIGN_TYPE           |
      | $[0].Uialias.VAT                   |
      | $[0].Uialias.DISCOUNTED PRICE      |
      | $[0].Uialias.GST                   |
      | $[0].Uialias.CESS                  |
      | $[0].Uialias.CREDIT                |
      | $[0].Uialias.MSL                   |
      | $[0].Uialias.PRIMARYSELFCOLLECTION |
      | $[0].Uialias.DISTRIBUTOR_NAME      |
      | $[0].Uialias.DISTRIBUTOR_TYPE      |
      | $[0].Uialias.DISTRIBUTOR_CATEGORY  |
      | $[0].Uialias.CLAIM                 |
      | $[0].Uialias.ERP_ID                |
      | $[0].Uialias.SEGMENT               |
      | $[0].Uialias.MSL_TARGET            |
      | $[0].Uialias.MSL_ACHIEVEMENT       |
      | $[0].Uialias.BILL_NO               |
      | $[0].Uialias.MERCHANDISING         |
      | $[0].Uialias.MERCHANDISING_VISITOR |
      | $[0].Uialias.MERCHANDISING_PLANO   |
      | $[0].Uialias.SKU_FACING            |
      | $[0].Uialias.TOTAL_SKU_FACING      |
      | $[0].Uialias.TOTAL_SKU             |
      | $[0].Uialias.SHELF_PRICE           |
      | $[0].Uialias.MERCHANDISING_PRODUCT_PRESENT |
      | $[0].Uialias.MERCHANDISING_PROMOTION_PRESENT |
      | $[0].Uialias.MERCHANDISING_PLANOGRAM_COMPLIANT |
      | $[0].Uialias.LOADOUTS              |
      | $[0].Uialias.LOADINS               |
      | $[0].Uialias.VIEW_VAN_STOCK         |
      | $[0].Uialias.INCENTIVE             |
      | $[0].Uialias.CUSTOMSKUNAME         |
      | $[0].Uialias.CUSTOMMRP             |
      | $[0].Uialias.SALE                  |
      | $[0].Uialias.TASK_DUE_DATE         |
      | $[0].Uialias.TASK_REMINDER_DATE    |
      | $[0].Uialias.MERCHANDISING_ASSET   |
      | $[0].Uialias.MERCHANDISING_ASSET_PURITY |
      | $[0].Uialias.MERCHANDISING_PLANO_COMPLIANCE |
      | $[0].Uialias.MERCHANDISING_PURITY_ACCEPT_MESSAGE |
      | $[0].Uialias.ASSET_QR_CODE         |
      | $[0].Uialias.MANUFACTURE_DATE      |
      | $[0].Uialias.MANUFACTURE_TIME      |
      | $[0].Uialias.EXPIRY_DATE           |
      | $[0].Uialias.APPROVE_PLAN          |
      | $[0].Uialias.TASK_PLAN             |
      | $[0].Uialias.VISIT_TYPE            |
      | $[0].Uialias.TOWN                  |
      | $[0].Uialias.DB_NAME               |
      | $[0].Uialias.SR_NAME               |
      | $[0].Uialias.BEAT_NAME             |
      | $[0].Uialias.BEAT_NAME1            |
      | $[0].Uialias.COMPETITOR            |
      | $[0].Uialias.COMPETITOR_VISITOR    |
      | $[0].Uialias.COMPETITOR_PLANOGRAM   |
      | $[0].Uialias.COMPETITOR_SKU_FACING  |
      | $[0].Uialias.COMPETITOR_SKU        |
      | $[0].Uialias.COMPETITOR_PRICE       |
      | $[0].Uialias.COMPETITOR_PRODUCT_PRESENT |
      | $[0].Uialias.COMPETITOR_PROMOTION_PRESENT |
      | $[0].Uialias.COMPETITOR_PLANOGRAM_COMPLIANT |
      | $[0].Uialias.COMPETITOR_ASSET      |
      | $[0].Uialias.COMPETITOR_ASSET_PURITY |
      | $[0].Uialias.COMPETITOR_PLANO_COMPLIANCE |
      | $[0].Uialias.COMPETITOR_PURITY_ACCEPT_MESSAGE |
      | $[0].Uialias.TOUR_TYPES            |
      | $[0].Uialias.PCP                   |
      | $[0].Uialias.TOUR_PLAN             |
      | $[0].Uialias.MTP                   |
      | $[0].Uialias.TASK_START_DATE       |
      | $[0].Uialias.PACKAGE_SKUNIT        |
      | $[0].Uialias.EMPTY_SKUNIT          |
      | $[0].Uialias.INNERCASE             |
      | $[0].Uialias.PAYEE_NAME            |
      | $[0].Uialias.PAYEE_ACCOUNT_NUMBER  |
      | $[0].Uialias.PAYEE_IFSC_CODE       |
      | $[0].Uialias.PAYEE_DOCUMENTS       |
      | $[0].Uialias.PAYEE_BANK_NAME       |
      | $[0].Uialias.PAYEE_DISTRIBUTION_PERCENTAGE |
      | $[0].Uialias.PAYEE                 |
      | $[0].Uialias.DISBURSEMENT_MODE     |
      | $[0].Uialias.PAYEE_BRANCH_NAME     |
      | $[0].Uialias.FSSAI_NO              |
      | $[0].Uialias.COMPANY_NAME          |
      | $[0].Uialias.Availability          |
      | $[0].Uialias.Innerpercase          |
      | $[0].Uialias.ATTENDANCE_PRESENT    |
      | $[0].Uialias.ATTENDANCE_ABSENT     |
      | $[0].Uialias.CITY                  |
      | $[0].Uialias.DISTRICT              |
      | $[0].Uialias.STATE                 |
      | $[0].Uialias.UNITSPERCASE          |
      | $[0].Uialias.PO_ERP                |
      | $[0].Uialias.SAMPLING              |
      | $[0].Uialias.TERTIARY              |
      | $[0].Uialias.OUTLET_INFORMATION    |
      | $[0].Uialias.SCHEME_ERP_ID         |
      | $[0].Uialias.SKUNIT_TYPE           |
      | $[0].Uialias.SKUNIT_VALUE          |
      | $[0].Uialias.NO_BEAT               |
      | $[0].Uialias.BUSINESS STREAM       |
      | $[0].Uialias.CHANNEL               |
      | $[0].Uialias.AGGREGATE TYPE        |
      | $[0].Uialias.OUTLET TYPE           |
      | $[0].Uialias.LAST_SOLD_PRICE       |
      | $[0].Uialias.TRANSFER_AREA         |
      | $[0].Uialias.ISSEZ                 |
      | $[0].Uialias.ISDTA                 |
      | $[0].Uialias.VOLUME_PER_CASE       |
      | $[0].Uialias.Cubic Meter           |
      | $[0].Uialias.RO_MIN                |
      | $[0].Uialias.ROTATION              |
      | $[0].Uialias.NET_BANKING           |
      | $[0].Uialias.CREDIT_CARD           |
      | $[0].Uialias.DEBIT_CARD           |
      | $[0].Uialias.UPI                   |
      | $[0].Uialias.WALLET                |
      | $[0].Uialias.PRESENCECOMPLIANCE    |
      | $[0].Uialias.ROWCOMPLIANCE         |
      | $[0].Uialias.SEQUENCECOMPLIANCE    |
      | $[0].Uialias.BILL_DETAILS          |
      | $[0].Uialias.SKU_INACTIVE          |
      | $[0].Uialias.SPECIAL_CREDIT        |
      | $[0].Uialias.USERS                 |
      | $[0].Uialias.TERTIARYUNIT          |
      | $[0].Uialias.TERTIARYCASE          |
      | $[0].Uialias.TERTIARYINNERCASE     |
      | $[0].Uialias.MARGIN                |
      | $[0].Uialias.TRAINING_OUTLET_NAME  |
      | $[0].Uialias.OUTLET_BALANCE        |
      | $[0].Uialias.TODAY_BEAT            |
      | $[0].Uialias.CUSTOMER_SKUNITS      |
      | $[0].Uialias.SKULINE               |
      | $[0].Uialias.TOTAL_TARGET          |
      | $[0].Uialias.REGULAR_TARGET        |
      | $[0].Uialias.EXTRA_TARGET          |
      | $[0].Uialias.GRN                   |
      | $[0].Uialias.CLOSING_STOCK         |
      | $[0].Uialias.TOTAL_AMOUNT          |
      | $[0].Uialias.FINAL_AMOUNT          |
      | $[0].Uialias.TOTAL_CALLS           |
      | $[0].Uialias.HEAD_QUARTERS        |
      | $[0].Uialias.HQ                    |
      | $[0].Uialias.ASSET_SERIAL_NUMBER   |
      | $[0].Uialias.OUTLET_NOT_VISITED    |
      | $[0].Uialias.OUTLET_CLOSED         |
      | $[0].Uialias.INFLUENCER            |
      | $[0].Uialias.PAYEE_PAN_NUMBER      |
      | $[0].Uialias.NEWSKU                |
      | $[0].Uialias.CONSUMER              |
      | $[0].Uialias.LEAD                  |
      | $[0].Uialias.START_CALL_OFF_LOCATION |
      | $[0].Uialias.PENDING_TARGET        |
      | $[0].Uialias.ACHIEVED_TARGET       |
      | $[0].Uialias.UNIQUE_SKUS_SOLD      |
      | $[0].Uialias.CURRENT_STOCK         |
      | $[0].Uialias.FORMS                 |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_06 getCompanyInfo - verify attendance settings
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].attendanceSetting.starttime   |
      | $[0].attendanceSetting.cutoff      |
      | $[0].attendanceSetting.halfday     |
      | $[0].attendanceSetting.remarkcutoff |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_07 getCompanyInfo - verify attendance status configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].attendanceStatus[0].role_id    |
      | $[0].attendanceStatus[0].status     |
      | $[0].attendanceStatus[0].reason     |
      | $[0].attendanceStatus[0].starttime |
      | $[0].attendanceStatus[0].endtime   |
      | $[0].attendanceStatus[0].designation_id |
      | $[0].attendanceStatus[1].role_id    |
      | $[0].attendanceStatus[1].status     |
      | $[0].attendanceStatus[1].reason     |
      | $[0].attendanceStatus[1].starttime |
      | $[0].attendanceStatus[1].endtime   |
      | $[0].attendanceStatus[1].designation_id |
      | $[0].attendanceStatus[2].role_id    |
      | $[0].attendanceStatus[2].status     |
      | $[0].attendanceStatus[2].reason     |
      | $[0].attendanceStatus[2].starttime |
      | $[0].attendanceStatus[2].endtime   |
      | $[0].attendanceStatus[2].designation_id |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_08 getCompanyInfo - verify outlet categories
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].Outletcategories[0].Outletcategory.id |
      | $[0].Outletcategories[0].Outletcategory.name |
      | $[0].Outletcategories[1].Outletcategory.id |
      | $[0].Outletcategories[1].Outletcategory.name |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_09 getCompanyInfo - verify date configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].Date.previousmonth.start_date  |
      | $[0].Date.previousmonth.end_date    |
      | $[0].Date.currentmonth.start_date   |
      | $[0].Date.currentmonth.end_date     |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_10 getCompanyInfo - verify printer configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].PrinterConfig[0].id           |
      | $[0].PrinterConfig[0].name         |
      | $[0].PrinterConfig[0].description  |
      | $[0].PrinterConfig[0].configuration |
      | $[0].PrinterConfig[0].configuration[0].align |
      | $[0].PrinterConfig[0].configuration[0].length |
      | $[0].PrinterConfig[0].configuration[0].fieldName |
      | $[0].PrinterConfig[0].configuration[0].leftPadding |
      | $[0].PrinterConfig[0].configuration[0].rightPadding |
      | $[0].PrinterConfig[0].configuration[1].align |
      | $[0].PrinterConfig[0].configuration[1].length |
      | $[0].PrinterConfig[0].configuration[1].fieldName |
      | $[0].PrinterConfig[0].configuration[1].leftPadding |
      | $[0].PrinterConfig[0].configuration[1].rightPadding |
      | $[0].PrinterConfig[0].configuration[2].align |
      | $[0].PrinterConfig[0].configuration[2].length |
      | $[0].PrinterConfig[0].configuration[2].fieldName |
      | $[0].PrinterConfig[0].configuration[2].leftPadding |
      | $[0].PrinterConfig[0].configuration[2].rightPadding |
      | $[0].PrinterConfig[0].configuration[3].align |
      | $[0].PrinterConfig[0].configuration[3].length |
      | $[0].PrinterConfig[0].configuration[3].fieldName |
      | $[0].PrinterConfig[0].configuration[3].leftPadding |
      | $[0].PrinterConfig[0].configuration[3].rightPadding |
      | $[0].PrinterConfig[0].configuration[4].align |
      | $[0].PrinterConfig[0].configuration[4].length |
      | $[0].PrinterConfig[0].configuration[4].fieldName |
      | $[0].PrinterConfig[0].configuration[4].leftPadding |
      | $[0].PrinterConfig[0].configuration[4].rightPadding |
      | $[0].PrinterConfig[0].configuration[5].align |
      | $[0].PrinterConfig[0].configuration[5].length |
      | $[0].PrinterConfig[0].configuration[5].fieldName |
      | $[0].PrinterConfig[0].configuration[5].leftPadding |
      | $[0].PrinterConfig[0].configuration[5].rightPadding |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_11 getCompanyInfo - verify mobile printer configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $[0].MobilePrinterConfig[0].Result | true |
      | $[0].MobilePrinterConfig[0].name | "default" |
      | $[0].MobilePrinterConfig[0].description | "The default printer configuration" |
    And verifies the field is present in the response
      | JPath                               |
      | $[0].MobilePrinterConfig[0].configuration |
      | $[0].MobilePrinterConfig[0].configuration[0].key |
      | $[0].MobilePrinterConfig[0].configuration[0].type |
      | $[0].MobilePrinterConfig[0].configuration[0].align |
      | $[0].MobilePrinterConfig[0].configuration[0].isSku |
      | $[0].MobilePrinterConfig[0].configuration[0].label |
      | $[0].MobilePrinterConfig[0].configuration[0].value |
      | $[0].MobilePrinterConfig[0].configuration[0].length |
      | $[0].MobilePrinterConfig[0].configuration[0].row_id |
      | $[0].MobilePrinterConfig[0].configuration[0].setting |
      | $[0].MobilePrinterConfig[0].configuration[0].column_id |
      | $[0].MobilePrinterConfig[0].configuration[0].left_padding |
      | $[0].MobilePrinterConfig[0].configuration[0].right_padding |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_12 getCompanyInfo - verify leave types configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].Leavetypes[0].Leavetype.id     |
      | $[0].Leavetypes[0].Leavetype.company_id |
      | $[0].Leavetypes[0].Leavetype.name   |
      | $[0].Leavetypes[0].Leavetype.maxleaveinyear |
      | $[0].Leavetypes[0].Leavetype.active |
      | $[0].Leavetypes[0].Leavetype.created |
      | $[0].Leavetypes[0].Leavetype.modified |
      | $[0].Leavetypes[0].Leavetype.forrole_id |
      | $[0].Leavetypes[0].Leavetype.created_by |
      | $[0].Leavetypes[0].Leavetype.forrole_idarray |
      | $[0].Leavetypes[0].Leavetype.leavetakencurrentyear |
      | $[0].Leavetypes[0].Leavetype.leavetakencurrentmonth |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_13 getCompanyInfo - verify order types configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].Ordertypes[0].Ordertype.id    |
      | $[0].Ordertypes[0].Ordertype.name  |
      | $[0].Ordertypes[1].Ordertype.id    |
      | $[0].Ordertypes[1].Ordertype.name  |
      | $[0].Ordertypes[2].Ordertype.id    |
      | $[0].Ordertypes[2].Ordertype.name  |
      | $[0].Ordertypes[3].Ordertype.id    |
      | $[0].Ordertypes[3].Ordertype.name  |
      | $[0].Ordertypes[4].Ordertype.id    |
      | $[0].Ordertypes[4].Ordertype.name  |
      | $[0].Ordertypes[5].Ordertype.id    |
      | $[0].Ordertypes[5].Ordertype.name  |
      | $[0].Ordertypes[6].Ordertype.id    |
      | $[0].Ordertypes[6].Ordertype.name  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_14 getCompanyInfo - verify merchandising data configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].merchandisingData.shelfType   |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_15 getCompanyInfo - verify outlet frequency configuration
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].outletFrequency                |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @CompaniesPositive
  Scenario: TC_16 getCompanyInfo - verify additional configuration fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $[0].tataMotorSyncConfig           |
      | $[0].outletRequiredFields          |
      | $[0].WarehouseRequiredFields       |
      | $[0].isEditApprovalField           |
      | $[0].mslPropertyReasonLimit       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "companyInfo" name using full path

  @Performance @Load
  Scenario: TC_17 getCompanyInfo - verify API performance under normal load
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "800" milliseconds
    And I store the response as "companyInfo" name using full path


  @BusinessLogic @DataIntegrity
  Scenario: TC_18 getCompanyInfo - verify company data consistency and business rules
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanyInfo" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $[0].Company.currency    | "INR" |
      | $[0].Company.timezone    | "Asia/Kolkata" |
      | $[0].Company.countryCode | "IN"  |
      | $[0].Workflow.sms       | "1"   |
      | $[0].Workflow.activity  | "1"   |
      | $[0].Workflow.attendance| "1"   |
    And I store the response as "companyInfo" name using full path
