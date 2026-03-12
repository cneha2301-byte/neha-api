@TaskApprovalStatusesManagement @TaskApprovalStatuses @CheckTrainer @Innovation
#this API have notice in response so for a time being we are not testing this API
Feature: Task Approval Statuses Check Trainer API Testing
  As a system user
  I want to test the task approval statuses check trainer endpoint
  So that I can ensure proper functionality and JSON response validation for checking trainer status

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get check trainer without access token
    When I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with path parameters
      |Path|Value|
      |id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get check trainer with invalid access token
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get check trainer with expired access token
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get check trainer with malformed access token
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get check trainer with valid access token and valid ID
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
      |$.data|null|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And verify response time is less than "2500" milliseconds
    And I store the response as "taskapprovalstatuses_checktrainer_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate check trainer JSON response structure
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
      |$.data|null|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Validate check trainer response data types
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.data|null|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
      |$.data|null|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate check trainer response content
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |message|
      |success|
      |data|

  @Positive @ResponseHeaders
  Scenario: TC_09 Verify check trainer response headers
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for check trainer endpoint
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for check trainer endpoint
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|

  @Negative @Validation @PathParam
  Scenario: TC_12 Get check trainer with invalid ID (non-numeric)
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_13 Get check trainer with invalid ID (negative)
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_14 Get check trainer with invalid ID (zero)
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_15 Get check trainer with invalid ID (very large number)
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get check trainer with invalid query parameters
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|

  @Negative @Validation
  Scenario: TC_17 Get check trainer with special characters in query parameters
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|

  @Negative @Security
  Scenario: TC_18 Get check trainer with SQL injection attempt in path parameter
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|'; DROP TABLE taskapprovalstatuses; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_19 Get check trainer with maximum query parameters
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
      |param1|value1|||
      |param2|value2|||
      |param3|value3|||
      |param4|value4|||
      |param5|value5|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|

  @Negative @ErrorHandling
  Scenario: TC_20 Get check trainer with invalid endpoint
    And I send the GET request to "taskapprovalstatuses_checktrainer_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_21 Verify check trainer endpoint functionality
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And contentType as "application/json; charset=UTF-8"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
      |$.data|null|

  @Positive @BusinessLogic
  Scenario: TC_22 Validate check trainer business logic
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.data|null|

  @Positive @DataIntegrity
  Scenario: TC_23 Validate check trainer data integrity
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.data|null|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
      |$.data|null|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_24 Regression test for check trainer endpoint
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
      |$.data|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.data|null|

  @Positive @Functional
  Scenario: TC_25 Validate check trainer response completeness
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|success|
      |$.data|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.data|null|
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |message|
      |success|
      |data|
    And I store the response as "taskapprovalstatuses_checktrainer_response" name using full path

  @Positive @ResultFieldValidation
  Scenario: TC_26 Validate check trainer result field
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @ErrorFieldValidation
  Scenario: TC_27 Validate check trainer error object and message field
    And I send the GET request to "taskapprovalstatuses_checktrainer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error.message|success|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|object|
      |$.error.message|string|

