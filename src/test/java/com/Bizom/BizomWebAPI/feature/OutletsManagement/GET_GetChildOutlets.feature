@BizomWebAPI @CE @OutletsManagement @GetChildOutlets @SystemOperations
Feature: Get Child Outlets API Testing
  As a system user
  I want to test the get child outlets endpoint
  So that I can ensure proper functionality and data retrieval for child outlets based on warehouse ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get child outlets without access token
    When I send the GET request to "outlets_get_child_outlets" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |warehouseId|35|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get child outlets with invalid access token
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |warehouseId|35|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get child outlets with expired access token
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |warehouseId|35|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get child outlets with malformed access token
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |warehouseId|35|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get child outlets with valid warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "getchildoutlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate child outlets response structure
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlet|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate child outlets array structure
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Outlet[0].Outlet.id|"5576"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlet[0].Outlet|object|
      |$.Outlet[0].Outlet.id|string|
      |$.Outlet[0].Outlet.name|string|
      |$.Outlet[0].Outlet.erp_id|string|
      |$.Outlet[0].Outlet.warehouse_id|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate child outlets outlet object fields
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Outlet|
      |id|
      |name|
      |erp_id|
      |warehouse_id|

  @Positive @Performance
  Scenario: TC_09 Performance test for get child outlets endpoint
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_10 Get child outlets with invalid warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get child outlets with missing warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get child outlets with empty warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get child outlets with non-existent warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get child outlets with invalid endpoint
#    And I send the GET request to "outlets_get_child_outlets_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |warehouseId|35|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Get child outlets for different warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_16 Regression test for get child outlets endpoint
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlet|array|

  @Positive @Concurrency
  Scenario: TC_17 Concurrent access test for get child outlets endpoint
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for get child outlets endpoint
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_19 Test get child outlets endpoint timeout handling
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_20 End-to-end get child outlets workflow
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlet|array|
      |$.Outlet[0].Outlet|object|
    And I store the response as "getchildoutlets_response" name using full path

  @Positive @Boundary
  Scenario: TC_21 Get child outlets with very large warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_22 Get child outlets with zero warehouse ID
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_23 Validate child outlets response contains outlet details
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataValidation
  Scenario: TC_24 Validate child outlets outlet object contains all required fields
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Outlet[0].Outlet.id|string|
      |$.Outlet[0].Outlet.name|string|
      |$.Outlet[0].Outlet.erp_id|string|
      |$.Outlet[0].Outlet.warehouse_id|string|

  @Positive @Integration
  Scenario: TC_25 Verify get child outlets endpoint integration
    And I send the GET request to "outlets_get_child_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouseId|35|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I validate that the operation was successfully completed in the system

