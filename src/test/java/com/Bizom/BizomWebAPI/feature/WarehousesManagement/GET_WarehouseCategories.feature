@BizomWebAPI @CE @WarehousesManagement @WarehouseManagement @WarehouseCategories @SystemIntegration
Feature: Warehouse Categories API Testing
  As a system user
  I want to test the warehouse categories endpoint
  So that I can ensure proper functionality and data retrieval for warehouse categories

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get warehouse categories without access token
    When I send the GET request to "warehouse_categories" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse categories with invalid access token
#    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
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
#  Scenario: Get warehouse categories with expired access token
#    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get warehouse categories with malformed access token
#    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get warehouse categories with valid access token
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I store the response as "warehouse_categories_response" name using full path

  @Positive @DataValidation
  Scenario: Validate warehouse categories response structure
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehousecategories|object|

  @Positive @DataValidation
  Scenario: Validate warehouse categories specific data values
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.warehousecategories.1|DB:warehousecategories:name: id=1|
      |$.warehousecategories.2|DB:warehousecategories:name: id=2|
      |$.warehousecategories.3|DB:warehousecategories:name: id=3|
      |$.warehousecategories.4|DB:warehousecategories:name: id=4|
      |$.warehousecategories.5|DB:warehousecategories:name: id=5|

  @Positive @DataValidation
  Scenario: Validate warehouse categories with static values
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.warehousecategories.1|WareHouseCatagories_01|
      |$.warehousecategories.2|NoTokenCategory|
      |$.warehousecategories.3|InvalidTokenCategory|
      |$.warehousecategories.4|EmptyErpIdCat|
      |$.warehousecategories.5|MissingErpIdCat|

  @Positive @Performance
  Scenario: Performance test for warehouse categories endpoint
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Positive @Concurrency
  Scenario: Concurrent access test for warehouse categories endpoint
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Validation
  Scenario: Get warehouse categories with invalid query parameters
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Validation
  Scenario: Get warehouse categories with special characters in query parameters
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Security
  Scenario: Get warehouse categories with SQL injection attempt
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE warehousecategories; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

  @Negative @Boundary
  Scenario: Get warehouse categories with maximum query parameters
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|

#  @Negative @ErrorHandling
#  Scenario: Get warehouse categories with invalid endpoint
#    And I send the GET request to "warehouse_categories_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate warehouse categories business logic
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.warehousecategories.1|DB:warehousecategories:name: id=1|
      |$.warehousecategories.2|DB:warehousecategories:name: id=2|
      |$.warehousecategories.3|DB:warehousecategories:name: id=3|
      |$.warehousecategories.4|DB:warehousecategories:name: id=4|
      |$.warehousecategories.5|DB:warehousecategories:name: id=5|

  @Positive @DataIntegrity
  Scenario: Validate warehouse categories data integrity
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehousecategories|object|
      |$.warehousecategories.1|string|
      |$.warehousecategories.2|string|
      |$.warehousecategories.3|string|
      |$.warehousecategories.4|string|
      |$.warehousecategories.5|string|

  @Positive @Regression
  Scenario: Regression test for warehouse categories endpoint
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.warehousecategories|object|

  @Positive @Functional
  Scenario: Validate warehouse categories response completeness
    And I send the GET request to "warehouse_categories" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.warehousecategories|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.warehousecategories.1|WareHouseCatagories_01|
      |$.warehousecategories.2|NoTokenCategory|
      |$.warehousecategories.3|InvalidTokenCategory|
      |$.warehousecategories.4|EmptyErpIdCat|
      |$.warehousecategories.5|MissingErpIdCat|

