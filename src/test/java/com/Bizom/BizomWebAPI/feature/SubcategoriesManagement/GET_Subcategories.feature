@BizomWebAPI @CE @SubcategoriesManagement @GetSubcategories @OutletManagement
Feature: Subcategories Management API
  As a system user
  I want to retrieve subcategories information through the web interface
  So that I can access subcategories data for management and configuration operations

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
  Scenario: Retrieve subcategories list successfully
    When I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system

#  @Positive @Functional
#  Scenario: Verify subcategories page contains expected HTML elements
#    When I send the GET request to "subcategories_index" endpoint
#    Then I should see the response code as "200"
#    And verify the HTML response
#      | Path                    | Value                    |
#      | html.head.title         | Subcategories           |
#      | html.body               | table                    |
#    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: Verify subcategories data structure and content
    When I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value           |
      | Subcategory     |
      | table           |
      | data            |
      | category        |
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Verify response time performance for subcategories retrieval
    When I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @Security
  Scenario: Verify subcategories access with valid session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IndveFBEeHNTTkdwWUFnNUlBcnRkMEE9PSIsInZhbHVlIjoibHpabExNSk9zTTNhVFBHSy9nanhUWW5RVGp1TVo2ckZXL0ZPK2VydVY3VnBHVGFTcGtFbkxJd1dldTg3eXJnY2tySEtuSVBoMkhKNjJyL0FZN3d3T0owZVRaMjBPa2RqT0dJbXhRMHFYaGIybFZ2YU1LK0JZa1pFVk40UkNGd0MiLCJtYWMiOiI5NDIwN2U2MmZkN2E3OGUyNmEyZDgwYmEyYmU3NTk0MjY5NDdlNDFiNDFlMWIxMzVmN2NlZTNkYWFlY2IyMDkyIiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subcategories without authentication cookies
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subcategories with invalid session token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | XSRF-TOKEN=invalid_token; PHPSESSID=invalid_session                                                                                           |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Access subcategories with malformed URL
#    When I send the GET request to "subcategories_index_invalid" endpoint
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subcategories with expired session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID=expired_session_token; CAKEPHP=expired_cake_token                                                                                   |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subcategories with missing session ID header
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en                                                                                                               |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subcategories with SQL injection attempt in session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID='; DROP TABLE subcategories; --                                                                                                      |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subcategories with XSS attempt in headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | x-ht-session-id           | <script>alert('xss')</script>                                                                                                                 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: Verify subcategories endpoint handles concurrent requests
    When I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Boundary @Validation
  Scenario: Verify subcategories endpoint with maximum header size
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
      | custom-header             | very_long_header_value_that_exceeds_normal_limits_but_should_still_be_handled_properly_by_the_server_without_causing_issues |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Integration @EndToEnd
  Scenario: Complete subcategories retrieval workflow with session validation
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IndveFBEeHNTTkdwWUFnNUlBcnRkMEE9PSIsInZhbHVlIjoibHpabExNSk9zTTNhVFBHSy9nanhUWW5RVGp1TVo2ckZXL0ZPK2VydVY3VnBHVGFTcGtFbkxJd1dldTg3eXJnY2tySEtuSVBoMkhKNjJyL0FZN3d3T0owZVRaMjBPa2RqT0dJbXhRMHFYaGIybFZ2YU1LK0JZa1pFVk40UkNGd0MiLCJtYWMiOiI5NDIwN2U2MmZkN2E3OGUyNmEyZDgwYmEyYmU3NTk0MjY5NDdlNDFiNDFlMWIxMzVmN2NlZTNkYWFlY2IyMDkyIiwidGFnIjoiIn0%3D |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system
    And validating the response contains the following values
      | Value           |
      | Subcategory     |
      | table           |
      | category        |

#  @Negative @MethodValidation
#  Scenario: Access subcategories with unsupported HTTP method
#    When I send the POST request to "subcategories_index" endpoint
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds

#  @Negative @ContentType
#  Scenario: Access subcategories with unsupported content type
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | application/json                                                                                                                               |
#      | Content-Type              | application/json                                                                                                                               |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the GET request to "subcategories_index" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Negative @RateLimit
  Scenario: Access subcategories with excessive request rate
    When I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I send the GET request to "subcategories_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
