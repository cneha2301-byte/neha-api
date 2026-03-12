@BizomWebAPI @CreditDebitNotesManagement @GetCreditNoteDataIdwise @SupportingFunctions @PI
Feature: Get Credit Note Data ID Wise API Testing
  As a system user
  I want to test the get credit note data by ID endpoint
  So that I can ensure proper functionality and data retrieval for credit note management by ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get credit note data by ID without access token
    When I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with path parameters
      |Path|Value|
      |cdnoteId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get credit note data by ID with invalid access token
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|cdnoteId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get credit note data by ID with expired access token
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|cdnoteId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get credit note data by ID with malformed access token
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|cdnoteId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get credit note data for ID 1 with valid access token
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "credit_note_data_idwise_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get credit note data for ID 2 with valid access token
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataValidation
  Scenario: TC_07 Validate credit note data response structure for ID 1
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Creditnotes|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate credit note data object structure
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Creditnotes|object|
      |$.Creditnotes["1"]|object|
      |$.Creditnotes["1"].id|string|
      |$.Creditnotes["1"].remainingamount|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate credit note data with DB validation
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|
    #   |$.Creditnotes["1"].id|DB:cdnotes:id: id=1|
    #   |$.Creditnotes["1"].remainingamount|DB:cdnotes:remainingamount: id=1|

  @Negative @Validation
  Scenario: TC_10 Get credit note data with invalid credit note ID
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_11 Get credit note data with non-existent credit note ID
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_12 Get credit note data with negative credit note ID
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_13 Get credit note data with zero credit note ID
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @ErrorHandling
  Scenario: TC_14 Get credit note data with invalid endpoint
    And I send the GET request to "cdnotes_get_credit_note_data_idwise_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_15 Performance test for credit note data endpoint
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|

  @Positive @Concurrency
  Scenario: TC_16 Concurrent access test for credit note data endpoint
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|

  @Negative @Validation
  Scenario: TC_17 Get credit note data with invalid query parameters
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
      |invalid_param|invalid_value|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|

  @Negative @Security
  Scenario: TC_18 Get credit note data with SQL injection in path parameter
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1'; DROP TABLE cdnotes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_19 Validate credit note data business logic
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|

  @Positive @DataIntegrity
  Scenario: TC_20 Validate credit note data integrity
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|String|
      |$.Creditnotes|object|
      |$.Creditnotes["1"]|object|
      |$.Creditnotes["1"].id|string|
      |$.Creditnotes["1"].remainingamount|string|

  @Positive @Regression
  Scenario: TC_21 Regression test for credit note data endpoint
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|String|
      |$.Creditnotes|object|

  @Positive @Functional
  Scenario: TC_22 Validate credit note data response completeness
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Creditnotes|object|
      |$.Creditnotes["1"]|object|

  @Positive @ContentValidation
  Scenario: TC_23 Validate credit note data content structure
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Creditnotes|
      |id|
      |remainingamount|

  @Positive @LoadTesting
  Scenario: TC_24 Load testing for credit note data endpoint
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|

  @Negative @Timeout
  Scenario: TC_25 Test credit note data endpoint timeout handling
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"| 

  @Positive @EndToEnd
  Scenario: TC_26 End-to-end credit note data retrieval workflow
    And I send the GET request to "cdnotes_get_credit_note_data_idwise" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cdnoteId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"true"|
    And I store the response as "credit_note_data_idwise_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|String|
      |$.Creditnotes|object|
      |$.Creditnotes["1"]|object|
      |$.Creditnotes["1"].id|string|
      |$.Creditnotes["1"].remainingamount|string|

