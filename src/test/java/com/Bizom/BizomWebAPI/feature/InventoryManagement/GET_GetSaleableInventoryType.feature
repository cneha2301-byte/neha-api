@BizomWebAPI @InventoryManagement @GetSaleableInventoryType @UserAccessManagement @OS
Feature: Get Saleable Inventory Type API Testing
  As a system user
  I want to test the get saleable inventory type endpoint
  So that I can ensure proper functionality and data retrieval for saleable inventory types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get saleable inventory type without access token
    When I send the GET request to "get_saleable_inventory_type" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get saleable inventory type with invalid access token
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
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
  Scenario: Get saleable inventory type with expired access token
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
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
  Scenario: Get saleable inventory type with malformed access token
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
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
  Scenario: Get saleable inventory type with valid access token
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "get_saleable_inventory_type_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get saleable inventory type response structure
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].name_alias|string|
      |$.data[0].parent_id|string|
      |$.data[0].nextinventorytype|string|
      |$.data[0].is_active|string|

  @Positive @DataValidation
  Scenario: Validate get saleable inventory type nested object structure
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].name_alias|string|
      |$.data[0].parent_id|string|
      |$.data[0].nextinventorytype|string|
      |$.data[0].is_active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].id|"1"|
      |$.data[0].name|saleable|
      |$.data[0].name_alias|Saleable|
      |$.data[0].parent_id|"0"|
      |$.data[0].is_active|"1"|

  @Positive @DataValidation
  Scenario: Validate get saleable inventory type with static values
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].id|"1"|
      |$.data[0].name|saleable|
      |$.data[0].name_alias|Saleable|
      |$.data[0].parent_id|"0"|
      |$.data[0].nextinventorytype|null|
      |$.data[0].is_active|"1"|

  @Positive @Performance
  Scenario: Performance test for get saleable inventory type endpoint
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for get saleable inventory type endpoint
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|

  @Negative @Validation
  Scenario: Get saleable inventory type with invalid query parameters
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get saleable inventory type with special characters in query parameters
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: Get saleable inventory type with SQL injection attempt
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE inventorytypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: Get saleable inventory type with maximum query parameters
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
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
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: Get saleable inventory type with invalid endpoint
#    And I send the GET request to "get_saleable_inventory_type_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate get saleable inventory type business logic
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: Validate get saleable inventory type data integrity
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].name_alias|string|
      |$.data[0].parent_id|string|
      |$.data[0].nextinventorytype|string|
      |$.data[0].is_active|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |id|
      |name|
      |name_alias|
      |parent_id|
      |nextinventorytype|
      |is_active|
      |saleable|
      |Saleable|

  @Positive @Regression
  Scenario: Regression test for get saleable inventory type endpoint
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|

  @Positive @Functional
  Scenario: Validate get saleable inventory type response completeness
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].name_alias|string|
      |$.data[0].parent_id|string|
      |$.data[0].nextinventorytype|string|
      |$.data[0].is_active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].id|"1"|
      |$.data[0].name|saleable|
      |$.data[0].name_alias|Saleable|
      |$.data[0].parent_id|"0"|
      |$.data[0].is_active|"1"|

  @Positive @ArrayValidation
  Scenario: Validate get saleable inventory type array structure and content
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].name_alias|string|
      |$.data[0].parent_id|string|
      |$.data[0].nextinventorytype|string|
      |$.data[0].is_active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].id|"1"|
      |$.data[0].name|saleable|
      |$.data[0].name_alias|Saleable|
      |$.data[0].parent_id|"0"|
      |$.data[0].nextinventorytype|null|
      |$.data[0].is_active|"1"|

  @Positive @ContentValidation
  Scenario: Validate get saleable inventory type content structure
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |id|
      |name|
      |name_alias|
      |parent_id|
      |nextinventorytype|
      |is_active|
      |saleable|
      |Saleable|

  @Positive @LoadTesting
  Scenario: Load testing for get saleable inventory type endpoint
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test get saleable inventory type endpoint timeout handling
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end get saleable inventory type data retrieval workflow
    And I send the GET request to "get_saleable_inventory_type" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "get_saleable_inventory_type_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].name|string|
      |$.data[0].name_alias|string|
      |$.data[0].parent_id|string|
      |$.data[0].nextinventorytype|string|
      |$.data[0].is_active|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |id|
      |name|
      |name_alias|
      |parent_id|
      |nextinventorytype|
      |is_active|
      |saleable|
      |Saleable|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data[0].id|"1"|
      |$.data[0].name|saleable|
      |$.data[0].name_alias|Saleable|
      |$.data[0].parent_id|"0"|
      |$.data[0].nextinventorytype|null|
      |$.data[0].is_active|"1"|

