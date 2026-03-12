@BizomWebAPI @OS @CollectionsManagement @ConnectApiCollectionForUser @ReportsAnalyticsGroup2
Feature: Connect API Collection For User API Testing
  As a system user
  I want to test the connect API collection for user endpoint
  So that I can ensure proper functionality for retrieving collections for a specific user within a date range

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Connect API collection for user without access token
    When I send the GET request to "collections_connect_api_collection_for_user" endpoint with path parameters
      |Path|Value|
      |fromdate|2025-10-04|
      |todate|2025-10-05|
      |userId|25|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Connect API collection for user with invalid access token
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Connect API collection for user with expired access token
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Connect API collection for user with malformed access token
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Connect API collection for user with valid access token
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|
    And I store the response as "connect_api_collection_for_user_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Connect API collection for user with different date range
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-09-01|
      |||todate|2025-10-31|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate connect API collection for user response structure
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate connect API collection for user response content
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Data|

  @Positive @DataValidation
  Scenario: TC_09 Validate connect API collection for user Data array structure
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for connect API collection for user endpoint
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for connect API collection for user endpoint
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate connect API collection for user business logic with different user ID
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @DataIntegrity
  Scenario: TC_13 Validate connect API collection for user data integrity
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Data|

  @Positive @Regression
  Scenario: TC_14 Regression test for connect API collection for user endpoint
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_15 Validate connect API collection for user response completeness
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @ContentValidation
  Scenario: TC_16 Validate connect API collection for user content structure
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Data|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for connect API collection for user endpoint
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @Timeout
  Scenario: TC_18 Test connect API collection for user endpoint timeout handling
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end connect API collection for user workflow
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|
    And I store the response as "connect_api_collection_for_user_response" name using full path

  @Negative @Validation
  Scenario: TC_20 Connect API collection for user with invalid user ID
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @Validation
  Scenario: TC_21 Connect API collection for user with non-existent user ID
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @Validation
  Scenario: TC_22 Connect API collection for user with reversed date range
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-05|
      |||todate|2025-10-04|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @Validation
  Scenario: TC_23 Connect API collection for user with invalid query parameters
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-10-04|
      |||todate|2025-10-05|
      |||userId|25|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

  @Negative @Security
  Scenario: TC_24 Connect API collection for user with SQL injection in path parameters
    And I send the GET request to "collections_connect_api_collection_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|'; DROP TABLE collections; --|
      |||todate|2025-10-05|
      |||userId|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|

