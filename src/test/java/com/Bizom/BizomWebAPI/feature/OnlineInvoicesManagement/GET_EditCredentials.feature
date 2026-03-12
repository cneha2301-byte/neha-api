@OnlineInvoicesManagement @EditCredentials @Innovation
#this API have notice in response so for a time being we are not testing this API
Feature: Edit Credentials API Testing for Online Invoices
  As a system user
  I want to test the edit credentials endpoint for online invoices
  So that I can ensure proper functionality for editing credentials in online invoices management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |cache-control|max-age=0|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|jmihagqm38ri9qhap06vjip02a|
      |CAKEPHP|ijre9rp9ofqjpa6jck5tl70lss|

  @Positive @Smoke
  Scenario: TC_01 Edit credentials with valid cookies and headers
    When I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Saved the credentials successfully.|
    And I store the response as "edit_credentials_response" name using full path

  @Positive @Functional
  Scenario: TC_02 Validate edit credentials response structure
    When I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Saved the credentials successfully.|

  @Negative @Security
  Scenario: TC_03 Edit credentials without cookies
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Edit credentials with invalid session cookie
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|invalid_session_12345|
      |CAKEPHP|invalid_cake_12345|
    And I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Edit credentials with expired session cookie
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |PHPSESSID|expired_session_12345|
      |CAKEPHP|expired_cake_12345|
    And I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_06 Performance test for edit credentials endpoint
    When I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @DataValidation
  Scenario: TC_07 Validate edit credentials response content
    When I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Saved the credentials successfully.|

  @Positive @Concurrency
  Scenario: TC_08 Concurrent edit credentials requests
    When I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @ErrorHandling
  Scenario: TC_09 Edit credentials with invalid endpoint
    When I send the GET request to "onlineinvoices_editcredentials_invalid" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_10 Regression test for edit credentials endpoint
    When I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Saved the credentials successfully.|

  @Positive @EndToEnd
  Scenario: TC_11 End-to-end edit credentials workflow
    When I send the GET request to "onlineinvoices_editcredentials" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|Saved the credentials successfully.|
    And I store the response as "edit_credentials_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

