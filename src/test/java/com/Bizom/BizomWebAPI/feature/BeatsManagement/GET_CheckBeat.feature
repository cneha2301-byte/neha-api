@BizomWebAPI @CE @BeatsManagement @CheckBeat @SystemIntegration
Feature: Check Beat API Testing
  As a system user
  I want to test the checkbeat endpoint
  So that I can ensure proper functionality and data retrieval for beat validation

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Check beat without access token
    When I send the GET request to "beats_checkbeat" endpoint with path parameters
      |Path|Value|
      |beatIds|1,2|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Check beat with invalid access token
#    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|beatIds|1,2|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Check beat with expired access token
#    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|beatIds|1,2|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Check beat with malformed access token
#    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|beatIds|1,2|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Check beat with valid access token and comma-separated beat IDs
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|"true"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|string|
      |$.message|string|
    And I store the response as "checkBeat_response" name using full path

#  @Positive @Functional
#  Scenario: Check beat with single beat ID
#    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatIds|1|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|"true"|
#      |$.message|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|string|
#      |$.message|string|

  @Positive @Functional
  Scenario: Check beat with multiple comma-separated beat IDs
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2,3|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|"true"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|string|
      |$.message|string|

  @Positive @Functional
  Scenario: Check beat with different user ID
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|"true"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|string|
      |$.message|string|

  @Negative @Validation
  Scenario: Check beat with invalid beat ID format
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|abc|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Check beat with non-existent beat ID
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|99999|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Check beat with invalid user ID
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Check beat with non-existent user ID
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Check beat with missing beat IDs
#    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: Check beat with missing user ID
#    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatIds|1,2|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Check beat with empty beat IDs
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds||
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Check beat with negative beat ID
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|-1|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Check beat with negative user ID
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Check beat with special characters in beat IDs
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2@3|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Check beat with invalid endpoint
#    And I send the GET request to "beats_checkbeat_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatIds|1,2|
#      |||userId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for check beat endpoint
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for check beat endpoint
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|"true"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|string|
      |$.message|string|

  @Positive @DataValidation
  Scenario: Validate check beat response structure
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|"true"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|string|
      |$.message|string|

  @Positive @DataValidation
  Scenario: Validate check beat with large number of comma-separated beat IDs
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2,3,4,5,6,7,8,9,10|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|"true"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|string|
      |$.message|string|

  @Positive @Functional
  Scenario: Validate check beat response completeness
    And I send the GET request to "beats_checkbeat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatIds|1,2|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|"true"|
      |$.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|string|
      |$.message|string|
    And I store the response as "checkBeat_response" name using full path
    And validating the response contains the following values
      |Value|
      |result|
      |message|



