@BizomWebAPI @PI @SchemeReversalHierarchyWisesManagement @GetOrgHierarchyId @PaymentProcessing
Feature: Get Organisation Hierarchy ID API Testing
  As a system user
  I want to test the get organisation hierarchy ID endpoint
  So that I can ensure proper functionality and data retrieval for organisation hierarchy IDs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get organisation hierarchy ID without access token
    When I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get organisation hierarchy ID with invalid access token
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get organisation hierarchy ID with expired access token
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get organisation hierarchy ID with malformed access token
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get organisation hierarchy ID with valid access token
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
    And I store the response as "org_hierarchy_id_response" name using full path

  @Positive @DataValidation
  Scenario: Validate organisation hierarchy ID response structure
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Validate organisation hierarchy ID Data object structure
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Validate organisation hierarchy ID Data object with dynamic keys
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
      |$.Data["10"]|string|
      |$.Data["50"]|string|
      |$.Data["91"]|string|

  @Positive @Performance
  Scenario: Performance test for organisation hierarchy ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Concurrent access test for organisation hierarchy ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get organisation hierarchy ID with invalid query parameters
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get organisation hierarchy ID with special characters in query parameters
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Get organisation hierarchy ID with SQL injection attempt
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  # Scenario: Get organisation hierarchy ID with invalid endpoint
    # And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate organisation hierarchy ID business logic
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Validate organisation hierarchy ID data integrity
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Regression test for organisation hierarchy ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Validate organisation hierarchy ID response completeness
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["3"]|string|

  @Positive @ContentValidation
  Scenario: Validate organisation hierarchy ID content structure
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Validate organisation hierarchy ID Result field
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Validate organisation hierarchy ID Reason field
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Validate organisation hierarchy ID Data field structure
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
      |$.Data["10"]|string|
      |$.Data["50"]|string|
      |$.Data["91"]|string|

  @Positive @ObjectWithDynamicKeysValidation
  Scenario: Validate organisation hierarchy ID Data object with numeric string keys
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
      |$.Data["20"]|string|
      |$.Data["30"]|string|
      |$.Data["50"]|string|
      |$.Data["91"]|string|

  @Positive @LoadTesting
  Scenario: Load testing for organisation hierarchy ID endpoint
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: Test organisation hierarchy ID endpoint timeout handling
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
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
  Scenario: End-to-end organisation hierarchy ID data retrieval workflow
    And I send the GET request to "schemereversalhierarchywises_get_org_hierarchy_id" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Data found|
    And I store the response as "org_hierarchy_id_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data["1"]|string|
      |$.Data["2"]|string|
      |$.Data["3"]|string|


