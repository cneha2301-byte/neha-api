@BizomWebAPI @CE @OutletsManagement @DistributorsForWarehouse @SystemOperations
Feature: Get Distributors For Warehouse API Testing
  As a system user
  I want to test the get distributors for warehouse endpoint
  So that I can ensure proper functionality and data retrieval for distributors mapped to warehouses

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get distributors for warehouse without access token
    When I send the GET request to "outlets_get_distributors_for_warehouse" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get distributors for warehouse with invalid access token
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get distributors for warehouse with expired access token
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get distributors for warehouse with malformed access token
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Smoke
  Scenario: TC_05 Get distributors for warehouse with valid access token - no parameters
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_06 Validate distributors for warehouse error response structure
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|

  @Positive @Functional
  Scenario: TC_07 Get distributors with warehouse ID query parameter
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouse_id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Validation
  Scenario: TC_08 Get distributors with negative warehouse ID
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouse_id|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Validation
  Scenario: TC_09 Get distributors with zero warehouse ID
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouse_id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Negative @Boundary
  Scenario: TC_10 Get distributors with maximum query parameters
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

#  @Negative @ErrorHandling
#  Scenario: TC_11 Get distributors with invalid endpoint
#    And I send the GET request to "outlets_get_distributors_for_warehouse_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_12 Validate distributors error response data integrity
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.apiVersion|string|
      |$.error|object|
      |$.error.code|string|
      |$.error.message|string|

  @Positive @Regression
  Scenario: TC_13 Regression test for distributors for warehouse endpoint
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|

  @Positive @Functional
  Scenario: TC_14 Validate distributors response completeness
    And I send the GET request to "outlets_get_distributors_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |outlets|




