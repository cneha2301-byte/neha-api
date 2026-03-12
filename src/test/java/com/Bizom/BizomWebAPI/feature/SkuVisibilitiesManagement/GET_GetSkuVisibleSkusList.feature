@BizomWebAPI @SkuVisibilitiesManagement @SkuVisibilities @ProductManagement @OS
Feature: Get SKU Visible SKUs List API Testing
  As a system user
  I want to test the get SKU visible SKUs list endpoint
  So that I can ensure proper functionality and data retrieval for SKU visibility management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU visible SKUs list without access token
    When I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU visible SKUs list with invalid access token
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU visible SKUs list with expired access token
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU visible SKUs list with malformed access token
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get SKU visible SKUs list with valid access token
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And I store the response as "sku_visible_skus_list_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate SKU visible SKUs list response structure
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Positive @DataValidation
#  Scenario: Validate SKU visible SKUs list specific data values
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|

#  @Positive @DataValidation
#  Scenario: Validate SKU visible SKUs list with static values
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|

#  @Positive @Performance
#  Scenario: Performance test for SKU visible SKUs list endpoint
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||

#  @Positive @Concurrency
#  Scenario: Concurrent access test for SKU visible SKUs list endpoint
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||

#  @Negative @Validation
#  Scenario: Get SKU visible SKUs list with invalid query parameters
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#
#  @Negative @Validation
#  Scenario: Get SKU visible SKUs list with special characters in query parameters
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#
#  @Negative @Security
#  Scenario: Get SKU visible SKUs list with SQL injection attempt
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE skuvisibilities; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#
#  @Negative @Boundary
#  Scenario: Get SKU visible SKUs list with maximum query parameters
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#
#  @Negative @ErrorHandling
#  Scenario: Get SKU visible SKUs list with invalid endpoint
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: Validate SKU visible SKUs list business logic
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#
#  @Positive @DataIntegrity
#  Scenario: Validate SKU visible SKUs list data integrity
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#
#  @Positive @Regression
#  Scenario: Regression test for SKU visible SKUs list endpoint
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|
#
#  @Positive @Functional
#  Scenario: Validate SKU visible SKUs list response completeness
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|
#
#  @Positive @ArrayValidation
#  Scenario: Validate SKU visible SKUs list array structure and content
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|
#
#  @Positive @ContentValidation
#  Scenario: Validate SKU visible SKUs list content structure
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#
#  @Positive @LoadTesting
#  Scenario: Load testing for SKU visible SKUs list endpoint
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#
#  @Negative @Timeout
#  Scenario: Test SKU visible SKUs list endpoint timeout handling
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#
#  @Positive @EndToEnd
#  Scenario: End-to-end SKU visible SKUs list retrieval workflow
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason||
#      |$.Data|[]|
#    And I store the response as "sku_visible_skus_list_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

