@BizomWebAPI @PI @SchemesManagement @GetSchemeForHolder @PaymentProcessing
Feature: GetSchemeForHolder API Testing
  As a system user
  I want to test the getschemeforholder endpoint
  So that I can ensure proper functionality and data retrieval for schemes by holder

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get scheme for holder without access token
    When I send the GET request to "get_scheme_for_holder" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get scheme for holder with invalid access token
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get scheme for holder with expired access token
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get scheme for holder with malformed access token
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Get scheme for holder with empty access token
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_06 Get scheme for holder with valid parameters and verify Scheme array
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.Scheme|[]|
      |$.error.message|"No schemes found"|
    And I store the response as "getschemeforholder_response" name using full path

  @Positive @DataValidation
  Scenario: TC_07 Validate get scheme for holder response structure
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.Scheme|[]|
      |$.error.message|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Scheme|array|
      |$.error|object|
      |$.error.message|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate Scheme array is empty
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Scheme|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate get scheme for holder response contains required fields
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |Scheme|
      |error|
      |message|

  @Negative @Validation
  Scenario: TC_10 Get scheme for holder with invalid holderId
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|abc|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get scheme for holder with invalid holderType
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|invalid_type|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get scheme for holder with non-existent holderId
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|999999|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get scheme for holder with missing holderId
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get scheme for holder with missing holderType
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get scheme for holder with blank holderId
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId||
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get scheme for holder with blank holderType
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_17 Get scheme for holder with invalid endpoint
    And I send the GET request to "get_scheme_for_holder_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_18 Performance test for get scheme for holder endpoint
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme|[]|

  @Positive @BusinessLogic
  Scenario: TC_19 Get scheme for holder with different holderId
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|2|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.Scheme|[]|

  @Positive @BusinessLogic
  Scenario: TC_20 Get scheme for holder with different holderType
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|outlet|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.Scheme|[]|

  @Positive @Boundary
  Scenario: TC_21 Get scheme for holder with zero holderId
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|0|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_22 Get scheme for holder with very large holderId
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|2147483647|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_23 Regression test for get scheme for holder endpoint
    And I send the GET request to "get_scheme_for_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |holderId|1|
      |holderType|zone|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.Scheme|[]|
      |$.error.message|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Scheme|array|
      |$.error|object|
      |$.error.message|string|
    And I store the response as "getschemeforholder_response" name using full path

