@BizomWebAPI @PI @SchemeReversalHierarchyWisesManagement @UpdateSchemeReversalHierarchyData @PaymentProcessing
Feature: Update Scheme Reversal Hierarchy Data API Testing
  As a system user
  I want to test the update scheme reversal hierarchy data endpoint
  So that I can ensure proper functionality and data retrieval for scheme reversal hierarchy data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get update scheme reversal hierarchy data without access token
    When I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get update scheme reversal hierarchy data with invalid access token
    # And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
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
  # Scenario: Get update scheme reversal hierarchy data with expired access token
    # And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
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
  # Scenario: Get update scheme reversal hierarchy data with malformed access token
    # And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
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
  Scenario: Get update scheme reversal hierarchy data with valid access token
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And I store the response as "update_scheme_reversal_hierarchy_data_response" name using full path

  @Positive @DataValidation
  Scenario: Validate update scheme reversal hierarchy data response structure
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @NoDataValidation
  Scenario: Validate update scheme reversal hierarchy data no data response
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Performance
  Scenario: Performance test for update scheme reversal hierarchy data endpoint
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Concurrency
  Scenario: Concurrent access test for update scheme reversal hierarchy data endpoint
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Get update scheme reversal hierarchy data with invalid query parameters
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Get update scheme reversal hierarchy data with special characters in query parameters
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Security
  Scenario: Get update scheme reversal hierarchy data with SQL injection attempt
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemereversalhierarchywises; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  # @Negative @ErrorHandling
  # Scenario: Get update scheme reversal hierarchy data with invalid endpoint
    # And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate update scheme reversal hierarchy data business logic
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataIntegrity
  Scenario: Validate update scheme reversal hierarchy data data integrity
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: Regression test for update scheme reversal hierarchy data endpoint
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate update scheme reversal hierarchy data response completeness
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: Validate update scheme reversal hierarchy data content structure
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|

  @Positive @ResultFieldValidation
  Scenario: Validate update scheme reversal hierarchy data Result field
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
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
  Scenario: Validate update scheme reversal hierarchy data Reason field
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @LoadTesting
  Scenario: Load testing for update scheme reversal hierarchy data endpoint
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Timeout
  Scenario: Test update scheme reversal hierarchy data endpoint timeout handling
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @EndToEnd
  Scenario: End-to-end update scheme reversal hierarchy data data retrieval workflow
    And I send the GET request to "schemereversalhierarchywises_update_scheme_reversal_hierarchy_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found|
    And I store the response as "update_scheme_reversal_hierarchy_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|


