@BizomWebAPI @SKUnitsManagement @GetSkuLevelFiltersForReports @PaymentProcessing @OS
Feature: Get SKU Level Filters For Reports API Testing
  As a system user
  I want to test the get SKU level filters for reports endpoint
  So that I can ensure proper functionality and data retrieval for SKU level filters

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU level filters for reports without access token
    When I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get SKU level filters for reports with invalid access token
    # And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|invalid_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get SKU level filters for reports with expired access token
    # And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|expired_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get SKU level filters for reports with malformed access token
    # And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|malformed.token.here|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get SKU level filters for reports with valid access token and query parameters
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|
    And I store the response as "sku_level_filters_for_reports_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKU level filters for reports response structure
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @Functional
  Scenario: Get SKU level filters for reports with active=0 only
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @Functional
  Scenario: Get SKU level filters for reports with active=1 only
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @Functional
  Scenario: Get SKU level filters for reports with different apiSource
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|web|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Negative @Validation
  Scenario: Get SKU level filters for reports without active parameter
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Negative @Validation
  Scenario: Get SKU level filters for reports without apiSource parameter
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Negative @Validation
  Scenario: Get SKU level filters for reports with invalid active value
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|invalid|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Negative @Validation
  Scenario: Get SKU level filters for reports with invalid apiSource value
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|invalid_source|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Negative @Validation
  Scenario: Get SKU level filters for reports with special characters in active
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|<script>alert('XSS')</script>|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Negative @Security
  Scenario: Get SKU level filters for reports with SQL injection attempt
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|'; DROP TABLE skunits; --|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @Performance
  Scenario: Performance test for SKU level filters for reports endpoint
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU level filters for reports endpoint
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  # @Negative @ErrorHandling
  # Scenario: Get SKU level filters for reports with invalid endpoint
    # And I send the GET request to "skunits_get_sku_level_filters_for_reports_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |active|0,1|
      # |apiSource|ell|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate SKU level filters for reports business logic
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @DataIntegrity
  Scenario: Validate SKU level filters for reports data integrity
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @Regression
  Scenario: Regression test for SKU level filters for reports endpoint
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @Functional
  Scenario: Validate SKU level filters for reports response completeness
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @CategoriesValidation
  Scenario: Validate SKU level filters for reports categories object structure
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.categories|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end SKU level filters for reports data retrieval workflow
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "sku_level_filters_for_reports_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.categories|object|

  @Positive @ResultFieldValidation
  Scenario: Validate SKU level filters for reports result field
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate SKU level filters for reports reason field
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.reason|string|

  @Positive @CategoriesObjectValidation
  Scenario: Validate SKU level filters for reports categories object with key-value pairs
    And I send the GET request to "skunits_get_sku_level_filters_for_reports" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |active|0,1|
      |apiSource|ell|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.categories|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

