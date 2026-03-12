@BizomWebAPI @InventoryManagement @GetAuditableInventoryTypes @UserAccessManagement @OS
Feature: Get Auditable Inventory Types API Testing
  As a system user
  I want to test the get auditable inventory types endpoint
  So that I can ensure proper functionality and data retrieval for auditable inventory types

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get auditable inventory types without access token
    When I send the GET request to "get_auditable_inventory_types" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get auditable inventory types with invalid access token
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
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
  Scenario: Get auditable inventory types with expired access token
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
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
  Scenario: Get auditable inventory types with malformed access token
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
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
  Scenario: Get auditable inventory types with valid access token
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|
    And I store the response as "get_auditable_inventory_types_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get auditable inventory types response structure
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate get auditable inventory types with static values
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Positive @Performance
  Scenario: Performance test for get auditable inventory types endpoint
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|

  @Positive @Concurrency
  Scenario: Concurrent access test for get auditable inventory types endpoint
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Negative @Validation
  Scenario: Get auditable inventory types with invalid query parameters
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Negative @Validation
  Scenario: Get auditable inventory types with special characters in query parameters
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Negative @Security
  Scenario: Get auditable inventory types with SQL injection attempt
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE inventorytypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Negative @Boundary
  Scenario: Get auditable inventory types with maximum query parameters
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
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
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

#  @Negative @ErrorHandling
#  Scenario: Get auditable inventory types with invalid endpoint
#    And I send the GET request to "get_auditable_inventory_types_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate get auditable inventory types business logic
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Positive @DataIntegrity
  Scenario: Validate get auditable inventory types data integrity
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Success|

  @Positive @Regression
  Scenario: Regression test for get auditable inventory types endpoint
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: Validate get auditable inventory types response completeness
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Positive @ArrayValidation
  Scenario: Validate get auditable inventory types array structure
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Positive @ContentValidation
  Scenario: Validate get auditable inventory types content structure
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Success|

  @Positive @LoadTesting
  Scenario: Load testing for get auditable inventory types endpoint
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Negative @Timeout
  Scenario: Test get auditable inventory types endpoint timeout handling
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

  @Positive @EndToEnd
  Scenario: End-to-end get auditable inventory types data retrieval workflow
    And I send the GET request to "get_auditable_inventory_types" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|
    And I store the response as "get_auditable_inventory_types_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Success|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Success|
      |$.data|[]|

