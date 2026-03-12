@BizomWebAPI @CE @OutletsManagement @Outlets @GetAllOutletDetails @SalesOperations
Feature: Get All Outlet Details For User API Testing
  As a system user
  I want to test the Get All Outlet Details For User endpoint
  So that I can ensure proper functionality, data consistency, and validation for outlet data retrieval based on user ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  # ======================================================
  # Negative Security Scenarios
  # ======================================================

  @Negative @Security
  Scenario: TC_01 Get all outlet details without access token
    When I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with path parameters
      |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get all outlet details with invalid access token
#    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|userId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get all outlet details with expired access token
#    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|userId|1|
#      Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

  # ======================================================
  # Positive Functional Scenarios
  # ======================================================

#  @Positive @Smoke
#  Scenario: TC_04 Get all outlet details for user ID 1 with valid access token
#    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.outlets[0].Outlet.name|tets|
#      |$.outlets[0].Area.name|Sarjapur|
#      |$.outlets[0].City.city_name|Calcutta|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.outlets[0].Outlet|object|
#      |$.outlets[0].Area|object|
#      |$.outlets[0].City|object|

  @Positive @Functional
  Scenario: TC_05 Validate nested outlet fields for user ID 1
    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets[0].Outlet.name|string|
      |$.outlets[0].Outlet.latitude|string|
      |$.outlets[0].Outlet.longitude|string|
      |$.outlets[0].Area.Warehouse.name|string|
      |$.outlets[0].Area.Warehouse.Zone.name|string|

  # ======================================================
  # Positive Data Validation Scenarios (DB & Static Comparison)
  # ======================================================

#  @Positive @DataValidation
#  Scenario: TC_06 Validate API response with DB data for user ID 1
#    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|true|
#      |$.outlets[0].Outlet.name|DB:outlets:name:id=751|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.outlets[0].Outlet.name|string|
#      |$.outlets[0].Area.name|string|
#      |$.outlets[0].City.city_name|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate outlet coordinates and warehouse zone from DB
#    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.outlets[0].Area.Warehouse.Zone.name|DB:zones:name:id=2|

  # ======================================================
  # Negative Validation Scenarios
  # ======================================================

#  @Negative @Validation
#  Scenario: TC_08 Get outlet details with invalid user ID
#    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|abc|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"false"|
#      |$.Reason|"No outlets found."|

#  @Negative @Validation
#  Scenario: TC_09 Get outlet details with non-existent user ID
#    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|999999|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"false"|
#      |$.Reason|"No outlets found."|

  # ======================================================
  # Invalid Endpoint Scenario
  # ======================================================

  @Negative @ErrorHandling
  Scenario: TC_10 Get all outlet details with invalid endpoint
    And I send the GET request to "outlets_get_all_outlet_details_for_user_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  # ======================================================
  # Performance & Regression Scenarios
  # ======================================================

  @Positive @Performance
  Scenario: TC_11 Performance test for Get All Outlet Details For User API
    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_12 Regression test for Get All Outlet Details For User API
    And I send the GET request to "outlets_get_all_outlet_details_for_user" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
