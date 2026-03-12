@BizomWebAPI @TourBudgetsManagement @ReporteeForWarehouses @OutletManagement @innovation
Feature: Get Reportee For Warehouses API Testing
  As a system user
  I want to test the get reportee for warehouses endpoint
  So that I can ensure proper functionality and data retrieval for tour budgets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get reportee for warehouses without access token
    When I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with path parameters
      |Path|Value|
      |warehouseId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get reportee for warehouses with invalid access token
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get reportee for warehouses with expired access token
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get reportee for warehouses with malformed access token
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get reportee for warehouses with warehouse ID 2
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "reportee_for_warehouses_response" name using full path

  @Positive @Smoke
  Scenario: Get reportee for warehouses with warehouse ID 1
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "reportee_for_warehouses_response" name using full path

  @Positive @DataValidation
  Scenario: Validate reportee for warehouses response structure with warehouse ID 2
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].userId|number|
      |$.users[0].userName|string|

  @Positive @DataValidation
  Scenario: Validate reportee for warehouses response structure with warehouse ID 1
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].userId|number|
      |$.users[0].userName|string|

  @Positive @DataValidation
  Scenario: Validate reportee for warehouses users array structure
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[1]|object|
      |$.users[0].userId|number|
      |$.users[0].userName|string|

  @Positive @DataValidation
  Scenario: Validate reportee for warehouses specific data values
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.users[0].userName|DB:users:name: id=2|
      |$.users[1].userName|DB:users:name: id=8|

  @Positive @DataValidation
  Scenario: Validate reportee for warehouses with static values for warehouse ID 2
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].userId|2|
      |$.users[0].userName|"SLV Traders"|
      |$.users[1].userId|8|
      |$.users[1].userName|"SLV Traders"|
      |$.users[2].userId|9|
      |$.users[2].userName|"test1"|
      |$.users[3].userId|10|
      |$.users[3].userName|"sadha"|

  @Positive @DataValidation
  Scenario: Validate reportee for warehouses with static values for warehouse ID 1
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].userId|2|
      |$.users[0].userName|"SLV Traders"|

  @Negative @Validation
  Scenario: Get reportee for warehouses with invalid warehouse ID
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found."|

  @Negative @Validation
  Scenario: Get reportee for warehouses with non-numeric warehouse ID
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found."|

  @Negative @Validation
  Scenario: Get reportee for warehouses with negative warehouse ID
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found."|

  @Negative @Validation
  Scenario: Get reportee for warehouses with zero warehouse ID
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found."|

#  @Negative @ErrorHandling
#  Scenario: Get reportee for warehouses with invalid endpoint
#    And I send the GET request to "tourbudgets_get_reportee_for_warehouses_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|2|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for reportee for warehouses endpoint
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for reportee for warehouses endpoint
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Positive @BusinessLogic
  Scenario: Validate reportee for warehouses business logic
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0].userId|number|
      |$.users[0].userName|string|

  @Positive @DataIntegrity
  Scenario: Validate reportee for warehouses data integrity
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].userId|number|
      |$.users[0].userName|string|

  @Positive @Regression
  Scenario: Regression test for reportee for warehouses endpoint
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|

  @Positive @Functional
  Scenario: Validate reportee for warehouses response completeness
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].userId|2|
      |$.users[0].userName|"SLV Traders"|

  @Positive @ArrayValidation
  Scenario: Validate reportee for warehouses array structure and content
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].userId|2|
      |$.users[0].userName|"SLV Traders"|
      |$.users[1].userId|8|
      |$.users[1].userName|"SLV Traders"|

  @Positive @ContentValidation
  Scenario: Validate reportee for warehouses content structure
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |users|
      |userId|
      |userName|
      |Data Found|

  @Positive @LoadTesting
  Scenario: Load testing for reportee for warehouses endpoint
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Negative @Timeout
  Scenario: Test reportee for warehouses endpoint timeout handling
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|

  @Positive @EndToEnd
  Scenario: End-to-end reportee for warehouses data retrieval workflow for warehouse ID 2
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "reportee_for_warehouses_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0].userId|number|
      |$.users[0].userName|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].userId|2|
      |$.users[0].userName|"SLV Traders"|
      |$.users[1].userId|8|
      |$.users[1].userName|"SLV Traders"|

  @Positive @EndToEnd
  Scenario: End-to-end reportee for warehouses data retrieval workflow for warehouse ID 1
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And I store the response as "reportee_for_warehouses_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0].userId|number|
      |$.users[0].userName|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].userId|2|
      |$.users[0].userName|"SLV Traders"|

  @Positive @ErrorResponseValidation
  Scenario: Validate reportee for warehouses error response with invalid warehouse ID
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No users found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

#  @Positive @WarehouseParameterValidation
#  Scenario: Validate reportee for warehouses with different warehouse IDs
#    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|warehouseId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.users|array|

  @Positive @FieldValidation
  Scenario: Validate reportee for warehouses field completeness
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.users|array|
      |$.users[0].userId|number|
      |$.users[0].userName|string|

  @Positive @UsersArrayValidation
  Scenario: Validate reportee for warehouses users array structure
    And I send the GET request to "tourbudgets_get_reportee_for_warehouses" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users|array|
      |$.users[0]|object|
      |$.users[0].userId|number|
      |$.users[0].userName|string|
      |$.users[1]|object|
      |$.users[1].userId|number|
      |$.users[1].userName|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.users[0].userId|2|
      |$.users[0].userName|"SLV Traders"|
      |$.users[1].userId|8|
      |$.users[1].userName|"SLV Traders"|

