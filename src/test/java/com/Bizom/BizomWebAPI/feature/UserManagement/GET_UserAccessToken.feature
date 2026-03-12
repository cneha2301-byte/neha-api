@BizomWebAPI @CE @UserAccessToken @ReportingOperations
Feature: User Access Token API Testing
  As a system user
  I want to test the user access token endpoint
  So that I can ensure proper functionality and data retrieval for user access token management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user access token without access token
    When I send the GET request to "user_access_token" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user access token with invalid access token
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
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
  Scenario: Get user access token with expired access token
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
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
  Scenario: Get user access token with malformed access token
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
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
  Scenario: Get user access token with valid access token
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    And I store the response as "user_access_token_response" name using full path

  @Positive @DataValidation
  Scenario: Validate user access token response structure
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.client|string|
      |$.data.lmsfrontendurl|string|

  @Positive @DataValidation
  Scenario: Validate user access token with static values
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Positive @Performance
  Scenario: Performance test for user access token endpoint
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Positive @Concurrency
  Scenario: Concurrent access test for user access token endpoint
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Negative @Validation
  Scenario: Get user access token with invalid query parameters
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Negative @Validation
  Scenario: Get user access token with special characters in query parameters
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Negative @Security
  Scenario: Get user access token with SQL injection attempt
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Negative @Boundary
  Scenario: Get user access token with maximum query parameters
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

#  @Negative @ErrorHandling
#  Scenario: Get user access token with invalid endpoint
#    And I send the GET request to "user_access_token_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate user access token business logic
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Positive @DataIntegrity
  Scenario: Validate user access token data integrity
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.client|string|
      |$.data.lmsfrontendurl|string|

  @Positive @Regression
  Scenario: Regression test for user access token endpoint
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.client|string|
      |$.data.lmsfrontendurl|string|

  @Positive @Functional
  Scenario: Validate user access token response completeness
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.client|string|
      |$.data.lmsfrontendurl|string|

#  @Positive @ContentValidation
#  Scenario: Validate user access token content structure
#    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#
#      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
#    And validating the response contains the following values
#      |Value|
#      |result|
#      |reason|
#      |data|
#      |client|
#      |lmsfrontendurl|
#      |NjhlM2I1MGEyODVmNTgw|
#      |https://devuitest.bizomdev.in.bizom.app|

  @Positive @LoadTesting
  Scenario: Load testing for user access token endpoint
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Negative @Timeout
  Scenario: Test user access token endpoint timeout handling
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

  @Positive @EndToEnd
  Scenario: End-to-end user access token data retrieval workflow
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    And I store the response as "user_access_token_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.client|string|
      |$.data.lmsfrontendurl|string|

  @Positive @AccessTokenValidation
  Scenario: Validate user access token data accuracy
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.client|string|
      |$.data.lmsfrontendurl|string|

  @Positive @ClientValidation
  Scenario: Validate user access token client field
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
     
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.client|string|

  @Positive @LMSFrontendURLValidation
  Scenario: Validate user access token LMS frontend URL field
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|

    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.lmsfrontendurl|string|

  @Positive @UserManagementValidation
  Scenario: Validate user access token management interface
    And I send the GET request to "user_access_token" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data.lmsfrontendurl|https://devuitest.bizomdev.in.bizom.app|
    
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.client|string|
      |$.data.lmsfrontendurl|string|

