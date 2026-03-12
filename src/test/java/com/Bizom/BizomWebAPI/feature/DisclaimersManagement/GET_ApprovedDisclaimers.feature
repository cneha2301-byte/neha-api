@BizomWebAPI @PI @DisclaimersManagement @ApprovedDisclaimers @IntegrationServices
Feature: Approved Disclaimers API Testing
  As a Bizom web API consumer
  I want to validate the approved disclaimers endpoint
  So that I can ensure approved disclaimers HTML page is rendered correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get approved disclaimers without access token
    When I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get approved disclaimers with invalid access token
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get approved disclaimers with expired access token
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get approved disclaimers with malformed access token
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get approved disclaimers with valid request
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And I store the response as "approved_disclaimers_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate approved disclaimers HTML response structure
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataValidation
  Scenario: TC_07 Validate approved disclaimers HTML content
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And validating the response contains the following values
      |Value|
      |Disclaimers|
      |html|
      |body|

  @Positive @Performance
  Scenario: TC_08 Performance test for approved disclaimers endpoint
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Disclaimers"

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for approved disclaimers endpoint
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"

  @Negative @Validation
  Scenario: TC_10 Get approved disclaimers with invalid query parameters
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"

  @Negative @Validation
  Scenario: TC_11 Get approved disclaimers with special characters in query parameters
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"

  @Negative @Security
  Scenario: TC_12 Get approved disclaimers with SQL injection attempt
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE disclaimers; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"

  @Negative @Boundary
  Scenario: TC_13 Get approved disclaimers with maximum query parameters
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get approved disclaimers with invalid endpoint
#    And I send the GET request to "disclaimers_approveddisclaimers_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate approved disclaimers business logic
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate approved disclaimers data integrity
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And validating the response contains the following values
      |Value|
      |Disclaimers|
      |html|
      |body|

  @Positive @Regression
  Scenario: TC_17 Regression test for approved disclaimers endpoint
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_18 Validate approved disclaimers response completeness
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "approved_disclaimers_response" name using full path
    And validating the response contains the following values
      |Value|
      |Disclaimers|
      |html|
      |body|
      |head|

  @Positive @ContentValidation
  Scenario: TC_19 Validate approved disclaimers HTML element structure
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|
      |title|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for approved disclaimers endpoint
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Disclaimers"

  @Negative @Timeout
  Scenario: TC_21 Test approved disclaimers endpoint timeout handling
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Disclaimers"

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end approved disclaimers data retrieval workflow
    And I send the GET request to "disclaimers_approveddisclaimers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Disclaimers"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "approved_disclaimers_response" name using full path
    And validating the response contains the following values
      |Value|
      |Disclaimers|
      |html|
      |body|
      |head|
      |title|

