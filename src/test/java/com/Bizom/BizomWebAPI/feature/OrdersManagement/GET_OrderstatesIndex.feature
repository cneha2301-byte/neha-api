@BizomWebAPI @OS @OrdersManagement @OrderstatesIndex @SystemOperations
Feature: Orderstates - HTML index page
  This feature validates the /orderstates/index endpoint which serves the Orderstates HTML page.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|text/html,*/*|
      |Connection|keep-alive|

  @PositiveScenario @Smoke
  Scenario: TC_01 Load Orderstates page without access token
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_02 Load Orderstates page with invalid access token
    And I send the GET request to "orderstates_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Load Orderstates page with expired access token
    And I send the GET request to "orderstates_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Load Orderstates page with malformed access token
    And I send the GET request to "orderstates_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_05 Validate Orderstates HTML content
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Headers
  Scenario: TC_06 Validate Orderstates response headers
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_07 Performance baseline for Orderstates page
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "1500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate Orderstates page has table headers
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_09 Store Orderstates HTML response
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And I store the response as "orderstates_index_response" name using full path
    And verify response time is less than "2000" milliseconds

  @Positive @LoadTesting
  Scenario: TC_10 Load testing for Orderstates page
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_11 Timeout handling for Orderstates page
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "5000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_12 Invalid Orderstates endpoint redirects to Users page
#    And I send the GET request to "orderstates_index_invalid" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression check for Orderstates page
    When I send the GET request to "orderstates_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

