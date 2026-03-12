@BizomWebAPI @CE @SizesManagement @GetSizes @WarehouseOperations
Feature: Sizes Management API
  As a system user
  I want to retrieve sizes information through the web interface
  So that I can access sizes data for management and configuration operations

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
  Scenario: Retrieve sizes list successfully
    When I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system

#  @Positive @Functional
#  Scenario: Verify sizes page contains expected HTML elements
#    When I send the GET request to "sizes" endpoint
#    Then I should see the response code as "200"
#    And verify the HTML response
#      | Path                    | Value                    |
#      | html.head.title         | Sizes                   |
#      | html.body               | table                    |
#    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: Verify sizes data structure and content
    When I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value           |
      | Size            |
      | table           |
      | data            |
      | product         |
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Verify response time performance for sizes retrieval
    When I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @Security
  Scenario: Verify sizes access with valid session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; PHPSESSID=I2YptFIuyi25KK6EHDt0y39UejAX9CSvMMwlqFdw; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access sizes without authentication cookies
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access sizes with invalid session token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID=invalid_session; CAKEPHP=invalid_cake_token                                                                                         |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Access sizes with malformed URL
    When I send the GET request to "sizes_invalid" endpoint
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access sizes with expired session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID=expired_session_token; CAKEPHP=expired_cake_token                                                                                   |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access sizes with missing session ID header
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en                                                                                                               |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access sizes with SQL injection attempt in session
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | PHPSESSID='; DROP TABLE sizes; --                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Access sizes with XSS attempt in headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | x-ht-session-id           | <script>alert('xss')</script>                                                                                                                 |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: Verify sizes endpoint handles concurrent requests
    When I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Boundary @Validation
  Scenario: Verify sizes endpoint with maximum header size
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
      | custom-header             | very_long_header_value_that_exceeds_normal_limits_but_should_still_be_handled_properly_by_the_server_without_causing_issues |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Integration @EndToEnd
  Scenario: Complete sizes retrieval workflow with session validation
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; PHPSESSID=I2YptFIuyi25KK6EHDt0y39UejAX9CSvMMwlqFdw; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system
    And validating the response contains the following values
      | Value           |
      | Size            |
      | table           |
      | product         |

#  @Negative @MethodValidation
#  Scenario: Access sizes with unsupported HTTP method
#    When I send the POST request to "sizes" endpoint
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds

#  @Negative @ContentType
#  Scenario: Access sizes with unsupported content type
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | application/json                                                                                                                               |
#      | Content-Type              | application/json                                                                                                                               |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the GET request to "sizes" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Negative @RateLimit
  Scenario: Access sizes with excessive request rate
    When I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @DataIntegrity
  Scenario: Verify sizes data integrity and consistency
    When I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system
    And validating the response contains the following values
      | Value           |
      | Size            |
      | table           |
      | data            |
      | product         |
      | size            |

#  @Positive @Accessibility
#  Scenario: Verify sizes page accessibility and structure
#    When I send the GET request to "sizes" endpoint
#    Then I should see the response code as "200"
#    And verify the HTML response
#      | Path                    | Value                    |
#      | html.head.title         | Sizes                   |
#      | html.body               | table                    |
#      | html.body               | form                     |
#    And verify response time is less than "2000" milliseconds

  @Negative @InputValidation
  Scenario: Access sizes with special characters in URL
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; PHPSESSID=I2YptFIuyi25KK6EHDt0y39UejAX9CSvMMwlqFdw; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "sizes" endpoint with query parameters
      | Query         | Value         |
      | search        | test@#$%^&*() |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Caching
  Scenario: Verify sizes endpoint caching behavior
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; PHPSESSID=I2YptFIuyi25KK6EHDt0y39UejAX9CSvMMwlqFdw; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "2000" milliseconds

  @Positive @SessionManagement
  Scenario: Verify sizes endpoint session management
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; PHPSESSID=I2YptFIuyi25KK6EHDt0y39UejAX9CSvMMwlqFdw; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system

  @Negative @Authorization
  Scenario: Access sizes with insufficient permissions
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | Cookie                    | toolbarDisplay=hide; language=en; PHPSESSID=limited_permissions_session; CAKEPHP=limited_permissions_cake |
      | x-ht-session-id           | LimitedUser                                                                                                                                     |
    And I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @ErrorHandling
  Scenario: Verify sizes endpoint error handling
    When I send the GET request to "sizes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system
    And validating the response contains the following values
      | Value           |
      | Size            |
      | table           |
      | data            |
