@BizomWebAPI @CE @DistrictsManagement @GetDistricts @IntegrationServices
Feature: Districts Index API
  As a system user
  I want to retrieve districts information through the web interface
  So that I can access district data for various operations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | priority                  | u=0, i                                                                                                                                        |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | none                                                                                                                                           |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |

  @Positive @Smoke
  Scenario: Retrieve districts list successfully
    When I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system

  @Positive @Functional
  Scenario: Verify districts page contains expected HTML elements
    When I send the GET request to "districts_index" endpoint with dynamic access token, path and query parameters
      |QueryParamName|queryparamvalue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain element "h2" with content "District"
    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: Verify districts data structure and content
    When I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value    |
      | District |
      | table    |
      | data     |
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Verify response time performance for districts retrieval
    When I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @Security
  Scenario: Verify districts access with valid session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=qt4lkt9qcmn0m6kb8t4u4as302; PHPSESSID=qt4lkt9qcmn0m6kb8t4u4as302; XSRF-TOKEN=eyJpdiI6ImtCZjZGdUNobTZwQ1pyU1JybmNhRnc9PSIsInZhbHVlIjoiN1NQNy96SkdXc1pZOGpOMktEUlBVaVFWUHpZTjZKYWFGLzgwYkNIWFhVQ2pIWmdDSHhnNlUrZGpGTzlwUVloMGpUcUhVYWJScUJpQWNrbzV4UVFqb3pHSU92ZW9HaTI2NWF1YklkNlRNeEM0dkJHL1pwcjA3NzZqTktyTFZzN1giLCJtYWMiOiJjYzQ0OTljYTlkNzQzZmUxNmJkYjI0MGJiOTVjY2VmNzFhM2M1ZTA4MDFiMTNlMTRlMzA2ZGFlMmU4YTQ0MjY2IiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access districts without authentication cookies
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access districts with invalid session token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | XSRF-TOKEN=invalid_token; PHPSESSID=invalid_session                                                                                           |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Access districts with malformed URL
#    When I send the GET request to "districts_index_invalid" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access districts with expired session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID=expired_session_token; CAKEPHP=expired_cake_token                                                                                   |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access districts with missing session ID header
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en                                                                                                               |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access districts with SQL injection attempt in session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID='; DROP TABLE districts; --                                                                                                          |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access districts with XSS attempt in headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | x-ht-session-id           | <script>alert('xss')</script>                                                                                                                 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: Verify districts endpoint handles concurrent requests
    When I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Boundary @Validation
  Scenario: Verify districts endpoint with maximum header size
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
      | custom-header             | very_long_header_value_that_exceeds_normal_limits_but_should_still_be_handled_properly_by_the_server_without_causing_issues |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Integration @EndToEnd
  Scenario: Complete districts retrieval workflow with session validation
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=qt4lkt9qcmn0m6kb8t4u4as302; PHPSESSID=qt4lkt9qcmn0m6kb8t4u4as302; XSRF-TOKEN=eyJpdiI6ImtCZjZGdUNobTZwQ1pyU1JybmNhRnc9PSIsInZhbHVlIjoiN1NQNy96SkdXc1pZOGpOMktEUlBVaVFWUHpZTjZKYWFGLzgwYkNIWFhVQ2pIWmdDSHhnNlUrZGpGTzlwUVloMGpUcUhVYWJScUJpQWNrbzV4UVFqb3pHSU92ZW9HaTI2NWF1YklkNlRNeEM0dkJHL1pwcjA3NzZqTktyTFZzN1giLCJtYWMiOiJjYzQ0OTljYTlkNzQzZmUxNmJkYjI0MGJiOTVjY2VmNzFhM2M1ZTA4MDFiMTNlMTRlMzA2ZGFlMmU4YTQ0MjY2IiwidGFnIjoiIn0%3D |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "districts_index" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system
    And validating the response contains the following values
      | Value    |
      | District |
      | table    |

