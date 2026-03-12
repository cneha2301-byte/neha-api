@BizomWebAPI @MerchandisingManagement @GetMerchandisingData @WorkflowAutomation @Innovation
Feature: Merchandising Data API Testing
  As a system user
  I want to test the stockatoutlets getMerchandisingData endpoint
  So that I can ensure proper functionality and data retrieval for merchandising data management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get merchandising data without access token
    When I send the GET request to "get_merchandising_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get merchandising data with invalid access token
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get merchandising data with expired access token
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get merchandising data with malformed access token
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get merchandising data with valid access token
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "merchandising_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate merchandising data response structure
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.secondaryDisplay|array|
      |$.shelfType|array|
      |$.shelfPlacementType|array|
      |$.planogramrefImage|array|
      |$.visitingType|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate merchandising data specific data values
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.visitingType['1']|DB:visitingtypes:name: id=1|

  @Positive @DataValidation
  Scenario: TC_08 Validate merchandising data with static values
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.visitingType['1']|test2|

  @Positive @Performance
  Scenario: TC_09 Performance test for merchandising data endpoint
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for merchandising data endpoint
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_11 Get merchandising data with invalid query parameters
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get merchandising data with special characters in query parameters
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_13 Get merchandising data with SQL injection attempt
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE stockatoutlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_14 Get merchandising data with maximum query parameters
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get merchandising data with invalid endpoint
#    And I send the GET request to "get_merchandising_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: TC_16 Validate merchandising data business logic
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate merchandising data data integrity
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.secondaryDisplay|array|
      |$.shelfType|array|
      |$.shelfPlacementType|array|
      |$.planogramrefImage|array|
      |$.visitingType|object|
      |$.visitingType['1']|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for merchandising data endpoint
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.secondaryDisplay|array|
      |$.shelfType|array|
      |$.shelfPlacementType|array|
      |$.planogramrefImage|array|
      |$.visitingType|object|

  @Positive @Functional
  Scenario: TC_19 Validate merchandising data response completeness
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.secondaryDisplay|array|
      |$.shelfType|array|
      |$.shelfPlacementType|array|
      |$.planogramrefImage|array|
      |$.visitingType|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.visitingType['1']|test2|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate merchandising data array structure and content
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.secondaryDisplay|array|
      |$.shelfType|array|
      |$.shelfPlacementType|array|
      |$.planogramrefImage|array|

  @Positive @ObjectValidation
  Scenario: TC_21 Validate merchandising data object structure and content
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.visitingType|object|
      |$.visitingType['1']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.visitingType['1']|test2|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.visitingType['1']|DB:visitingtypes:name: id=1|

  @Positive @ContentValidation
  Scenario: TC_22 Validate merchandising data content structure
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |secondaryDisplay|
      |shelfType|
      |shelfPlacementType|
      |planogramrefImage|
      |visitingType|
      |test2|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for merchandising data endpoint
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: TC_24 Test merchandising data endpoint timeout handling
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end merchandising data data retrieval workflow
    And I send the GET request to "get_merchandising_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "merchandising_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.secondaryDisplay|array|
      |$.shelfType|array|
      |$.shelfPlacementType|array|
      |$.planogramrefImage|array|
      |$.visitingType|object|
      |$.visitingType['1']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.visitingType['1']|test2|