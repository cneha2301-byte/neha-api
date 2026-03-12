@BizomWebAPI @CE @TargetsManagement @GetUserTargetsData @OutletManagement
Feature: Get User Targets Data API Testing
  As a system user
  I want to test the get user targets data endpoint
  So that I can ensure proper functionality and data retrieval for user targets data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user targets data without access token
    When I send the GET request to "targets_get_user_targets_data" endpoint with path parameters
      |Path|Value|
      |userId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get user targets data with invalid access token
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|userId|3|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get user targets data with expired access token
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|userId|3|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get user targets data with malformed access token
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|userId|3|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get user targets data for user ID 3 with valid access token
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#    And I store the response as "user_targets_data_response" name using full path

  @Positive @Functional
  Scenario: Get user targets data for user ID 1 with valid access token
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

  @Positive @Functional
  Scenario: Get user targets data for user ID 2 with valid access token
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

#  @Positive @DataValidation
#  Scenario: Validate user targets data response structure
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|

#  @Positive @DataValidation
#  Scenario: Validate user targets data DataTables structure
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|

#  @Positive @DataValidation
#  Scenario: Validate user targets data empty array response
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|

  @Negative @Validation
  Scenario: Get user targets data with invalid user ID
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

  @Negative @Validation
  Scenario: Get user targets data with non-existent user ID
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

  @Negative @Validation
  Scenario: Get user targets data with negative user ID
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

  @Negative @Validation
  Scenario: Get user targets data with zero user ID
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

#  @Negative @ErrorHandling
#  Scenario: Get user targets data with invalid endpoint
#    And I send the GET request to "targets_get_user_targets_data_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for user targets data endpoint
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for user targets data endpoint
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

#  @Positive @BusinessLogic
#  Scenario: Validate user targets data business logic
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|

#  @Positive @DataIntegrity
#  Scenario: Validate user targets data data integrity
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|

  @Positive @Regression
  Scenario: Regression test for user targets data endpoint
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

#  @Positive @Functional
#  Scenario: Validate user targets data response completeness
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|

#  @Positive @ArrayValidation
#  Scenario: Validate user targets data array structure and content
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|

#  @Positive @ContentValidation
#  Scenario: Validate user targets data content structure
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And validating the response contains the following values
#      |Value|
#      |draw|
#      |recordsTotal|
#      |recordsFiltered|
#      |data|

  @Positive @DrawFieldValidation
  Scenario: Validate user targets data draw field
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|

#  @Positive @RecordsTotalFieldValidation
#  Scenario: Validate user targets data recordsTotal field
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.recordsTotal|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.recordsTotal|number|

#  @Positive @RecordsFilteredFieldValidation
#  Scenario: Validate user targets data recordsFiltered field
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.recordsFiltered|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.recordsFiltered|number|

#  @Positive @DataFieldValidation
#  Scenario: Validate user targets data data field
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|

#  @Positive @DataTablesValidation
#  Scenario: Validate user targets data DataTables format
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#      |$.data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|

#  @Positive @LoadTesting
#  Scenario: Load testing for user targets data endpoint
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|

  @Negative @Timeout
  Scenario: Test user targets data endpoint timeout handling
    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end user targets data retrieval workflow
#    And I send the GET request to "targets_get_user_targets_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|0|
#      |$.recordsTotal|0|
#      |$.recordsFiltered|0|
#    And I store the response as "user_targets_data_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|number|
#      |$.recordsTotal|number|
#      |$.recordsFiltered|number|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|[]|


