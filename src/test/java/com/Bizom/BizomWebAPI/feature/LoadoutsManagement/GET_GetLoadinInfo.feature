@BizomWebAPI @OS @LoadoutsManagement @GetLoadinInfo @UserAccessManagement
Feature: Get Load In Info API Testing
  As a system user
  I want to test the get load in info endpoint
  So that I can ensure proper functionality and data retrieval for load in information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get load in info without access token
    When I send the GET request to "get_loadin_info" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get load in info with invalid access token
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get load in info with expired access token
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get load in info with malformed access token
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get load in info with valid access token
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|
    And I store the response as "get_loadin_info_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get load in info response structure
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: Validate get load in info with static values
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Positive @Performance
  Scenario: Performance test for get load in info endpoint
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Positive @Concurrency
  Scenario: Concurrent access test for get load in info endpoint
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Get load in info with invalid query parameters
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Negative @Validation
  Scenario: Get load in info with special characters in query parameters
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Negative @Security
  Scenario: Get load in info with SQL injection attempt
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE loadouts; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Negative @Boundary
  Scenario: Get load in info with maximum query parameters
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
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
      |$.Reason|Not a salesman!|

#  @Negative @ErrorHandling
#  Scenario: Get load in info with invalid endpoint
#    And I send the GET request to "get_loadin_info_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate get load in info business logic
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Positive @DataIntegrity
  Scenario: Validate get load in info data integrity
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Not a salesman!|

  @Positive @Regression
  Scenario: Regression test for get load in info endpoint
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate get load in info response completeness
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Positive @ContentValidation
  Scenario: Validate get load in info content structure
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Not a salesman!|

  @Positive @LoadTesting
  Scenario: Load testing for get load in info endpoint
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Negative @Timeout
  Scenario: Test get load in info endpoint timeout handling
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

  @Positive @EndToEnd
  Scenario: End-to-end get load in info data retrieval workflow
    And I send the GET request to "get_loadin_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|
    And I store the response as "get_loadin_info_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Not a salesman!|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Not a salesman!|

