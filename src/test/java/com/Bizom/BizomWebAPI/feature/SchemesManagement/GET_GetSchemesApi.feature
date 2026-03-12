@BizomWebAPI @PI @SchemesManagement @GetSchemesApi @PaymentProcessing
Feature: GetSchemesApi API Testing
  As a system user
  I want to test the getschemesApi endpoint
  So that I can ensure proper functionality and data retrieval for schemes management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get schemes API without access token
    When I send the GET request to "get_schemes_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get schemes API with invalid access token
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes API with expired access token
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes API with malformed access token
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes API with valid access token
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "schemes_response" name using full path

  @Positive @DataValidation
  Scenario: Validate schemes API response structure
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Scheme|array|

  @Positive @DataValidation
  Scenario: Validate schemes API specific data values
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataValidation
  Scenario: Validate schemes API with static values
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme[0].holderid|1|
      |$.Scheme[0].holdertype|""|
      |$.Scheme[0].warehouse_erpid|"trp123"|
      |$.Scheme[0].enddate|""|
      |$.Scheme[1].holderid|2|
      |$.Scheme[1].holdertype|""|
      |$.Scheme[1].warehouse_erpid|"trp133"|
      |$.Scheme[1].enddate|""|

  @Positive @Performance
  Scenario: Performance test for schemes API endpoint
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for schemes API endpoint
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get schemes API with invalid query parameters
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get schemes API with special characters in query parameters
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Security
  Scenario: Get schemes API with SQL injection attempt
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: Get schemes API with maximum query parameters
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
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
      |$.Result|"true"|
      |$.Reason|""|

  # @Negative @ErrorHandling
  # Scenario: Get schemes API with invalid endpoint
    # And I send the GET request to "get_schemes_api_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.error|not_found|
      # |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate schemes API business logic
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: Validate schemes API data integrity
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Scheme|array|
      |$.Scheme[0].holderid|number|
      |$.Scheme[0].holdertype|string|
      |$.Scheme[0].warehouse_erpid|string|
      |$.Scheme[0].enddate|string|
      |$.Scheme[0].Schemes|array|

  @Positive @Regression
  Scenario: Regression test for schemes API endpoint
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Scheme|array|

  @Positive @Functional
  Scenario: Validate schemes API response completeness
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Scheme|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme[0].holderid|1|
      |$.Scheme[0].holdertype|""|
      |$.Scheme[0].warehouse_erpid|"trp123"|
      |$.Scheme[0].enddate|""|
      |$.Scheme[1].holderid|2|
      |$.Scheme[1].holdertype|""|
      |$.Scheme[1].warehouse_erpid|"trp133"|
      |$.Scheme[1].enddate|""|

  @Positive @ArrayValidation
  Scenario: Validate schemes array structure and content
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Scheme|array|
      |$.Scheme[0]|object|
      |$.Scheme[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme[0].holderid|1|
      |$.Scheme[0].holdertype|""|
      |$.Scheme[0].warehouse_erpid|"trp123"|
      |$.Scheme[0].enddate|""|
      |$.Scheme[1].holderid|2|
      |$.Scheme[1].holdertype|""|
      |$.Scheme[1].warehouse_erpid|"trp133"|
      |$.Scheme[1].enddate|""|

  @Positive @ContentValidation
  Scenario: Validate schemes content structure
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Scheme|
      |holderid|
      |holdertype|
      |warehouse_erpid|
      |enddate|
      |Schemes|

  @Positive @LoadTesting
  Scenario: Load testing for schemes API endpoint
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test schemes API endpoint timeout handling
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end schemes API data retrieval workflow
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "schemes_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Scheme|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme[0].holderid|1|
      |$.Scheme[0].holdertype|""|
      |$.Scheme[0].warehouse_erpid|"trp123"|
      |$.Scheme[0].enddate|""|
      |$.Scheme[1].holderid|2|
      |$.Scheme[1].holdertype|""|
      |$.Scheme[1].warehouse_erpid|"trp133"|
      |$.Scheme[1].enddate|""|

  @Positive @SchemeValidation
  Scenario: Validate scheme holder data structure
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Scheme[0].holderid|number|
      |$.Scheme[0].holdertype|string|
      |$.Scheme[0].warehouse_erpid|string|
      |$.Scheme[0].enddate|string|
      |$.Scheme[0].Schemes|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme[0].holderid|1|
      |$.Scheme[0].holdertype|""|
      |$.Scheme[0].warehouse_erpid|"trp123"|
      |$.Scheme[0].enddate|""|
      |$.Scheme[0].Schemes|[]|

  # @Positive @WarehouseValidation
  # Scenario: Validate warehouse ERP ID data
    # And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|"true"|
      # |$.Reason|""|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Scheme[0].warehouse_erpid|"trp123"|
      # |$.Scheme[1].warehouse_erpid|"trp133"|
      # |$.Scheme[9].warehouse_erpid|"s12345"|
      # |$.Scheme[12].warehouse_erpid|"ERP16291"|
      # |$.Scheme[13].warehouse_erpid|"14"|
      # |$.Scheme[28].warehouse_erpid|"33444"|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.Scheme[0].warehouse_erpid|string|
      # |$.Scheme[1].warehouse_erpid|string|
      # |$.Scheme[9].warehouse_erpid|string|
      # |$.Scheme[12].warehouse_erpid|string|
      # |$.Scheme[13].warehouse_erpid|string|
      # |$.Scheme[28].warehouse_erpid|string|

  @Positive @HolderValidation
  Scenario: Validate holder ID data structure
    And I send the GET request to "get_schemes_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Scheme[0].holderid|1|
      |$.Scheme[1].holderid|2|
      |$.Scheme[2].holderid|3|
      |$.Scheme[3].holderid|4|
      |$.Scheme[4].holderid|5|
      |$.Scheme[5].holderid|6|
      |$.Scheme[6].holderid|7|
      |$.Scheme[7].holderid|8|
      |$.Scheme[8].holderid|9|
      |$.Scheme[9].holderid|10|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Scheme[0].holderid|number|
      |$.Scheme[1].holderid|number|
      |$.Scheme[2].holderid|number|
      |$.Scheme[3].holderid|number|
      |$.Scheme[4].holderid|number|
      |$.Scheme[5].holderid|number|
      |$.Scheme[6].holderid|number|
      |$.Scheme[7].holderid|number|
      |$.Scheme[8].holderid|number|
      |$.Scheme[9].holderid|number|

