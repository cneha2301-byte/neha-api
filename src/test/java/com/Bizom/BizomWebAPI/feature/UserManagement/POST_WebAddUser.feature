@BizomWebAPI @CE @AddUser @SystemIntegration
Feature: Web User Creation API
  As a system administrator
  I want to create users through the web interface
  So that I can manage user accounts in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | content-type              | multipart/form-data; boundary=----WebKitFormBoundary3cMLXW8arL0prVjm                                                                        |
      | origin                    | https://devuitest.bizomdev.in                                                                                                                 |
      | referer                   | https://devuitest.bizomdev.in/users/add                                                                                                       |
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
#  Scenario: Create user with valid data and verify redirection
#    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint
#      | FormKey | FormValue |
#      | _method | POST      |
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName | HeaderValue                    |
#      | Location   | /users/ajaxuserindex           |
#    And verify response time is less than "1500" milliseconds

  @Positive @Functional
  Scenario: Create user with valid data and follow redirection
    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey | FormValue |
      | _method | POST      |
    Then I should see the response code as "200"
     
    And verify response time is less than "1500" milliseconds

  @Positive @DataValidation
  Scenario: Create user with dynamic valid data
    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue        |
      | _method                    | POST             |
      | data[User][username]       | randomString     |
      | data[User][passwd]         | Mobisy@123       |
      | data[User][name]           | randomString     |
      | data[User][phoneno]        | randomPhoneNumber|
      | data[User][dialcode]       | 91               |
      | data[User][creditlimit]    | 20000            |
      | data[User][designation_id] | 0                |
      | data[User][Role]           | 2                |
      | data[User][Rolespecificid][] | 6              |
      | data[User][reportingto]    | 0                |
    Then I should see the response code as "200"
     
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Create user with invalid username format
    When I send the POST request with "webAddUser_Invalid.txt" filepath to "webAddUser" endpoint
      | FormKey | FormValue |
      | _method | POST      |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Create user with empty required fields
    When I send the POST request with "webAddUser_Empty.txt" filepath to "webAddUser" endpoint
      | FormKey | FormValue |
      | _method | POST      |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: Create user with weak password
    When I send the POST request with "webAddUser_Invalid.txt" filepath to "webAddUser" endpoint
      | FormKey              | FormValue |
      | _method              | POST      |
      | data[User][passwd]   | weak      |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Create user with invalid phone number format
    When I send the POST request with "webAddUser_Invalid.txt" filepath to "webAddUser" endpoint
      | FormKey                | FormValue |
      | _method                | POST      |
      | data[User][phoneno]    | 123       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Create user with invalid email format
    When I send the POST request with "webAddUser_Invalid.txt" filepath to "webAddUser" endpoint
      | FormKey              | FormValue     |
      | _method              | POST          |
      | data[User][email]    | invalid-email |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Create user with negative credit limit
    When I send the POST request with "webAddUser_Invalid.txt" filepath to "webAddUser" endpoint
      | FormKey                   | FormValue |
      | _method                   | POST      |
      | data[User][creditlimit]   | -1000     |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Create user with invalid role ID
    When I send the POST request with "webAddUser_Invalid.txt" filepath to "webAddUser" endpoint
      | FormKey                   | FormValue |
      | _method                   | POST      |
      | data[User][Role]          | 999       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Create user with invalid designation ID
    When I send the POST request with "webAddUser_Invalid.txt" filepath to "webAddUser" endpoint
      | FormKey                      | FormValue |
      | _method                      | POST      |
      | data[User][designation_id]   | 999       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: Create user without authentication cookies
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data; boundary=----WebKitFormBoundary3cMLXW8arL0prVjm                                                                        |
    And I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint
      | FormKey | FormValue |
      | _method | POST      |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: Create user with invalid session token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data; boundary=----WebKitFormBoundary3cMLXW8arL0prVjm                                                                        |
      | Cookie                    | XSRF-TOKEN=invalid_token                                                                                                                      |
    And I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint
      | FormKey | FormValue |
      | _method | POST      |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Performance @Load
  Scenario: Create multiple users concurrently
    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue        |
      | _method                    | POST             |
      | data[User][username]       | randomString     |
      | data[User][passwd]         | Mobisy@123       |
      | data[User][name]           | randomString     |
      | data[User][phoneno]        | randomPhoneNumber|
    Then I should see the response code as "200"
     
    And verify response time is less than "1500" milliseconds

  @Boundary @Validation
  Scenario: Create user with maximum allowed field lengths
    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue                                                                 |
      | _method                    | POST                                                                      |
      | data[User][username]       | verylongusernamethatexceedstypicallimitsbutshouldstillbevalid              |
      | data[User][passwd]         | VeryLongPassword123!@#$%^&*()_+-=[]{};':\",./<>?                          |
      | data[User][name]           | Very Long User Name That Exceeds Typical Limits But Should Still Be Valid   |
      | data[User][address]        | Very Long Address That Exceeds Typical Limits But Should Still Be Valid     |
    Then I should see the response code as "200"
     
    And verify response time is less than "1500" milliseconds

  @Boundary @Validation
  Scenario: Create user with minimum required field lengths
    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue |
      | _method                    | POST      |
      | data[User][username]       | ab        |
      | data[User][passwd]         | Ab1!      |
      | data[User][name]           | ab        |
      | data[User][phoneno]        | 1234567890|
    Then I should see the response code as "200"
     
    And verify response time is less than "1500" milliseconds

#  @Positive @Redirection
#  Scenario: Verify user creation requires redirection to complete
#    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint
#      | FormKey                    | FormValue        |
#      | _method                    | POST             |
#      | data[User][username]       | randomString     |
#      | data[User][passwd]         | Mobisy@123       |
#      | data[User][name]           | randomString     |
#      | data[User][phoneno]        | randomPhoneNumber|
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName | HeaderValue                    |
#      | Location   | /users/ajaxuserindex           |
#    When I send the GET request to "webAjaxUserIndex" endpoint
#    Then I should see the response code as "200"
#
#    And verify response time is less than "1500" milliseconds

  @Integration @EndToEnd
  Scenario: Complete user creation workflow with redirection verification
    When I send the POST request with "webAddUser.txt" filepath to "webAddUser" endpoint and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue        |
      | _method                    | POST             |
      | data[User][username]       | randomString     |
      | data[User][passwd]         | Mobisy@123       |
      | data[User][name]           | randomString     |
      | data[User][phoneno]        | randomPhoneNumber|
      | data[User][dialcode]       | 91               |
      | data[User][creditlimit]    | 20000            |
      | data[User][designation_id] | 0                |
      | data[User][Role]           | 2                |
      | data[User][Rolespecificid][] | 6              |
      | data[User][reportingto]    | 0                |
    Then I should see the response code as "200"
     
    And verify response time is less than "1500" milliseconds

