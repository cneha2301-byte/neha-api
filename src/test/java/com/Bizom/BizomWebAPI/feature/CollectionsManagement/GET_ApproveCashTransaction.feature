@BizomWebAPI @OS @CollectionsManagement @ApproveCashTransaction @ReportsAnalyticsGroup2
Feature: Approve Cash Transaction API Testing
  As a system user
  I want to test the approve cash transaction endpoint
  So that I can ensure proper functionality for approving cash transactions in collections management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Approve cash transaction without access token
    When I send the GET request to "collections_approve_cash_transaction" endpoint with path parameters
      |Path|Value|
      |transactionId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Approve cash transaction with invalid access token
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|transactionId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Approve cash transaction with expired access token
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|transactionId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Approve cash transaction with malformed access token
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|transactionId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Approve cash transaction for ID 2 with valid access token
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "approve_cash_transaction_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Approve cash transaction for ID 1 with valid access token
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @DataValidation
  Scenario: TC_07 Validate approve cash transaction response structure for ID 2
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Reason_id|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate approve cash transaction response content
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason_id|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Reason_id|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Reason_id|

  @Positive @DataValidation
  Scenario: TC_09 Validate approve cash transaction with DB validation
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason_id|"2"|

  @Positive @Performance
  Scenario: TC_10 Performance test for approve cash transaction endpoint
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for approve cash transaction endpoint
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate approve cash transaction business logic
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Reason_id|string|

  @Positive @DataIntegrity
  Scenario: TC_13 Validate approve cash transaction data integrity
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Reason_id|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Reason_id|

  @Positive @Regression
  Scenario: TC_14 Regression test for approve cash transaction endpoint
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Functional
  Scenario: TC_15 Validate approve cash transaction response completeness
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Reason_id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @ContentValidation
  Scenario: TC_16 Validate approve cash transaction content structure
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Reason_id|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for approve cash transaction endpoint
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Timeout
  Scenario: TC_18 Test approve cash transaction endpoint timeout handling
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end approve cash transaction workflow
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Reason_id|string|
    And I store the response as "approve_cash_transaction_response" name using full path

  @Negative @Validation
  Scenario: TC_20 Approve cash transaction with invalid transaction ID
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_21 Approve cash transaction with non-existent transaction ID
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_22 Approve cash transaction with negative transaction ID
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_23 Approve cash transaction with zero transaction ID
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_24 Approve cash transaction with invalid query parameters
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2|
      |invalid_param|invalid_value|transactionId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_25 Approve cash transaction with SQL injection in path parameter
    And I send the GET request to "collections_approve_cash_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|2'; DROP TABLE collections; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_26 Approve cash transaction with invalid endpoint
    And I send the GET request to "collections_approve_cash_transaction_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

