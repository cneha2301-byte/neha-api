@BizomWebAPI @CE @OutletsManagement @GetOutletLevel @InventoryOperations
Feature: Get Outlet Level API Testing
  As a system user
  I want to test the get outlet level endpoint
  So that I can ensure outlet hierarchy information is returned correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet level without access token
    When I send the GET request to "outlets_get_outlet_level" endpoint with path parameters
      |Path|Value|
      |outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet level with invalid access token
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_03 Get outlet level for outlet ID 2 with valid access token
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Outletlevel|"cash"|
      |$.isdistributor|"0"|
    And I store the response as "outlet_level_outlet2" name using full path

  @Positive @DataValidation
  Scenario: TC_04 Validate outlet level response field types
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outletlevel|string|
      |$.isdistributor|string|

  @Positive @Functional
  Scenario: TC_05 Get outlet level for another outlet with valid access token
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the field is not null
      |JPath|
      |$.Outletlevel|

  @Positive @Performance
  Scenario: TC_06 Performance test for outlet level endpoint
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_07 Regression validation for outlet level response across outlets
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"    
    And verify response time is less than "2500" milliseconds
    And verifies the field is not null
      |JPath|
      |$.isdistributor|

  @Negative @ErrorHandling
  Scenario: TC_08 Get outlet level with invalid endpoint
    And I send the GET request to "outlets_get_outlet_level_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get outlet level with invalid outlet ID
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

#  @Negative @Validation
#  Scenario: TC_10 Get outlet level with non-existent outlet ID
#    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletId|999999|
#    Then I should see the response code as "500"
#    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_11 Validate outlet level response contains expected keys
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Outletlevel|
      |isdistributor|

  @Positive @DataValidation
  Scenario: TC_12 Validate outlet level response with database values
    And I send the GET request to "outlets_get_outlet_level" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Outletlevel|DB:outlets:outlet_level: id=2|


