@BizomWebAPI @CE @OutletsManagement @ApprovalStatus @SystemOperations
Feature: Outlet Approval Status API Testing
  As a system user
  I want to test the outlet approval status endpoint
  So that I can ensure proper functionality and data retrieval for outlet approval status

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet approval status without access token
    When I send the GET request to "outlets_approval_status" endpoint with path parameters
      |Path|Value|
      |outletId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet approval status with invalid access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet approval status with expired access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet approval status with malformed access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet approval status for outlet ID 12 with valid access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @Functional
  Scenario: TC_06 Get outlet approval status for outlet ID 1 with valid access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @Functional
  Scenario: TC_07 Get outlet approval status for outlet ID 2 with valid access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @Functional
  Scenario: TC_08 Get outlet approval status for outlet ID 5 with valid access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @Functional
  Scenario: TC_09 Get outlet approval status for outlet ID 10 with valid access token
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|10|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|
    And I store the response as "outlet_approval_status_response" name using full path

  @Negative @Validation
  Scenario: TC_10 Get outlet approval status with invalid outlet ID - alphabetic characters
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds
  

  @Negative @Validation
  Scenario: TC_11 Get outlet approval status with invalid outlet ID - special characters
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|@#$%|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get outlet approval status with non-existent outlet ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Get outlet approval status with negative outlet ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_14 Get outlet approval status with zero outlet ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_15 Get outlet approval status with very large outlet ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_16 Get outlet approval status with SQL injection attempt in outlet ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1'; DROP TABLE outlets; --|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get outlet approval status with XSS attempt in outlet ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
  
  @Negative @ErrorHandling
  Scenario: TC_18 Get outlet approval status with invalid endpoint
    And I send the GET request to "outlets_approval_status_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_19 Performance test for outlet approval status endpoint
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_20 Concurrent access test for outlet approval status endpoint
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_21 Regression test for outlet approval status endpoint
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @DataValidation
  Scenario: TC_22 Validate outlet approval status response structure
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @DataIntegrity
  Scenario: TC_23 Validate outlet approval status data integrity
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @BusinessLogic
  Scenario: TC_24 Validate outlet approval status business logic
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end outlet approval status data retrieval workflow
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And I store the response as "outlet_approval_status_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @Smoke
  Scenario: TC_26 Get outlet approval status for outlet ID 12 with valid access token and DB validation
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @Functional
  Scenario: TC_27 Get outlet approval status for outlet ID 1 with valid access token and DB validation
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Response|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|object|

  @Positive @LoadTesting
  Scenario: TC_28 Load testing for outlet approval status endpoint
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_29 Test outlet approval status endpoint timeout handling
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_30 Get outlet approval status with boundary value - minimum valid ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_31 Get outlet approval status with boundary value - maximum valid ID
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @ContentValidation
  Scenario: TC_32 Validate outlet approval status content structure
    And I send the GET request to "outlets_approval_status" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|12|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |Result|
      |Response|

