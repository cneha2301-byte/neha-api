@BizomWebAPI @PI @SchemesManagement @SchemesIndexTrade @WarehouseOperations
Feature: SchemesIndexTrade API Testing
  As a system user
  I want to test the schemes indextrade endpoint
  So that I can ensure proper functionality and HTML page rendering for trade schemes management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get schemes indextrade without access token
    When I send the GET request to "schemes_indextrade" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get schemes indextrade with invalid access token
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes indextrade with expired access token
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes indextrade with malformed access token
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes indextrade with valid access token
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "
    And I store the response as "schemes_indextrade_response" name using full path

  @Positive @DataValidation
  Scenario: Validate schemes indextrade HTML response structure
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

#  @Positive @DataValidation
#  Scenario: Validate schemes indextrade specific HTML content
#    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Schemes  "
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.title|"Schemes"|
#      |$.html|contains HTML structure|

  @Positive @DataValidation
  Scenario: Validate schemes indextrade with static HTML values
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   
   

  @Positive @Performance
  Scenario: Performance test for schemes indextrade endpoint
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Schemes  "

  @Positive @Concurrency
  Scenario: Concurrent access test for schemes indextrade endpoint
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

  @Negative @Validation
  Scenario: Get schemes indextrade with invalid query parameters
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

  @Negative @Validation
  Scenario: Get schemes indextrade with special characters in query parameters
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

  @Negative @Security
  Scenario: Get schemes indextrade with SQL injection attempt
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

  @Negative @Boundary
  Scenario: Get schemes indextrade with maximum query parameters
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
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
  Scenario: Get schemes indextrade with invalid endpoint
    And I send the GET request to "schemes_indextrade_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds


  @Positive @BusinessLogic
  Scenario: Validate schemes indextrade business logic
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

  @Positive @DataIntegrity
  Scenario: Validate schemes indextrade data integrity
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "


  @Positive @Regression
  Scenario: Regression test for schemes indextrade endpoint
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds



  @Positive @Functional
  Scenario: Validate schemes indextrade response completeness
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "

   

  @Positive @HTMLValidation
  Scenario: Validate schemes indextrade HTML structure and content
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "


  @Positive @ContentValidation
  Scenario: Validate schemes indextrade content structure
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |Schemes|

  @Positive @LoadTesting
  Scenario: Load testing for schemes indextrade endpoint
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
   

  @Negative @Timeout
  Scenario: Test schemes indextrade endpoint timeout handling
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
   

  @Positive @EndToEnd
  Scenario: End-to-end schemes indextrade page rendering workflow
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   
    And I store the response as "schemes_indextrade_response" name using full path


  @Positive @PageValidation
  Scenario: Validate schemes indextrade page structure
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
   

   

  @Positive @TitleValidation
  Scenario: Validate schemes indextrade page title
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "


  @Positive @TradeValidation
  Scenario: Validate schemes indextrade trade-specific functionality
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "


  @Positive @CompleteValidation
  Scenario: Validate complete schemes indextrade page structure
    And I send the GET request to "schemes_indextrade" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes  "


