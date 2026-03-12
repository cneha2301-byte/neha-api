@BizomWebAPI @PI @DiscountsManagement @DiscountCategoriesAPI @IntegrationServices
Feature: Discount categories GET API testing
  As a Bizom Web API tester
  I want to validate the discount categories listing endpoint
  So that users always receive accurate and performant discount category data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    @Positive @Smoke
  Scenario: TC_01 Retrieve discount categories listing with valid parameters
    And I send the GET request to "discount_categories_getdiscountcategoriesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|8|
      |iDisplayStart|0|
      |iDisplayLength|10|
      |mDataProp_0|discountCategoryId|
      |mDataProp_1|discountCategoryName|
      |mDataProp_2|skuId|
      |mDataProp_3|skuName|
      |mDataProp_4|maxDiscount|
      |mDataProp_5|minDiscount|
      |mDataProp_6|6|
      |mDataProp_7|7|
      |bRegex_0|false|
      |bRegex_1|false|
      |bRegex_2|false|
      |bRegex_3|false|
      |bRegex_4|false|
      |bRegex_5|false|
      |bRegex_6|false|
      |bRegex_7|false|
      |bSearchable_0|true|
      |bSearchable_1|true|
      |bSearchable_2|true|
      |bSearchable_3|true|
      |bSearchable_4|true|
      |bSearchable_5|true|
      |bSearchable_6|false|
      |bSearchable_7|false|
      |bSortable_0|true|
      |bSortable_1|true|
      |bSortable_2|true|
      |bSortable_3|true|
      |bSortable_4|true|
      |bSortable_5|true|
      |bSortable_6|false|
      |bSortable_7|false|
      |bRegex|false|
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.iTotalRecords|"5"|
      |$.iTotalDisplayRecords|"5"|
      |$.aaData[0].discountCategoryName|DB:discount_categories:name: id=1|
      |$.aaData[0].skuName|DB:skunits:name: id=6|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
    And I store the response as "discount_categories_response" name using full path

  @Positive @DataValidation
  Scenario: TC_02 Validate discount categories data rows
    And I send the GET request to "discount_categories_getdiscountcategoriesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|8|
      |iDisplayStart|0|
      |iDisplayLength|10|
      |mDataProp_0|discountCategoryId|
      |mDataProp_1|discountCategoryName|
      |mDataProp_2|skuId|
      |mDataProp_3|skuName|
      |mDataProp_4|maxDiscount|
      |mDataProp_5|minDiscount|
      |mDataProp_6|6|
      |mDataProp_7|7|
      |bRegex_0|false|
      |bRegex_1|false|
      |bRegex_2|false|
      |bRegex_3|false|
      |bRegex_4|false|
      |bRegex_5|false|
      |bRegex_6|false|
      |bRegex_7|false|
      |bSearchable_0|true|
      |bSearchable_1|true|
      |bSearchable_2|true|
      |bSearchable_3|true|
      |bSearchable_4|true|
      |bSearchable_5|true|
      |bSearchable_6|false|
      |bSearchable_7|false|
      |bSortable_0|true|
      |bSortable_1|true|
      |bSortable_2|true|
      |bSortable_3|true|
      |bSortable_4|true|
      |bSortable_5|true|
      |bSortable_6|false|
      |bSortable_7|false|
      |bRegex|false|
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.aaData[0].skuName|DB:skunits:name: id=6|

  @Positive @DataValidation
  Scenario: TC_03 Validate discount categories response data types
    And I send the GET request to "discount_categories_getdiscountcategoriesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|8|
      |iDisplayStart|0|
      |iDisplayLength|10|
      |mDataProp_0|discountCategoryId|
      |mDataProp_1|discountCategoryName|
      |mDataProp_2|skuId|
      |mDataProp_3|skuName|
      |mDataProp_4|maxDiscount|
      |mDataProp_5|minDiscount|
      |mDataProp_6|6|
      |mDataProp_7|7|
      |bRegex_0|false|
      |bRegex_1|false|
      |bRegex_2|false|
      |bRegex_3|false|
      |bRegex_4|false|
      |bRegex_5|false|
      |bRegex_6|false|
      |bRegex_7|false|
      |bSearchable_0|true|
      |bSearchable_1|true|
      |bSearchable_2|true|
      |bSearchable_3|true|
      |bSearchable_4|true|
      |bSearchable_5|true|
      |bSearchable_6|false|
      |bSearchable_7|false|
      |bSortable_0|true|
      |bSortable_1|true|
      |bSortable_2|true|
      |bSortable_3|true|
      |bSortable_4|true|
      |bSortable_5|true|
      |bSortable_6|false|
      |bSortable_7|false|
      |bRegex|false|
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].discountCategoryId|string|
      |$.aaData[0].discountCategoryName|string|
      |$.aaData[0].discountCategoryStatus|string|
      |$.aaData[0].skuId|string|
      |$.aaData[0].skuName|string|
      |$.aaData[0].maxDiscount|string|
      |$.aaData[0].minDiscount|string|

  @Positive @Performance
  Scenario: TC_04 Validate discount categories response time threshold
    And I send the GET request to "discount_categories_getdiscountcategoriesapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|8|
      |iDisplayStart|0|
      |iDisplayLength|10|
      |mDataProp_0|discountCategoryId|
      |mDataProp_1|discountCategoryName|
      |mDataProp_2|skuId|
      |mDataProp_3|skuName|
      |mDataProp_4|maxDiscount|
      |mDataProp_5|minDiscount|
      |mDataProp_6|6|
      |mDataProp_7|7|
      |bRegex_0|false|
      |bRegex_1|false|
      |bRegex_2|false|
      |bRegex_3|false|
      |bRegex_4|false|
      |bRegex_5|false|
      |bRegex_6|false|
      |bRegex_7|false|
      |bSearchable_0|true|
      |bSearchable_1|true|
      |bSearchable_2|true|
      |bSearchable_3|true|
      |bSearchable_4|true|
      |bSearchable_5|true|
      |bSearchable_6|false|
      |bSearchable_7|false|
      |bSortable_0|true|
      |bSortable_1|true|
      |bSortable_2|true|
      |bSortable_3|true|
      |bSortable_4|true|
      |bSortable_5|true|
      |bSortable_6|false|
      |bSortable_7|false|
      |bRegex|false|
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.aaData[0].skuName|DB:skunits:name: id=6|

