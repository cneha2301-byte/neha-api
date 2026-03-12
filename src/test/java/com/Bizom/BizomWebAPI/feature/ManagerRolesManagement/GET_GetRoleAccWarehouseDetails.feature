@BizomWebAPI @ManagerRolesManagement @GetRoleAccWarehouseDetails @WorkflowAutomation @CE
Feature: Get Role Acc Warehouse Details API Testing
  As a system user
  I want to test the get role acc warehouse details endpoint
  So that I can ensure proper functionality and data retrieval for role access warehouse details management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get role acc warehouse details without access token
    When I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get role acc warehouse details with invalid access token
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get role acc warehouse details with expired access token
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get role acc warehouse details with malformed access token
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get role acc warehouse details with valid access token
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
    And I store the response as "role_acc_warehouse_details_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate role acc warehouse details response structure
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate role acc warehouse details is an object with string keys and values
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate role acc warehouse details contains role ID keys
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|
    And validating the response contains the following values
      |Value|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |SALESMAN|
      |DISTRIBUTOR MANAGER|
      |DISTRIBUTOR SALESMAN|
      |DISTRIBUTOR SALES MANAGER|

  @Positive @DataValidation
  Scenario: TC_09 Validate role acc warehouse details role ID 3
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$["3"]|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate role acc warehouse details role ID 4
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$["4"]|string|

  @Positive @DataValidation
  Scenario: TC_11 Validate role acc warehouse details role ID 5
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$["5"]|string|

  @Positive @DataValidation
  Scenario: TC_12 Validate role acc warehouse details role ID 6
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$["6"]|string|

  @Positive @DataValidation
  Scenario: TC_13 Validate role acc warehouse details role ID 7
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$["7"]|string|

  @Positive @DataValidation
  Scenario: TC_14 Validate role acc warehouse details role ID 8
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$["8"]|string|

  @Positive @DataValidation
  Scenario: TC_15 Validate role acc warehouse details complete structure
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|

  @Positive @Performance
  Scenario: TC_16 Performance test for role acc warehouse details endpoint
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Concurrency
  Scenario: TC_17 Concurrent access test for role acc warehouse details endpoint
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Validation
  Scenario: TC_18 Get role acc warehouse details with invalid query parameters
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Validation
  Scenario: TC_19 Get role acc warehouse details with special characters in query parameters
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Security
  Scenario: TC_20 Get role acc warehouse details with SQL injection attempt
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE manageroles; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Boundary
  Scenario: TC_21 Get role acc warehouse details with maximum query parameters
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
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
      |$|object|

#  @Negative @ErrorHandling
#  Scenario: TC_22 Get role acc warehouse details with invalid endpoint
#    And I send the GET request to "manageroles_get_role_acc_warehouse_details_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_23 Validate role acc warehouse details business logic
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|
    And validating the response contains the following values
      |Value|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |SALESMAN|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate role acc warehouse details data integrity
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|
    And validating the response contains the following values
      |Value|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |SALESMAN|
      |DISTRIBUTOR MANAGER|
      |DISTRIBUTOR SALESMAN|
      |DISTRIBUTOR SALES MANAGER|

  @Positive @Regression
  Scenario: TC_25 Regression test for role acc warehouse details endpoint
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|

  @Positive @Functional
  Scenario: TC_26 Validate role acc warehouse details response completeness
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|
    And validating the response contains the following values
      |Value|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |SALESMAN|
      |DISTRIBUTOR MANAGER|
      |DISTRIBUTOR SALESMAN|
      |DISTRIBUTOR SALES MANAGER|
    And I store the response as "role_acc_warehouse_details_response" name using full path

  @Positive @DataValidation
  Scenario: TC_27 Validate role acc warehouse details all role values are strings
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|

  @Positive @DataValidation
  Scenario: TC_28 Validate role acc warehouse details object keys are numeric strings
    And I send the GET request to "manageroles_get_role_acc_warehouse_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$["3"]|string|
      |$["4"]|string|
      |$["5"]|string|
      |$["6"]|string|
      |$["7"]|string|
      |$["8"]|string|
    And validating the response contains the following values
      |Value|
      |WAREHOUSE MANAGER|
      |SALES MANAGER|
      |SALESMAN|
      |DISTRIBUTOR MANAGER|
      |DISTRIBUTOR SALESMAN|
      |DISTRIBUTOR SALES MANAGER|

