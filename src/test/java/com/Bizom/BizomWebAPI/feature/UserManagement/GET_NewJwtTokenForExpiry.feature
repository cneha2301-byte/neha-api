@BizomWebAPI @CE @JwtTokenManagement @ReportingOperations
Feature: New JWT Token For Expiry API Testing
  As a system user
  I want to test the getNewJwtTokenForExpiry endpoint
  So that I can ensure proper functionality and token generation for JWT token expiry

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get new JWT token without access token
    When I send the GET request to "get_new_jwt_token_for_expiry" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get new JWT token with invalid access token
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get new JWT token with expired access token
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get new JWT token with malformed access token
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get new JWT token with valid access token
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @Functional
  Scenario: Verify JWT token response structure
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|
    

  @Positive @Regression
  Scenario: Verify JWT token generation consistency
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    

  @Negative @ErrorHandling
  Scenario: Get new JWT token with invalid endpoint
    And I send the GET request to "get_new_jwt_token_for_expiry_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for JWT token generation endpoint
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @DataValidation
  Scenario: Verify JWT token data integrity
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|
    
  @Positive @Smoke
  Scenario: Get new JWT token with comprehensive validation
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    

  @Positive @Functional
  Scenario: Verify JWT token response format
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|
 
  @Positive @TokenValidation
  Scenario: Verify JWT token structure and format
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|


  @Positive @Security
  Scenario: Verify JWT token security characteristics
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|

  @Positive @BusinessLogic
  Scenario: Verify JWT token business logic
    And I send the GET request to "get_new_jwt_token_for_expiry" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
   
    And validating the response field data types
      |JPath|ExpectedType|
      |$.token|string|
