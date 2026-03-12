@BizomWebAPI @CE @DistributorsForUser @UserManagement
Feature: Get Distributors for User API Testing
  As a system user
  I want to test the getdistributorsforuser endpoint
  So that I can ensure proper functionality and data retrieval for distributors associated with the current user

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get distributors for user without access token
    When I send the GET request to "get_distributors_for_user" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get distributors for user with invalid access token
    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: Get distributors for user with expired access token
    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: Get distributors for user with malformed access token
    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
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
#  Scenario: Get distributors for user with valid access token
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I store the response as "distributors_for_user_response" name using full path

  @Positive @DataValidation
  Scenario: Validate distributors for user response structure
    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|

  @Positive @DataValidation
  Scenario: Validate distributors for user data object structure
    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
      |$.data."6"|string|

#  @Positive @DataValidation
#  Scenario: Validate distributors for user with static values
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."6"|"MDM"|

#  @Positive @Performance
#  Scenario: Performance test for distributors for user endpoint
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for distributors for user endpoint
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Validation
#  Scenario: Get distributors for user with invalid query parameters
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Validation
#  Scenario: Get distributors for user with special characters in query parameters
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Security
#  Scenario: Get distributors for user with SQL injection attempt
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE users; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Boundary
#  Scenario: Get distributors for user with maximum query parameters
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
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
#      |$.Result|true|
#      |$.data|object|

#  @Negative @ErrorHandling
#  Scenario: Get distributors for user with invalid endpoint
#    And I send the GET request to "get_distributors_for_user_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate distributors for user business logic
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data."6"|DB:distributors:name: id=6|

#  @Positive @DataIntegrity
#  Scenario: Validate distributors for user data integrity
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.data|object|
#      |$.data."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."6"|"MDM"|

#  @Positive @Regression
#  Scenario: Regression test for distributors for user endpoint
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.data|object|

#  @Positive @Functional
#  Scenario: Validate distributors for user response completeness
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.data|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."6"|"MDM"|

#  @Positive @ObjectValidation
#  Scenario: Validate distributors for user object structure and content
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.data|object|
#      |$.data."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."6"|"MDM"|

#  @Positive @ContentValidation
#  Scenario: Validate distributors for user content structure
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |data|
#      |MDM|

#  @Positive @LoadTesting
#  Scenario: Load testing for distributors for user endpoint
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Negative @Timeout
#  Scenario: Test distributors for user endpoint timeout handling
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Positive @EndToEnd
#  Scenario: End-to-end distributors for user data retrieval workflow
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I store the response as "distributors_for_user_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.data|object|
#      |$.data."6"|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."6"|"MDM"|

#  @Positive @HeaderValidation
#  Scenario: Validate distributors for user response headers
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|

#  @Positive @SessionValidation
#  Scenario: Validate distributors for user with session handling
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.data|object|

#  @Positive @DistributorDataValidation
#  Scenario: Validate distributors for user distributor data mapping
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."6"|"MDM"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data."6"|string|

#  @Positive @UserSpecificValidation
#  Scenario: Validate distributors for user user-specific data
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data."6"|DB:distributors:name: id=6 AND user_id=CURRENT_USER|

#  @Positive @EmptyDataHandling
#  Scenario: Validate distributors for user empty data handling
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data|object|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.data|object|

#  @Positive @DistributorMappingValidation
#  Scenario: Validate distributors for user distributor mapping structure
#    And I send the GET request to "get_distributors_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data."6"|"MDM"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|object|
#      |$.data."6"|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |data|
#      |MDM|
#      |6|
