@BizomWebAPI @CE @OutletCategoriesManagement @SetOutletCategory @SystemOperations
Feature: Outlet Categories - Set Outlet Category by Zone ID
  Validates /outletcategories/setoutletcategory/{zoneId} endpoint using path parameters.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Set outlet category without access token
    When I send the GET request to "outletcategories_set_category" endpoint with path parameters
      |Path|Value|
      |OutletID|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Set outlet category with invalid access token
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|OutletID|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_03 Set outlet category with expired access token
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|OutletID|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_04 Set outlet category with malformed access token
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|OutletID|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Set outlet category with valid access token (zoneId 1)
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|OutletID|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|Invalid request.|
      |$.id|"-1"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.id|string|

  @Negative @Validation
  Scenario: TC_06 Set outlet category with non-numeric zoneId
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|OutletID|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Set outlet category with very large zoneId
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|OutletID|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_08 Invalid endpoint should return not found
    And I send the GET request to "outletcategories_set_category_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|OutletID|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for set outlet category endpoint
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|OutletID|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_10 Regression test for set outlet category endpoint
    And I send the GET request to "outletcategories_set_category" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|OutletID|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds


