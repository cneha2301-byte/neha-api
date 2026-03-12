@BizomWebAPI @CE @OutletsManagement @OutletFlows @InventoryOperations
Feature: Get Outlet Flows API Testing
  As a system user
  I want to test the get outlet flows API endpoint
  So that I can ensure proper functionality and data retrieval for outlet flows

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet flows without access token
    When I send the GET request to "outlets_get_outlet_flows_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlet flows with invalid access token
#    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlet flows with expired access token
#    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlet flows with malformed access token
#    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet flows with valid access token
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Fetched data successfully|
      |$.Data[0].Outletflow.id|"1"|
      |$.Data[0].Outletflow.name|sale|
      |$.Data[0].Outletflow.user_id|"1"|
    And I store the response as "outlet_flows_response" name using full path

  @Positive @Regression
  Scenario: TC_06 Regression test for outlet flows endpoint
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Fetched data successfully|

  @Positive @Functional
  Scenario: TC_07 Validate outlet flows response completeness
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Fetched data successfully|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0].Outletflow.id|string|
      |$.Data[0].Outletflow.name|string|

  @Positive @ArrayValidation
  Scenario: TC_08 Validate outlet flows array structure and content
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].Outletflow.id|"1"|
      |$.Data[0].Outletflow.name|sale|
      |$.Data[1].Outletflow.id|"2"|
      |$.Data[1].Outletflow.name|collection|

  @Positive @ContentValidation
  Scenario: TC_09 Validate outlet flows content structure
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Data|
      |Outletflow|
      |id|
      |name|

  @Positive @LoadTesting
  Scenario: TC_10 Load testing for outlet flows endpoint
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_11 Test outlet flows endpoint timeout handling
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_12 Validate outlet flows business logic
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Fetched data successfully|

  @Positive @DataIntegrity
  Scenario: TC_13 Validate outlet flows data integrity
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0].Outletflow.id|string|
      |$.Data[0].Outletflow.name|string|
      |$.Data[0].Outletflow.user_id|string|

  @Positive @DataValidation
  Scenario: TC_14 Validate outlet flows response structure
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Fetched data successfully|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].Outletflow|object|
      |$.Data[0].Outletflow.id|string|
      |$.Data[0].Outletflow.name|string|
      |$.Data[0].Outletflow.user_id|string|
      |$.Data[0].Outletflow.created|string|
      |$.Data[0].Outletflow.modified|string|

  @Positive @DataValidation
  Scenario: TC_15 Validate outlet flows specific data values
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Fetched data successfully|
      |$.Data[1].Outletflow.id|"2"|
      |$.Data[1].Outletflow.name|collection|
      |$.Data[2].Outletflow.id|"3"|
      |$.Data[2].Outletflow.name|saleReturnWithInvoice|
      |$.Data[3].Outletflow.id|"4"|
      |$.Data[3].Outletflow.name|saleReturnWithoutInvoice|
      |$.Data[4].Outletflow.id|"5"|
      |$.Data[4].Outletflow.name|stockatoutlet|
      |$.Data[5].Outletflow.id|"6"|
      |$.Data[5].Outletflow.name|asset|
      |$.Data[6].Outletflow.id|"7"|
      |$.Data[6].Outletflow.name|merchandising|
      |$.Data[7].Outletflow.id|"8"|
      |$.Data[7].Outletflow.name|order|

  @Positive @Performance
  Scenario: TC_16 Performance test for outlet flows endpoint
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_17 Concurrent access test for outlet flows endpoint
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Get outlet flows with invalid query parameters
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Get outlet flows with special characters in query parameters
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_20 Get outlet flows with SQL injection attempt
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_21 Get outlet flows with invalid endpoint
#    And I send the GET request to "outlets_get_outlet_flows_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end outlet flows retrieval workflow
    And I send the GET request to "outlets_get_outlet_flows_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Fetched data successfully|
    And I store the response as "outlet_flows_response" name using full path


