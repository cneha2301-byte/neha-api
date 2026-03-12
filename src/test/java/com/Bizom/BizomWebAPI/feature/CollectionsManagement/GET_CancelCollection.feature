@BizomWebAPI @OS @CollectionsManagement @CancelCollection @ReportsAnalyticsGroup2
Feature: Cancel Collection API Testing
  As a system user
  I want to test the cancel collection endpoint
  So that I can ensure proper functionality for cancelling collections in collections management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Cancel collection without access token
    When I send the GET request to "collections_cancel_collection" endpoint with path parameters
      |Path|Value|
      |collectionId|26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Cancel collection with invalid access token
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|collectionId|26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Cancel collection with expired access token
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|collectionId|26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Cancel collection with malformed access token
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|collectionId|26|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Cancel collection for ID 26 with valid access token
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "cancel_collection_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Cancel collection for ID 1 with valid access token
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @DataValidation
  Scenario: TC_07 Validate cancel collection response structure for ID 26
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.is_already_cancelled|boolean|

  @Positive @DataValidation
  Scenario: TC_08 Validate cancel collection response content
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.is_already_cancelled|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.is_already_cancelled|boolean|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |is_already_cancelled|

  @Positive @DataValidation
  Scenario: TC_09 Validate cancel collection with DB validation
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.is_already_cancelled|true|

  @Positive @Performance
  Scenario: TC_10 Performance test for cancel collection endpoint
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for cancel collection endpoint
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate cancel collection business logic
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.is_already_cancelled|boolean|

  @Positive @DataIntegrity
  Scenario: TC_13 Validate cancel collection data integrity
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.is_already_cancelled|boolean|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |is_already_cancelled|

  @Positive @Regression
  Scenario: TC_14 Regression test for cancel collection endpoint
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Functional
  Scenario: TC_15 Validate cancel collection response completeness
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.is_already_cancelled|boolean|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @ContentValidation
  Scenario: TC_16 Validate cancel collection content structure
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |is_already_cancelled|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for cancel collection endpoint
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Timeout
  Scenario: TC_18 Test cancel collection endpoint timeout handling
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end cancel collection workflow
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.is_already_cancelled|boolean|
    And I store the response as "cancel_collection_response" name using full path

  @Negative @Validation
  Scenario: TC_20 Cancel collection with non-existent collection ID
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_21 Cancel collection with negative collection ID
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_22 Cancel collection with zero collection ID
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_23 Cancel collection with invalid query parameters
    And I send the GET request to "collections_cancel_collection" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|collectionId|26|
      |invalid_param|invalid_value|collectionId|26|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_24 Cancel collection with invalid endpoint
    And I send the GET request to "collections_cancel_collection_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

