@BizomWebAPI @Innovation @AssetManagement @AssetDetailsApproval @MasterDataManagement
Feature: Asset Details Approval API Testing
  As a Bizom web API consumer
  I want to validate the asset details approval endpoint
  So that I can ensure asset details approval HTML page is rendered correctly for users

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get asset details approval without access token
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get asset details approval with invalid access token
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get asset details approval with expired access token
     And I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get asset details approval with malformed access token
    And I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get asset details approval with valid userId path parameter
    And I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"
    And I store the response as "assetDetailsApproval_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate asset details approval HTML response structure
    And I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataValidation
  Scenario: TC_07 Validate asset details approval HTML content
    And I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"
    And validating the response contains the following values
      |Value|
      |Assetdetails|
      |html|
      |body|

  @Positive @Performance
  Scenario: TC_08 Performance test for asset details approval endpoint
    And I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for asset details approval endpoint
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Negative @Validation
  Scenario: TC_10 Get asset details approval with invalid userId path parameter
     And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|invalid_user_id|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Negative @Validation
  Scenario: TC_11 Get asset details approval with negative userId path parameter
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Negative @Validation
  Scenario: TC_12 Get asset details approval with zero userId path parameter
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Negative @Validation
  Scenario: TC_13 Get asset details approval with very large userId path parameter
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Negative @Validation
  Scenario: TC_14 Get asset details approval with special characters in userId path parameter
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Negative @Security
  Scenario: TC_15 Get asset details approval with SQL injection in userId path parameter
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |userId|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"

  @Negative @Validation
  Scenario: TC_16 Get asset details approval with empty userId path parameter
   And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"


  @Positive @EndToEnd
  Scenario: TC_17 End-to-end asset details approval data retrieval workflow
    And  I send the GET request to "assetdetails_approval" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Assetdetails"
    And I store the response as "assetDetailsApproval_response" name using full path
    And validating the response contains the following values
      |Value|
      |Assetdetails|
      |html|
      |body|

