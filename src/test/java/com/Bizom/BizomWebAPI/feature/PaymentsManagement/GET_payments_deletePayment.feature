@BizomWebAPI @OS @PaymentsManagement @DeletePayment @SalesOperations
Feature: Delete Payment API Testing
  As a system user
  I want to test the delete payment endpoint
  So that I can ensure proper functionality for deleting payments

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|


  @Negative @Security
  Scenario: TC_01 Delete payment without access token
    When I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||paymentId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds


#  @Negative @Security
#  Scenario: TC_02 Delete payment with invalid access token
#    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|paymentId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds


#  @Negative @Security
#  Scenario: TC_03 Delete payment with expired access token
#    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|paymentId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds


#  @Negative @Security
#  Scenario: TC_04 Delete payment with malformed access token
#    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|paymentId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds


  @Positive @Smoke
  Scenario: TC_05 Delete payment with valid access token
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "delete_payment_response" name using full path


  @Positive @DataValidation
  Scenario: TC_06 Validate delete payment response structure
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.PaymentIds|array|


  @Positive @DataValidation
  Scenario: TC_07 Validate delete payment PaymentIds array structure
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|


  @Positive @DataValidation
  Scenario: TC_08 Validate delete payment PaymentIds array content
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.PaymentIds[0]|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|


  @Positive @DataValidation
  Scenario: TC_09 Validate delete payment complete structure
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.PaymentIds[0]|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|


  @Positive @Performance
  Scenario: TC_10 Performance test for delete payment endpoint
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for delete payment endpoint
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


  @Positive @Functional
  Scenario: TC_12 Delete payment with different payment IDs
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|


  @Negative @Validation
  Scenario: TC_13 Delete payment with invalid query parameters
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
      |invalid_param|invalid_value|       |      |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


#  @Negative @Validation
#  Scenario: TC_14 Delete payment with special characters in payment ID
#    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"


#  @Negative @Security
#  Scenario: TC_15 Delete payment with SQL injection attempt in payment ID
#    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|'; DROP TABLE payments; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_16 Delete payment with empty payment ID
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Negative @Boundary
  Scenario: TC_17 Delete payment with zero payment ID
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|


#  @Negative @Boundary
#  Scenario: TC_18 Delete payment with negative payment ID
#    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_19 Delete payment with invalid endpoint
#    And I send the GET request to "payments_deletepayment_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_20 Validate delete payment business logic
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.PaymentIds[0]|"1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|


  @Positive @DataIntegrity
  Scenario: TC_21 Validate delete payment data integrity
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.PaymentIds[0]|"1"|


  @Positive @Regression
  Scenario: TC_22 Regression test for delete payment endpoint
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|


  @Positive @Functional
  Scenario: TC_23 Validate delete payment response completeness
    And I send the GET request to "payments_deletepayment" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.PaymentIds|array|
      |$.PaymentIds[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.PaymentIds[0]|"1"|
    And I store the response as "delete_payment_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |PaymentIds|
      |invoice is already canceled|
