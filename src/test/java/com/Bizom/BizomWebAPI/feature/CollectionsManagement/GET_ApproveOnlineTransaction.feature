@BizomWebAPI @OS @CollectionsManagement @ApproveOnlineTransaction @ReportsAnalyticsGroup2
Feature: Approve Online Transaction API Testing
  As a system user
  I want to test the approve online transaction endpoint
  So that I can ensure proper functionality for approving online transactions in collections management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Approve online transaction without access token
    When I send the GET request to "collections_approve_online_transaction" endpoint with path parameters
      |Path|Value|
      |transactionId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Approve online transaction with invalid access token
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|transactionId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Approve online transaction with expired access token
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|transactionId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Approve online transaction with malformed access token
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|transactionId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Approve online transaction for ID 3 with valid access token
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "approve_online_transaction_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Approve online transaction for ID 1 with valid access token
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @DataValidation
  Scenario: TC_07 Validate approve online transaction response structure for ID 3
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
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
  Scenario: TC_08 Validate approve online transaction response content
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
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
  Scenario: TC_09 Validate approve online transaction with DB validation
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason_id|"2"|

  @Positive @Performance
  Scenario: TC_10 Performance test for approve online transaction endpoint
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for approve online transaction endpoint
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate approve online transaction business logic
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
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
  Scenario: TC_13 Validate approve online transaction data integrity
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
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
  Scenario: TC_14 Regression test for approve online transaction endpoint
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Functional
  Scenario: TC_15 Validate approve online transaction response completeness
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
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
  Scenario: TC_16 Validate approve online transaction content structure
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Reason_id|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for approve online transaction endpoint
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Timeout
  Scenario: TC_18 Test approve online transaction endpoint timeout handling
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end approve online transaction workflow
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Reason_id|string|
    And I store the response as "approve_online_transaction_response" name using full path

  @Negative @Validation
  Scenario: TC_20 Approve online transaction with invalid transaction ID
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_21 Approve online transaction with non-existent transaction ID
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_22 Approve online transaction with negative transaction ID
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_23 Approve online transaction with zero transaction ID
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_24 Approve online transaction with invalid query parameters
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3|
      |invalid_param|invalid_value|transactionId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_25 Approve online transaction with SQL injection in path parameter
    And I send the GET request to "collections_approve_online_transaction" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|transactionId|3'; DROP TABLE collections; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_26 Approve online transaction with invalid endpoint
    And I send the GET request to "collections_approve_online_transaction_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

