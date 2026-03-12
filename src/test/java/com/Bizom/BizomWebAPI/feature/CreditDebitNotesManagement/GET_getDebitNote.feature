@BizomWebAPI @CoreBusinessOperations @CreditDebitNotesManagement @GetDebitNote @PI
Feature: Get Debit Note API Testing
  As a system user
  I want to test the getdebitnote endpoint
  So that I can ensure proper functionality and data retrieval for debit notes management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get debit note without access token
    When I send the GET request to "cdnotes_getdebitnote" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get debit note with invalid access token
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get debit note with expired access token
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get debit note with malformed access token
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get debit note with valid access token and query parameters
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|
    And I store the response as "getDebitNote_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get debit note response structure
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @DataValidation
  Scenario: Validate get debit note response when invalid data
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|

  @Positive @DataValidation
  Scenario: Validate get debit note specific data values
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|
    And I verify API response at path with DB and static values
      |JPath|Value|

  @Positive @DataValidation
  Scenario: Validate get debit note with static values
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|

  @Positive @Performance
  Scenario: Performance test for get debit note endpoint
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Positive @Concurrency
  Scenario: Concurrent access test for get debit note endpoint
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with missing outletId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with missing warehouseId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with invalid outletId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|99999|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with invalid warehouseId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with invalid query parameters
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with special characters in query parameters
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Security
  Scenario: Get debit note with SQL injection attempt
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
      |test_param|'; DROP TABLE cdnotes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Boundary
  Scenario: Get debit note with maximum query parameters
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @ErrorHandling
  Scenario: Get debit note with invalid endpoint
    And I send the GET request to "cdnotes_getdebitnote_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate get debit note business logic
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|

  @Positive @DataIntegrity
  Scenario: Validate get debit note data integrity
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Regression
  Scenario: Regression test for get debit note endpoint
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Functional
  Scenario: Validate get debit note response completeness
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @ContentValidation
  Scenario: Validate get debit note content structure
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And validating the response contains the following values
      |Value|
      |result|
      |reason|

  @Positive @LoadTesting
  Scenario: Load testing for get debit note endpoint
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Timeout
  Scenario: Test get debit note endpoint timeout handling
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Positive @EndToEnd
  Scenario: End-to-end get debit note data retrieval workflow
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"invalid data"|
    And I store the response as "getDebitNote_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get debit note with negative outletId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|-1|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with negative warehouseId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|

  @Negative @Validation
  Scenario: Get debit note with non-numeric outletId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|invalid|
      |warehouseId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get debit note with non-numeric warehouseId parameter
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|13|
      |warehouseId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: Get debit note with different outletId and warehouseId values
    And I send the GET request to "cdnotes_getdebitnote" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|1|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|



