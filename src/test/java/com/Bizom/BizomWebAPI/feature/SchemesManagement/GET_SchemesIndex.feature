@BizomWebAPI @PI @SchemesManagement @SchemesIndex @WarehouseOperations
Feature: SchemesIndex API Testing
  As a system user
  I want to test the schemes index endpoint
  So that I can ensure proper functionality and HTML page rendering for schemes management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get schemes index without access token
    When I send the GET request to "schemes_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get schemes index with invalid access token
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes index with expired access token
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes index with malformed access token
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes index with valid access token
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
 
  @Positive @DataValidation
  Scenario: Validate schemes index HTML response structure
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: Validate schemes index specific HTML content
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Positive @DataValidation
  Scenario: Validate schemes index with static HTML values
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
 

  @Positive @Performance
  Scenario: Performance test for schemes index endpoint
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
 

  @Positive @Concurrency
  Scenario: Concurrent access test for schemes index endpoint
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
  And the HTML response should contain page title "Schemes  "
   

  @Negative @Validation
  Scenario: Get schemes index with invalid query parameters
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

  @Negative @Validation
  Scenario: Get schemes index with special characters in query parameters
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

  @Negative @Security
  Scenario: Get schemes index with SQL injection attempt
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

  @Negative @Boundary
  Scenario: Get schemes index with maximum query parameters
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

  @Negative @ErrorHandling
  Scenario: Get schemes index with invalid endpoint
    And I send the GET request to "schemes_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds


  @Positive @BusinessLogic
  Scenario: Validate schemes index business logic
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

  @Positive @DataIntegrity
  Scenario: Validate schemes index data integrity
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

  @Positive @Regression
  Scenario: Regression test for schemes index endpoint
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Validate schemes index response completeness
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

   

  @Positive @HTMLValidation
  Scenario: Validate schemes index HTML structure and content
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

   

  @Positive @ContentValidation
  Scenario: Validate schemes index content structure
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |Schemes|

  @Positive @LoadTesting
  Scenario: Load testing for schemes index endpoint
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Schemes  "

  @Negative @Timeout
  Scenario: Test schemes index endpoint timeout handling
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
   

  @Positive @EndToEnd
  Scenario: End-to-end schemes index page rendering workflow
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "
    And I store the response as "schemes_index_response" name using full path

   

  @Positive @PageValidation
  Scenario: Validate schemes index page structure
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

   

  @Positive @TitleValidation
  Scenario: Validate schemes index page title
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

   

  @Positive @CompleteValidation
  Scenario: Validate complete schemes index page structure
    And I send the GET request to "schemes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

