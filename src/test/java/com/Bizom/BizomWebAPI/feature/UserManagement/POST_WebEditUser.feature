@BizomWebAPI @CE @EditUser @SystemIntegration
Feature: Web User Edit API
  As a system administrator
  I want to edit existing users through the web interface
  So that I can update user account information in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | cache-control             | max-age=0                                                                                                                                     |
      | content-type              | multipart/form-data; boundary=----WebKitFormBoundary8WVOIpA0cTGfpeWB                                                                        |
      | origin                    | https://devuitest.bizomdev.in                                                                                                                 |
      | referer                   | https://devuitest.bizomdev.in/users/edit/17                                                                                                  |
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
#  Scenario: Edit user with valid data and verify redirection
#    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
#      | FormKey | FormValue |Path|Value|
#      | _method | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName | HeaderValue                    |
#      | Location   | /users/ajaxuserindex           |
#    And verify response time is less than "1500" milliseconds

  @Positive @Functional
  Scenario: Edit user with valid data and follow redirection
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey | FormValue |Path|Value|
      | _method | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @DataValidation
#  Scenario: Edit user with dynamic valid data and validate database
#    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
#      | FormKey                    | FormValue        |Path|Value|
#      | _method                    | PUT              |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
#      | data[User][username]       | randomString     |    |                                           |
#      | data[User][name]           | randomString     |    |                                           |
#      | data[User][phoneno]        | randomPhoneNumber|    |                                           |
#      | data[User][email]          | test@example.com |    |                                           |
#      | data[User][address]        | Updated Address  |    |                                           |
#      | data[User][employeeid]     | 123456           |    |                                           |
#      | data[User][designation_id] | 2                |    |                                           |
#      | data[User][creditlimit]    | 50000            |    |                                           |
#      | data[User][Role]           | 7                |    |                                           |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And I verify the data got updated as needed from DB
#      | expectedColumn                    | expectedValue        |
#      | DB:users:username: id=(SELECT MAX(id) FROM users)     | randomString         |
#      | DB:users:name: id=(SELECT MAX(id) FROM users)         | randomString         |
#      | DB:users:phoneno: id=(SELECT MAX(id) FROM users)      | randomPhoneNumber    |
#      | DB:users:email: id=(SELECT MAX(id) FROM users)        | test@example.com     |
#      | DB:users:address: id=(SELECT MAX(id) FROM users)      | Updated Address      |
#      | DB:users:employeeid: id=(SELECT MAX(id) FROM users)   | 123456               |
#      | DB:users:designation_id: id=(SELECT MAX(id) FROM users)| 2                   |
#      | DB:users:creditlimit: id=(SELECT MAX(id) FROM users)  | 50000                |
#      | DB:users:role: id=(SELECT MAX(id) FROM users)         | 7                    |

#  @Positive @CompleteWorkflow
#  Scenario: Complete user edit workflow with database validation
#    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
#      | FormKey                    | FormValue        |Path|Value|
#      | _method                    | PUT              |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
#      | data[User][username]       | randomString     |    |                                           |
#      | data[User][name]           | randomString     |    |                                           |
#      | data[User][phoneno]        | randomPhoneNumber|    |                                           |
#      | data[User][address]        | New Test Address |    |                                           |
#      | data[User][employeeid]     | 987654           |    |                                           |
#      | data[User][designation_id] | 3                |    |                                           |
#      | data[User][creditlimit]    | 75000            |    |                                           |
#      | data[User][Role]           | 7                |    |                                           |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And I validate that the operation was successfully completed in the system
#    And I verify the data got updated as needed from DB
#      | expectedColumn                    | expectedValue        |
#      | DB:users:username: id=(SELECT MAX(id) FROM users)     | randomString         |
#      | DB:users:name: id=(SELECT MAX(id) FROM users)         | randomString         |
#      | DB:users:phoneno: id=(SELECT MAX(id) FROM users)      | randomPhoneNumber    |
#      | DB:users:email: id=(SELECT MAX(id) FROM users)        | updated@test.com     |
#      | DB:users:address: id=(SELECT MAX(id) FROM users)      | New Test Address     |
#      | DB:users:employeeid: id=(SELECT MAX(id) FROM users)   | 987654               |
#      | DB:users:designation_id: id=(SELECT MAX(id) FROM users)| 3                   |
#      | DB:users:creditlimit: id=(SELECT MAX(id) FROM users)  | 75000                |
#      | DB:users:role: id=(SELECT MAX(id) FROM users)         | 7                    |

  @Negative @Validation
  Scenario: Edit user with invalid username format
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][username]       | @#$%^&*() |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Edit user with empty required fields
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][username]       |           |    |                       |
      | data[User][name]           |           |    |                       |
      | data[User][phoneno]        |           |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Edit user with invalid email format
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue     |Path|Value|
      | _method                    | PUT           |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][email]          | invalid-email |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Edit user with invalid phone number format
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][phoneno]        | 123       |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Edit user with negative credit limit
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][creditlimit]    | -1000     |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Edit user with invalid designation ID
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][designation_id] | 999       |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: Edit user with invalid role ID
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][Role]           | 999       |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: Edit user without authentication cookies
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data; boundary=----WebKitFormBoundary8WVOIpA0cTGfpeWB                                                                        |
    And I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey | FormValue |Path|Value|
      | _method | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: Edit user with invalid session token
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | content-type              | multipart/form-data; boundary=----WebKitFormBoundary8WVOIpA0cTGfpeWB                                                                        |
      | Cookie                    | XSRF-TOKEN=invalid_token                                                                                                                      |
    And I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey | FormValue |Path|Value|
      | _method | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @DataIntegrity
  Scenario: Edit user with duplicate username
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][username]       | existing_user ||                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @DataIntegrity
  Scenario: Edit user with duplicate email
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][email]          | existing@email.com ||                  |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @DataIntegrity
  Scenario: Edit user with duplicate phone number
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][phoneno]        | 9876543210 |   |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Performance @Load
  Scenario: Edit user with concurrent requests
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue        |Path|Value|
      | _method                    | PUT              |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][username]       | randomString     |    |     |
      | data[User][name]           | randomString     |    |     |
      | data[User][phoneno]        | randomPhoneNumber|    |     |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Boundary @Validation
  Scenario: Edit user with maximum allowed field lengths
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue                                                                 |Path|Value|
      | _method                    | PUT                                                                      |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][username]       | verylongusernamethatexceedstypicallimitsbutshouldstillbevalid              |  |                                           |
      | data[User][name]           | Very Long User Name That Exceeds Typical Limits But Should Still Be Valid   | |                                           |
      | data[User][address]        | Very Long Address That Exceeds Typical Limits But Should Still Be Valid     | |                                           |
      | data[User][email]          | verylongemailaddressthatexceedstypicallimits@verylongdomainname.com        |  |                                           |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Boundary @Validation
  Scenario: Edit user with minimum required field lengths
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][username]       | ab        |    |                                           |
      | data[User][name]           | ab        |    |                                           |
      | data[User][phoneno]        | 1234567890|    |                                           |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @Redirection
#  Scenario: Verify user edit requires redirection to complete
#    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
#      | FormKey                    | FormValue        |Path|Value|
#      | _method                    | PUT              |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
#      | data[User][username]       | randomString     |    |                       |
#      | data[User][name]           | randomString     |    |                       |
#      | data[User][phoneno]        | randomPhoneNumber|    |                       |
#    Then I should see the response code as "302"
#    And verify response headers
#      | HeaderName | HeaderValue                    |
#      | Location   | /users/ajaxuserindex           |
#    When I send the GET request to "webAjaxUserIndex" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds

#  @EndToEnd
#  Scenario: Complete user edit workflow with redirection and database validation
#    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
#      | FormKey                    | FormValue        |Path|Value|
#      | _method                    | PUT              |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
#      | data[User][username]       | randomString     |    |                                           |
#      | data[User][name]           | randomString     |    |                                           |
#      | data[User][phoneno]        | randomPhoneNumber|    |                                           |
#      | data[User][email]          | final@test.com   |    |                                           |
#      | data[User][address]        | Final Test Address|   |                                           |
#      | data[User][employeeid]     | 555555           |    |                                           |
#      | data[User][designation_id] | 4                |    |                                           |
#      | data[User][creditlimit]    | 100000           |    |                                           |
#      | data[User][Role]           | 7                |    |                                           |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And I validate that the operation was successfully completed in the system
#    And I verify the data got updated as needed from DB
#      | expectedColumn                    | expectedValue        |
#      | DB:users:username: id=(SELECT MAX(id) FROM users)     | randomString         |
#      | DB:users:name: id=(SELECT MAX(id) FROM users)         | randomString         |
#      | DB:users:phoneno: id=(SELECT MAX(id) FROM users)      | randomPhoneNumber    |
#      | DB:users:email: id=(SELECT MAX(id) FROM users)        | final@test.com       |
#      | DB:users:address: id=(SELECT MAX(id) FROM users)      | Final Test Address   |
#      | DB:users:employeeid: id=(SELECT MAX(id) FROM users)   | 555555               |
#      | DB:users:designation_id: id=(SELECT MAX(id) FROM users)| 4                   |
#      | DB:users:creditlimit: id=(SELECT MAX(id) FROM users)  | 100000               |
#      | DB:users:role: id=(SELECT MAX(id) FROM users)         | 7                    |

  @Negative @BusinessLogic
  Scenario: Edit user with invalid workflow permissions
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[Userworkflow][sale]   | 999       |    |                       |
      | data[Userworkflow][order]  | 999       |    |                       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @BusinessLogic
  Scenario: Edit user with invalid app call sequence
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[Appcallsequence][0][type] | invalid_type ||                    |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

#  @Positive @WorkflowConfiguration
#  Scenario: Edit user with valid workflow configuration
#    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
#      | FormKey                    | FormValue |Path|Value|
#      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
#      | data[Userworkflow][sale]   | 1         |    |                                           |
#      | data[Userworkflow][order]  | 1         |    |                                           |
#      | data[Userworkflow][collection] | 1    |     |                                           |
#      | data[Userworkflow][activity] | 1       |    |                                           |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And I verify the data got updated as needed from DB
#      | expectedColumn                    | expectedValue |
#      | DB:userworkflows:sale: user_id=(SELECT MAX(user_id) FROM userworkflows) | 1      |
#      | DB:userworkflows:order: user_id=(SELECT MAX(user_id) FROM userworkflows) | 1     |
#      | DB:userworkflows:collection: user_id=(SELECT MAX(user_id) FROM userworkflows) | 1 |
#      | DB:userworkflows:activity: user_id=(SELECT MAX(user_id) FROM userworkflows) | 1  |

  @Positive @CustomFields
  Scenario: Edit user with custom fields
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter and follow redirection to "webAjaxUserIndex" endpoint
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[Custom][name#SingleLineText] | Custom Field Value ||           |
      | data[Custom][image1#Image] | test_image.jpg |           |           |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And I validate that the operation was successfully completed in the system

  @Negative @DataValidation
  Scenario: Edit user with SQL injection attempt
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][username]       | '; DROP TABLE users; -- ||             |
      | data[User][name]           | <script>alert('xss')</script> ||       |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Negative @DataValidation
  Scenario: Edit user with XSS attempt
    When I send the POST request with "webEditUser.txt" filepath to "webEditUser" endpoint with path parameter
      | FormKey                    | FormValue |Path|Value|
      | _method                    | PUT       |id  |DB:users:id: id=(SELECT MAX(id) FROM users)|
      | data[User][address]        | <script>alert('XSS')</script> ||       |
      | data[User][name]           | <img src=x onerror=alert('XSS')> ||    |
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds
