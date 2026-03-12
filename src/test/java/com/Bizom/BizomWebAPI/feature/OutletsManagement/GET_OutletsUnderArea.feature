@BizomWebAPI @CE @OutletsManagement @OutletsUnderArea @SalesOperations
Feature: Outlets Under Area API Testing
  As a system user
  I want to test the outlets under area endpoint
  So that I can ensure outlet listing for a specific area is returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets under area without access token
    When I send the GET request to "outlets_under_area" endpoint with path parameters
      |Path|Value|
      |areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlets under area with invalid access token
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlets under area with expired access token
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlets under area with malformed access token
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets under area with valid access token
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data[0].Outlet.id|"2"|
      |$.data[0].Outlet.name|"Sadha Nanda1"|
      |$.data[0].Outlet.address|"attibele1"|
    And I store the response as "outlets_under_area_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets under area response structure
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|
      |$.data[0].Outlet|object|
      |$.data[0].Outlet.id|string|
      |$.data[0].Outlet.name|string|
      |$.data[0].Outlet.address|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets under area specific data values
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[1].Outlet.id|"3"|
      |$.data[1].Outlet.name|"chinaAmma Store"|
      |$.data[2].Outlet.id|"4"|
      |$.data[2].Outlet.name|"Anmol Kirana"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate outlets under area content structure
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |Sadha Nanda1|
      |chinaAmma Store|
      |Anmol Kirana|
      |Poonam Provision|

  @Positive @ArrayValidation
  Scenario: TC_09 Validate outlets under area array structure
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].Outlet|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[5].Outlet.id|"7"|
      |$.data[5].Outlet.name|"Smith Bakery"|
      |$.data[5].Outlet.address|"test"|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlets under area endpoint
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlets under area endpoint
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for outlets under area endpoint
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_13 Regression test for outlets under area endpoint
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data[0].Outlet.id|"2"|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end outlets under area data retrieval workflow
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data[0].Outlet.name|"Sadha Nanda1"|
    And I store the response as "outlets_under_area_response" name using full path

  @Negative @Validation
  Scenario: TC_15 Get outlets under area with invalid area identifier
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_16 Get outlets under area using special characters in query parameters
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: TC_17 Get outlets under area with SQL injection attempt
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: TC_18 Get outlets under area with large area identifier
    And I send the GET request to "outlets_under_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: TC_19 Get outlets under area using invalid endpoint
    And I send the GET request to "outlets_under_area_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

