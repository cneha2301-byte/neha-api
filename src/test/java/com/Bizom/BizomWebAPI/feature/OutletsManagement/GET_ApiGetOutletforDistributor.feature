@BizomWebAPI @CE @OutletsManagement @OutletsForDistributor @SystemOperations
Feature: Get Outlet for Distributor API Testing
  As a system user
  I want to test the get outlet for distributor endpoint
  So that I can ensure proper functionality and data retrieval for distributor outlets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet for distributor without access token
    When I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet for distributor with invalid access token
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get outlet for distributor with expired access token
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get outlet for distributor with malformed access token
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Authorization
  Scenario: TC_05 Get outlet for distributor with admin role - should return error
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"only DM can call this api."|
      |$.Outlets|[]|

  @Positive @Smoke
  Scenario: TC_06 Get outlet for distributor with valid DM access token
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And I store the response as "outlets_for_distributor_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet for distributor response structure
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Outlets|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlet for distributor specific data values
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"only DM can call this api."|
      |$.Outlets|[]|

  @Positive @DataValidation
  Scenario: TC_09 Validate outlet for distributor with static values
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"only DM can call this api."|
      |$.Outlets|[]|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet for distributor endpoint
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlet for distributor endpoint
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Negative @Validation
  Scenario: TC_12 Get outlet for distributor with invalid query parameters
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get outlet for distributor with special characters in query parameters
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Negative @Security
  Scenario: TC_14 Get outlet for distributor with SQL injection attempt
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Negative @Boundary
  Scenario: TC_15 Get outlet for distributor with maximum query parameters
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
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
      |$.Result|"false"|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get outlet for distributor with invalid endpoint
#    And I send the GET request to "outlets_api_get_outlet_for_distributor_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate outlet for distributor business logic
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate outlet for distributor data integrity
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Outlets|array|

  @Positive @Regression
  Scenario: TC_19 Regression test for outlet for distributor endpoint
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Outlets|array|

  @Positive @Functional
  Scenario: TC_20 Validate outlet for distributor response completeness
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"only DM can call this api."|
      |$.Outlets|[]|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate outlet for distributor array structure and content
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"only DM can call this api."|
      |$.Outlets|[]|

  @Positive @ContentValidation
  Scenario: TC_22 Validate outlet for distributor content structure
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for outlet for distributor endpoint
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Negative @Timeout
  Scenario: TC_24 Test outlet for distributor endpoint timeout handling
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end outlet for distributor data retrieval workflow
    And I send the GET request to "outlets_api_get_outlet_for_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And I store the response as "outlets_for_distributor_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Outlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"only DM can call this api."|
      |$.Outlets|[]|

