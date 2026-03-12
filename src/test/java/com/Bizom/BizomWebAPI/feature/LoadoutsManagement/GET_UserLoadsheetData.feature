@BizomWebAPI @OS @LoadoutsManagement @UserLoadsheetData @UserAccessManagement
Feature: User Loadsheet Data API Testing
  As a system user
  I want to test the user loadsheet data endpoint
  So that I can ensure proper functionality and data retrieval for user loadsheet data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get user loadsheet data without access token
    When I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get user loadsheet data with invalid access token
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get user loadsheet data with expired access token
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get user loadsheet data with malformed access token
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get user loadsheet data with valid access token
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|
    And I store the response as "user_loadsheet_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate user loadsheet data response structure
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.loadoutsheet|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate user loadsheet data Result field
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @DataValidation
  Scenario: TC_08 Validate user loadsheet data Reason field
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|Success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate user loadsheet data loadoutsheet array field
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.loadoutsheet|array|

  @Positive @DataValidation
  Scenario: TC_10 Validate user loadsheet data complete structure
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.loadoutsheet|array|

  @Positive @Performance
  Scenario: TC_11 Performance test for user loadsheet data endpoint
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for user loadsheet data endpoint
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|

  @Negative @Validation
  Scenario: TC_13 Get user loadsheet data with invalid query parameters
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|

  @Negative @Validation
  Scenario: TC_14 Get user loadsheet data with special characters in query parameters
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|

  @Negative @Security
  Scenario: TC_15 Get user loadsheet data with SQL injection attempt
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE loadoutsheets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|

  @Negative @Boundary
  Scenario: TC_16 Get user loadsheet data with maximum query parameters
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
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
      |$.Reason|Success|

#  @Negative @ErrorHandling
#  Scenario: TC_17 Get user loadsheet data with invalid endpoint
#    And I send the GET request to "loadoutsheets_user_loadsheet_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_18 Validate user loadsheet data business logic
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.loadoutsheet|array|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate user loadsheet data data integrity
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.loadoutsheet|array|

  @Positive @Regression
  Scenario: TC_20 Regression test for user loadsheet data endpoint
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.loadoutsheet|array|

  @Positive @Functional
  Scenario: TC_21 Validate user loadsheet data response completeness
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Success|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.loadoutsheet|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |loadoutsheet|
      |Success|
    And I store the response as "user_loadsheet_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_22 Validate user loadsheet data empty array handling
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.loadoutsheet|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.loadoutsheet|array|

  @Positive @DataValidation
  Scenario: TC_23 Validate user loadsheet data all required fields present
    And I send the GET request to "loadoutsheets_user_loadsheet_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.loadoutsheet|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |loadoutsheet|

