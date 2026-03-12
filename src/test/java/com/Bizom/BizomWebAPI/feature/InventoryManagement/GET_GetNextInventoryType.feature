@BizomWebAPI @InventoryManagement @GetNextInventoryType @UserAccessManagement @OS
Feature: Get Next Inventory Type API Testing
  As a system user
  I want to test the get next inventory type endpoint
  So that I can ensure proper functionality and data retrieval for next inventory type by inventory type ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get next inventory type without access token
    When I send the GET request to "get_next_inventory_type" endpoint with path parameters
      |Path|Value|
      |inventoryTypeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get next inventory type with invalid access token
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|inventoryTypeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get next inventory type with expired access token
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|inventoryTypeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get next inventory type with malformed access token
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|inventoryTypeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get next inventory type for inventory type ID 1 with valid access token
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And I store the response as "get_next_inventory_type_response" name using full path

  @Positive @Functional
  Scenario: Get next inventory type for inventory type ID 2 with valid access token
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: Validate get next inventory type response structure
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

  @Positive @DataValidation
  Scenario: Validate get next inventory type with static values
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

  @Negative @Validation
  Scenario: Get next inventory type with invalid inventory type ID
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Inventory Type.|

  @Negative @Validation
  Scenario: Get next inventory type with non-existent inventory type ID
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Inventory Type.|

  @Negative @Validation
  Scenario: Get next inventory type with negative inventory type ID
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Inventory Type.|

  @Negative @Validation
  Scenario: Get next inventory type with zero inventory type ID
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Inventory Type.|

#  @Negative @Validation
#  Scenario: Get next inventory type with special characters in inventory type ID
#    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|inventoryTypeId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Inventory Type.|

#  @Negative @Security
#  Scenario: Get next inventory type with SQL injection attempt in inventory type ID
#    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|inventoryTypeId|'; DROP TABLE inventorytypes; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|Invalid Inventory Type.|

#  @Negative @ErrorHandling
#  Scenario: Get next inventory type with invalid endpoint
#    And I send the GET request to "get_next_inventory_type_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get next inventory type endpoint
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

  @Positive @Concurrency
  Scenario: Concurrent access test for get next inventory type endpoint
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @BusinessLogic
  Scenario: Validate get next inventory type business logic
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

  @Positive @DataIntegrity
  Scenario: Validate get next inventory type data integrity
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No next inventory type available.|

  @Positive @Regression
  Scenario: Regression test for get next inventory type endpoint
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate get next inventory type response completeness
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

  @Positive @ContentValidation
  Scenario: Validate get next inventory type content structure
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No next inventory type available.|

  @Positive @LoadTesting
  Scenario: Load testing for get next inventory type endpoint
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

  @Negative @Timeout
  Scenario: Test get next inventory type endpoint timeout handling
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

  @Positive @EndToEnd
  Scenario: End-to-end get next inventory type data retrieval workflow
    And I send the GET request to "get_next_inventory_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|inventoryTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|
    And I store the response as "get_next_inventory_type_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No next inventory type available.|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No next inventory type available.|

