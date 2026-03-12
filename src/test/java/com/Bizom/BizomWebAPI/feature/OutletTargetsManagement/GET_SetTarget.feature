@BizomWebAPI @CE @OutletTargetsManagement @SetTarget @SystemOperations
Feature: Set Target API Testing
  As a system user
  I want to test the set target endpoint
  So that I can ensure proper functionality and accessibility of the set target page

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get set target without access token
    When I send the GET request to "outlettargets_set_target" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get set target with invalid access token
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get set target with expired access token
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get set target with malformed access token
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get set target with valid access token
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Functional
  Scenario: Get set target and verify response code
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get set target with invalid endpoint
#    And I send the GET request to "outlettargets_set_target_invalid" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for set target endpoint
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for set target endpoint
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end set target access workflow
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get set target without query parameters
    When I send the GET request to "outlettargets_set_target" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Functional
  Scenario: Get set target with valid session
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for set target endpoint
    And I send the GET request to "outlettargets_set_target" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

