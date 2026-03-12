@BizomWebAPI @CE @WarehousesManagement @WarehouseTypeManagement @WarehouseTypesBusinessTypes @SystemIntegration
Feature: Warehouse Types API Testing
  As a system user
  I want to test the warehouse types endpoint
  So that I can ensure proper functionality and data retrieval for warehouse and business types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get warehouse types without access token
    When I send the GET request to "warehouse_types" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |limit|10|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse types with invalid access token
#    When I send the GET request to "warehouse_types" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse types with expired access token
#    When I send the GET request to "warehouse_types" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse types with malformed access token
#    When I send the GET request to "warehouse_types" endpoint with query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get warehouse types with valid access token
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Functional
  Scenario: Get warehouse types with additional query parameters
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|10|
      |offset|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Functional
  Scenario: Get warehouse types with pagination parameters
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |page|1|
      |per_page|20|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Functional
  Scenario: Get warehouse types with filtering parameters
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |status|active|
      |type|warehouse|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Functional
  Scenario: Get warehouse types with sorting parameters
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sort_by|name|
      |sort_order|asc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Functional
  Scenario: Get warehouse types with search parameters
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |search|Direct|
      |search_field|name|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Functional
  Scenario: Get warehouse types with date range parameters
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |from_date|2024-01-01|
      |to_date|2024-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Functional
  Scenario: Get warehouse types with multiple combined parameters
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|5|
      |offset|0|
      |status|active|
      |sort_by|name|
      |sort_order|asc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @DataValidation
  Scenario: Validate warehouse types response structure
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @DataValidation
  Scenario: Validate warehouse types specific data values
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.warehousetype[0].name|Direct|
      |$.warehousetype[1].name|Indirect|
      |$.warehousetype[2].name|SubType|
      |$.businesstype[0].name|Market one|
      |$.businesstype[0].businesstype_for|warehouse|
      |$.businesstype[0].name|DB:businesstypes:name: id=1|
      |$.warehousetype[0].name|DB:warehousetypes:name: id=1|
      |$.warehousetype[1].name|DB:warehousetypes:name: id=2|
      |$.warehousetype[2].name|DB:warehousetypes:name: id=3|


  @Positive @DataValidation
  Scenario: Validate warehouse types with empty search result
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |search|nonexistent_type|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Performance
  Scenario: Performance test for warehouse types endpoint
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for warehouse types endpoint
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|


  @Negative @Boundary
  Scenario: Get warehouse types with boundary limit value (maximum allowed)
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|1000|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Boundary
  Scenario: Get warehouse types with zero offset parameter
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |offset|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

#  @Negative @ErrorHandling
#  Scenario: Get warehouse types with invalid endpoint
#    When I send the GET request to "warehouse_types_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|


  @Positive @BusinessLogic
  Scenario: Validate warehouse types business logic
    When I send the GET request to "warehouse_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.warehousetype[0].name|Direct|
      |$.warehousetype[1].name|Indirect|
      |$.warehousetype[2].name|SubType|
      |$.businesstype[0].businesstype_for|warehouse|

