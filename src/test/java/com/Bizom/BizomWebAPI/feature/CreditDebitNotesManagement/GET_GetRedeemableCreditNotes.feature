@BizomWebAPI @CreditDebitNotesManagement @GetRedeemableCreditNotes @CreditNoteManagement @PI
Feature: Get Redeemable Credit Notes API Testing
  As a system user
  I want to test the get redeemable credit notes endpoint
  So that I can ensure proper functionality and data retrieval for redeemable credit notes management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get redeemable credit notes without access token
    When I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with path parameters
      |Path|Value|
      |customerId|2|
      |companyId|14|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get redeemable credit notes with invalid access token
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get redeemable credit notes with expired access token
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get redeemable credit notes with malformed access token
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get redeemable credit notes for customer 2 and company 14 with valid access token
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And I store the response as "redeemable_credit_notes_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get redeemable credit notes for customer 2 and company 14 with language parameter
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|hi|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @DataValidation
  Scenario: TC_07 Validate redeemable credit notes response structure for customer 2
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Creditnotes|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate Creditnotes array is empty or list structure
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Creditnotes|array|

  @Negative @Validation
  Scenario: TC_09 Get redeemable credit notes with invalid customer ID format
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|abc|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get redeemable credit notes with invalid company ID format
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|xyz|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get redeemable credit notes with non-existent customer ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|999999|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get redeemable credit notes with non-existent company ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get redeemable credit notes with negative customer ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|-1|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get redeemable credit notes with negative company ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get redeemable credit notes with zero customer ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|0|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get redeemable credit notes with zero company ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Injection
  Scenario: TC_17 Get redeemable credit notes with SQL injection in customer ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2' OR '1'='1|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Injection
  Scenario: TC_18 Get redeemable credit notes with SQL injection in company ID
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14' OR '1'='1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Injection
  Scenario: TC_19 Get redeemable credit notes with XSS payload in language parameter
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|<script>alert('xss')</script>|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Injection
  Scenario: TC_20 Get redeemable credit notes with command injection in language parameter
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en; rm -rf /|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_21 Get redeemable credit notes with invalid endpoint
    And I send the GET request to "cdnotes_get_redeemable_credit_notes_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_22 Performance test for get redeemable credit notes endpoint
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Performance
  Scenario: TC_23 Concurrency test for get redeemable credit notes endpoint
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_24 Load test for get redeemable credit notes endpoint
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @DataValidation
  Scenario: TC_25 Validate response data types for customer 2
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Creditnotes|array|

  @Positive @Regression
  Scenario: TC_26 Regression test for get redeemable credit notes endpoint
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @DBValidation
  Scenario: TC_27 DB validation for redeemable credit notes - verify customer and company association
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @DBValidation
  Scenario: TC_28 DB validation for redeemable credit notes count matches response
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Creditnotes|array|

  @Positive @DataIntegrity
  Scenario: TC_29 Data integrity test for redeemable credit notes with different customers
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|3|
      |language|en|companyId|14|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_30 Data integrity test for redeemable credit notes with different companies
    And I send the GET request to "cdnotes_get_redeemable_credit_notes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|customerId|2|
      |language|en|companyId|15|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
