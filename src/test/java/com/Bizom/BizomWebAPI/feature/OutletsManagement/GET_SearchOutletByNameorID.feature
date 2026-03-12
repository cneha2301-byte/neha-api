@BizomWebAPI @CE @OutletsManagement @OutletSearch @SearchOutletByNameOrId @SalesOperations
Feature: Search Outlet By Name or ID API Testing
  As a system user
  I want to test the Search Outlet By Name or ID endpoint
  So that I can verify proper outlet retrieval functionality

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate,br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Search outlet without access token
    When I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with path parameters
      |Path|Value|
      |id|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Search outlet with invalid access token
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|id|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Search outlet with expired access token
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|id|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Search outlet with malformed access token
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|id|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Search outlet with valid access token
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Outlets[0].Outlet.id|"3"|
      |$.Outlets[0].Outlet.name|"chinaAmma Store"|
      |$.Outlets[0].Outlet.address|"atb"|
    And I store the response as "search_outlet_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate search outlet response structure
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.Outlets|array|
      |$.Outlets[0].Outlet.id|string|
      |$.Outlets[0].Outlet.name|string|
      |$.Outlets[0].Outlet.address|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate search outlet specific data values
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.Outlets[0].Outlet.name|"chinaAmma Store"|
      |$.Outlets[0].Outlet.address|"atb"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate search outlet content structure
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |Outlets|
      |id|
      |name|
      |address|

  @Positive @Performance
  Scenario: TC_09 Performance test for search outlet endpoint
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_10 Search outlet with invalid outlet identifier
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_11 Search outlet using special characters in query parameters
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: TC_12 Search outlet with SQL injection attempt
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: TC_13 Search outlet with large outlet identifier
    And I send the GET request to "outlets_search_outlet_by_name_or_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Search outlet using invalid endpoint
#    And I send the GET request to "outlets_search_outlet_by_name_or_id_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"
