@BizomWebAPI @SkuUnitsManagement @AjaxSkuList @WarehouseOperations @OS
Feature: Ajax SKU List API Testing
  As a system user
  I want to test the skunits ajaxskulist endpoint
  So that I can ensure proper functionality and DataTable-style listing of SKUs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get ajax SKU list without access token
    When I send the GET request to "skunits_ajax_sku_list" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get ajax SKU list with invalid access token
#    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get ajax SKU list with expired access token
#    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get ajax SKU list with malformed access token
#    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get ajax SKU list with valid access token
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "ajax_sku_list_response" name using full path

  @Positive @DataValidation
  Scenario: Validate DataTable response structure and types
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
      |$.data[0].skuID|string|
      |$.data[0].skuName|string|
      |$.data[0].skucode|string|
      |$.data[0].skuMrp|string|
      |$.data[0].skuVat|string|
      |$.data[0].skuprice|string|
      |$.data[0].skUnitCase|string|
      |$.data[0].active|string|
      |$.data[0].brandName|string|
      |$.data[0].skunit_type|string|

#  @Positive @StaticValues
#  Scenario: Validate first few SKU static values
#    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"71"|
#      |$.recordsFiltered|"71"|
#      |$.data[0].skuName|Cafe Cuba|
#      |$.data[0].skucode|Cuba|
#      |$.data[0].brandName|oOKCPj|
#      |$.data[1].skuName|Maaza|
#      |$.data[1].skucode|Maza|
#      |$.data[2].skuName|Fanta|

  @Positive @DBValidation
  Scenario: DB validate ajax SKU list first rows
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].skuName|DB:skunits:name: id=1|
      |$.data[0].skucode|DB:skunits:skucode: id=1|

  @Positive @ContentValidation
  Scenario: Validate response contains expected keys
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|
      |skuName|
      |skucode|

  @Positive @Performance
  Scenario: Performance test for ajax SKU list endpoint
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for ajax SKU list endpoint
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get ajax SKU list with invalid query parameters
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get ajax SKU list with special characters in query parameters
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get ajax SKU list with SQL injection attempt
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get ajax SKU list with maximum query parameters
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get ajax SKU list with invalid endpoint
#    And I send the GET request to "skunits_ajax_sku_list_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"

  @Positive @Regression
  Scenario: Regression test for ajax SKU list endpoint
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Validate ajax SKU list response completeness
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end ajax SKU list retrieval workflow
    And I send the GET request to "skunits_ajax_sku_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "ajax_sku_list_response" name using full path
