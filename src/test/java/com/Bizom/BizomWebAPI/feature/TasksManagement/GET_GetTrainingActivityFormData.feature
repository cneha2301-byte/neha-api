@BizomWebAPI @TasksManagement @GetTrainingActivityFormData @OutletManagement @innovation
Feature: Get Training Activity Form Data API Testing
  As a system user
  I want to test the get training activity form data endpoint
  So that I can ensure proper functionality and data retrieval for training activity form data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get training activity form data without access token
    When I send the GET request to "tasks_gettrainingactivityformdata" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get training activity form data with invalid access token
    And I send the GET request to "tasks_gettrainingactivityformdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_03 Get training activity form data with valid access token
    And I send the GET request to "tasks_gettrainingactivityformdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$|[]|

  @Positive @DataValidation
  Scenario: TC_04 Validate get training activity form data response structure
    And I send the GET request to "tasks_gettrainingactivityformdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @Positive @Performance
  Scenario: TC_05 Performance test for get training activity form data endpoint
    And I send the GET request to "tasks_gettrainingactivityformdata" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2025-11-20|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

#  @Negative @ErrorHandling
#  Scenario: TC_06 Get training activity form data with invalid endpoint
#    And I send the GET request to "tasks_gettrainingactivityformdata_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |fordate|2025-11-20|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

