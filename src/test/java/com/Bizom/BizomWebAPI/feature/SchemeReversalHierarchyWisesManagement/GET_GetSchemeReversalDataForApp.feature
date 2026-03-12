@BizomWebAPI @PI @SchemeReversalHierarchyWisesManagement @GetSchemeReversalDataForApp @PaymentProcessing
Feature: Get Scheme Reversal Data For App API Testing
  As a system user
  I want to test the get scheme reversal data for app endpoint
  So that I can ensure proper functionality and data retrieval for scheme reversal data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get scheme reversal data for app without access token
    When I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get scheme reversal data for app with invalid access token
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Get scheme reversal data for app with expired access token
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Get scheme reversal data for app with malformed access token
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Get scheme reversal data for app with valid access token
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And I store the response as "scheme_reversal_data_for_app_response" name using full path

  @Positive @DataValidation
  Scenario: Validate scheme reversal data for app response structure
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @NoDataValidation
  Scenario: Validate scheme reversal data for app no data response
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @EmptyArrayValidation
  Scenario: Validate scheme reversal data for app empty Data array
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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

  @Positive @Performance
  Scenario: Performance test for scheme reversal data for app endpoint
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Concurrent access test for scheme reversal data for app endpoint
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Get scheme reversal data for app with invalid query parameters
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Get scheme reversal data for app with special characters in query parameters
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Get scheme reversal data for app with SQL injection attempt
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  # Scenario: Get scheme reversal data for app with invalid endpoint
    # And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate scheme reversal data for app business logic
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataIntegrity
  Scenario: Validate scheme reversal data for app data integrity
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Regression
  Scenario: Regression test for scheme reversal data for app endpoint
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Validate scheme reversal data for app response completeness
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.Data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @ArrayValidation
  Scenario: Validate scheme reversal data for app Data array structure
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @ContentValidation
  Scenario: Validate scheme reversal data for app content structure
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|

  @Positive @ResultFieldValidation
  Scenario: Validate scheme reversal data for app Result field
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Validate scheme reversal data for app Reason field
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @DataFieldValidation
  Scenario: Validate scheme reversal data for app Data field
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Load testing for scheme reversal data for app endpoint
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: Test scheme reversal data for app endpoint timeout handling
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
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
  Scenario: End-to-end scheme reversal data for app data retrieval workflow
    And I send the GET request to "schemereversalhierarchywises_get_scheme_reversal_data_for_app" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.Data|[]|
    And I store the response as "scheme_reversal_data_for_app_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|


