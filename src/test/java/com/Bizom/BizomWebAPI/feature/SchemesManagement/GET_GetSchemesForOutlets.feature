@BizomWebAPI @PI @SchemesManagement @GetSchemesForOutlets @PaymentProcessing
Feature: GetSchemesForOutlets API Testing
  As a system user
  I want to test the getschemesforoutlets endpoint
  So that I can ensure proper functionality and data retrieval for schemes for outlets

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get schemes for outlets without access token
    When I send the GET request to "get_schemes_for_outlets" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get schemes for outlets with invalid access token
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes for outlets with expired access token
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes for outlets with malformed access token
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes for outlets with valid access token
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And I store the response as "schemes_for_outlets_response" name using full path

  @Positive @DataValidation
  Scenario: Validate schemes for outlets response structure
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: Validate schemes for outlets specific data values
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And I verify API response at path with DB and static values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @DataValidation
  Scenario: Validate schemes for outlets with static values
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @Performance
  Scenario: Performance test for schemes for outlets endpoint
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @Concurrency
  Scenario: Concurrent access test for schemes for outlets endpoint
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Negative @Validation
  Scenario: Get schemes for outlets with invalid query parameters
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Negative @Validation
  Scenario: Get schemes for outlets with special characters in query parameters
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Negative @Security
  Scenario: Get schemes for outlets with SQL injection attempt
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Negative @Boundary
  Scenario: Get schemes for outlets with maximum query parameters
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
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
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  # @Negative @ErrorHandling
  # Scenario: Get schemes for outlets with invalid endpoint
    # And I send the GET request to "get_schemes_for_outlets_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.error|not_found|
      # |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate schemes for outlets business logic
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @DataIntegrity
  Scenario: Validate schemes for outlets data integrity
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @Regression
  Scenario: Regression test for schemes for outlets endpoint
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate schemes for outlets response completeness
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @NoDataValidation
  Scenario: Validate schemes for outlets no data response
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @EmptyDataValidation
  Scenario: Validate schemes for outlets empty data handling
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @ContentValidation
  Scenario: Validate schemes for outlets content structure
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No schemes found|

  @Positive @LoadTesting
  Scenario: Load testing for schemes for outlets endpoint
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Negative @Timeout
  Scenario: Test schemes for outlets endpoint timeout handling
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @EndToEnd
  Scenario: End-to-end schemes for outlets data retrieval workflow
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And I store the response as "schemes_for_outlets_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @OutletValidation
  Scenario: Validate outlet schemes data structure
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @SchemeValidation
  Scenario: Validate scheme availability for outlets
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

  @Positive @CompleteValidation
  Scenario: Validate complete schemes for outlets data structure
    And I send the GET request to "get_schemes_for_outlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
     |$.Result|"false"|
      |$.Reason|"No schemes found"|

