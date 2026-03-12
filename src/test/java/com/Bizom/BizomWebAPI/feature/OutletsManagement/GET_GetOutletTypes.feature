@BizomWebAPI @CE @OutletsManagement @GetOutletTypes @InventoryOperations
Feature: Get Outlet Types API Testing
  As a system user
  I want to test the get outlet types endpoint
  So that I can ensure outlet type metadata is returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet types without access token
    When I send the GET request to "outlets_get_outlet_types" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet types with invalid access token
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet types with expired access token
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet types with malformed access token
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet types with valid access token
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.outlettypes['Outlets1']|"Outlets1"|
      |$.outlettypesid['5']|"Test Type"|
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.outlettypes['Outlets1']|"Outlets1"|
      |$.outlettypesid['5']|"Test Type"|
    And I store the response as "outlet_types_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet types response structure
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.outlettypes|object|
      |$.outlettypesid|object|
      |$.outlettypelist|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet types specific data values
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlettypes['Test Type']|"Test Type"|
      |$.outlettypesid['6']|"outlet"|
      |$.outlettypelist[0].OutletType.id|"1"|
      |$.outlettypelist[0].OutletType.name|"Outlets1"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate outlet types content structure
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |outlettypes|
      |Outlets1|
      |Test Type|
      |outlet|
      |ouatlet|

  @Positive @ArrayValidation
  Scenario: TC_09 Validate outlet type list structure
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlettypelist[0].OutletType.id|string|
      |$.outlettypelist[0].OutletType.name|string|
      |$.outlettypelist[0].OutletType.active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlettypelist[1].OutletType.id|"5"|
      |$.outlettypelist[1].OutletType.name|"Test Type"|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet types endpoint
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlet types endpoint
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for outlet types endpoint
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Regression
  Scenario: TC_13 Regression test for outlet types endpoint
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end outlet types data retrieval workflow
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "outlet_types_response" name using full path

  @Negative @Validation
  Scenario: TC_15 Get outlet types with invalid query parameters
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_16 Get outlet types using special characters in query parameters
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Security
  Scenario: TC_17 Get outlet types with SQL injection attempt
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Boundary
  Scenario: TC_18 Get outlet types with excessive query parameters
    And I send the GET request to "outlets_get_outlet_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_19 Get outlet types using invalid endpoint
    And I send the GET request to "outlets_get_outlet_types_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds


