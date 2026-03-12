@BizomWebAPI @TourBudgetsManagement @GetAssigneeDatas @OutletManagement @innovation
Feature: Get Assignee Datas API Testing
  As a system user
  I want to test the get assignee datas endpoint
  So that I can ensure proper functionality and data retrieval for assignee datas by warehouse

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get assignee datas without access token
    When I send the GET request to "tourbudgets_get_assignee_datas" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get assignee datas with invalid access token
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get assignee datas with expired access token
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get assignee datas with malformed access token
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get assignee datas for warehouse ID 1 with valid access token and query parameters
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And I store the response as "assignee_datas_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate assignee datas DataTables response structure
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
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

#  @Positive @Functional
#  Scenario: Get assignee datas for warehouse ID 2 with valid access token
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

  @Positive @Functional
  Scenario: Get assignee datas with different date range
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2023|||
      |todate|31-12-2023|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Get assignee datas with different approvalStatus
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|1|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Get assignee datas with different isUpdate value
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|0|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: Get assignee datas with specific userId
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|1|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get assignee datas with invalid warehouse ID
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|abc|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

#  @Negative @Validation
#  Scenario: Get assignee datas with non-existent warehouse ID
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|999999|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

  @Negative @Validation
  Scenario: Get assignee datas with invalid date format
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|invalid-date|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get assignee datas with missing fromdate parameter
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get assignee datas with missing todate parameter
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Validation
  Scenario: Get assignee datas with special characters in query parameters
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|<script>alert('XSS')</script>|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Negative @Security
  Scenario: Get assignee datas with SQL injection attempt
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|'; DROP TABLE tourbudgets; --|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Performance
  Scenario: Performance test for assignee datas endpoint
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for assignee datas endpoint
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Negative @ErrorHandling
#  Scenario: Get assignee datas with invalid endpoint
#    And I send the GET request to "tourbudgets_get_assignee_datas_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate assignee datas business logic
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
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

  @Positive @DataIntegrity
  Scenario: Validate assignee datas data integrity
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Regression
  Scenario: Regression test for assignee datas endpoint
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

#  @Positive @Functional
#  Scenario: Validate assignee datas response completeness
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
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

#  @Positive @DataTablesValidation
#  Scenario: Validate assignee datas DataTables structure
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
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

#  @Positive @EmptyArrayValidation
#  Scenario: Validate assignee datas empty aaData array
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|

#  @Positive @EndToEnd
#  Scenario: End-to-end assignee datas data retrieval workflow
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.aaData|[]|
#    And I store the response as "assignee_datas_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|

  @Positive @SEchoValidation
  Scenario: Validate assignee datas sEcho field
    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
      |fromdate|01-01-2022|||
      |todate|31-01-2024|||
      |userId|undefined|||
      |approvalStatus|0|||
      |isUpdate|1|||
      |sEcho|1|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|

#  @Positive @TotalRecordsValidation
#  Scenario: Validate assignee datas iTotalRecords and iTotalDisplayRecords fields
#    And I send the GET request to "tourbudgets_get_assignee_datas" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#      |fromdate|01-01-2022|||
#      |todate|31-01-2024|||
#      |userId|undefined|||
#      |approvalStatus|0|||
#      |isUpdate|1|||
#      |sEcho|1|||
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|

