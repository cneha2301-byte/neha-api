@BizomWebAPI @AreasManagement @PostAddAreas @MasterDataManagement @CE
Feature: Add Areas Management API
  As a system user
  I want to add new areas through the web interface
  So that I can create and manage area data in the system

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
      | referer                   | https://devuitest.bizomdev.in/areas/add                                                                                                       |
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
#  Scenario: Add area successfully with valid form data
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "302"
#    And verify response time is less than "2000" milliseconds
#    And I validate that the operation was successfully completed in the system

#  @Positive @Functional
#  Scenario: Verify successful area creation with redirect to dashboard
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName    | HeaderValue                                    |
#      | Location      | https://devuitest.bizomdev.in/companies/dashboard |
#    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: Verify area data is correctly stored in database
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data;                                                                                                             |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
     
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds


  @Positive @Performance
  Scenario: Verify response time performance for area creation
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data;                                                                                                             |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
     
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Positive @Security
  Scenario: Verify area creation with valid session and CSRF token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data;                                                                                                             |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
     
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds

#  @Positive @RedirectValidation
#  Scenario: Verify redirect to dashboard after successful area creation
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName    | HeaderValue                                    |
#      | Location      | https://devuitest.bizomdev.in/companies/dashboard |
#    And verify response time is less than "2000" milliseconds
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Attempt to add area with missing required fields
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_MissingFields.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "422"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Attempt to add area with invalid data types
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_InvalidData.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "422"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Attempt to add area without authentication cookies
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "401"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Attempt to add area with invalid session token
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | XSRF-TOKEN=invalid_token; PHPSESSID=invalid_session                                                                                           |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "401"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Attempt to add area with expired session
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | PHPSESSID=expired_session_token; CAKEPHP=expired_cake_token                                                                                   |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "401"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Attempt to add area with missing CSRF token
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3 |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "419"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Attempt to add area with SQL injection in name field
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_SQLInjection.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "422"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Attempt to add area with XSS in name field
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_XSS.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "422"
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Attempt to add area with malformed URL
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @MethodValidation
#  Scenario: Attempt to add area with unsupported HTTP method
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "areas_add" endpoint
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: Verify area creation endpoint handles concurrent requests
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data;                                                                                                             |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
     
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

#  @Integration @EndToEnd
#  Scenario: Complete area creation workflow with redirect and database validation
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName    | HeaderValue                                    |
#      | Location      | https://devuitest.bizomdev.in/companies/dashboard |
#    And verify response time is less than "2000" milliseconds
#    And I validate that the operation was successfully completed in the system
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#
#  @Boundary @Validation
#  Scenario: Attempt to add area with maximum field length values
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | content-type              | multipart/form-data;                                                                                                             |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request with "areas_add_MaxLength.txt" filepath to "areas_add" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#
#    Then I should see the response code as "422"
#    And verify response time is less than "2000" milliseconds

  @Negative @RateLimit
  Scenario: Attempt to add multiple areas rapidly
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data;                                                                                                             |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=e2fvsd1sjjt5p3fph7incbtme3; PHPSESSID=e2fvsd1sjjt5p3fph7incbtme3; XSRF-TOKEN=eyJpdiI6IjBjQ0RNRjYzRk9VbGl1VGFuMUo1N0E9PSIsInZhbHVlIjoib0ovTmZoSXdWVFpTVXJZSno3UE5lNC8rRCtENTVLQk1jWHNmYkRmSnUzNXd4elY2RDRzK1ZieEQ5enJBU1Z6dlVCV0F6c3RwYXM3L2Y4T1BOQWtDd2RQMTZ4bWRTd2V6clNnRlpkZmxjWmxFWUJXbkgrckpWeTNGMFluODFOZTMiLCJtYWMiOiIyNjhhNzgwZGIzNWQ5ZTA0ZmQxNTIyYmMyYTA5YzE4ZmZiODkzMDlhYTk3NTIxOTZmODY4NWM2Nzc4MTM1OTk1IiwidGFnIjoiIn0%3D |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
     
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds
    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
     
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds
    And I send the POST request with "areas_add_Valid.txt" filepath to "areas_add" endpoint
      | FormKey | FormValue |
      | _method | POST      |
     
    Then I should see the response code as "302"
    And verify response time is less than "2000" milliseconds
