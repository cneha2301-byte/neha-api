@BizomWebAPI @OS @PaymentsManagement @MailToRetailer @SalesOperations
Feature: Mail To Retailer API Testing
  As a system user
  I want to test the mail to retailer endpoint with invoice ID and email parameters
  So that I can ensure proper functionality for sending invoice emails to retailers

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Mail to retailer without access token
    When I send the GET request to "payments_mailtoretailer" endpoint with path parameters
      |Path|Value|
      |invoiceId|0002202004220921481356|
      |email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Mail to retailer with invalid access token
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|invoiceId|0002202004220921481356|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Mail to retailer with expired access token
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|invoiceId|0002202004220921481356|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Mail to retailer with malformed access token
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|invoiceId|0002202004220921481356|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Mail to retailer with valid invoice ID and valid email
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|email sent successfully|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

#  @Positive @Functional
#  Scenario: Mail to retailer with different valid invoice ID and email
#    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|invoiceId|DB:payments:invoice: id=1|
#      |||email|test@example.com|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|email sent successfully|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|

  @Negative @Validation
  Scenario: Mail to retailer with invalid invoice ID
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|invalid_invoice_id_12345|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Invalid InvoiceId|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Mail to retailer with non-existent invoice ID
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|99999999999999999999|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Invalid InvoiceId|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Mail to retailer with invalid email format
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
      |||email|amitabhadfaafwf.ewfrwer|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Failed to send, please try again|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

#  @Negative @Validation
#  Scenario: Mail to retailer with empty email
#    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
#      |||email||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"false"|
#      |$.Reason|Failed to send, please try again|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|

  @Negative @Validation
  Scenario: Mail to retailer with email missing @ symbol
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
      |||email|invalidemail.com|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Failed to send, please try again|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Mail to retailer with email missing domain
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
      |||email|test@|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|Failed to send, please try again|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

#  @Negative @Validation
#  Scenario: Mail to retailer with special characters in email
#    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
#      |||email|<script>alert('XSS')</script>@test.com|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"false"|
#      |$.Reason|Failed to send, please try again|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|

#  @Negative @Validation
#  Scenario: Mail to retailer with empty invoice ID
#    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|invoiceId||
#      |||email|amitabha.bagchi@mobisy.com|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"false"|
#      |$.Reason|Invalid InvoiceId|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|

  @Negative @ErrorHandling
  Scenario: Mail to retailer with invalid endpoint
    And I send the GET request to "payments_mailtoretailer_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for mail to retailer endpoint
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for mail to retailer endpoint
    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|invoiceId|0002202004220921481356|
      |||email|amitabha.bagchi@mobisy.com|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|email sent successfully|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

#  @Positive @Smoke
#  Scenario: Mail to retailer with valid invoice ID and valid email - DB validation
#    And I send the GET request to "payments_mailtoretailer" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|invoiceId|DB:payments:invoice: id=1|
#      |||email|amitabha.bagchi@mobisy.com|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|email sent successfully|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|


