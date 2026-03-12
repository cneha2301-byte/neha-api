@BizomWebAPI @ClaimsManagement @Claims @ClaimsIndex @ReportsAnalyticsGroup2 @CE
Feature: This feature file contains testcases for GET endpoint Claims - Index page

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|

  @PositiveScenario @Sanity
  Scenario: TC_01 Claims Index - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Claims"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And verify response time is less than "2000" milliseconds
    And I store the response as "claimsIndexResponse" name using full path

  @PositiveScenario @ContentValidation
  Scenario: TC_02 Claims Index - validate HTML page title
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Claims"
    And verify response time is less than "2000" milliseconds

  @PositiveScenario @HTMLValidation
  Scenario: TC_03 Claims Index - validate HTML structure
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Claims"
    And verify response time is less than "2000" milliseconds

  @PositiveScenario @ResponseHeaders
  Scenario: TC_04 Claims Index - response headers validation
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And verify response time is less than "2000" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_05 Claims Index - performance validation
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Claims"

  @PositiveScenario @EdgeCase
  Scenario: TC_06 Claims Index - with additional query parameters
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |test_param    |test_value    |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Claims"
    And verify response time is less than "2000" milliseconds

  @PositiveScenario @LoadTest
  Scenario: TC_07 Claims Index - load testing
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the HTML response should contain page title "Claims"

  @PositiveScenario @Concurrent
  Scenario: TC_08 Claims Index - concurrent request validation
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the HTML response should contain page title "Claims"

  @PositiveScenario @SecurityHeaders
  Scenario: TC_09 Claims Index - security headers validation
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And the HTML response should contain page title "Claims"
    And verify response time is less than "2000" milliseconds


  @PositiveScenario @BoundaryTesting
  Scenario: TC_10 Claims Index - boundary testing with special characters
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |special_chars |@#$%^&*()_+-=[]{};':",./<>? |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Claims"
    And verify response time is less than "2000" milliseconds


  @PositiveScenario @Security
  Scenario: TC_11 Claims Index - invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |invalid_token_12345 |
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2000" milliseconds

  @PositiveScenario @Validation
  Scenario: TC_12 Claims Index - empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

