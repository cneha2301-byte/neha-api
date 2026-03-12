@BizomWebAPI @CE @BusinessTypesManagement @GetBusinessTypes @ConfigurationSettings
Feature: Get Business Types API Testing
  As a system user
  I want to test the get business types endpoint
  So that I can ensure proper functionality and data retrieval for business types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get business types without access token
    When I send the GET request to "getbusinesstypes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get business types with invalid access token
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get business types with expired access token
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get business types with malformed access token
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get business types with valid access token
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I store the response as "getbusinesstypes_response" name using full path

  @Positive @DataValidation
  Scenario: Validate business types response structure
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.businesstype|array|

  @Positive @DataValidation
  Scenario: Validate business types specific data values
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.businesstype[0].id|"1"|
      |$.businesstype[0].name|DB:businesstypes:name: id=1|
      |$.businesstype[0].imageurl|DB:businesstypes:imageurl: id=1|

  @Positive @DataValidation
  Scenario: Validate business types with static values
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.businesstype[0].id|"1"|
      |$.businesstype[0].name|"Market one"|
      |$.businesstype[0].imageurl|""|

  @Positive @Performance
  Scenario: Performance test for business types endpoint
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @Concurrency
  Scenario: Concurrent access test for business types endpoint
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Validation
  Scenario: Get business types with invalid query parameters
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Validation
  Scenario: Get business types with special characters in query parameters
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Security
  Scenario: Get business types with SQL injection attempt
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE businesstypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Boundary
  Scenario: Get business types with maximum query parameters
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.error|[]|

  @Negative @ErrorHandling
  Scenario: Get business types with invalid endpoint
    And I send the GET request to "getbusinesstypes_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate business types business logic
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @DataIntegrity
  Scenario: Validate business types data integrity
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.businesstype|array|
      |$.businesstype[0].id|string|
      |$.businesstype[0].name|string|
      |$.businesstype[0].imageurl|string|

  @Positive @Regression
  Scenario: Regression test for business types endpoint
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.businesstype|array|

  @Positive @Functional
  Scenario: Validate business types response completeness
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.businesstype|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.businesstype[0].id|"1"|
      |$.businesstype[0].name|"Market one"|
      |$.businesstype[0].imageurl|""|

  @Positive @ArrayValidation
  Scenario: Validate business types array structure and content
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.businesstype|array|
      |$.businesstype[0]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.businesstype[0].id|"1"|
      |$.businesstype[0].name|"Market one"|
      |$.businesstype[0].imageurl|""|

  @Positive @ContentValidation
  Scenario: Validate business types content structure
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response contains the following values
      |Value|
      |businesstype|
      |id|
      |name|
      |imageurl|

  @Positive @LoadTesting
  Scenario: Load testing for business types endpoint
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Negative @Timeout
  Scenario: Test business types endpoint timeout handling
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|

  @Positive @EndToEnd
  Scenario: End-to-end business types data retrieval workflow
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I store the response as "getbusinesstypes_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.businesstype|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.businesstype[0].id|"1"|
      |$.businesstype[0].name|"Market one"|
      |$.businesstype[0].imageurl|""|

  @Positive @DataHandling
  Scenario: Validate business types data handling
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.businesstype|array|
      |$.businesstype[0].id|string|
      |$.businesstype[0].name|string|
      |$.businesstype[0].imageurl|string|

  @Positive @ResponseStructure
  Scenario: Validate business types response structure consistency
    And I send the GET request to "getbusinesstypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.businesstype|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.businesstype[0].id|"1"|
      |$.businesstype[0].name|"Market one"|
      |$.businesstype[0].imageurl|""|
