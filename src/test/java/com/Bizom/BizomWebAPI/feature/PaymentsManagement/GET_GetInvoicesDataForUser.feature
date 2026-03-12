@BizomWebAPI @OS @PaymentsManagement @GetInvoicesDataForUser @SalesOperations
Feature: Get Invoices Data For User API Testing
  As a system user
  I want to test the get invoices data for user endpoint
  So that I can ensure proper functionality and data retrieval for payments management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get invoices data for user without access token
#    When I send the GET request to "payments_get_invoices_data_for_user" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |pageno|1|
#      |limit|100|
#      |fromdate|2022-01-01|
#      |todate|2024-01-07|
#      |language|en|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get invoices data for user with invalid access token
#    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |pageno|1|
#      |limit|100|
#      |fromdate|2022-01-01|
#      |todate|2024-01-07|
#      |language|en|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get invoices data for user with expired access token
#    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |pageno|1|
#      |limit|100|
#      |fromdate|2022-01-01|
#      |todate|2024-01-07|
#      |language|en|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get invoices data for user with malformed access token
#    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |pageno|1|
#      |limit|100|
#      |fromdate|2022-01-01|
#      |todate|2024-01-07|
#      |language|en|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get invoices data for user with valid parameters
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
    And I store the response as "invoices_data_for_user_response" name using full path

  @Positive @DataValidation
  Scenario: Validate invoices data for user response structure
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @DataValidation
  Scenario: Validate invoices data for user Payment array structure
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Payment|array|

  @Positive @DataValidation
  Scenario: Validate invoices data for user with static values
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
      |$.Payment|[]|

  @Negative @Validation
  Scenario: Get invoices data for user without pageno parameter
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user without limit parameter
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user without fromdate parameter
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user without todate parameter
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user without language parameter
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with invalid pageno
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|0|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with negative pageno
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|-1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with invalid limit
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|0|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with negative limit
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|-1|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with invalid date format
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|invalid-date|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with different date format
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|01-01-2022|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with todate before fromdate
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2024-01-07|
      |todate|2022-01-01|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with future dates
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2099-01-01|
      |todate|2099-12-31|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with invalid language
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|invalid_lang|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Validation
  Scenario: Get invoices data for user with special characters in query parameters
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|<script>alert('XSS')</script>|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get invoices data for user with SQL injection attempt
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|'; DROP TABLE payments; --|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get invoices data for user with invalid endpoint
    And I send the GET request to "payments_get_invoices_data_for_user_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for invoices data for user endpoint
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for invoices data for user endpoint
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @BusinessLogic
  Scenario: Validate invoices data for user business logic
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @DataIntegrity
  Scenario: Validate invoices data for user data integrity
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
      |$.Payment|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @Regression
  Scenario: Regression test for invoices data for user endpoint
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @Functional
  Scenario: Validate invoices data for user response completeness
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
      |$.Payment|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @ArrayValidation
  Scenario: Validate invoices data for user array structure and content
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Payment|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Payment|[]|

  @Positive @ContentValidation
  Scenario: Validate invoices data for user content structure
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Payment|
      |No Beats Found for this user|

  @Positive @LoadTesting
  Scenario: Load testing for invoices data for user endpoint
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Negative @Timeout
  Scenario: Test invoices data for user endpoint timeout handling
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @EndToEnd
  Scenario: End-to-end invoices data for user data retrieval workflow
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
      |$.Payment|[]|
    And I store the response as "invoices_data_for_user_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate invoices data for user empty array response
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
      |$.Payment|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Payment|array|

  @Positive @PaginationValidation
  Scenario: Validate invoices data for user pagination with different page numbers
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|2|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @PaginationValidation
  Scenario: Validate invoices data for user pagination with different limits
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|50|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @DateRangeValidation
  Scenario: Validate invoices data for user with different date ranges
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2023-01-01|
      |todate|2023-12-31|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @LanguageParameterValidation
  Scenario: Validate invoices data for user with different language values
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|fr|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

  @Positive @FieldValidation
  Scenario: Validate invoices data for user field completeness
    And I send the GET request to "payments_get_invoices_data_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|100|
      |fromdate|2022-01-01|
      |todate|2024-01-07|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Beats Found for this user"|
      |$.Payment|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Payment|array|

