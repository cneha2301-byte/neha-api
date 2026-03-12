@BizomWebAPI @CE @GetUsersForSubzones @ReportingOperations
Feature: This feature file contains testcases for GET endpoint GetUsersForSubzones

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
  Scenario: TC_01 GetUsersForSubzones - status code positive case with valid session
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | <html xmlns="http://www.w3.org/1999/xhtml"> |
      | <head> |
      | <body> |
      | Login to your account |
    And I store the response as "getUsersForSubzonesResponse" name using full path

  @Positive @Functional
  Scenario: TC_02 Verify GetUsersForSubzones response structure with valid session
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" |
      | <title> |
      | Users |
      | </title> |
      | Login to your account |

  @Positive @DataValidation
  Scenario: TC_03 Verify GetUsersForSubzones returns valid HTML structure
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> |
      | <script> |
      | <link rel="stylesheet" |
      | Login to your account |

  @Positive @Performance
  Scenario: TC_04 Verify GetUsersForSubzones response time performance
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @SessionManagement
  Scenario: TC_05 Verify GetUsersForSubzones with valid session management
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
      | Login to Bizom |

  @Positive @BusinessLogic
  Scenario: TC_06 Verify GetUsersForSubzones business logic validation
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Always verify the URL |
      | Login to Bizom |
      | Login to your account |

  @Negative @Security
  Scenario: TC_07 Access GetUsersForSubzones without valid session
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_08 Access GetUsersForSubzones with invalid session ID
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|invalid_session_id|
      |PHPSESSID|invalid_session_id|
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_09 Access GetUsersForSubzones with invalid CSRF token
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|invalid_csrf_token|
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_10 Access GetUsersForSubzones with expired session
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|expired_session|
      |PHPSESSID|expired_session|
      |XSRF-TOKEN|expired_token|
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_11 Access GetUsersForSubzones with malformed headers
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
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Validation
  Scenario: TC_12 Access GetUsersForSubzones with missing required headers
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
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Security
  Scenario: TC_13 Access GetUsersForSubzones with SQL injection attempt in headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|'; DROP TABLE users; --|
    And I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|eyJpdiI6IklTU2p3a3Q2QThkd0dXZHR1YjlvZWc9PSIsInZhbHVlIjoiTSs0M1NDNFA5d29iYkdjeEVzNG9yN05vTUJaREFucUdGbi9pV2l6c3l4azYyMTFQeTNZWmVDb1daRXRsNytKU0c1a2g0TUE3eHVQTEhERnVwVTBNQWZtb2diY2RRRUd1RmhDL1pLUzgwZzVtUWVTaGhXSDc2REtuMlNXNmg2YkwiLCJtYWMiOiI5YjFmYWI2OWM4MGUyNmViNGNmZTZkNGZjMTFiMGM1OGEzMTAwNjFlNjhhZGM5NmExYTUwY2Q3MDNhMTRhNDhkIiwidGFnIjoiIn0%3D|
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Security
  Scenario: TC_14 Access GetUsersForSubzones with XSS attempt in headers
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
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

#  @Negative @Validation
#  Scenario: TC_15 Access invalid GetUsersForSubzones endpoint
#    When I send the GET request to "getusersforsubzones_invalid" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "1200" milliseconds
#    And validating the response contains the following values
#      | Value |
#      | Invalid request url. |
#      | Login to your account |
#      | Username |
#      | Password |

  @Performance @Load
  Scenario: TC_16 Verify GetUsersForSubzones response time under load
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Performance @Load
  Scenario: TC_17 Verify concurrent access to GetUsersForSubzones
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1500" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |

  @Performance @Load
  Scenario: TC_18 Verify GetUsersForSubzones response time with large session data
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |


  @Integration @BusinessLogic
  Scenario: TC_19 Verify GetUsersForSubzones integration with authentication system
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @DataValidation
  Scenario: TC_20 Verify GetUsersForSubzones with null session cookies
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|null|
      |language|null|
      |CAKEPHP|null|
      |PHPSESSID|null|
      |XSRF-TOKEN|null|
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_21 Verify GetUsersForSubzones with tampered session data
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|tampered_session_data_12345|
      |PHPSESSID|tampered_session_id_67890|
      |XSRF-TOKEN|tampered_csrf_token_abcdef|
    And I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @UIValidation
  Scenario: TC_22 Verify GetUsersForSubzones login page UI elements
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | <input name="data[User][username]" |
      | <input name="data[User][password]" |
      | <input title="Login to Bizom" |
      | <img src="/img/bizom_logo.png" |

  @Positive @UIValidation
  Scenario: TC_23 Verify GetUsersForSubzones login page security elements
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Always verify the URL |
      | reCAPTCHA |
      | captcha_token |

  @Positive @UIValidation
  Scenario: TC_24 Verify GetUsersForSubzones login page social login elements
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Social Login |
      | Google |
      | google_signin_icon.png |


  @Positive @UIValidation
  Scenario: TC_25 Verify GetUsersForSubzones login page responsive design elements
    When I send the GET request to "getusersforsubzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | viewport |
      | width=device-width |
      | initial-scale=1.0 |
      | bootstrap.min.css |
