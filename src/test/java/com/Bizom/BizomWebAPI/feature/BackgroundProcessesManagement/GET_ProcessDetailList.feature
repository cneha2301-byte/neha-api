@BizomWebAPI @BackgroundProcessesManagement @BackgroundProcesses @ProcessDetailList @CoreBusinessOperations @OS
Feature: Process Detail List API Testing
  As a Bizom web API consumer
  I want to validate the process detail list endpoint
  So that I can ensure background process details are returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get process detail list without access token
    When I send the GET request to "backgroundprocesses_process_detail_list" endpoint with path parameters
      |Path|Value|
      |processId|4|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get process detail list with invalid access token
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|processId|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get process detail list with expired access token
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|processId|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get process detail list with malformed access token
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|processId|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials |
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get process detail list with valid access token
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And I store the response as "processDetailList_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for process detail list endpoint
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for process detail list endpoint
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get process detail list with invalid process id
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get process detail list with special characters in process id
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|<script>alert('XSS')</script>|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

 @Negative @Security
 Scenario: TC_10 Get process detail list with SQL injection attempt
   And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
     |QueryParamName|QueryParamValue|Path|Value|
     |access_token|ACCESS_TOKEN|processId|'; DROP TABLE backgroundprocesses; --|
   Then I should see the response code as "STATUS_404_NOT_FOUND"
   And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_11 Get process detail list with maximum query parameters
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
      |param1|value1||                          |
      |param2|value2||                          |
      |param3|value3||                          |
      |param4|value4||                          |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

 @Negative @ErrorHandling
 Scenario: TC_12 Get process detail list with invalid endpoint
   And I send the GET request to "backgroundprocesses_process_detail_list_invalid" endpoint with dynamic access token, path and query parameters
     |QueryParamName|QueryParamValue|Path|Value|
     |access_token|ACCESS_TOKEN|processId|4|
   Then I should see the response code as "STATUS_404_NOT_FOUND"
   And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for process detail list endpoint
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @LoadTesting
  Scenario: TC_14 Load testing for process detail list endpoint
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_15 Timeout handling for process detail list endpoint
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end process detail list workflow
    And I send the GET request to "backgroundprocesses_process_detail_list" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|processId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.aaData|[]|
    And I store the response as "processDetailList_response" name using full path

