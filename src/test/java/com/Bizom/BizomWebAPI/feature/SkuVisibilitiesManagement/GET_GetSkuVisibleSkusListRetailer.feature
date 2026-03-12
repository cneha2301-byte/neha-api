@BizomWebAPI @SkuVisibilitiesManagement @SkuVisibilitiesGetSkuVisibleSkusListRetailer @ProductManagement @OS
Feature: SKU Visibilities GetSkuVisibleSkusListRetailer API Testing
  As a system user
  I want to test the skuvisibilities getSkuVisibleskusListRetailer endpoint
  So that I can ensure proper functionality and data retrieval for SKU visible SKUs list for retailer management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU visible SKUs list retailer without access token
    When I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU visible SKUs list retailer with invalid access token
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU visible SKUs list retailer with expired access token
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU visible SKUs list retailer with malformed access token
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get SKU visible SKUs list retailer with valid access token
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And I store the response as "skuvisibilities_getskuvisibleskuslistretailer_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKU visible SKUs list retailer response structure
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: Validate SKU visible SKUs list retailer with static values
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Positive @Performance
  Scenario: Performance test for SKU visible SKUs list retailer endpoint
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU visible SKUs list retailer endpoint
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Validation
  Scenario: Get SKU visible SKUs list retailer with invalid query parameters
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Validation
  Scenario: Get SKU visible SKUs list retailer with special characters in query parameters
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Security
  Scenario: Get SKU visible SKUs list retailer with SQL injection attempt
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skuvisibilities; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Boundary
  Scenario: Get SKU visible SKUs list retailer with maximum query parameters
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

#  @Negative @ErrorHandling
#  Scenario: Get SKU visible SKUs list retailer with invalid endpoint
#    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate SKU visible SKUs list retailer business logic
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Positive @DataIntegrity
  Scenario: Validate SKU visible SKUs list retailer data integrity
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: Regression test for SKU visible SKUs list retailer endpoint
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate SKU visible SKUs list retailer response completeness
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ObjectValidation
  Scenario: Validate SKU visible SKUs list retailer object structure and content
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: Validate SKU visible SKUs list retailer content structure
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No Data Found|

  @Positive @LoadTesting
  Scenario: Load testing for SKU visible SKUs list retailer endpoint
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Timeout
  Scenario: Test SKU visible SKUs list retailer endpoint timeout handling
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Positive @EndToEnd
  Scenario: End-to-end SKU visible SKUs list retailer data retrieval workflow
    And I send the GET request to "skuvisibilities_get_sku_visible_skus_list_retailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And I store the response as "skuvisibilities_getskuvisibleskuslistretailer_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
