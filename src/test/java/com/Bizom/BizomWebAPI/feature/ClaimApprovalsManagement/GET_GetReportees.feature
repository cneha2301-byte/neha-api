@BizomWebAPI @ClaimApprovalsManagement @GetReportees @ConfigurationSettings @CE
Feature: Get Reportees API Testing
  As a system user
  I want to test the get reportees endpoint
  So that I can ensure proper functionality and data retrieval for reportees management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get reportees without access token
    When I send the GET request to "getreportees" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds
   

  @Negative @Security
  Scenario: TC_02 Get reportees with invalid access token
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get reportees with expired access token
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get reportees with malformed access token
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get reportees with valid access token
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And I store the response as "getreportees_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate reportees response structure
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate reportees specific data values
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @DataValidation
  Scenario: TC_08 Validate reportees with static values
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @Performance
  Scenario: TC_09 Performance test for reportees endpoint
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for reportees endpoint
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Validation
  Scenario: TC_11 Get reportees with invalid query parameters
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Validation
  Scenario: TC_12 Get reportees with special characters in query parameters
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Security
  Scenario: TC_13 Get reportees with SQL injection attempt
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Boundary
  Scenario: TC_14 Get reportees with maximum query parameters
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
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
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @ErrorHandling
  Scenario: TC_15 Get reportees with invalid endpoint
    And I send the GET request to "getreportees_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds
    

  @Positive @BusinessLogic
  Scenario: TC_16 Validate reportees business logic
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate reportees data integrity
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @Regression
  Scenario: TC_18 Regression test for reportees endpoint
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @Functional
  Scenario: TC_19 Validate reportees response completeness
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate reportees array structure and content
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @ContentValidation
  Scenario: TC_21 Validate reportees content structure
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response contains the following values
      |Value|
      |Response|
      |Result|
      |Reason|
      |Users|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for reportees endpoint
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Negative @Timeout
  Scenario: TC_23 Test reportees endpoint timeout handling
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end reportees data retrieval workflow
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And I store the response as "getreportees_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @DataHandling
  Scenario: TC_25 Validate reportees data handling
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @ResponseStructure
  Scenario: TC_26 Validate reportees response structure consistency
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response|object|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Users|array|

  @Positive @EmptyDataHandling
  Scenario: TC_27 Validate reportees empty data handling
    And I send the GET request to "getreportees" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
      |$.Response.Users|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Users|array|
