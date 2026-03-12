@BizomWebAPI @CE @SubbrandsManagement @GetSubbrands @OutletManagement
Feature: Subbrands Management API
  As a system user
  I want to retrieve subbrands information through the web interface
  So that I can access subbrands data for management and configuration operations

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
  Scenario: Retrieve subbrands list successfully
    When I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system

#  @Positive @Functional
#  Scenario: Verify subbrands page contains expected HTML elements
#    When I send the GET request to "subbrands" endpoint
#    Then I should see the response code as "200"
#    And verify the HTML response
#      | Path                    | Value                    |
#      | html.head.title         | Subbrands               |
#      | html.body               | table                    |
#    And verify response time is less than "2000" milliseconds

#  @Positive @DataValidation
#  Scenario: Verify subbrands data structure and content
#    When I send the GET request to "subbrands" endpoint
#    Then I should see the response code as "200"
#    And validating the response contains the following values
#      | Value           |
#      | Subbrand        |
#      | table           |
#      | data            |
#      | brand           |
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Verify response time performance for subbrands retrieval
    When I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @Security
  Scenario: Verify subbrands access with valid session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6Ii9yWUFzMkg5V1JyNDZzQmloK2RtRGc9PSIsInZhbHVlIjoiWFBiRzdIVFVWblF1S1o5ZE5IZ1ZyWDg2RkhhQ1V2WUFQc1lLQlBjL1hYcGtUZE44UXpnMG85dFBnbWJucjBVNE9yN0JCNXpNZTIxZ2pGc1NMU2pPR2l4VzdIUTRsc1pweXNZZnN2L0FaNk9jUWk2NHlMam1nbS9OV1NkSjAvUlEiLCJtYWMiOiI1NmNmMzU1ZWI5N2VhODljYWFjNzM5YzZlMzIyMWQ0MjcxYWVkNmE1NzZkYzAxMTcwMDA4NmQ2OTg3ZjUxMTFiIiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subbrands without authentication cookies
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subbrands with invalid session token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | XSRF-TOKEN=invalid_token; PHPSESSID=invalid_session                                                                                           |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Access subbrands with malformed URL
#    When I send the GET request to "subbrands_invalid" endpoint
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subbrands with expired session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID=expired_session_token; CAKEPHP=expired_cake_token                                                                                   |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subbrands with missing session ID header
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en                                                                                                               |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subbrands with SQL injection attempt in session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID='; DROP TABLE subbrands; --                                                                                                         |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access subbrands with XSS attempt in headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | x-ht-session-id           | <script>alert('xss')</script>                                                                                                                 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: Verify subbrands endpoint handles concurrent requests
    When I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Boundary @Validation
  Scenario: Verify subbrands endpoint with maximum header size
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
      | custom-header             | very_long_header_value_that_exceeds_normal_limits_but_should_still_be_handled_properly_by_the_server_without_causing_issues |
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Integration @EndToEnd
#  Scenario: Complete subbrands retrieval workflow with session validation
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | cache-control             | max-age=0                                                                                                                                     |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6Ii9yWUFzMkg5V1JyNDZzQmloK2RtRGc9PSIsInZhbHVlIjoiWFBiRzdIVFVWblF1S1o5ZE5IZ1ZyWDg2RkhhQ1V2WUFQc1lLQlBjL1hYcGtUZE44UXpnMG85dFBnbWJucjBVNE9yN0JCNXpNZTIxZ2pGc1NMU2pPR2l4VzdIUTRsc1pweXNZZnN2L0FaNk9jUWk2NHlMam1nbS9OV1NkSjAvUlEiLCJtYWMiOiI1NmNmMzU1ZWI5N2VhODljYWFjNzM5YzZlMzIyMWQ0MjcxYWVkNmE1NzZkYzAxMTcwMDA4NmQ2OTg3ZjUxMTFiIiwidGFnIjoiIn0%3D |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "subbrands" endpoint
#    Then I should see the response code as "200"
#    And contentType as "text/html; charset=UTF-8"
#    And verify response time is less than "2000" milliseconds
#    And I validate that the operation was successfully completed in the system
#    And validating the response contains the following values
#      | Value           |
#      | Subbrand        |
#      | table           |
#      | brand           |

#  @Negative @MethodValidation
#  Scenario: Access subbrands with unsupported HTTP method
#    When I send the POST request to "subbrands" endpoint
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @ContentType
#  Scenario: Access subbrands with unsupported content type
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | application/json                                                                                                                               |
#      | Content-Type              | application/json                                                                                                                               |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the GET request to "subbrands" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Negative @RateLimit
  Scenario: Access subbrands with excessive request rate
    When I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I send the GET request to "subbrands" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
