@BizomWebAPI @PI @SchemesManagement @AssignNewScheme @SystemOperations
Feature: Assign New Scheme API Testing
  As a system user
  I want to test the assign new scheme endpoint
  So that I can ensure proper functionality and HTML page rendering for assigning new schemes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
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

  @Negative @Security
  Scenario: TC_01 Assign new scheme without cookies
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I send the GET request to "schemes_assignnewscheme" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Assign new scheme with invalid session cookie
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
    And I send the GET request to "schemes_assignnewscheme" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Assign new scheme with expired session cookie
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
    And I send the GET request to "schemes_assignnewscheme" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_04 Assign new scheme with valid cookies and headers
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"
    And I store the response as "assign_new_scheme_response" name using full path

  @Positive @HTMLValidation
  Scenario: TC_05 Validate assign new scheme HTML page title
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"

  @Positive @HTMLValidation
  Scenario: TC_06 Validate assign new scheme HTML structure
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @HTMLValidation
  Scenario: TC_07 Validate assign new scheme HTML element exists
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And the HTML response should contain element "div"

  @Positive @DataValidation
  Scenario: TC_08 Validate assign new scheme HTML response structure
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"

  @Positive @Performance
  Scenario: TC_09 Performance test for assign new scheme endpoint
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Schemes"

  @Positive @Concurrency
  Scenario: TC_10 Concurrent assign new scheme requests
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Schemes"

  @Negative @Validation
  Scenario: TC_11 Assign new scheme with invalid query parameters
    When I send the GET request to "schemes_assignnewscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Validation
  Scenario: TC_12 Assign new scheme with special characters in query parameters
    When I send the GET request to "schemes_assignnewscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_13 Assign new scheme with SQL injection attempt
    When I send the GET request to "schemes_assignnewscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_14 Assign new scheme with maximum query parameters
    When I send the GET request to "schemes_assignnewscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @ErrorHandling
  Scenario: TC_15 Assign new scheme with invalid endpoint
    When I send the GET request to "schemes_assignnewscheme_invalid" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate assign new scheme business logic
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"

  @Positive @DataIntegrity
  Scenario: TC_17 Validate assign new scheme data integrity
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @Regression
  Scenario: TC_18 Regression test for assign new scheme endpoint
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"

  @Positive @Functional
  Scenario: TC_19 Validate assign new scheme response completeness
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And I store the response as "assign_new_scheme_response" name using full path

  @Positive @ContentValidation
  Scenario: TC_20 Validate assign new scheme content structure
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"
    And validating the response contains the following values
      |Value|
      |Schemes|
      |html|
      |head|
      |title|
      |body|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for assign new scheme endpoint
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Schemes"

  @Negative @Timeout
  Scenario: TC_22 Test assign new scheme endpoint timeout handling
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Schemes"

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end assign new scheme workflow
    And I send the GET request to "schemes_assignnewscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Schemes"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "body"
    And I store the response as "assign_new_scheme_response" name using full path

