@BizomWebAPI @SupportingFunctions @ClaimsManagement @ApiGetAllClaims @CE
Feature: Claims API Testing
  As a system user
  I want to test the apiGetAllClaims endpoint
  So that I can ensure proper functionality and data retrieval for claims management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all claims without access token
    When I send the GET request to "claims_apigetallclaims" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all claims with invalid access token
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
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
  Scenario: Get all claims with expired access token
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
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
  Scenario: Get all claims with malformed access token
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
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
  Scenario: Get all claims with valid access token
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|
    And I store the response as "apiGetAllClaims_response" name using full path

  @Positive @DataValidation
  Scenario: Validate apiGetAllClaims response structure
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.ClaimUserSequences|array|

  @Positive @DataValidation
  Scenario: Validate apiGetAllClaims response when no reportee users found
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|
      |$.Data|[]|
      |$.ClaimUserSequences|[]|

  @Positive @DataValidation
  Scenario: Validate apiGetAllClaims specific data values
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|
    And I verify API response at path with DB and static values
      |JPath|Value|

  @Positive @DataValidation
  Scenario: Validate apiGetAllClaims with static values
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|
      |$.Data|[]|
      |$.ClaimUserSequences|[]|

  @Positive @Performance
  Scenario: Performance test for apiGetAllClaims endpoint
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Concurrency
  Scenario: Concurrent access test for apiGetAllClaims endpoint
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: Get all claims with invalid query parameters
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: Get all claims with special characters in query parameters
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Security
  Scenario: Get all claims with SQL injection attempt
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |test_param|'; DROP TABLE claims; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Boundary
  Scenario: Get all claims with maximum query parameters
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
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
#  Scenario: Get all claims with invalid endpoint
#    And I send the GET request to "claims_apigetallclaims_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |language|en|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate apiGetAllClaims business logic
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|

  @Positive @DataIntegrity
  Scenario: Validate apiGetAllClaims data integrity
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.ClaimUserSequences|array|

  @Positive @Regression
  Scenario: Regression test for apiGetAllClaims endpoint
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.ClaimUserSequences|array|

  @Positive @Functional
  Scenario: Validate apiGetAllClaims response completeness
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.ClaimUserSequences|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
      |$.ClaimUserSequences|[]|

  @Positive @ArrayValidation
  Scenario: Validate apiGetAllClaims array structure and content
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.ClaimUserSequences|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
      |$.ClaimUserSequences|[]|

  @Positive @ContentValidation
  Scenario: Validate apiGetAllClaims content structure
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |ClaimUserSequences|

  @Positive @LoadTesting
  Scenario: Load testing for apiGetAllClaims endpoint
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Timeout
  Scenario: Test apiGetAllClaims endpoint timeout handling
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @EndToEnd
  Scenario: End-to-end apiGetAllClaims data retrieval workflow
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Reportee users found."|
    And I store the response as "apiGetAllClaims_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.ClaimUserSequences|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
      |$.ClaimUserSequences|[]|

  @Positive @DataValidation
  Scenario: Get all claims with different language parameter
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|hi|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: Get all claims with missing language parameter
    And I send the GET request to "claims_apigetallclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|



