@BizomWebAPI @CE @OutletsManagement @GetOutletsForArea @InventoryOperations
Feature: Get Outlets For Area API Testing
  As a system user
  I want to test the get outlets for area endpoint
  So that I can ensure proper functionality and data retrieval for outlets mapped to an area

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for area without access token
    When I send the GET request to "outlets_get_outlets_for_area" endpoint with path parameters
      |Path|Value|
      |areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets for area with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|areaId|2|
#    Then I should see the response code as "200"
#     And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for area with expired access token
#    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|areaId|2|
#    Then I should see the response code as "200"
#     And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for area with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|areaId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets for area with valid access token
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.outlets[0].Outlet.id|"18"|
      |$.outlets[0].Outlet.name|"sass"|
    And I store the response as "outlets_for_area_response" name using full path

  @Positive @DataValidation
 Scenario: TC_06 Validate outlets for area response structure
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.outlets|array|
      |$.outlets[0]|object|
      |$.outlets[0].Outlet|object|
      |$.outlets[0].Outlet.id|string|
      |$.outlets[0].Outlet.name|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets for area specific data values
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.outlets[1].Outlet.id|"30"|
      |$.outlets[1].Outlet.name|"5t"|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlets for area with static values
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Outlet.name|"sass"|
      |$.outlets[1].Outlet.name|"5t"|

  @Positive @Performance
  Scenario: TC_09 Performance test for outlets for area endpoint
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for outlets for area endpoint
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: TC_11 Get outlets for area with invalid query parameters
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |invalid_param|invalid_value| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get outlets for area with special characters in query parameters
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_13 Get outlets for area with SQL injection attempt
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_14 Get outlets for area with maximum query parameters
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
      |param1|value1| | |
      |param2|value2| | |
      |param3|value3| | |
      |param4|value4| | |
      |param5|value5| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @ErrorHandling
  Scenario: TC_15 Get outlets for area with invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_area_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate outlets for area business logic
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate outlets for area data integrity
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets|array|
      |$.outlets[0].Outlet.id|string|
      |$.outlets[0].Outlet.name|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for outlets for area endpoint
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.outlets|array|

  @Positive @Functional
  Scenario: TC_19 Validate outlets for area response completeness
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Outlet.id|"18"|
      |$.outlets[0].Outlet.name|"sass"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate outlets array structure and content
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets|array|
      |$.outlets[0].Outlet|object|
      |$.outlets[1].Outlet|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Outlet.id|"18"|
      |$.outlets[1].Outlet.id|"30"|

  @Positive @ContentValidation
  Scenario: TC_21 Validate outlets for area content structure
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |outlets|
      |Outlet|
      |id|
      |name|
      |address|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for outlets for area endpoint
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Timeout
  Scenario: TC_23 Test outlets for area endpoint timeout handling
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end outlets for area data retrieval workflow
    And I send the GET request to "outlets_get_outlets_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "outlets_for_area_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.outlets|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Outlet.id|"18"|
      |$.outlets[0].Outlet.name|"sass"|

