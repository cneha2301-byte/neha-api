@BizomWebAPI @CE @DseForDsm @UserManagement
Feature: Get DSE for DSM API Testing
  As a system user
  I want to test the getdsefordsm endpoint
  So that I can ensure proper functionality and data retrieval for DSE (Distributor Sales Executive) under DSM (Distributor Sales Manager) hierarchy

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get DSE for DSM without access token
    When I send the GET request to "get_dse_for_dsm" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get DSE for DSM with invalid access token
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
  Scenario: Get DSE for DSM with expired access token
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
  Scenario: Get DSE for DSM with malformed access token
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Get DSE for DSM with valid access token - No data scenario
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under distributor sales managers."|
#      |$.Model|array|
#      |$.Data|array|
#    And I store the response as "dse_for_dsm_response" name using full path

  @Positive @DataValidation
  Scenario: Validate DSE for DSM response structure
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
  Scenario: Validate DSE for DSM empty arrays structure
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under distributor sales managers."|
      |$.Model|[]|
      |$.Data|[]|

  @Positive @DataValidation
  Scenario: Validate DSE for DSM with static values
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under distributor sales managers."|
      |$.Model|[]|
      |$.Data|[]|

#  @Positive @Performance
#  Scenario: Performance test for DSE for DSM endpoint
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Concurrent access test for DSE for DSM endpoint
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Get DSE for DSM with invalid query parameters
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Get DSE for DSM with special characters in query parameters
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Get DSE for DSM with SQL injection attempt
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Get DSE for DSM with maximum query parameters
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Get DSE for DSM with invalid endpoint
#    And I send the GET request to "get_dse_for_dsm_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate DSE for DSM business logic - No data case
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under distributor sales managers."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|DB:users:count: role_id=4 AND reportingto IN (SELECT userid FROM users WHERE role_id=3)|

  @Positive @DataIntegrity
  Scenario: Validate DSE for DSM data integrity
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
      |$.Reason|"No users found under distributor sales managers."|
      |$.Model|[]|
      |$.Data|[]|

#  @Positive @Regression
#  Scenario: Regression test for DSE for DSM endpoint
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
  Scenario: Validate DSE for DSM response completeness
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
      |$.Reason|"No users found under distributor sales managers."|
      |$.Model|[]|
      |$.Data|[]|

  @Positive @ArrayValidation
  Scenario: Validate DSE for DSM array structure and content
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
      |$.Reason|"No users found under distributor sales managers."|
      |$.Model|[]|
      |$.Data|[]|

#  @Positive @ContentValidation
#  Scenario: Validate DSE for DSM content structure
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#      |No users found under distributor sales managers|

#  @Positive @LoadTesting
#  Scenario: Load testing for DSE for DSM endpoint
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Test DSE for DSM endpoint timeout handling
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: End-to-end DSE for DSM data retrieval workflow
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#    And I store the response as "dse_for_dsm_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under distributor sales managers."|
#      |$.Model|[]|
#      |$.Data|[]|

#  @Positive @HeaderValidation
#  Scenario: Validate DSE for DSM response headers
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Validate DSE for DSM with session handling
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
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
#  Scenario: Validate DSE for DSM empty data handling
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under distributor sales managers."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

  @Positive @MessageValidation
  Scenario: Validate DSE for DSM error message content
    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under distributor sales managers."|
    And validating the response contains the following values
      |Value|
      |No users found|
      |distributor sales managers|
      |Result|
      |Reason|
      |Model|
      |Data|

#  @Positive @HierarchyValidation
#  Scenario: Validate DSE for DSM hierarchy structure
#    And I send the GET request to "get_dse_for_dsm" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under distributor sales managers."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|DB:users:count: role_id=4 AND reportingto IN (SELECT userid FROM users WHERE role_id=3 AND role_name='DISTRIBUTOR SALES MANAGER')|
