@BizomWebAPI @CE @EndOfDayReportsManagement @EndOfDayReports @MailOrdersToDistributors @IntegrationServices
Feature: Mail Orders To Distributors Cron API Testing
  As a Bizom web API consumer
  I want to validate the mail orders to distributors cron endpoint
  So that I can ensure distributor emails are triggered reliably

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Trigger mail orders cron without access token
    When I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with path parameters
      |Path|Value|
      |distributorId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Trigger mail orders cron with invalid access token
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Trigger mail orders cron with expired access token
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Trigger mail orders cron with malformed access token
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Trigger mail orders cron with valid access token
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And I store the response as "mailOrdersToDistributors_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for mail orders cron endpoint
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for mail orders cron endpoint
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Trigger mail orders cron with invalid distributor id
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Trigger mail orders cron with special characters in distributor id
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Trigger mail orders cron with SQL injection attempt
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|'; DROP TABLE distributors; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_11 Trigger mail orders cron with maximum query parameters
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
      |param1|value1||                          |
      |param2|value2||                          |
      |param3|value3||                          |
      |param4|value4||                          |
      |param5|value5||                          |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_12 Trigger mail orders cron with invalid endpoint
    And I send the GET request to "endofdayreports_mail_orders_to_distributors_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for mail orders cron endpoint
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_14 Load testing for mail orders cron endpoint
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_15 Timeout handling for mail orders cron endpoint
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end mail orders cron workflow
    And I send the GET request to "endofdayreports_mail_orders_to_distributors" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|distributorId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "mailOrdersToDistributors_response" name using full path

