@BizomWebAPI @MDMsManagement @GetupdateWithParams @WorkflowAutomation @OS
Feature: Get Update With Parameters API Testing
  As a system user
  I want to test the get update endpoint with MDM ID and status parameters
  So that I can ensure proper functionality and data retrieval for MDM update status by ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get update with parameters without access token
    When I send the GET request to "mdms_getupdate_with_params" endpoint with path parameters
      |Path|Value|
      |mdmsId|6|
      |status|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get update with parameters with invalid access token
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|mdmsId|6|
      |||status|0|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get update with parameters with expired access token
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|mdmsId|6|
      |||status|0|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get update with parameters with malformed access token
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|mdmsId|6|
      |||status|0|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get update with parameters for MDM ID 6 and status 0 with valid access token
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|6|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|File successfully uploaded and queued in server|
      |$.percent|"0"|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|string|
      |$.proceed|number|

  @Positive @Functional
  Scenario: Get update with parameters for different MDM ID
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|1|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|"Data saved successfully"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|string|
      |$.proceed|number|

  @Positive @Functional
  Scenario: Get update with parameters for different status value
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|6|
      |||status|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|File successfully uploaded and queued in server|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|string|
      |$.proceed|number|

  @Negative @Validation
  Scenario: Get update with parameters with invalid MDM ID
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|abc|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get update with parameters with non-existent MDM ID
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|999999|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get update with parameters with invalid status value
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|6|
      |||status|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get update with parameters with negative MDM ID
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|-1|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get update with parameters with zero MDM ID
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|0|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: Get update with parameters with invalid endpoint
    And I send the GET request to "mdms_getupdate_with_params_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|6|
      |||status|0|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get update with parameters endpoint
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|6|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get update with parameters endpoint
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|6|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.status|File successfully uploaded and queued in server|
      |$.percent|"0"|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|string|
      |$.proceed|number|

  @Positive @Smoke
  Scenario: Get update with parameters for MDM ID 6 and status 0 - DB validation
    And I send the GET request to "mdms_getupdate_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|mdmsId|6|
      |||status|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.status|File successfully uploaded and queued in server|
      |$.percent|"0"|
      |$.proceed|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.status|string|
      |$.percent|string|
      |$.proceed|number|


