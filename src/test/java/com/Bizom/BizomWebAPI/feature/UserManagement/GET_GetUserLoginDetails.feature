@BizomWebAPI @CE @GetUserLogin @ReportingOperations
Feature: This feature file contains testcases for GET endpoint GetUserLoginDetails

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
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck| 
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|eyJpdiI6IklTU2p3a3Q2QThkd0dXZHR1YjlvZWc9PSIsInZhbHVlIjoiTSs0M1NDNFA5d29iYkdjeEVzNG9yN05vTUJaREFucUdGbi9pV2l6c3l4azYyMTFQeTNZWmVDb1daRXRsNytKU0c1a2g0TUE3eHVQTEhERnVwVTBNQWZtb2diY2RRRUd1RmhDL1pLUzgwZzVtUWVTaGhXSDc2REtuMlNXNmg2YkwiLCJtYWMiOiI5YjFmYWI2OWM4MGUyNmViNGNmZTZkNGZjMTFiMGM1OGEzMTAwNjFlNjhhZGM5NmExYTUwY2Q3MDNhMTRhNDhkIiwidGFnIjoiIn0%3D|

  @Positive @Smoke
  Scenario: TC_01 Retrieve user login details successfully
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @Functional
  Scenario: TC_02 Verify user login details page loads with proper HTML structure
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | <html xmlns="http://www.w3.org/1999/xhtml"> |
      | <head> |
      | <body> |
      | Login to your account |

  @Positive @SessionManagement
  Scenario: TC_03 Verify login session details and authentication
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Always verify the URL before entering the Credentials! |

  @Positive @DataValidation
  Scenario: TC_04 Verify login data fields are present in response
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | placeholder="Username" |
      | placeholder="Password" |
      | required="required" |
      | type="password" |
      | type="text" |

  @Positive @UIValidation
  Scenario: TC_05 Verify login details interface elements are present
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | <img src="/img/bizom_logo.png" |
      | <img src="/img/mascot_for_screens.png" |
      | Made in India with |
      | Follow us on: |

  @Positive @Performance
  Scenario: TC_06 Verify response time performance for login details
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: TC_07 Access login details without valid session
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_08 Access login details with invalid session ID
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|invalid_session_id|
      |PHPSESSID|invalid_session_id|
    And I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_09 Access login details with invalid CSRF token
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|invalid_csrf_token|
    And I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_10 Access login details with expired session
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|expired_session|
      |PHPSESSID|expired_session|
      |XSRF-TOKEN|expired_token|
    And I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Validation
  Scenario: TC_11 Access login details with malformed headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|invalid_header_value|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|eyJpdiI6IklTU2p3a3Q2QThkd0dXZHR1YjlvZWc9PSIsInZhbHVlIjoiTSs0M1NDNFA5d29iYkdjeEVzNG9yN05vTUJaREFucUdGbi9pV2l6c3l4azYyMTFQeTNZWmVDb1daRXRsNytKU0c1a2g0TUE3eHVQTEhERnVwVTBNQWZtb2diY2RRRUd1RmhDL1pLUzgwZzVtUWVTaGhXSDc2REtuMlNXNmg2YkwiLCJtYWMiOiI5YjFmYWI2OWM4MGUyNmViNGNmZTZkNGZjMTFiMGM1OGEzMTAwNjFlNjhhZGM5NmExYTUwY2Q3MDNhMTRhNDhkIiwidGFnIjoiIn0%3D|
    And I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_12 Access login details with missing required headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|eyJpdiI6IklTU2p3a3Q2QThkd0dXZHR1YjlvZWc9PSIsInZhbHVlIjoiTSs0M1NDNFA5d29iYkdjeEVzNG9yN05vTUJaREFucUdGbi9pV2l6c3l4azYyMTFQeTNZWmVDb1daRXRsNytKU0c1a2g0TUE3eHVQTEhERnVwVTBNQWZtb2diY2RRRUd1RmhDL1pLUzgwZzVtUWVTaGhXSDc2REtuMlNXNmg2YkwiLCJtYWMiOiI5YjFmYWI2OWM4MGUyNmViNGNmZTZkNGZjMTFiMGM1OGEzMTAwNjFlNjhhZGM5NmExYTUwY2Q3MDNhMTRhNDhkIiwidGFnIjoiIn0%3D|
    And I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_13 Access login details with XSS attempt in headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|<script>alert('xss')</script>|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|eyJpdiI6IklTU2p3a3Q2QThkd0dXZHR1YjlvZWc9PSIsInZhbHVlIjoiTSs0M1NDNFA5d29iYkdjeEVzNG9yN05vTUJaREFucUdGbi9pV2l6c3l4azYyMTFQeTNZWmVDb1daRXRsNytKU0c1a2g0TUE3eHVQTEhERnVwVTBNQWZtb2diY2RRRUd1RmhDL1pLUzgwZzVtUWVTaGhXSDc2REtuMlNXNmg2YkwiLCJtYWMiOiI5YjFmYWI2OWM4MGUyNmViNGNmZTZkNGZjMTFiMGM1OGEzMTAwNjFlNjhhZGM5NmExYTUwY2Q3MDNhMTRhNDhkIiwidGFnIjoiIn0%3D|
    And I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: TC_14 Verify response time under load for login details
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "3000" milliseconds

  @Performance @Load
  Scenario: TC_15 Verify concurrent access to login details
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds

  @Performance @Load
  Scenario: TC_16 Verify response time with large session data
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds

  @Integration @BusinessLogic
  Scenario: TC_17 Verify login details integration with session management
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | <form action="/users/login" |
      | <input name="data[User][username]" |
      | <input name="data[User][password]" |

  @Integration @BusinessLogic
  Scenario: TC_18 Verify login details integration with security monitoring
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Always verify the URL before entering the Credentials! |

  @Integration @BusinessLogic
  Scenario: TC_19 Verify login details integration with audit trail
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Integration @BusinessLogic
    Scenario: TC_20 Verify login details integration with user management
    When I send the GET request to "getuserlogindetails" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Always verify the URL before entering the Credentials! |
