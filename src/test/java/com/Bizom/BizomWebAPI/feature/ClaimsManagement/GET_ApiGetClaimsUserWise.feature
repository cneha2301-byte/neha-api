@BizomWebAPI @ClaimsManagement @ApiGetClaimsUserWise @ReportsAnalyticsGroup2 @CE
Feature: API Get Claims User Wise Testing
  As a system user
  I want to test the API get claims user wise endpoint
  So that I can ensure proper functionality and data retrieval for claims user management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get claims user wise without access token
    When I send the GET request to "claims_apigetclaimsuserwise" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get claims user wise with invalid access token
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get claims user wise with expired access token
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get claims user wise with malformed access token
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get claims user wise with valid access token
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "claims_user_wise_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate claims user wise response structure
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.ClaimUserSequences|array|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate claims user wise ClaimUserSequences array structure
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.ClaimUserSequences|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.ClaimUserSequences|[]|

#  @Positive @DataValidation
#  Scenario: TC_08 Validate claims user wise Data array structure
#    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data|[]|

#  @Positive @DataValidation
#  Scenario: TC_09 Validate claims user wise complete structure
#    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.ClaimUserSequences|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.ClaimUserSequences|array|
#      |$.Data|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for claims user wise endpoint
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for claims user wise endpoint
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get claims user wise with invalid query parameters
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_13 Get claims user wise with special characters in query parameters
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_14 Get claims user wise with SQL injection attempt
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE claims; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_15 Get claims user wise with maximum query parameters
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
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
      |$.Result|true|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get claims user wise with invalid endpoint
#    And I send the GET request to "claims_apigetclaimsuserwise_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate claims user wise business logic
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.ClaimUserSequences|array|
      |$.Data|array|

#  @Positive @DataIntegrity
#  Scenario: TC_18 Validate claims user wise data integrity
#    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.ClaimUserSequences|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.ClaimUserSequences|array|
#      |$.Data|array|

  @Positive @Regression
  Scenario: TC_19 Regression test for claims user wise endpoint
    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.ClaimUserSequences|array|
      |$.Data|array|

#  @Positive @Functional
#  Scenario: TC_20 Validate claims user wise response completeness
#    And I send the GET request to "claims_apigetclaimsuserwise" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.ClaimUserSequences|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.ClaimUserSequences|array|
#      |$.Data|array|
#    And I store the response as "claims_user_wise_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |ClaimUserSequences|
#      |Data|

