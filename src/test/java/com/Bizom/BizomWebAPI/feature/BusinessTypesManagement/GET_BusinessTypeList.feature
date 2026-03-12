@BizomWebAPI @CE @BusinessTypesManagement @BusinessTypeList @ConfigurationSettings
Feature: Business Type List API Testing
  As a system user
  I want to test the business type list endpoint
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
  Scenario: TC_01 Get business type list without access token
    When I send the GET request to "businesstypelist" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get business type list with invalid access token
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get business type list with expired access token
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get business type list with malformed access token
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get business type list with valid access token
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|
    And verify response time is less than "2500" milliseconds
    And I store the response as "businesstypelist_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate business type list response structure
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.|object|
      |$['1']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Positive @DataValidation
  Scenario: TC_07 Validate business type list specific data values
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$['1']|DB:businesstypes:name: id=1|

  @Positive @DataValidation
  Scenario: TC_08 Validate business type list with static values
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Positive @Performance
  Scenario: TC_09 Performance test for business type list endpoint
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for business type list endpoint
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Negative @Validation
  Scenario: TC_11 Get business type list with invalid query parameters
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Negative @Validation
  Scenario: TC_12 Get business type list with special characters in query parameters
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Negative @Security
  Scenario: TC_13 Get business type list with SQL injection attempt
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE business_types; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Negative @Boundary
  Scenario: TC_14 Get business type list with maximum query parameters
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
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
      |$['1']|"Market one"|

  @Negative @ErrorHandling
  Scenario: TC_15 Get business type list with invalid endpoint
    And I send the GET request to "businesstypelist_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds
    

  @Positive @BusinessLogic
  Scenario: TC_16 Validate business type list business logic
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate business type list data integrity
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.|object|
      |$['1']|string| 

  @Positive @Regression
  Scenario: TC_18 Regression test for business type list endpoint
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.|object|
      |$['1']|string|

  @Positive @Functional
  Scenario: TC_19 Validate business type list response completeness
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.|object|
      |$['1']|string|

  @Positive @ObjectValidation
  Scenario: TC_20 Validate business type list object structure and content
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.|object|
      |$['1']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Positive @ContentValidation
  Scenario: TC_21 Validate business type list content structure
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|
    And validating the response contains the following values
      |Value|
      |Market one|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for business type list endpoint
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
  
      |$['1']|"Market one"|

  @Negative @Timeout
  Scenario: TC_23 Test business type list endpoint timeout handling
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end business type list data retrieval workflow
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
        |$['1']|"Market one"|
    And I store the response as "businesstypelist_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.|object|
      |$['1']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|

  @Positive @ResponseStructure
  Scenario: TC_25 Validate business type list response structure consistency
    And I send the GET request to "businesstypelist" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|"Market one"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Connection|keep-alive|
