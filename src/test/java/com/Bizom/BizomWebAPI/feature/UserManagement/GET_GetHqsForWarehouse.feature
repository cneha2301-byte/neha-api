@BizomWebAPI @CE @GetHqsForWarehouse @UserManagement
Feature: GetHqsForWarehouse API Testing
  As a system user
  I want to test the gethqsforwarehouse endpoint
  So that I can ensure proper functionality and data retrieval for headquarters by warehouse

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get HQs for warehouse without access token
    When I send the GET request to "get_hqs_for_warehouse" endpoint with path parameters
      |Path|Value|
      |warehouseId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get HQs for warehouse with invalid access token
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get HQs for warehouse with expired access token
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get HQs for warehouse with malformed access token
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get HQs for warehouse ID 1 with valid access token
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get HQs for warehouse with blank warehouse ID
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under area."|
      |$.Model|[]|
      |$.Data|[]|

  @Negative @Validation
  Scenario: Get HQs for warehouse with invalid warehouse ID
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under area."|
      |$.Model|[]|
      |$.Data|[]|

  @Negative @Validation
  Scenario: Get HQs for warehouse with non-numeric warehouse ID
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under area."|
      |$.Model|[]|
      |$.Data|[]|

#  @Negative @ErrorHandling
#  Scenario: Get HQs for warehouse with invalid endpoint
#    And I send the GET request to "get_hqs_for_warehouse_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get HQs for warehouse endpoint
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get HQs for warehouse endpoint
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get HQs for warehouse ID 1 with valid access token - DB validation
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.Model|[]|
#      |$.Data|DB:warehouses:hq_data: id=1|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|object|

  @Positive @DataValidation
  Scenario: Validate get HQs for warehouse response structure for warehouse ID 1
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|

#  @Positive @DataValidation
#  Scenario: Validate get HQs for warehouse response structure for blank warehouse ID
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under area."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

  @Positive @BusinessLogic
  Scenario: Validate get HQs for warehouse business logic for warehouse ID 1
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data[""]|null|

  @Positive @BusinessLogic
  Scenario: Validate get HQs for warehouse business logic for blank warehouse ID
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under area."|
      |$.Model|[]|
      |$.Data|[]|

  @Positive @ArrayValidation
  Scenario: Validate Model array structure for warehouse ID 1
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Model|array|
      |$.Data|object|

  @Positive @ArrayValidation
  Scenario: Validate Model array structure for blank warehouse ID
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under area."|
      |$.Model|[]|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Model|array|
      |$.Data|array|

#  @Positive @ErrorHandling
#  Scenario: Validate error handling for blank warehouse ID
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under area."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Positive @ErrorHandling
#  Scenario: Validate error handling for invalid warehouse ID
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under area."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

  @Positive @CompleteValidation
  Scenario: Validate complete get HQs for warehouse data structure for warehouse ID 1
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data[""]|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|

#  @Positive @CompleteValidation
#  Scenario: Validate complete get HQs for warehouse data structure for blank warehouse ID
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under area."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

#  @Positive @WarehouseValidation
#  Scenario: Validate warehouse-specific data for warehouse ID 1
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.Model|[]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason|""|
#      |$.Data|DB:warehouses:hq_data: id=1|

  @Positive @WarehouseValidation
  Scenario: Validate warehouse-specific data for blank warehouse ID
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under area."|
      |$.Model|[]|
      |$.Data|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found under area."|

  @Positive @DataIntegrity
  Scenario: Validate data integrity for warehouse ID 1
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[""]|null|

#  @Positive @DataIntegrity
#  Scenario: Validate data integrity for blank warehouse ID
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under area."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|

  @Positive @Functional
  Scenario: Validate functional behavior for warehouse ID 1
    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.Model|[]|
      |$.Data[""]|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Model|array|
      |$.Data|object|

#  @Positive @Functional
#  Scenario: Validate functional behavior for blank warehouse ID
#    And I send the GET request to "get_hqs_for_warehouse" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId||
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"No users found under area."|
#      |$.Model|[]|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#      |$.Model|array|
#      |$.Data|array|
