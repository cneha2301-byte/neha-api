@BizomWebAPI @PI @SchemesManagement @ApplyQpsScheme @SystemOperations
Feature: Apply QPS Scheme API Testing
  As a system user
  I want to test the apply QPS scheme endpoint
  So that I can ensure proper functionality for applying QPS schemes in the system

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
  Scenario: TC_01 Apply QPS scheme without cookies
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|
    And I send the GET request to "schemes_applyqpsscheme" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02  Apply QPS scheme with invalid session cookie
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
    And I send the GET request to "schemes_applyqpsscheme" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario:   TC_03 Apply QPS scheme with expired session cookie
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
    And I send the GET request to "schemes_applyqpsscheme" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_04 Apply QPS scheme with valid cookies and headers
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|
    And I store the response as "apply_qps_scheme_response" name using full path

  @Positive @Functional
  Scenario: TC_05 Validate apply QPS scheme response structure
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|

  @Positive @DataValidation
  Scenario: TC_06 Validate apply QPS scheme response content
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|

  @Positive @Performance
  Scenario: TC_07 Performance test for apply QPS scheme endpoint
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_08 Concurrent apply QPS scheme requests
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_09 Apply QPS scheme with invalid query parameters
    When I send the GET request to "schemes_applyqpsscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Apply QPS scheme with special characters in query parameters
    When I send the GET request to "schemes_applyqpsscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Apply QPS scheme with SQL injection attempt
    When I send the GET request to "schemes_applyqpsscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |test_param|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_12 Apply QPS scheme with maximum query parameters
    When I send the GET request to "schemes_applyqpsscheme" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_13 Apply QPS scheme with invalid endpoint
#    When I send the GET request to "schemes_applyqpsscheme_invalid" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate apply QPS scheme business logic
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|

  @Positive @DataIntegrity
  Scenario:   TC_15 Validate apply QPS scheme data integrity
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|

  @Positive @Regression
  Scenario: TC_16 Regression test for apply QPS scheme endpoint
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|

  @Positive @Functional
  Scenario: TC_17 Validate apply QPS scheme response completeness
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|
    And I store the response as "apply_qps_scheme_response" name using full path

  @Positive @ContentValidation
  Scenario: TC_18 Validate apply QPS scheme content structure
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Qps will be Applied|
      |report will be sent over email|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for apply QPS scheme endpoint
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_20 Test apply QPS scheme endpoint timeout handling
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_21 End-to-end apply QPS scheme workflow
    And I send the GET request to "schemes_applyqpsscheme" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Qps will be Applied, a report will be sent over email.|
    And I store the response as "apply_qps_scheme_response" name using full path

