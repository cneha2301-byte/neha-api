@BizomWebAPI @PI @SchemeReversalHierarchyWisesManagement @GetSkunitProperty @PaymentProcessing
Feature: Get SKU Unit Property API Testing
  As a system user
  I want to test the get SKU unit property endpoint
  So that I can ensure proper functionality and data retrieval for SKU unit properties

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU unit property without access token
    When I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get SKU unit property with invalid access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU unit property with expired access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU unit property with malformed access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU unit property with valid access token
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
    And I store the response as "skunit_property_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKU unit property response structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|string|

  @Positive @DataArrayValidation
  Scenario: Validate SKU unit property Data array structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|string|

  @Positive @ArrayContentValidation
  Scenario: Validate SKU unit property Data array content
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0]|brand|

  @Positive @Performance
  Scenario: Performance test for SKU unit property endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU unit property endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Negative @Validation
  Scenario: Get SKU unit property with invalid query parameters
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Negative @Validation
  Scenario: Get SKU unit property with special characters in query parameters
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Negative @Security
  Scenario: Get SKU unit property with SQL injection attempt
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemereversalhierarchywises; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  # @Negative @ErrorHandling
  # Scenario: Get SKU unit property with invalid endpoint
    # And I send the GET request to "schemereversalhierarchywises_get_skunit_property_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate SKU unit property business logic
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
      |$.Data|array|

  @Positive @DataIntegrity
  Scenario: Validate SKU unit property data integrity
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|string|

  @Positive @Regression
  Scenario: Regression test for SKU unit property endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: Validate SKU unit property response completeness
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|string|

  @Positive @ArrayValidation
  Scenario: Validate SKU unit property Data array structure and content
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0]|brand|

  @Positive @ContentValidation
  Scenario: Validate SKU unit property content structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
      |brand|

  @Positive @ResultFieldValidation
  Scenario: Validate SKU unit property Result field
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
  Scenario: Validate SKU unit property Reason field
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
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
  Scenario: Validate SKU unit property Data field structure
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0]|brand|

  @Positive @LoadTesting
  Scenario: Load testing for SKU unit property endpoint
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Negative @Timeout
  Scenario: Test SKU unit property endpoint timeout handling
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @EndToEnd
  Scenario: End-to-end SKU unit property data retrieval workflow
    And I send the GET request to "schemereversalhierarchywises_get_skunit_property" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And I store the response as "skunit_property_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0]|brand|


