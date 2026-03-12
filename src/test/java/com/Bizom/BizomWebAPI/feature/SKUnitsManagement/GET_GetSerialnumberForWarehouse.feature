@BizomWebAPI @SKUnitsManagement @GetSerialnumberForWarehouse @OrderManagement @OS
Feature: Get Serial Number For Warehouse API Testing
  As a system user
  I want to test the get serial number for warehouse endpoint
  So that I can ensure proper functionality and data retrieval for serial numbers by warehouse

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get serial number for warehouse without access token
    When I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get serial number for warehouse with invalid access token
#    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get serial number for warehouse with expired access token
#    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get serial number for warehouse with malformed access token
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get serial number for warehouse with valid access token and query parameters
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Data Not Found"|
      |$.data|[]|
    And I store the response as "serial_number_for_warehouse_response" name using full path

  @Positive @DataValidation
  Scenario: Validate serial number for warehouse response structure
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Data Not Found"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Get serial number for warehouse with single warehouse ID
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Get serial number for warehouse with multiple warehouse IDs
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2,3|
      |pageno|1|
      |limit|10|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Get serial number for warehouse with different page number
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|2|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Get serial number for warehouse with different limit
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|20|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Get serial number for warehouse with different language
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|es|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get serial number for warehouse without warehouseIds parameter
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get serial number for warehouse with invalid warehouseIds
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|invalid|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get serial number for warehouse with non-existent warehouseIds
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|99999,99998|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get serial number for warehouse with invalid pageno
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|0|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get serial number for warehouse with negative pageno
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|-1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get serial number for warehouse with invalid limit
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|0|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get serial number for warehouse with special characters in warehouseIds
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|<script>alert('XSS')</script>|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Security
  Scenario: Get serial number for warehouse with SQL injection attempt
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|'; DROP TABLE skunits; --|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Performance
  Scenario: Performance test for serial number for warehouse endpoint
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for serial number for warehouse endpoint
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

#  @Negative @ErrorHandling
#  Scenario: Get serial number for warehouse with invalid endpoint
#    And I send the GET request to "skunits_get_serial_number_for_warehouse_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseIds|1,2|
#      |pageno|1|
#      |limit|5|
#      |language|en|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate serial number for warehouse business logic
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Data Not Found"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: Validate serial number for warehouse data integrity
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Regression
  Scenario: Regression test for serial number for warehouse endpoint
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: End-to-end serial number for warehouse data retrieval workflow
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Data Not Found"|
      |$.data|[]|
    And I store the response as "serial_number_for_warehouse_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate serial number for warehouse empty data array
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Data Not Found"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @ReasonFieldValidation
  Scenario: Validate serial number for warehouse reason field
    And I send the GET request to "skunits_get_serial_number_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseIds|1,2|
      |pageno|1|
      |limit|5|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|"Data Not Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

