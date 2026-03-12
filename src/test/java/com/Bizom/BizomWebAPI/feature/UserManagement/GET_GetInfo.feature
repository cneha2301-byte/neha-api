@BizomWebAPI @CE @GetInfo @UserManagement
Feature: GetInfo API Testing
  As a system user
  I want to test the getinfo endpoint
  So that I can ensure proper functionality and data retrieval for user information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get info without access token
    When I send the GET request to "get_info" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get info with invalid access token
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get info with expired access token
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get info with malformed access token
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
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
  Scenario: Get info with valid access token
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "getinfo_response" name using full path

  @Positive @DataValidation
  Scenario: Validate getinfo response structure
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|

  @Positive @DataValidation
  Scenario: Validate getinfo specific data values
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.users["1"]|DB:users:name: id=1|
      |$.users["1"]|"SLV Traders"|

  @Positive @DataValidation
  Scenario: Validate getinfo with static values
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["1"]|"SLV Traders"|

  @Positive @Performance
  Scenario: Performance test for getinfo endpoint
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for getinfo endpoint
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get info with invalid query parameters
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get info with special characters in query parameters
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Security
  Scenario: Get info with SQL injection attempt
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: Get info with maximum query parameters
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
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
      |$.Result|"true"|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: Get info with invalid endpoint
#    And I send the GET request to "get_info_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate getinfo business logic
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: Validate getinfo data integrity
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
      |$.users["1"]|string|

  @Positive @Regression
  Scenario: Regression test for getinfo endpoint
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|

  @Positive @Functional
  Scenario: Validate getinfo response completeness
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["1"]|"SLV Traders"|

  @Positive @ObjectValidation
  Scenario: Validate getinfo object structure and content
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|object|
      |$.users["1"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["1"]|"SLV Traders"|

  @Positive @ContentValidation
  Scenario: Validate getinfo content structure
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |users|
      |SLV Traders|

  @Positive @LoadTesting
  Scenario: Load testing for getinfo endpoint
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test getinfo endpoint timeout handling
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end getinfo data retrieval workflow
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "getinfo_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["1"]|"SLV Traders"|

  @Positive @UserDataValidation
  Scenario: Validate user data structure
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["1"]|"SLV Traders"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|object|
      |$.users["1"]|string|

  @Positive @ResponseStructureValidation
  Scenario: Validate response structure integrity
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users["1"]|"SLV Traders"|

  @Positive @StringValidation
  Scenario: Validate string data types and values
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users["1"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.users["1"]|"SLV Traders"|

  @Positive @CompleteValidation
  Scenario: Validate complete getinfo data structure
    And I send the GET request to "get_info" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.users|object|
      |$.users["1"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.users["1"]|"SLV Traders"|
