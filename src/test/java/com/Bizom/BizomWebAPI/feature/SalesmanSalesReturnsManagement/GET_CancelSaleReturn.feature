@SalesmanSalesReturnsManagement @CancelSaleReturn @SystemIntegration @OS
Feature: Cancel Sale Return API Testing
  As a system user
  I want to test the cancelSaleReturn endpoint
  So that I can ensure proper functionality for canceling sale returns

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
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
  Scenario: Cancel sale return without access token
    When I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with path parameters
      |Path|Value|
      |salereturnId|201|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Cancel sale return with invalid access token
    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|salereturnId|201|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Cancel sale return with expired access token
    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|salereturnId|201|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Cancel sale return with malformed access token
    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|salereturnId|201|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Cancel sale return with valid sale return ID - success case
#    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|salereturnId|201|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Sale Return Cancelled|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.transactionid|string|
#    And I store the response as "cancel_sale_return_response" name using full path

  @Positive @Functional
  Scenario: Cancel sale return with different sale return ID
    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|salereturnId|202|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.transactionid|string|

#  @Positive @DataValidation
#  Scenario: Validate cancel sale return response structure
#    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|salereturnId|203|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|Sale Return Cancelled|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.transactionid|string|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |transactionid|

  @Negative @Validation
  Scenario: Cancel sale return with already cancelled sale return ID
    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|salereturnId|200|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Sale return Id 200|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Cancel sale return with invalid sale return ID
    And I send the GET request to "salemansalesreturns_cancelsalereturn" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|salereturnId|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Cancel sale return with invalid endpoint
    And I send the GET request to "salemansalesreturns_cancelsalereturn_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|salereturnId|201|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds


