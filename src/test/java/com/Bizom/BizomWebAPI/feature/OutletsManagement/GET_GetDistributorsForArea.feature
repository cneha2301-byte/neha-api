@BizomWebAPI @CE @OutletsManagement @DistributorsForArea @SystemOperations
Feature: Get Distributors For Area API Testing
  As a system user
  I want to test the get distributors for area endpoint
  So that I can ensure proper functionality and data retrieval for distributors mapped to specific areas

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get distributors for area without access token
    When I send the GET request to "outlets_get_distributors_for_area" endpoint with path parameters
      |Path|Value|
      |areaId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get distributors for area with invalid access token
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|areaId|1|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get distributors for area with expired access token
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get distributors for area with malformed access token
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|areaId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get distributors for area ID 1 with valid access token
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.outlets[0].Outlet.id|"767"|
      |$.outlets[0].Outlet.name|"dis1"|
    And I store the response as "distributors_for_area_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate distributors for area response structure
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|
      |$.outlets[0].Outlet|object|
      |$.outlets[0].Outlet.id|string|
      |$.outlets[0].Outlet.name|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate distributors outlet object structure
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets[0].Outlet.id|string|
      |$.outlets[0].Outlet.name|string|

  @Positive @Functional
  Scenario: TC_08 Get distributors for area ID 2 with valid access token
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|

  @Positive @Functional
  Scenario: TC_09 Get distributors for area ID 3 with valid access token
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for distributors for area endpoint
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get distributors with invalid area ID
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get distributors with negative area ID
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get distributors with SQL injection attempt
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |test_param|'; DROP TABLE outlets; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|

  @Negative @Boundary
  Scenario: TC_13 Get distributors with maximum query parameters
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
      |param1|value1|                  | |
      |param2|value2|                  | |
      |param3|value3|                  | |
      |param4|value4|                  | |
      |param5|value5|                  | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get distributors with invalid endpoint
#    And I send the GET request to "outlets_get_distributors_for_area_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|areaId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate distributors for area business logic
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|
      |$.outlets[0].Outlet|object|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate distributors data integrity with database
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_17 Regression test for distributors for area endpoint
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|

  @Positive @Functional
  Scenario: TC_18 Validate distributors response completeness
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |outlets|
      |Outlet|
      |id|
      |name|

  @Positive @EndToEnd
  Scenario: TC_19 End-to-end distributors for area retrieval workflow
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.outlets[0].Outlet.id|"767"|
      |$.outlets[0].Outlet.name|dis1|
    And I store the response as "distributors_area_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|
      |$.outlets[0].Outlet|object|
      |$.outlets[0].Outlet.id|string|
      |$.outlets[0].Outlet.name|string|

  @Positive @Reliability
  Scenario: TC_20 Reliability test for distributors for area endpoint
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|
      |$.outlets[0].Outlet|object|

  @Positive @Idempotency
    Scenario: TC_21 Idempotency test for distributors for area endpoint
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "distributors_first_call" name using full path
    And I send the GET request to "outlets_get_distributors_for_area" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|areaId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.outlets|array|


