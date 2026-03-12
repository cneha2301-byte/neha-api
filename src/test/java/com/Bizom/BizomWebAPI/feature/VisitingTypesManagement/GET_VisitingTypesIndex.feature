@BizomWebAPI @VisitingTypesManagement @VisitingTypesIndex @SystemIntegration
Feature: Get Visiting Types Index API Testing
  As a system user
  I want to test the visiting types index endpoint
  So that I can ensure proper functionality and HTML content validation for visiting types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get visiting types index without access token
    When I send the GET request to "visiting_types_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get visiting types index with invalid access token
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get visiting types index with expired access token
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get visiting types index with malformed access token
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get visiting types index with valid access token
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Positive @Functional
  Scenario: Validate visiting types index HTML structure
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Positive @UIValidation
  Scenario: Validate visiting types index page elements
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Positive @ContentValidation
  Scenario: Validate visiting types index specific content
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Positive @Performance
  Scenario: Performance test for visiting types index endpoint
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Positive @Concurrency
  Scenario: Concurrent access test for visiting types index endpoint
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Negative @Validation
  Scenario: Get visiting types index with invalid query parameter
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Negative @Security
  Scenario: Get visiting types index with XSS attempt in query parameter
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Negative @Boundary
  Scenario: Get visiting types index with excessive query parameters
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Negative @ErrorHandling
  Scenario: Get visiting types index with invalid endpoint
    And I send the GET request to "visiting_types_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate visiting types index business logic
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Positive @DataIntegrity
  Scenario: Validate visiting types index data integrity
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   

  @Positive @Regression
  Scenario: Regression test for visiting types index endpoint
    And I send the GET request to "visiting_types_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Visitingtypes"
   


