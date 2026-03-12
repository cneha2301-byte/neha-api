@BizomWebAPI @CE @WarehousesManagement @WarehouseTypeManagement @WarehouseTypes @SystemIntegration
Feature: Warehouse Type API Testing
  As a system user
  I want to test the warehouse type endpoint
  So that I can ensure proper functionality and data retrieval for warehouse types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get warehouse type without access token
    When I send the GET request to "warehouse_type_single" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |limit|10|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse type with invalid access token
#    When I send the GET request to "warehouse_type_single" endpoint with query parameters
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
#  Scenario: Get warehouse type with expired access token
#    When I send the GET request to "warehouse_type_single" endpoint with query parameters
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
#  Scenario: Get warehouse type with malformed access token
#    When I send the GET request to "warehouse_type_single" endpoint with query parameters
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
  Scenario: Get warehouse type with valid access token
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|


  @Positive @Functional
  Scenario: Get warehouse type with additional query parameters
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Functional
  Scenario: Get warehouse type with pagination parameters
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |page|1|
      |per_page|20|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Functional
  Scenario: Get warehouse type with filtering parameters
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |status|active|
      |type|warehouse|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Functional
  Scenario: Get warehouse type with sorting parameters
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sort_by|name|
      |sort_order|asc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Functional
  Scenario: Get warehouse type with search parameters
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |search|Direct|
      |search_field|name|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|


  @Positive @DataValidation
  Scenario: Validate warehouse type specific data values
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.warehousetypes.1|DB:warehousetypes:name: id=1|
      |$.warehousetypes.2|DB:warehousetypes:name: id=2|
      |$.warehousetypes.3|DB:warehousetypes:name: id=3|
      |$.warehousetypes.4|DB:warehousetypes:name: id=4|
      |$.warehousetypes.5|DB:warehousetypes:name: id=5|
      |$.warehousetypes.8|DB:warehousetypes:name: id=8|
      |$.warehousetypes.9|MissingErpId|
      |$.warehousetypes.11|warehouse4321|
      |$.warehousetypes.6|DB:warehousetypes:name: id=6|
      |$.warehousetypes.7|DB:warehousetypes:name: id=7|


  @Positive @DataValidation
  Scenario: Validate warehouse type with empty search result
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Performance
  Scenario: Performance test for warehouse type endpoint
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Concurrency
  Scenario: Concurrent access test for warehouse type endpoint
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Boundary
  Scenario: Get warehouse type with boundary limit value (maximum allowed)
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |limit|1000|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Boundary
  Scenario: Get warehouse type with zero offset parameter
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |offset|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

#  @Negative @ErrorHandling
#  Scenario: Get warehouse type with invalid endpoint
#    When I send the GET request to "warehouse_type_single_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate warehouse type business logic
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.warehousetypes.1|Direct|
      |$.warehousetypes.2|Indirect|
      |$.warehousetypes.3|SubType|
      |$.warehousetypes.4|Warehouse_01|
      |$.warehousetypes.5|Warehouse123|

  @Positive @DataIntegrity
  Scenario: Validate warehouse type data integrity
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|


  @Positive @Regression
  Scenario: Regression test for warehouse type endpoint
    When I send the GET request to "warehouse_type_single" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

