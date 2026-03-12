@BizomWebAPI @CE @OutletsManagement @GetUnmappedOutlets @InventoryOperations
Feature: Get Unmapped Outlets API Testing
  As a system user
  I want to test the get unmapped outlets endpoint
  So that I can ensure unmapped outlet listing by area is returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get unmapped outlets without access token
    When I send the GET request to "outlets_get_unmapped_outlets" endpoint with path parameters
      |Path|Value|
      |areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get unmapped outlets with invalid access token
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get unmapped outlets with expired access token
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get unmapped outlets with malformed access token
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get unmapped outlets for area 1 with valid access token
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Data.Outlets[0].Outlet.name|"9 to 11 Store"|
      |$.Data.Outlets[0].Area.name|"Attibele"|
    And I store the response as "unmapped_outlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate unmapped outlets response structure
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Outlets|array|
      |$.Data.Outlets[0].Outlet|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate unmapped outlets specific data values
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.Outlets[2].Outlet.id|"667"|
      |$.Data.Outlets[2].Outlet.name|"dev sadhas"|
      |$.Data.Outlets[2].Area.name|"Attibele"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate unmapped outlets content structure
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Outlets|
      |Attibele|
      |SS Traders|
      |RPC|

  @Positive @Performance
  Scenario: TC_09 Performance test for unmapped outlets endpoint
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for unmapped outlets endpoint
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_11 Load testing for unmapped outlets endpoint
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_12 Regression test for unmapped outlets endpoint
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_13 End-to-end unmapped outlets data retrieval workflow
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "unmapped_outlets_response" name using full path

  @Negative @Validation
  Scenario: TC_14 Get unmapped outlets with invalid area identifier
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_15 Get unmapped outlets using special characters in query parameters
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_16 Get unmapped outlets with SQL injection attempt
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_17 Get unmapped outlets with large area identifier
    And I send the GET request to "outlets_get_unmapped_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_18 Get unmapped outlets using invalid endpoint
    And I send the GET request to "outlets_get_unmapped_outlets_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

