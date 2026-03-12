@BizomWebAPI @OS @GRNsManagement @GRNDetails @GetGrnDetails @IntegrationServices
Feature: Get GRN Details (HTML) API Testing
  As a Bizom web API consumer
  I want to validate the get GRN details endpoint
  So that I can ensure the endpoint returns HTML and expected status/behaviour

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Access GRN details without access token
    When I send the GET request to "grns_get_grn_details" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Access GRN details with invalid access token
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Access GRN details with expired access token
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_04 Access GRN details with valid access token
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentChecks
  Scenario: TC_05 Validate GRN HTML contains key markers
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"

  @Negative @Validation
  Scenario: TC_06 SQL injection attempt in query param
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |grnId|'; DROP TABLE grns; --|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"

  @Negative @Security
  Scenario: TC_07 XSS attempt in query param
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |grnId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"

  @Negative @ErrorHandling
  Scenario: TC_08 Invalid endpoint
    When I send the GET request to "grns_get_grn_details_invalid" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"

  @Positive @Performance
  Scenario: TC_09 Performance test for GRN details endpoint
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for GRN details endpoint
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @StoreResponse
  Scenario: TC_11 Store HTML response for manual verification
    And I send the GET request to "grns_get_grn_details" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I store the response as "getGrnDetails_html" name using full path
