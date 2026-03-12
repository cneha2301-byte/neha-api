@BizomWebAPI @PJPsManagement @GetBeatsAssignedList @SalesOperations @Innovation
Feature: Get Beats Assigned List API Testing
  As a system user
  I want to test the get beats assigned list endpoint
  So that I can ensure proper functionality and data retrieval for beats assigned list

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get beats assigned list without access token
    When I send the GET request to "pjps_get_beats_assigned_list" endpoint with path parameters
      |Path|Value|
      |date|2022-02-09|
      |beatId|15|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get beats assigned list with invalid access token
#    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|date|2022-02-09|
#      |||beatId|15|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get beats assigned list with expired access token
#    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|date|2022-02-09|
#      |||beatId|15|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get beats assigned list with malformed access token
#    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|date|2022-02-09|
#      |||beatId|15|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get beats assigned list for date 2022-02-09 and beat ID 15 with valid access token
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|object|
      |$.data["1"]|string|
    And I store the response as "beats_assigned_list_response" name using full path

  @Positive @Functional
  Scenario: Get beats assigned list for date 2022-02-09 and beat ID 1 with valid access token
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
      |$.data|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|string|

  @Positive @DataValidation
  Scenario: Validate beats assigned list response structure with beat ID 15
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|object|
      |$.data["1"]|string|

  @Positive @DataValidation
  Scenario: Validate beats assigned list response structure with beat ID 1
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
      |$.data|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|string|

  @Positive @DataObjectValidation
  Scenario: Validate beats assigned list data object structure with beat ID 15
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data["1"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data["1"]|2 - SLV Traders|

  @Positive @DynamicKeysValidation
  Scenario: Validate beats assigned list data object with dynamic keys
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data["1"]|string|

  @Positive @NoDataValidation
  Scenario: Validate beats assigned list no data response with beat ID 1
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
      |$.data|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.data|string|

  @Negative @Validation
  Scenario: Get beats assigned list with invalid date format
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|invalid-date|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

  @Negative @Validation
  Scenario: Get beats assigned list with invalid beat ID
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

  @Negative @Validation
  Scenario: Get beats assigned list with non-existent beat ID
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

  @Negative @Validation
  Scenario: Get beats assigned list with future date
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2099-12-31|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

#  @Negative @ErrorHandling
#  Scenario: Get beats assigned list with invalid endpoint
#    And I send the GET request to "pjps_get_beats_assigned_list_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|date|2022-02-09|
#      |||beatId|15|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for beats assigned list endpoint
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for beats assigned list endpoint
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.data|object|

  @Positive @BusinessLogic
  Scenario: Validate beats assigned list business logic with beat ID 15
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.data|object|

  @Positive @BusinessLogic
  Scenario: Validate beats assigned list business logic with beat ID 1
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
      |$.data|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.data|string|

  @Positive @DataIntegrity
  Scenario: Validate beats assigned list data integrity
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|object|
      |$.data["1"]|string|

  @Positive @Regression
  Scenario: Regression test for beats assigned list endpoint
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.data|object|

  @Positive @Functional
  Scenario: Validate beats assigned list response completeness with beat ID 15
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|object|
      |$.data["1"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data["1"]|2 - SLV Traders|

  @Positive @Functional
  Scenario: Validate beats assigned list response completeness with beat ID 1
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
      |$.data|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|string|

  @Positive @ErrorObjectValidation
  Scenario: Validate beats assigned list error object structure
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error.code|""|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|

  @Positive @ResultFieldValidation
  Scenario: Validate beats assigned list result field
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @DataFieldValidation
  Scenario: Validate beats assigned list data field with beat ID 15
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data["1"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data["1"]|2 - SLV Traders|

  @Positive @DataFieldValidation
  Scenario: Validate beats assigned list data field with beat ID 1
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|Data not found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|string|

  @Positive @LoadTesting
  Scenario: Load testing for beats assigned list endpoint
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.data|object|

  @Negative @Timeout
  Scenario: Test beats assigned list endpoint timeout handling
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.data|object|

  @Positive @EndToEnd
  Scenario: End-to-end beats assigned list data retrieval workflow with beat ID 15
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
    And I store the response as "beats_assigned_list_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|object|
      |$.data["1"]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data["1"]|2 - SLV Traders|

  @Positive @EndToEnd
  Scenario: End-to-end beats assigned list data retrieval workflow with beat ID 1
    And I send the GET request to "pjps_get_beats_assigned_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|date|2022-02-09|
      |||beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.code|""|
      |$.error.message|""|
      |$.data|Data not found|
    And I store the response as "beats_assigned_list_no_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|
      |$.data|string|


