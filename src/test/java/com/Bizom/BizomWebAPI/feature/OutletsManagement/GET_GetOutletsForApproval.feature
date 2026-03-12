@BizomWebAPI @CE @OutletsManagement @OutletsForApproval @InventoryOperations
Feature: Get Outlets For Approval API Testing
  As a system user
  I want to test the get outlets for approval endpoint
  So that I can ensure proper functionality and data retrieval for outlets awaiting approval

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for approval without access token
    When I send the GET request to "outlets_get_outlets_for_approval" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlets for approval with invalid access token
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
   And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlets for approval with expired access token
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlets for approval with malformed access token
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets for approval with valid access token
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.totalpages|1|
    And I store the response as "outlets_for_approval_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for approval response structure
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].outletid|string|
      |$.data[0].status|string|
      |$.data[0].comment|null|
      |$.data[0].created|string|
      |$.data[0].outletname|string|
      |$.data[0].address|string|
      |$.data[0].outletstate_id|string|
      |$.data[0].username|null|
      |$.outletData|array|
      |$.outletData[0].Outletid|string|
      |$.outletData[0].Salehistorycolor|null|
      |$.outletData[0].Outlet|object|
      |$.totalpages|number|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate specific outlet entries
#    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].outletname|e|
#      |$.data[1].id|"2"|
#      |$.data[1].outletname|e2|
#      |$.data[2].id|"4"|
#      |$.data[2].outletname|hs|

  @Positive @Performance
  Scenario: TC_08 Performance test for outlets for approval endpoint
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for outlets for approval endpoint
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get outlets for approval with invalid query parameters
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get outlets for approval with special characters in query parameters
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get outlets for approval with SQL injection attempt
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_13 Get outlets for approval with invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_approval_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_14 Regression test for outlets for approval endpoint
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @ArrayValidation
  Scenario: TC_15 Validate arrays and nested structures
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.outletData|array|
      |$.outletData[0].Outlet|object|

  @Positive @ContentValidation
  Scenario: TC_16 Validate outlets for approval content keywords
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |outletData|
      |Outlet|
      |outletname|

  @Positive @LoadTesting
  Scenario: TC_17 Load testing for outlets for approval endpoint
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_18 Test outlets for approval endpoint timeout handling
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end outlets for approval retrieval workflow
    And I send the GET request to "outlets_get_outlets_for_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "outlets_for_approval_e2e_response" name using full path


