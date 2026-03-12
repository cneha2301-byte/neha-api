@BizomWebAPI @OS @CollectionsManagement @GetCollections @ReportsAnalyticsGroup2
Feature: Get Collections API Testing
  As a system user
  I want to test the get collections endpoint with date range, sequence range, and time filters
  So that I can ensure proper functionality for retrieving collections data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get collections without access token
    When I send the GET request to "collections_get_collections" endpoint with path parameters
      |Path|Value|
      |fromdate|2025-09-01|
      |todate|2025-10-05|
      |startseq|0|
      |endseq|99|
        Then I should see the response code as "200"
        And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get collections with invalid access token
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get collections with expired access token
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get collections with malformed access token
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get collections with valid access token
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|
    And I store the response as "collections_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get collections with different date range
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-08-01|
      |||todate|2025-11-30|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate collections response structure
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|
      |$.Collection[0]|object|
      |$.Collection[0].Check|object|
      |$.Collection[0].Online|object|
      |$.Collection[0].amount|string|
      |$.Collection[0].approved|string|
      |$.Collection[0].collectiontype|string|
      |$.Collection[0].created|string|
      |$.Collection[0].id|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate collections response content
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|
    And validating the response contains the following values
      |Value|
      |Collection|
      |Check|
      |Online|
      |amount|
      |approved|
      |collectiontype|

  @Positive @DataValidation
  Scenario: TC_09 Validate collections nested object structure
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection[0].Check|object|
      |$.Collection[0].Check.checkno|string|
      |$.Collection[0].Check.checkdate|string|
      |$.Collection[0].Check.bankname|string|
      |$.Collection[0].Online|object|
      |$.Collection[0].Online.bankname|string|
      |$.Collection[0].Online.transactionid|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for collections endpoint
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for collections endpoint
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate collections business logic with different sequence range
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|50|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Positive @DataIntegrity
  Scenario: TC_13 Validate collections data integrity
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|
    And validating the response contains the following values
      |Value|
      |Collection|
      |amount|
      |approved|
      |collectiontype|
      |id|

  @Positive @Regression
  Scenario: TC_14 Regression test for collections endpoint
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Positive @Functional
  Scenario: TC_15 Validate collections response completeness
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|
      |$.Collection[0]|object|

  @Positive @ContentValidation
  Scenario: TC_16 Validate collections content structure
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Collection|
      |Check|
      |Online|
      |amount|
      |approved|
      |collectiontype|
      |created|
      |id|
      |transactionid|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for collections endpoint
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Positive @Timeout
  Scenario: TC_18 Test collections endpoint timeout handling
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end collections retrieval workflow
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|
    And I store the response as "collections_response" name using full path

  @Negative @Validation
  Scenario: TC_20 Get collections with invalid date format
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|invalid-date|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Negative @Validation
  Scenario: TC_21 Get collections with invalid sequence values
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|abc|
      |||endseq|xyz|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "500"

  @Negative @Validation
  Scenario: TC_22 Get collections with reversed date range
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-05|
      |||todate|2025-09-01|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Negative @Validation
  Scenario: TC_23 Get collections with invalid time format
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|invalid-time|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Negative @Validation
  Scenario: TC_24 Get collections with invalid query parameters
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Negative @Security
  Scenario: TC_25 Get collections with SQL injection in path parameters
    And I send the GET request to "collections_get_collections" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|'; DROP TABLE collections; --|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Collection|array|

  @Negative @ErrorHandling
  Scenario: TC_26 Get collections with invalid endpoint
    And I send the GET request to "collections_get_collections_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-05|
      |||startseq|0|
      |||endseq|99|
      |fromtime|11:03:25|||
      |totime|08:30:00|||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

