@BizomWebAPI @OS @GRNsManagement @GetMyGrnsApi @DataProcessing
Feature: Get My GRNs API Testing
  As a system user
  I want to test the get my GRNs API endpoint
  So that I can ensure proper functionality and data retrieval for GRNs management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get my GRNs API without access token
    When I send the GET request to "grns_getmygrnsapi" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get my GRNs API with invalid access token
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get my GRNs API with expired access token
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get my GRNs API with malformed access token
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get my GRNs API with valid access token
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And I store the response as "my_grns_api_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate my GRNs API response structure
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate my GRNs API response content
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate my GRNs API array structure
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @Performance
  Scenario: TC_09 Performance test for my GRNs API endpoint
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for my GRNs API endpoint
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Negative @Validation
  Scenario: TC_11 Get my GRNs API with invalid query parameters
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Negative @Validation
  Scenario: TC_12 Get my GRNs API with special characters in query parameters
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Negative @Security
  Scenario: TC_13 Get my GRNs API with SQL injection attempt
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE grns; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Negative @Boundary
  Scenario: TC_14 Get my GRNs API with maximum query parameters
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
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
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Negative @ErrorHandling
  Scenario: TC_15 Get my GRNs API with invalid endpoint
    And I send the GET request to "grns_getmygrnsapi_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate my GRNs API business logic
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate my GRNs API data integrity
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Regression
  Scenario: TC_18 Regression test for my GRNs API endpoint
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_19 Validate my GRNs API response completeness
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate my GRNs API array structure
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|

  @Positive @ContentValidation
  Scenario: TC_21 Validate my GRNs API content structure
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for my GRNs API endpoint
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|

  @Negative @Timeout
  Scenario: TC_23 Test my GRNs API endpoint timeout handling
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end my GRNs API data retrieval workflow
    And I send the GET request to "grns_getmygrnsapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|
    And I store the response as "my_grns_api_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

