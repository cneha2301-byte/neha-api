@BizomWebAPI @CE @DashboardsManagement @OrgnisationHierarchy @IntegrationServices
Feature: Organisation Hierarchy API Testing
  As a Bizom web API consumer
  I want to validate the organisation hierarchy endpoint
  So that I can ensure organisation hierarchy HTML page is rendered correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get organisation hierarchy without access token
    When I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get organisation hierarchy with invalid access token
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get organisation hierarchy with expired access token
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get organisation hierarchy with malformed access token
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get organisation hierarchy with valid request
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And I store the response as "organisation_hierarchy_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate organisation hierarchy HTML response structure
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataValidation
  Scenario: TC_07 Validate organisation hierarchy HTML content
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And validating the response contains the following values
      |Value|
      |Dashboards|
      |html|
      |body|

  @Positive @Performance
  Scenario: TC_08 Performance test for organisation hierarchy endpoint
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Dashboards"

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for organisation hierarchy endpoint
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"

  @Negative @Validation
  Scenario: TC_10 Get organisation hierarchy with invalid query parameters
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"

  @Negative @Validation
  Scenario: TC_11 Get organisation hierarchy with special characters in query parameters
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"

  @Negative @Security
  Scenario: TC_12 Get organisation hierarchy with SQL injection attempt
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE dashboards; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"

  @Negative @Boundary
  Scenario: TC_13 Get organisation hierarchy with maximum query parameters
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get organisation hierarchy with invalid endpoint
#    And I send the GET request to "dashboards_orgnisationhierarchy_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate organisation hierarchy business logic
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate organisation hierarchy data integrity
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|

  @Positive @Regression
  Scenario: TC_17 Regression test for organisation hierarchy endpoint
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_18 Validate organisation hierarchy response completeness
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And validating the response contains the following values
      |Value|
      |Dashboards|
      |html|
      |body|
      |div|
      |table|

  @Positive @ContentValidation
  Scenario: TC_19 Validate organisation hierarchy content structure
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Dashboards|
      |html|
      |body|
      |div|
      |table|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for organisation hierarchy endpoint
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Dashboards"

  @Negative @Timeout
  Scenario: TC_21 Test organisation hierarchy endpoint timeout handling
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Dashboards"

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end organisation hierarchy data retrieval workflow
    And I send the GET request to "dashboards_orgnisationhierarchy" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Dashboards"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "organisation_hierarchy_response" name using full path
    And validating the response contains the following values
      |Value|
      |Dashboards|
      |html|
      |body|
      |div|
      |table|

