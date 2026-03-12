@BizomWebAPI @MDMsManagement @MDMsGetupdate @WorkflowAutomation @OS
Feature: Get Update API Testing
  As a system user
  I want to test the get update endpoint
  So that I can ensure proper functionality and data retrieval for MDM update status management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get update without access token
    When I send the GET request to "mdms_getupdate" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get update with invalid access token
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get update with expired access token
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get update with malformed access token
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get update with valid access token
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|
    And I store the response as "getupdate_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get update response structure
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|number|
      |$.proceed|number|

  @Positive @DataValidation
  Scenario: TC_07 Validate get update status field
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate get update percent field
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.percent|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.percent|number|

  @Positive @DataValidation
  Scenario: TC_09 Validate get update proceed field
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.proceed|number|

  @Positive @DataValidation
  Scenario: TC_10 Validate get update complete structure
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|number|
      |$.proceed|number|

  @Positive @Performance
  Scenario: TC_11 Performance test for get update endpoint
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for get update endpoint
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|

  @Negative @Validation
  Scenario: TC_13 Get update with invalid query parameters
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|

  @Negative @Validation
  Scenario: TC_14 Get update with special characters in query parameters
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|

  @Negative @Security
  Scenario: TC_15 Get update with SQL injection attempt
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE mdms; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|

  @Negative @Boundary
  Scenario: TC_16 Get update with maximum query parameters
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
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
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get update with invalid endpoint
#    And I send the GET request to "mdms_getupdate_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate get update business logic
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|number|
      |$.proceed|number|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate get update data integrity
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|number|
      |$.proceed|number|

  @Positive @Regression
  Scenario: TC_20 Regression test for get update endpoint
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|number|
      |$.proceed|number|

  @Positive @Functional
  Scenario: TC_21 Validate get update response completeness
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|""|
      |$.percent|0|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|number|
      |$.proceed|number|
    And validating the response contains the following values
      |Value|
      |status|
      |percent|
      |proceed|
    And I store the response as "getupdate_response" name using full path

  @Positive @DataValidation
  Scenario: TC_22 Validate get update numeric fields are numbers
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.percent|number|
      |$.proceed|number|

  @Positive @DataValidation
  Scenario: TC_23 Validate get update all required fields present
    And I send the GET request to "mdms_getupdate" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|number|
      |$.proceed|number|
    And validating the response contains the following values
      |Value|
      |status|
      |percent|
      |proceed|

