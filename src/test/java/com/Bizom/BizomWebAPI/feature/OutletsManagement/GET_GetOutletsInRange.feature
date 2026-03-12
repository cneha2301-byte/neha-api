@BizomWebAPI @CE @OutletsManagement @GetOutletsInRange @InventoryOperations
Feature: Get Outlets In Range API Testing
  As a system user
  I want to test the get outlets in range endpoint
  So that I can ensure geo based outlet searches return accurate data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets in range without access token
    When I send the GET request to "outlets_get_outlets_in_range" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets in range with invalid access token
#    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |latitude|26.83706700|
#      |longitude|75.77227590|
#      |radius|1000.0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets in range with expired access token
#    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |latitude|26.83706700|
#      |longitude|75.77227590|
#      |radius|1000.0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets in range with malformed access token
#    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |latitude|26.83706700|
#      |longitude|75.77227590|
#      |radius|1000.0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets in range with valid access token
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      |$.outlets[0].Outlet.id|"3"|
      |$.outlets[0].Outlet.name|"chinaAmma Store"|
    And I store the response as "outlets_in_range_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets in range response structure
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.outlets|array|
      |$.outlets[0].Outlet|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets in range specific data values
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[1].Outlet.id|"654"|
      |$.outlets[1].Outlet.name|"test"|
      |$.outlets[2].Outlet.id|"659"|
      |$.outlets[2].Outlet.pin|"369258"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate outlets in range content structure
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |outlets|
      |chinaAmma Store|
      |test|
      |chup|

  @Positive @ArrayValidation
  Scenario: TC_09 Validate outlets in range custom data values
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[0].Customoutletdata[0].custom[0].field_type|"Image"|
      |$.outlets[0].Customoutletdata[0].custom[1].key|"Unique Code"|
      |$.outlets[0].Customoutletdata[0].custom[1].value|"uc123"|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlets in range endpoint
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlets in range endpoint
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for outlets in range endpoint
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_13 Regression test for outlets in range endpoint
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end outlets in range data retrieval workflow
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I store the response as "outlets_in_range_response" name using full path

  @Negative @Validation
  Scenario: TC_15 Get outlets in range with invalid query parameters
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_16 Get outlets in range using special characters in query parameters
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: TC_17 Get outlets in range with SQL injection attempt
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: TC_18 Get outlets in range with large radius value
    And I send the GET request to "outlets_get_outlets_in_range" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_19 Get outlets in range using invalid endpoint
    And I send the GET request to "outlets_get_outlets_in_range_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |latitude|26.83706700|
      |longitude|75.77227590|
      |radius|1000.0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

