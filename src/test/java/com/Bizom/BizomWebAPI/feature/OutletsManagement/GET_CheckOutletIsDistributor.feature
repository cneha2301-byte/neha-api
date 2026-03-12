@BizomWebAPI @CE @OutletsManagement @CheckOutletIsDistributor @SystemOperations
Feature: Outlets - Check Outlet Is Distributor API Testing
  As a system user
  I want to test the check outlet is distributor endpoint
  So that I can ensure proper functionality for checking if an outlet is a distributor

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Check outlet is distributor without access token
    When I send the GET request to "outlets_check_is_distributor" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Check outlet is distributor with invalid access token
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Check outlet is distributor with expired access token
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Check outlet is distributor with malformed access token
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Check outlet is distributor with valid access token - Not a distributor case
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|
    And I store the response as "check_outlet_is_distributor_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate check outlet is distributor response structure
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate check outlet is distributor specific data values
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Positive @DataValidation
  Scenario: TC_08 Validate check outlet is distributor with static values
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Positive @Performance
  Scenario: TC_09 Performance test for check outlet is distributor endpoint
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for check outlet is distributor endpoint
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Negative @Validation
  Scenario: TC_11 Check outlet is distributor with invalid query parameters
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Negative @Validation
  Scenario: TC_12 Check outlet is distributor with special characters in query parameters
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Negative @Security
  Scenario: TC_13 Check outlet is distributor with SQL injection attempt
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Negative @Boundary
  Scenario: TC_14 Check outlet is distributor with maximum query parameters
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
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
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Negative @ErrorHandling
  Scenario: TC_15 Check outlet is distributor with invalid endpoint
    And I send the GET request to "outlets_check_is_distributor_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate check outlet is distributor business logic
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate check outlet is distributor data integrity
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for check outlet is distributor endpoint
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_19 Validate check outlet is distributor response completeness
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Positive @ContentValidation
  Scenario: TC_20 Validate check outlet is distributor content structure
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |distributor|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for check outlet is distributor endpoint
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Negative @Timeout
  Scenario: TC_22 Test check outlet is distributor endpoint timeout handling
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end check outlet is distributor workflow
    And I send the GET request to "outlets_check_is_distributor" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Outlet is not a distributor.|
    And I store the response as "check_outlet_is_distributor_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

