@BizomWebAPI @SkuUnitsManagement @SkuUnits @ProductManagement @OS
Feature: Get Parent SKUs API Testing
  As a system user
  I want to test the get parent SKUs endpoint
  So that I can ensure proper functionality and data retrieval for parent SKUs management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get parent SKUs without access token
    When I send the GET request to "skunits_get_parent_skus" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get parent SKUs with invalid access token
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get parent SKUs with expired access token
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get parent SKUs with malformed access token
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get parent SKUs with valid access token
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And I store the response as "parent_skus_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate parent SKUs response structure
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Skunit|array|
#
#  @Positive @DataValidation
#  Scenario: Validate parent SKUs specific data values
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#
#  @Positive @DataValidation
#  Scenario: Validate parent SKUs with static values
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#
#  @Positive @Performance
#  Scenario: Performance test for parent SKUs endpoint
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for parent SKUs endpoint
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Negative @Validation
#  Scenario: Get parent SKUs with invalid query parameters
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Negative @Validation
#  Scenario: Get parent SKUs with special characters in query parameters
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Negative @Security
#  Scenario: Get parent SKUs with SQL injection attempt
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE skunits; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Negative @Boundary
#  Scenario: Get parent SKUs with maximum query parameters
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
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
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Negative @ErrorHandling
#  Scenario: Get parent SKUs with invalid endpoint
#    And I send the GET request to "skunits_get_parent_skus_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: Validate parent SKUs business logic
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Positive @DataIntegrity
#  Scenario: Validate parent SKUs data integrity
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Skunit|array|
#
#  @Positive @Regression
#  Scenario: Regression test for parent SKUs endpoint
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Skunit|array|
#
#  @Positive @Functional
#  Scenario: Validate parent SKUs response completeness
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Skunit|array|
#
#  @Positive @ArrayValidation
#  Scenario: Validate parent SKUs array structure and content
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Skunit|array|
#
#  @Positive @ContentValidation
#  Scenario: Validate parent SKUs content structure
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Skunit|
#      |No Parent Sku"s Found|
#
#  @Positive @LoadTesting
#  Scenario: Load testing for parent SKUs endpoint
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Negative @Timeout
#  Scenario: Test parent SKUs endpoint timeout handling
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end parent SKUs retrieval workflow
#    And I send the GET request to "skunits_get_parent_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Parent Sku"s Found|
#      |$.Skunit|[]|
#    And I store the response as "parent_skus_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Skunit|array|

