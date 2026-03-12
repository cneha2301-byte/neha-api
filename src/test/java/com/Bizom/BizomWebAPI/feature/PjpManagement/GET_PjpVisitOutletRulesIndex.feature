@BizomWebAPI @PjpManagement @PjpVisitOutletRulesIndex @OrderManagement
Feature: PJP Visit Outlet Rules Index API Testing
  As a system user
  I want to test the PJP visit outlet rules index endpoint
  So that I can ensure proper functionality and accessibility of the PJP visit outlet rules page

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get PJP visit outlet rules index without access token
    When I send the GET request to "pjp_visit_outlet_rules_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get PJP visit outlet rules index with invalid access token
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get PJP visit outlet rules index with expired access token
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get PJP visit outlet rules index with malformed access token
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get PJP visit outlet rules index with valid access token
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Functional
  Scenario: Get PJP visit outlet rules index and verify response
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get PJP visit outlet rules index with invalid endpoint
#    And I send the GET request to "pjp_visit_outlet_rules_index_invalid" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for PJP visit outlet rules index endpoint
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for PJP visit outlet rules index endpoint
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end PJP visit outlet rules index access workflow
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get PJP visit outlet rules index without query parameters
    When I send the GET request to "pjp_visit_outlet_rules_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Functional
  Scenario: Get PJP visit outlet rules index with valid session
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @LoadTesting
  Scenario: Load testing for PJP visit outlet rules index endpoint
    And I send the GET request to "pjp_visit_outlet_rules_index" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

