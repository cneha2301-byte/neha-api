@BizomWebAPI @CE @SubbrandsManagement @PostAddSubbrands @OutletManagement
Feature: Add Subbrands Management API
  As a system user
  I want to add new subbrands through the web interface
  So that I can create and manage subbrand data in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | content-type              | multipart/form-data;                                                                                                            |
      | origin                    | https://devuitest.bizomdev.in                                                                                                                 |
      | priority                  | u=0, i                                                                                                                                        |
      | referer                   | https://devuitest.bizomdev.in/subbrands/add                                                                                                   |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | same-origin                                                                                                                                    |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |

#  @Positive @Smoke
#  Scenario: Add subbrand with valid data and verify redirection
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "302"
#    And verify response time is less than "1500" milliseconds
#    And I validate that the operation was successfully completed in the system

#  @Positive @Functional
#  Scenario: Add subbrand with valid data and follow redirection
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName    | HeaderValue                                    |
#      | Location      | https://devuitest.bizomdev.in/subbrands/index |
#    And verify response time is less than "1500" milliseconds

#  @Positive @RedirectValidation
#  Scenario: Add subbrand with valid data and follow redirection to index
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint and follow redirection to "subbrands_index" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds

#  @Positive @DataValidation
#  Scenario: Add subbrand with dynamic valid data
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "302"
#    And verify response time is less than "1500" milliseconds

#  @Negative @Validation
#  Scenario: Add subbrand with missing required fields
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_MissingFields.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "422"
#    And verify response time is less than "1500" milliseconds

#  @Negative @Validation
#  Scenario: Add subbrand with invalid data types
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_InvalidData.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "422"
#    And verify response time is less than "1500" milliseconds

#  @Negative @Security
#  Scenario: Add subbrand without authentication cookies
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "401"
#    And verify response time is less than "1500" milliseconds

#  @Negative @Security
#  Scenario: Add subbrand with invalid session token
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | XSRF-TOKEN=invalid_token; PHPSESSID=invalid_session                                                                                           |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "401"
#    And verify response time is less than "1500" milliseconds

#  @Negative @Security
#  Scenario: Add subbrand with expired session
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | PHPSESSID=expired_session_token; CAKEPHP=expired_cake_token                                                                                   |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "401"
#    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: Add subbrand with missing CSRF token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data;                                                                                                            |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
    Then I should see the response code as "419"
    And verify response time is less than "1500" milliseconds

#  @Negative @Security
#  Scenario: Add subbrand with XSS in name field
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_XSS.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "422"
#    And verify response time is less than "1500" milliseconds

#  @Negative @MethodValidation
#  Scenario: Add subbrand with unsupported HTTP method
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "subbrands_add" endpoint
#    Then I should see the response code as "405"
#    And verify response time is less than "1500" milliseconds

#  @Performance @Load
#  Scenario: Add multiple subbrands concurrently
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "302"
#    And verify response time is less than "1500" milliseconds

#  @Boundary @Validation
#  Scenario: Add subbrand with maximum allowed field lengths
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_MaxLength.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "422"
#    And verify response time is less than "1500" milliseconds

#  @Boundary @Validation
#  Scenario: Add subbrand with minimum required field lengths
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey   | FormValue |
#      | _method   | POST      |
#      | name      | ab        |
#      | is_active | 1         |
#    Then I should see the response code as "302"
#    And verify response time is less than "1500" milliseconds

#  @Positive @Redirection
#  Scenario: Verify subbrand creation requires redirection to complete
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName    | HeaderValue                                    |
#      | Location      | https://devuitest.bizomdev.in/subbrands/index |
#    When I send the GET request to "subbrands_index" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds

#  @Integration @EndToEnd
#  Scenario: Complete subbrand creation workflow with redirection verification
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                            |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6Im9DdURmTExsQURhSjBmNWNIOFZOVEE9PSIsInZhbHVlIjoiaUJHb2FYS3l1b3hNQ0JNdWJxVzB5bk5CSWhCWmdYR0NQNktsR0JxcW9YZFBmZURid2ZEcXRSYWNnMzdhaEgzSVJ6cWtkUytmSkE5RGpsaXd0TFNVYm1VYUZIRFlFVEZsT0V6MWNmU0RPbzB5K0c4RWFrTGRVTDF2dnFYZ2JiMWEiLCJtYWMiOiJiMWFiMjQ4NjQyODA4NTNlYTg1Y2UyOTZjYjZmM2QzYzU1ZjI2NTAzOTk2MDcxZmZkMzY3ODM5MjVjNDljYWFiIiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "subbrands_add_Valid.txt" filepath to "subbrands_add" endpoint and follow redirection to "subbrands_index" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And I validate that the operation was successfully completed in the system
