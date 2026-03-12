@BizomWebAPI @CE @BeatsManagement @CheckActiveOutletsForBeats @CoreBusinessOperations
Feature: Check Active Outlets For Beats API Testing
  As a system user
  I want to test the check active outlets for beats endpoint
  So that I can ensure proper functionality and data retrieval for checking active outlets for beats

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Check active outlets for beats without access token
    When I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with path parameters
      |Path|Value|
      |beatId|19|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Check active outlets for beats with invalid access token
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|beatId|19|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Check active outlets for beats with expired access token
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|beatId|19|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Check active outlets for beats with malformed access token
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|beatId|19|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Check active outlets for beats with valid access token
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "check_active_outlets_for_beats_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate check active outlets for beats response structure
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate check active outlets for beats reason field
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Proceed with deactivation.|

  @Positive @DataValidation
  Scenario: TC_08 Validate check active outlets for beats complete structure
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Proceed with deactivation.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Performance
  Scenario: TC_09 Performance test for check active outlets for beats endpoint
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for check active outlets for beats endpoint
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: TC_11 Check active outlets for beats with invalid beat ID
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Check active outlets for beats with negative beat ID
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Check active outlets for beats with zero beat ID
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_14 Check active outlets for beats with SQL injection attempt in beat ID
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|'; DROP TABLE beats; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Check active outlets for beats with invalid endpoint
    And I send the GET request to "beats_checkactiveoutletsforbeats_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate check active outlets for beats business logic
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Proceed with deactivation.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate check active outlets for beats data integrity
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Proceed with deactivation.|

  @Positive @Regression
  Scenario: TC_18 Regression test for check active outlets for beats endpoint
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Proceed with deactivation.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Functional
  Scenario: TC_19 Validate check active outlets for beats response completeness
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Proceed with deactivation.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And I store the response as "check_active_outlets_for_beats_response" name using full path
    And validating the response contains the following values
      |Value|
      |result|
      |reason|

  @Positive @Boundary
  Scenario: TC_20 Check active outlets for beats with different beat IDs
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end check active outlets for beats data retrieval workflow
    And I send the GET request to "beats_checkactiveoutletsforbeats" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|19|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Proceed with deactivation.|
    And I store the response as "check_active_outlets_for_beats_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

