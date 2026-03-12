@BizomWebAPI @OS @InventoriesManagement @Inventories @UserAccessManagement
Feature: Transfer History API Testing
  As a system user
  I want to test the transfer history API endpoint
  So that I can ensure proper functionality and data retrieval for inventory transfer history management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get transfer history API without access token
    When I send the GET request to "inventories_transfer_history_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get transfer history API with invalid access token
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get transfer history API with expired access token
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get transfer history API with malformed access token
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get transfer history API with valid access token
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And I store the response as "transfer_history_api_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate transfer history API response structure
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

#  @Positive @DataValidation
#  Scenario: Validate transfer history API specific data values
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Positive @DataValidation
#  Scenario: Validate transfer history API with static values
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Positive @Performance
#  Scenario: Performance test for transfer history API endpoint
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for transfer history API endpoint
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Negative @Validation
#  Scenario: Get transfer history API with invalid query parameters
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Negative @Validation
#  Scenario: Get transfer history API with special characters in query parameters
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Negative @Security
#  Scenario: Get transfer history API with SQL injection attempt
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE inventories; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Negative @Boundary
#  Scenario: Get transfer history API with maximum query parameters
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
  @Negative @ErrorHandling
  Scenario: Get transfer history API with invalid endpoint
    And I send the GET request to "inventories_transfer_history_api_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: Validate transfer history API business logic
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Positive @DataIntegrity
#  Scenario: Validate transfer history API data integrity
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @Regression
#  Scenario: Regression test for transfer history API endpoint
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @Functional
#  Scenario: Validate transfer history API response completeness
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @DataTablesValidation
#  Scenario: Validate transfer history API DataTables structure
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @ContentValidation
#  Scenario: Validate transfer history API content structure
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#
#  @Positive @LoadTesting
#  Scenario: Load testing for transfer history API endpoint
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Negative @Timeout
#  Scenario: Test transfer history API endpoint timeout handling
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end transfer history API data retrieval workflow
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And I store the response as "transfer_history_api_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#
#  @Positive @EmptyDataValidation
#  Scenario: Validate transfer history API empty data response
#    And I send the GET request to "inventories_transfer_history_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|



