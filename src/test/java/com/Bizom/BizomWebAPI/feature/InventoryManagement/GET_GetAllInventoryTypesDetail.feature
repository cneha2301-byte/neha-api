@BizomWebAPI @InventoryManagement @GetAllInventoryTypesDetail @UserAccessManagement @OS
Feature: Get All Inventory Types Detail API Testing
  As a system user
  I want to test the get all inventory types detail endpoint
  So that I can ensure proper functionality and data retrieval for inventory types with detailed information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all inventory types detail without access token
    When I send the GET request to "get_all_inventory_types_detail" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get all inventory types detail with invalid access token
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
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
  Scenario: Get all inventory types detail with expired access token
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
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
  Scenario: Get all inventory types detail with malformed access token
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
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
  Scenario: Get all inventory types detail with valid access token
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
    And I store the response as "get_all_inventory_types_detail_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get all inventory types detail response structure
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["1"].id|string|
      |$.data["1"].name|string|
      |$.data["1"].name_alias|string|
      |$.data["1"].is_active|string|
      |$.data["1"].iseditable|boolean|
      |$.data["1"].parent_id|string|
      |$.data["1"].created|string|
      |$.data["1"].modified|string|
      |$.data["1"].nextinventorytype|string|

  @Positive @DataValidation
  Scenario: Validate get all inventory types detail nested object structure
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["1"].id|string|
      |$.data["1"].name|string|
      |$.data["1"].name_alias|string|
      |$.data["1"].is_active|string|
      |$.data["1"].iseditable|boolean|
      |$.data["1"].parent_id|string|
      |$.data["1"].created|string|
      |$.data["1"].modified|string|
      |$.data["1"].nextinventorytype|string|
      |$.data["2"]|object|
      |$.data["2"].id|string|
      |$.data["2"].name|string|
      |$.data["2"].name_alias|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data["1"].id|"1"|
      |$.data["1"].name|saleable|
      |$.data["1"].name_alias|Saleable|
      |$.data["1"].is_active|"1"|
      |$.data["1"].iseditable|false|
      |$.data["1"].parent_id|"0"|
      |$.data["2"].id|"2"|
      |$.data["2"].name|nonsaleable|
      |$.data["2"].name_alias|Non-Saleable|
      |$.data["2"].is_active|"1"|
      |$.data["2"].parent_id|"0"|

  @Positive @DataValidation
  Scenario: Validate get all inventory types detail with static values
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.data["1"].id|"1"|
      |$.data["1"].name|saleable|
      |$.data["1"].name_alias|Saleable|
      |$.data["1"].is_active|"1"|
      |$.data["1"].iseditable|false|
      |$.data["1"].parent_id|"0"|
      |$.data["2"].id|"2"|
      |$.data["2"].name|nonsaleable|
      |$.data["2"].name_alias|Non-Saleable|
      |$.data["2"].is_active|"1"|
      |$.data["2"].parent_id|"0"|

  @Positive @Performance
  Scenario: Performance test for get all inventory types detail endpoint
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Positive @Concurrency
  Scenario: Concurrent access test for get all inventory types detail endpoint
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["2"]|object|

  @Negative @Validation
  Scenario: Get all inventory types detail with invalid query parameters
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Validation
  Scenario: Get all inventory types detail with special characters in query parameters
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Security
  Scenario: Get all inventory types detail with SQL injection attempt
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE inventorytypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Boundary
  Scenario: Get all inventory types detail with maximum query parameters
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
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
      |$.Reason|Data found.|

#  @Negative @ErrorHandling
#  Scenario: Get all inventory types detail with invalid endpoint
#    And I send the GET request to "get_all_inventory_types_detail_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate get all inventory types detail business logic
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Positive @DataIntegrity
  Scenario: Validate get all inventory types detail data integrity
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["1"].id|string|
      |$.data["1"].name|string|
      |$.data["1"].name_alias|string|
      |$.data["1"].is_active|string|
      |$.data["1"].iseditable|boolean|
      |$.data["1"].parent_id|string|
      |$.data["1"].created|string|
      |$.data["1"].modified|string|
      |$.data["1"].nextinventorytype|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |id|
      |name|
      |name_alias|
      |is_active|
      |iseditable|
      |parent_id|
      |created|
      |modified|
      |nextinventorytype|
      |Data found.|
      |saleable|
      |Saleable|
      |nonsaleable|
      |Non-Saleable|

  @Positive @Regression
  Scenario: Regression test for get all inventory types detail endpoint
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["2"]|object|

  @Positive @Functional
  Scenario: Validate get all inventory types detail response completeness
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["1"].id|string|
      |$.data["1"].name|string|
      |$.data["1"].name_alias|string|
      |$.data["1"].is_active|string|
      |$.data["1"].iseditable|boolean|
      |$.data["1"].parent_id|string|
      |$.data["1"].created|string|
      |$.data["1"].modified|string|
      |$.data["1"].nextinventorytype|string|
      |$.data["2"]|object|
      |$.data["2"].id|string|
      |$.data["2"].name|string|
      |$.data["2"].name_alias|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.data["1"].id|"1"|
      |$.data["1"].name|saleable|
      |$.data["1"].name_alias|Saleable|
      |$.data["1"].is_active|"1"|
      |$.data["1"].parent_id|"0"|
      |$.data["2"].id|"2"|
      |$.data["2"].name|nonsaleable|
      |$.data["2"].name_alias|Non-Saleable|

  @Positive @ObjectValidation
  Scenario: Validate get all inventory types detail object structure and content
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["1"].id|string|
      |$.data["1"].name|string|
      |$.data["1"].name_alias|string|
      |$.data["1"].is_active|string|
      |$.data["1"].iseditable|boolean|
      |$.data["1"].parent_id|string|
      |$.data["1"].created|string|
      |$.data["1"].modified|string|
      |$.data["1"].nextinventorytype|string|
      |$.data["2"]|object|
      |$.data["2"].id|string|
      |$.data["2"].name|string|
      |$.data["2"].name_alias|string|
      |$.data["2"].is_active|string|
      |$.data["2"].iseditable|boolean|
      |$.data["2"].parent_id|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.data["1"].id|"1"|
      |$.data["1"].name|saleable|
      |$.data["1"].name_alias|Saleable|
      |$.data["1"].is_active|"1"|
      |$.data["1"].iseditable|false|
      |$.data["1"].parent_id|"0"|
      |$.data["2"].id|"2"|
      |$.data["2"].name|nonsaleable|
      |$.data["2"].name_alias|Non-Saleable|
      |$.data["2"].is_active|"1"|
      |$.data["2"].parent_id|"0"|

  @Positive @ContentValidation
  Scenario: Validate get all inventory types detail content structure
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |id|
      |name|
      |name_alias|
      |is_active|
      |iseditable|
      |parent_id|
      |created|
      |modified|
      |nextinventorytype|
      |Data found.|
      |saleable|
      |Saleable|
      |nonsaleable|
      |Non-Saleable|

  @Positive @LoadTesting
  Scenario: Load testing for get all inventory types detail endpoint
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Negative @Timeout
  Scenario: Test get all inventory types detail endpoint timeout handling
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|

  @Positive @EndToEnd
  Scenario: End-to-end get all inventory types detail data retrieval workflow
    And I send the GET request to "get_all_inventory_types_detail" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
    And I store the response as "get_all_inventory_types_detail_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data["1"]|object|
      |$.data["1"].id|string|
      |$.data["1"].name|string|
      |$.data["1"].name_alias|string|
      |$.data["1"].is_active|string|
      |$.data["1"].iseditable|boolean|
      |$.data["1"].parent_id|string|
      |$.data["1"].created|string|
      |$.data["1"].modified|string|
      |$.data["1"].nextinventorytype|string|
      |$.data["2"]|object|
      |$.data["2"].id|string|
      |$.data["2"].name|string|
      |$.data["2"].name_alias|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |id|
      |name|
      |name_alias|
      |is_active|
      |iseditable|
      |parent_id|
      |created|
      |modified|
      |nextinventorytype|
      |Data found.|
      |saleable|
      |Saleable|
      |nonsaleable|
      |Non-Saleable|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found.|
      |$.data["1"].id|"1"|
      |$.data["1"].name|saleable|
      |$.data["1"].name_alias|Saleable|
      |$.data["1"].is_active|"1"|
      |$.data["1"].iseditable|false|
      |$.data["1"].parent_id|"0"|
      |$.data["2"].id|"2"|
      |$.data["2"].name|nonsaleable|
      |$.data["2"].name_alias|Non-Saleable|
      |$.data["2"].is_active|"1"|
      |$.data["2"].parent_id|"0"|

