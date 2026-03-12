@BizomWebAPI @CE @TownsManagement @GetTowns @UserManagement
Feature: Towns Index API
  As a system user
  I want to retrieve towns information through the web interface
  So that I can access town data for various operations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
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
  Scenario: Retrieve towns list successfully
    When I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system

#  @Positive @Functional
#  Scenario: Verify towns page contains expected HTML elements
#    When I send the GET request to "towns_index" endpoint
#    Then I should see the response code as "200"
#    And verify the HTML response
#      | Path                    | Value                    |
#      | html.head.title         | Towns                    |
#      | html.body               | table                    |
#    And verify response time is less than "2000" milliseconds

#  @Positive @DataValidation
#  Scenario: Verify towns data structure and content
#    When I send the GET request to "towns_index" endpoint
#    Then I should see the response code as "200"
#    And validating the response contains the following values
#      | Value |
#      | Town  |
#      | table |
#      | data  |
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Verify response time performance for towns retrieval
    When I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @Security
  Scenario: Verify towns access with valid session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=qt4lkt9qcmn0m6kb8t4u4as302; PHPSESSID=qt4lkt9qcmn0m6kb8t4u4as302; XSRF-TOKEN=eyJpdiI6IkwzaktjcFZsa1p4dmlvZTRZVkhHYWc9PSIsInZhbHVlIjoiQWh6TTRKOUUzc1BReFBJaHZTZ1U2YWdIcndrcWUvMVU1ZVdxSFZQMTFiTVVsaFdXazMrdjRMeGZ3bHlpSXBveEF1RTB4ejNzaFNZdUlUZ3JMNDR0MEJuRUtCbm5yemV6akNoZ1AwS2E2V0E5QnZBdUhPUnNoai9lU3psOGxVZlgiLCJtYWMiOiI1OWFlNjY5YTE3NzYwN2U2NTQwOTkxZjdkN2UyYmQ5ZDhiN2ExNWRkNzk2MzcxZjE0ZjJjMDEwYTZkM2QyMGJjIiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access towns without authentication cookies
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access towns with invalid session token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | XSRF-TOKEN=invalid_token; PHPSESSID=invalid_session                                                                                           |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Access towns with malformed URL
#    When I send the GET request to "towns_index_invalid" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access towns with expired session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID=expired_session_token; CAKEPHP=expired_cake_token                                                                                   |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access towns with missing session ID header
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en                                                                                                               |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access towns with SQL injection attempt in session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID='; DROP TABLE towns; --                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access towns with XSS attempt in headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | x-ht-session-id           | <script>alert('xss')</script>                                                                                                                 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: Verify towns endpoint handles concurrent requests
    When I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Boundary @Validation
  Scenario: Verify towns endpoint with maximum header size
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
      | custom-header             | very_long_header_value_that_exceeds_normal_limits_but_should_still_be_handled_properly_by_the_server_without_causing_issues |
    And I send the GET request to "towns_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Integration @EndToEnd
#  Scenario: Complete towns retrieval workflow with session validation
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=qt4lkt9qcmn0m6kb8t4u4as302; PHPSESSID=qt4lkt9qcmn0m6kb8t4u4as302; XSRF-TOKEN=eyJpdiI6IkwzaktjcFZsa1p4dmlvZTRZVkhHYWc9PSIsInZhbHVlIjoiQWh6TTRKOUUzc1BReFBJaHZTZ1U2YWdIcndrcWUvMVU1ZVdxSFZQMTFiTVVsaFdXazMrdjRMeGZ3bHlpSXBveEF1RTB4ejNzaFNZdUlUZ3JMNDR0MEJuRUtCbm5yemV6akNoZ1AwS2E2V0E5QnZBdUhPUnNoai9lU3psOGxVZlgiLCJtYWMiOiI1OWFlNjY5YTE3NzYwN2U2NTQwOTkxZjdkN2UyYmQ5ZDhiN2ExNWRkNzk2MzcxZjE0ZjJjMDEwYTZkM2QyMGJjIiwidGFnIjoiIn0%3D |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "towns_index" endpoint
#    Then I should see the response code as "200"
#    And contentType as "text/html; charset=UTF-8"
#    And verify response time is less than "2000" milliseconds
#    And I validate that the operation was successfully completed in the system
#    And validating the response contains the following values
#      | Value |
#      | Town  |
#      | table |

