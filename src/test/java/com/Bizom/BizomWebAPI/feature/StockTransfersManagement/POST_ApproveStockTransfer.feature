@BizomWebAPI @StockTransfersManagement @ApproveStockTransfer @SystemIntegration @Innovation
Feature: Approve Stock Transfer API Testing
  As a system user
  I want to test the approvestocktransfer endpoint
  So that I can ensure proper approval workflow for stock transfers

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Approve stock transfer without access token
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Approve stock transfer with invalid access token
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Approve stock transfer with expired access token
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Approve stock transfer with malformed access token
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Approve stock transfer with valid request
#    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.stocktransferId|14|
#      |$.error.message|""|
#    And I store the response as "approvestocktransfer_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate approve stock transfer response structure
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.stocktransferId|string|
      |$.error|object|
      |$.error.message|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate approve stock transfer with DB data
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And I verify API response at path with DB and static values
      |JPath|Value|

  @Positive @Performance
  Scenario: TC_08 Performance test for approve stock transfer endpoint
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_09 Approve stock transfer with invalid stocktransferId
    And I modify fields with random values and remove fields in "POST_approveStockTransfer" payload
      |JPath|Value|
      |$.stocktransferId|abc|
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Approve stock transfer with empty body
    And I send empty body with "POST_approveStockTransfer" request
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Approve stock transfer with non-existent stocktransferId
    And I modify fields with random values and remove fields in "POST_approveStockTransfer" payload
      |JPath|Value|
      |$.stocktransferId|999999|
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Approve stock transfer with negative stocktransferId
    And I modify fields with random values and remove fields in "POST_approveStockTransfer" payload
      |JPath|Value|
      |$.stocktransferId|-1|
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Approve stock transfer with zero stocktransferId
    And I modify fields with random values and remove fields in "POST_approveStockTransfer" payload
      |JPath|Value|
      |$.stocktransferId|0|
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Approve stock transfer with very large stocktransferId
    And I modify fields with random values and remove fields in "POST_approveStockTransfer" payload
      |JPath|Value|
      |$.stocktransferId|999999999999|
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Approve stock transfer with invalid endpoint
    And I post the request with "POST_approveStockTransfer_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "405"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_16 Validate approve stock transfer response contains mandatory keys
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response contains the following values
      |Value|
      |result|
      |stocktransferId|
      |error|
      |message|

  @Positive @DataValidation
  Scenario: TC_17 Validate stocktransferId matches request
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.stocktransferId|"14"|

  @Positive @Regression
  Scenario: TC_18 Regression test for approve stock transfer endpoint
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @Concurrency
  Scenario: TC_19 Concurrent access test for approve stock transfer endpoint
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for approve stock transfer endpoint
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Timeout
  Scenario: TC_21 Test approve stock transfer endpoint timeout handling
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @EndToEnd
    Scenario: TC_22 End-to-end approve stock transfer workflow
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.stocktransferId|"14"|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.stocktransferId|string|
      |$.error|object|
      |$.error.message|string|
    And I store the response as "approvestocktransfer_response" name using full path

  @Negative @BusinessLogic
  Scenario: TC_23 Approve already approved stock transfer
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_25 Validate error object structure
    And I post the request with "POST_approveStockTransfer" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|object|
      |$.error.message|string|


