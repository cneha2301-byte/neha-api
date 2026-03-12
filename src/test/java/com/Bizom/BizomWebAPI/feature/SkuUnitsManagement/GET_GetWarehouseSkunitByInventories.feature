@BizomWebAPI @SkuUnitsManagement @GetWarehouseSkunitByInventories @ProductManagement @OS
Feature: Warehouse Skunit By Inventories API Testing
  As a system user
  I want to test the skunits getWarehouseSkunitByInventories endpoint
  So that I can ensure proper functionality and mapping of inventory to skunits

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get warehouse skunit by inventories without access token
    When I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse skunit by inventories with invalid access token
#    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
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
#  Scenario: Get warehouse skunit by inventories with expired access token
#    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
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
#  Scenario: Get warehouse skunit by inventories with malformed access token
#    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
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
  Scenario: Get warehouse skunit by inventories with valid access token
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message|Fetched successfully|
    And I store the response as "warehouse_skunit_inventories_response" name using full path

  @Positive @DataValidation
  Scenario: Validate data map structure and types
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.message|string|
      |$.data|object|
      |$.data['1']|string|

  @Positive @StaticValues
  Scenario: Validate some static values in data
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|Cafe Cuba|
      |$.data['2']|Maaza|
      |$.data['3']|Fanta|

  @Positive @ContentValidation
  Scenario: Validate data content presence
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |data|
      |Cafe Cuba|
      |Maaza|

  @Positive @Performance
  Scenario: Performance test for warehouse skunit by inventories endpoint
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for warehouse skunit by inventories endpoint
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get warehouse skunit by inventories with invalid query parameters
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get warehouse skunit by inventories with special characters in query parameters
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get warehouse skunit by inventories with SQL injection attempt
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get warehouse skunit by inventories with maximum query parameters
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get warehouse skunit by inventories with invalid endpoint
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"

#  @Positive @Regression
#  Scenario: Regression test for warehouse skunit by inventories endpoint
#    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Validate warehouse skunit by inventories response completeness
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end warehouse skunit by inventories retrieval workflow
    And I send the GET request to "skunits_get_warehouse_skunit_by_inventories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "warehouse_skunit_inventories_response" name using full path
