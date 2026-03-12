@BizomWebAPI @CE @DSMForSM @UserManagement
Feature: Get DSM for Sales Manager API Testing
  As a system user
  I want to test the getdsmforsm endpoint
  So that I can ensure proper functionality and data retrieval for DSM (District Sales Manager) under Sales Manager hierarchy

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get DSM for SM without access token
    When I send the GET request to "get_dsm_for_sm" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get DSM for SM with invalid access token
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
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
  Scenario: Get DSM for SM with expired access token
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
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
  Scenario: Get DSM for SM with malformed access token
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
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
#  Scenario: Get DSM for SM with valid access token - No data scenario
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under sales managers."|
#      |$.Model|array|
#      |$.Data|array|
#    And I store the response as "dsm_for_sm_response" name using full path

  @Positive @DataValidation
  Scenario: Validate DSM for SM response structure
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: Validate DSM for SM empty arrays structure
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under sales managers."|
      |$.Model|[]|
      |$.Data|[]|

  @Positive @DataValidation
  Scenario: Validate DSM for SM with static values
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under sales managers."|
      |$.Model|[]|
      |$.Data|[]|

#  @Positive @Performance
#  Scenario: Performance test for DSM for SM endpoint
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for DSM for SM endpoint
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Negative @Validation
#  Scenario: Get DSM for SM with invalid query parameters
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Negative @Validation
#  Scenario: Get DSM for SM with special characters in query parameters
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Negative @Security
#  Scenario: Get DSM for SM with SQL injection attempt
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Negative @Boundary
#  Scenario: Get DSM for SM with maximum query parameters
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
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
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Negative @ErrorHandling
#  Scenario: Get DSM for SM with invalid endpoint
#    And I send the GET request to "get_dsm_for_sm_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate DSM for SM business logic - No data case
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under sales managers."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|DB:users:count: role_id=3 AND reportingto IN (SELECT userid FROM users WHERE role_id=2)|

  @Positive @DataIntegrity
  Scenario: Validate DSM for SM data integrity
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under sales managers."|
      |$.Model|[]|
      |$.Data|[]|

#  @Positive @Regression
#  Scenario: Regression test for DSM for SM endpoint
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

  @Positive @Functional
  Scenario: Validate DSM for SM response completeness
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under sales managers."|
      |$.Model|[]|
      |$.Data|[]|

  @Positive @ArrayValidation
  Scenario: Validate DSM for SM array structure and content
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under sales managers."|
      |$.Model|[]|
      |$.Data|[]|

#  @Positive @ContentValidation
#  Scenario: Validate DSM for SM content structure
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Model|
#      |Data|
#      |No users found under sales managers|

#  @Positive @LoadTesting
#  Scenario: Load testing for DSM for SM endpoint
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Negative @Timeout
#  Scenario: Test DSM for SM endpoint timeout handling
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end DSM for SM data retrieval workflow
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|
#    And I store the response as "dsm_for_sm_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under sales managers."|
#      |$.Model|[]|
#      |$.Data|[]|

#  @Positive @HeaderValidation
#  Scenario: Validate DSM for SM response headers
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Positive @SessionValidation
#  Scenario: Validate DSM for SM with session handling
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Positive @EmptyDataHandling
#  Scenario: Validate DSM for SM empty data handling
#    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under sales managers."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

  @Positive @MessageValidation
  Scenario: Validate DSM for SM error message content
    And I send the GET request to "get_dsm_for_sm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under sales managers."|
    And validating the response contains the following values
      |Value|
      |No users found|
      |sales managers|
      |Result|
      |Reason|
      |Model|
      |Data|
