@BizomWebAPI @Innovation @CollateralsManagement @GetCollateralsForSKU @ReportsAnalyticsGroup2
Feature: Get Collaterals For SKU API Testing
  As a system user
  I want to test the get collaterals for SKU endpoint
  So that I can ensure proper functionality and data retrieval for collaterals management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get collaterals for SKU without access token
    When I send the GET request to "collaterals_get_collaterals_for_sku" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get collaterals for SKU with invalid access token
#    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
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
#  Scenario: Get collaterals for SKU with expired access token
#    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
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
#  Scenario: Get collaterals for SKU with malformed access token
#    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
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
  Scenario: Get collaterals for SKU with valid access token
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And I store the response as "collaterals_for_sku_response" name using full path

  @Positive @DataValidation
  Scenario: Validate collaterals for SKU response structure
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: Validate collaterals for SKU array structure
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: Validate collaterals for SKU empty array response
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @Performance
  Scenario: Performance test for collaterals for SKU endpoint
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|

  @Positive @Concurrency
  Scenario: Concurrent access test for collaterals for SKU endpoint
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|

#  @Negative @Validation
#  Scenario: Get collaterals for SKU with invalid query parameters
#    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Negative @Validation
#  Scenario: Get collaterals for SKU with special characters in query parameters
#    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Negative @Security
#  Scenario: Get collaterals for SKU with SQL injection attempt
#    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE collaterals; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Negative @Boundary
#  Scenario: Get collaterals for SKU with maximum query parameters
#    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

#  @Negative @ErrorHandling
#  Scenario: Get collaterals for SKU with invalid endpoint
#    And I send the GET request to "collaterals_get_collaterals_for_sku_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate collaterals for SKU business logic
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataIntegrity
  Scenario: Validate collaterals for SKU data integrity
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Regression
  Scenario: Regression test for collaterals for SKU endpoint
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: Validate collaterals for SKU response completeness
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @ArrayValidation
  Scenario: Validate collaterals for SKU array structure and content
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @ContentValidation
  Scenario: Validate collaterals for SKU content structure
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|

  @Positive @ResultFieldValidation
  Scenario: Validate collaterals for SKU result field
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate collaterals for SKU reason field
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|No collaterals found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @DataFieldValidation
  Scenario: Validate collaterals for SKU Data field
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|

  @Positive @LoadTesting
  Scenario: Load testing for collaterals for SKU endpoint
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|

  @Negative @Timeout
  Scenario: Test collaterals for SKU endpoint timeout handling
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|

  @Positive @EndToEnd
  Scenario: End-to-end collaterals for SKU data retrieval workflow
    And I send the GET request to "collaterals_get_collaterals_for_sku" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No collaterals found|
    And I store the response as "collaterals_for_sku_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|


