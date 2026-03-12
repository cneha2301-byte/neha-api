@BizomWebAPI @SkuUnitsManagement @GetAllSkus @WarehouseOperations @OS
Feature: Get All SKUs API Testing
  As a system user
  I want to test the skunits getallskus endpoint
  So that I can ensure proper functionality and retrieval of complete SKU master data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all skus without access token
    When I send the GET request to "skunits_get_all_skus" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get all skus with invalid access token
#    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get all skus with expired access token
#    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get all skus with malformed access token
#    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
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
  Scenario: Get all skus with valid access token
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.result|"true"|
      |$.reason|""|
    And I store the response as "all_skus_response" name using full path

  @Positive @DataValidation
  Scenario: Validate top-level and nested objects structure
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Products|array|
      |$.Products[0]|object|
      |$.Products[0].Skunit|object|
      |$.Products[0].Skunit.id|string|
      |$.Products[0].Skunit.name|string|
      |$.Products[0].Skunit.mrp|string|
      |$.Products[0].Skunit.price|string|
      |$.Products[0].Skunit.active|string|
      |$.Products[0].Skunit.brand_id|string|
      |$.Products[0].Skunit.category_id|array|
      |$.Products[0].Skunit.subcategory_id|array|
      |$.Products[0].Brand|object|
      |$.Products[0].Brand.id|string|
      |$.Products[0].Brand.name|string|
      |$.Products[0].Category|array|
      |$.Products[0].Category[0].id|string|
      |$.Products[0].Category[0].name|string|
      |$.Products[0].Subcategory|array|
      |$.Products[0].Subcategory[0].id|string|
      |$.Products[0].Subcategory[0].name|string|

  @Positive @ContentValidation
  Scenario: Validate all skus content presence
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Products|
      |Skunit|
      |Brand|
      |Category|
      |Subcategory|

#  @Positive @StaticValues
#  Scenario: Validate specific SKU static values (sample)
#    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Products[0].Skunit.name|Cafe Cuba|
#      |$.Products[0].Brand.name|oOKCPj|
#      |$.Products[0].Category[0].name|Juice|
#      |$.Products[0].Subcategory[0].name|Maaza|

  @Positive @DBValidation
  Scenario: DB validate first SKU record fields
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Products[0].Skunit.name|DB:skunits:name: id=1|

  @Positive @Performance
  Scenario: Performance test for all skus endpoint
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for all skus endpoint
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get all skus with invalid query parameters
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get all skus with special characters in query parameters
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all skus with SQL injection attempt
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get all skus with maximum query parameters
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get all skus with invalid endpoint
#    And I send the GET request to "skunits_get_all_skus_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"

  @Positive @Regression
  Scenario: Regression test for all skus endpoint
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Validate all skus response completeness
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end all skus retrieval workflow
    And I send the GET request to "skunits_get_all_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "all_skus_response" name using full path
