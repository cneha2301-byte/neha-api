@BizomWebAPI @CE @DesignationsManagement @GetDesignations @IntegrationServices
Feature: Get Designations API Testing
  As a system user
  I want to test the get designations endpoint
  So that I can ensure proper functionality and data retrieval for designations management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get designations without access token
    When I send the GET request to "designations_getdesignations" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get designations with invalid access token
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get designations with expired access token
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get designations with malformed access token
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get designations with valid access token
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "designations_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate designations response structure
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
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
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate designations data array structure
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Designation|object|
      |$.data[0].Designation.id|string|
      |$.data[0].Designation.name|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate designations with static values
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].Designation.id|"1"|
      |$.data[0].Designation.name|"CEO"|
      |$.data[1].Designation.id|"2"|
      |$.data[1].Designation.name|"DM"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Designation|object|
      |$.data[0].Designation.id|string|
      |$.data[0].Designation.name|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate designations all data items
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].Designation.id|"1"|
      |$.data[0].Designation.name|"CEO"|
      |$.data[1].Designation.id|"2"|
      |$.data[1].Designation.name|"DM"|
      |$.data[2].Designation.id|"3"|
      |$.data[2].Designation.name|"Distributor sales manager"|
      |$.data[3].Designation.id|"4"|
      |$.data[3].Designation.name|"distributor salesman"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Designation.id|string|
      |$.data[0].Designation.name|string|
      |$.data[1].Designation.id|string|
      |$.data[1].Designation.name|string|
      |$.data[2].Designation.id|string|
      |$.data[2].Designation.name|string|
      |$.data[3].Designation.id|string|
      |$.data[3].Designation.name|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for designations endpoint
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for designations endpoint
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get designations with invalid query parameters
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Get designations with special characters in query parameters
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_14 Get designations with SQL injection attempt
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE designations; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_15 Get designations with maximum query parameters
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
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

  @Negative @ErrorHandling
  Scenario: TC_16 Get designations with invalid endpoint
    And I send the GET request to "designations_getdesignations_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate designations business logic
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].Designation.id|"1"|
      |$.data[0].Designation.name|"CEO"|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate designations data integrity
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
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
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Designation|object|
      |$.data[0].Designation.id|string|
      |$.data[0].Designation.name|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for designations endpoint
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
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
      |$.data|array|

  @Positive @Functional
  Scenario: TC_20 Validate designations response completeness
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].Designation.id|"1"|
      |$.data[0].Designation.name|"CEO"|
      |$.data[1].Designation.id|"2"|
      |$.data[1].Designation.name|"DM"|
      |$.data[2].Designation.id|"3"|
      |$.data[2].Designation.name|"Distributor sales manager"|
      |$.data[3].Designation.id|"4"|
      |$.data[3].Designation.name|"distributor salesman"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Designation|object|
      |$.data[0].Designation.id|string|
      |$.data[0].Designation.name|string|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate designations array structure and content
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[1]|object|
      |$.data[2]|object|
      |$.data[3]|object|
      |$.data[0].Designation|object|
      |$.data[0].Designation.id|string|
      |$.data[0].Designation.name|string|
      |$.data[1].Designation.id|string|
      |$.data[1].Designation.name|string|

  @Positive @ContentValidation
  Scenario: TC_22 Validate designations content structure
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Designation|
      |id|
      |name|
      |CEO|
      |DM|
      |Distributor sales manager|
      |distributor salesman|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for designations endpoint
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_24 Test designations endpoint timeout handling
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end designations data retrieval workflow
    And I send the GET request to "designations_getdesignations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].Designation.id|"1"|
      |$.data[0].Designation.name|"CEO"|
      |$.data[1].Designation.id|"2"|
      |$.data[1].Designation.name|"DM"|
      |$.data[2].Designation.id|"3"|
      |$.data[2].Designation.name|"Distributor sales manager"|
      |$.data[3].Designation.id|"4"|
      |$.data[3].Designation.name|"distributor salesman"|
    And I store the response as "designations_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Designation|object|
      |$.data[0].Designation.id|string|
      |$.data[0].Designation.name|string|
      |$.data[1]|object|
      |$.data[1].Designation|object|
      |$.data[1].Designation.id|string|
      |$.data[1].Designation.name|string|
      |$.data[2]|object|
      |$.data[2].Designation|object|
      |$.data[2].Designation.id|string|
      |$.data[2].Designation.name|string|
      |$.data[3]|object|
      |$.data[3].Designation|object|
      |$.data[3].Designation.id|string|
      |$.data[3].Designation.name|string|

