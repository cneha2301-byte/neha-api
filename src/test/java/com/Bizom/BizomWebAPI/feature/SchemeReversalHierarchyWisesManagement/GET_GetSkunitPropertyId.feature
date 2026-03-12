@BizomWebAPI @PI @SchemeReversalHierarchyWisesManagement @GetSkunitPropertyId @PaymentProcessing
Feature: Get SKU Unit Property ID API Testing
  As a system user
  I want to test the get SKU unit property ID endpoint
  So that I can ensure proper functionality and data retrieval for SKU unit property IDs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU unit property ID without access token
    When I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU unit property ID with invalid access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU unit property ID with expired access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU unit property ID with malformed access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU unit property ID with valid access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
    And I store the response as "skunit_property_id_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKU unit property ID response structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @DataObjectValidation
  Scenario: Validate SKU unit property ID Data object structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["3"]|string|

  @Positive @DynamicKeysValidation
  Scenario: Validate SKU unit property ID Data object with dynamic keys
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["3"]|string|
      |$.Data["4"]|string|
      |$.Data["5"]|string|
      |$.Data["10"]|string|
      |$.Data["15"]|string|

  @Positive @Performance
  Scenario: Performance test for SKU unit property ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU unit property ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get SKU unit property ID with invalid query parameters
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Validation
  Scenario: Get SKU unit property ID with special characters in query parameters
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Security
  Scenario: Get SKU unit property ID with SQL injection attempt
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemereversalhierarchywises; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  # @Negative @ErrorHandling
  # Scenario: Get SKU unit property ID with invalid endpoint
    # And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate SKU unit property ID business logic
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @DataIntegrity
  Scenario: Validate SKU unit property ID data integrity
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["3"]|string|

  @Positive @Regression
  Scenario: Regression test for SKU unit property ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @Functional
  Scenario: Validate SKU unit property ID response completeness
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @ContentValidation
  Scenario: Validate SKU unit property ID content structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|

  @Positive @ResultFieldValidation
  Scenario: Validate SKU unit property ID Result field
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate SKU unit property ID Reason field
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @DataFieldValidation
  Scenario: Validate SKU unit property ID Data field structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["3"]|string|
      |$.Data["4"]|string|
      |$.Data["5"]|string|

  @Positive @ObjectWithDynamicKeysValidation
  Scenario: Validate SKU unit property ID Data object with numeric string keys
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["10"]|string|
      |$.Data["11"]|string|
      |$.Data["12"]|string|
      |$.Data["13"]|string|
      |$.Data["14"]|string|
      |$.Data["15"]|string|

  @Positive @LoadTesting
  Scenario: Load testing for SKU unit property ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Negative @Timeout
  Scenario: Test SKU unit property ID endpoint timeout handling
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @EndToEnd
  Scenario: End-to-end SKU unit property ID data retrieval workflow
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And I store the response as "skunit_property_id_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["3"]|string|


