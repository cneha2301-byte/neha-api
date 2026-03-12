@BizomWebAPI @PI @SchemeHoldersManagement @SchemeHoldersAssign
Feature: Assign Scheme Holders API Testing
  As a system user
  I want to test the assign scheme holders endpoint
  So that I can ensure proper functionality and data retrieval for scheme holders assignment

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get assign scheme holders without access token
    When I send the GET request to "schemeholders_assign" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get assign scheme holders with invalid access token
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get assign scheme holders with expired access token
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get assign scheme holders with malformed access token
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get assign scheme holders with valid access token
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|
    And I store the response as "assign_scheme_holders_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate assign scheme holders response structure
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate assign scheme holders Result field
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @DataValidation
  Scenario: TC_08 Validate assign scheme holders Reason field
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate assign scheme holders entityWiseResponse array field
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|

  @Positive @DataValidation
  Scenario: TC_10 Validate assign scheme holders entityWiseResponse object structure
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|

  @Positive @DataValidation
  Scenario: TC_11 Validate assign scheme holders entityWiseResponse Result field
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.entityWiseResponse[0].Result|boolean|

  @Positive @DataValidation
  Scenario: TC_12 Validate assign scheme holders entityWiseResponse Reason field
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.entityWiseResponse[0].Reason|string|

  @Positive @DataValidation
  Scenario: TC_13 Validate assign scheme holders entityWiseResponse value field
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.entityWiseResponse[0].value|string|

  @Positive @DataValidation
  Scenario: TC_14 Validate assign scheme holders entityWiseResponse holderWiseData field
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.entityWiseResponse[0].holderWiseData|array|

  @Positive @DataValidation
  Scenario: TC_15 Validate assign scheme holders complete structure
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|
      |$.entityWiseResponse[0].value|string|
      |$.entityWiseResponse[0].holderWiseData|array|

  @Positive @Performance
  Scenario: TC_16 Performance test for assign scheme holders endpoint
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Concurrency
  Scenario: TC_17 Concurrent access test for assign scheme holders endpoint
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|

  @Negative @Validation
  Scenario: TC_18 Get assign scheme holders with invalid query parameters
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_19 Get assign scheme holders with special characters in query parameters
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Security
  Scenario: TC_20 Get assign scheme holders with SQL injection attempt
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemeholders; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Boundary
  Scenario: TC_21 Get assign scheme holders with maximum query parameters
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @ErrorHandling
  Scenario: TC_22 Get assign scheme holders with invalid endpoint
    And I send the GET request to "schemeholders_assign_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_23 Validate assign scheme holders business logic
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate assign scheme holders data integrity
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|
      |$.entityWiseResponse[0].value|string|
      |$.entityWiseResponse[0].holderWiseData|array|

  @Positive @Regression
  Scenario: TC_25 Regression test for assign scheme holders endpoint
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|

  @Positive @Functional
  Scenario: TC_26 Validate assign scheme holders response completeness
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|
      |$.entityWiseResponse[0].value|string|
      |$.entityWiseResponse[0].holderWiseData|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |entityWiseResponse|
    And I store the response as "assign_scheme_holders_response" name using full path

  @Positive @DataValidation
  Scenario: TC_27 Validate assign scheme holders multiple entityWiseResponse elements
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|
      |$.entityWiseResponse[1]|object|
      |$.entityWiseResponse[1].Result|boolean|
      |$.entityWiseResponse[1].Reason|string|

  @Positive @DataValidation
  Scenario: TC_28 Validate assign scheme holders all required fields present
    And I send the GET request to "schemeholders_assign" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.entityWiseResponse|array|
      |$.entityWiseResponse[0]|object|
      |$.entityWiseResponse[0].Result|boolean|
      |$.entityWiseResponse[0].Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |entityWiseResponse|

