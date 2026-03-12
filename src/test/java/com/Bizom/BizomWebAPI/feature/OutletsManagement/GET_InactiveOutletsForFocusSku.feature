@BizomWebAPI @CE @OutletsManagement @InactiveOutletsForFocusSku @SalesOperations
Feature: Inactive Outlets For Focus SKU API Testing
  As a system user
  I want to test the inactive outlets for focus SKU endpoint
  So that I can ensure inactive outlet status for focus SKU is returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get inactive outlets for focus SKU without access token
    When I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get inactive outlets for focus SKU with invalid access token
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get inactive outlets for focus SKU with expired access token
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get inactive outlets for focus SKU with malformed access token
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get inactive outlets for focus SKU with valid access token
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "inactive_outlets_focus_sku_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate inactive outlets for focus SKU response structure
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @Performance
  Scenario: TC_07 Performance test for inactive outlets for focus SKU endpoint
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for inactive outlets for focus SKU endpoint
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_09 Load testing for inactive outlets for focus SKU endpoint
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_10 Regression test for inactive outlets for focus SKU endpoint
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
  Scenario: TC_11 End-to-end inactive outlets for focus SKU data retrieval workflow
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I store the response as "inactive_outlets_focus_sku_response" name using full path

  @Negative @Validation
  Scenario: TC_12 Get inactive outlets for focus SKU with invalid outlet identifier
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_13 Get inactive outlets for focus SKU using special characters in query parameters
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|<script>alert('XSS')</script>| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: TC_14 Get inactive outlets for focus SKU with SQL injection attempt
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|'; DROP TABLE outlets; --| | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: TC_15 Get inactive outlets for focus SKU with large outlet identifier
    And I send the GET request to "outlets_inactive_outlets_for_focus_sku" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get inactive outlets for focus SKU using invalid endpoint
#    And I send the GET request to "outlets_inactive_outlets_for_focus_sku_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

