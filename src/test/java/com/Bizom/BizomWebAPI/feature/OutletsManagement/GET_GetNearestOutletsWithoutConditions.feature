@BizomWebAPI @CE @OutletsManagement @OutletsNearestOutlet @InventoryOperations
Feature: Get Nearest Outlets Without Conditions API Testing
  As a system user
  I want to test the get nearest outlets without conditions endpoint
  So that I can ensure proper functionality for fetching nearest outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get nearest outlets without access token
    When I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get nearest outlets with invalid access token
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get nearest outlets with expired access token
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get nearest outlets with malformed access token
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get nearest outlets with valid access token
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Data.outlet_ids|[]|
      |$.Data.outlets|[]|
    And I store the response as "nearest_outlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate nearest outlets response structure
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.outlet_ids|[]|
      |$.Data.outlets|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|object|
      |$.Data.outlet_ids|array|
      |$.Data.outlets|array|

  @Positive @Performance
  Scenario: TC_07 Performance test for nearest outlets endpoint
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for nearest outlets endpoint
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_09 Get nearest outlets with invalid query parameters
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_10 Get nearest outlets with special characters in query parameters
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Security
  Scenario: TC_11 Get nearest outlets with SQL injection attempt
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Boundary
  Scenario: TC_12 Get nearest outlets with maximum query parameters
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
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

#  @Negative @ErrorHandling
#  Scenario: TC_13 Get nearest outlets with invalid endpoint
#    And I send the GET request to "outlets_get_nearest_outlets_without_conditions_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate nearest outlets business logic
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Data.outlet_ids|[]|
      |$.Data.outlets|[]|

  @Positive @DataIntegrity
  Scenario: TC_15 Validate nearest outlets data integrity
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|object|
      |$.Data.outlet_ids|array|
      |$.Data.outlets|array|

  @Positive @Regression
  Scenario: TC_16 Regression test for nearest outlets endpoint
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|object|
      |$.Data.outlet_ids|array|
      |$.Data.outlets|array|

  @Positive @Functional
  Scenario: TC_17 Validate nearest outlets response completeness
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data.outlet_ids|array|
      |$.Data.outlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.outlet_ids|[]|
      |$.Data.outlets|[]|

  @Positive @ContentValidation
  Scenario: TC_18 Validate nearest outlets content structure
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response contains the following values
      |Value|
      |Result|
      |Data|
      |outlet_ids|
      |outlets|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for nearest outlets endpoint
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Timeout
  Scenario: TC_20 Test nearest outlets endpoint timeout handling
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end nearest outlets data retrieval workflow
    And I send the GET request to "outlets_get_nearest_outlets_without_conditions" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Data.outlet_ids|[]|
      |$.Data.outlets|[]|
    And I store the response as "nearest_outlets_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|object|
      |$.Data.outlet_ids|array|
      |$.Data.outlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.outlet_ids|[]|
      |$.Data.outlets|[]|
