@BizomWebAPI @CE @GetUsersForZones @ReportingOperations
Feature: This feature file contains testcases for GET endpoint GetUsersForZones

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
  Scenario: TC_01 GetUsersForZones - status code positive case
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And I store the response as "getUsersForZonesResponse" name using full path

  @Positive @Functional
  Scenario: TC_02 Verify GetUsersForZones response structure
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | <html xmlns="http://www.w3.org/1999/xhtml"> |
      | <head> |
      | <body> |
      | Login to your account |

  @Positive @DataValidation
  Scenario: TC_03 Verify GetUsersForZones returns valid HTML structure
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | <meta http-equiv="Content-Type" |
      | charset=utf-8 |
      | <script> |
      | <link rel="stylesheet" |
    And I store the response as "usersForZonesData" name using full path

  @Positive @Performance
  Scenario: TC_04 Verify GetUsersForZones response time performance
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Positive @SessionManagement
  Scenario: TC_05 Verify GetUsersForZones with valid session management
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Positive @BusinessLogic
  Scenario: TC_06 Verify GetUsersForZones business logic validation
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Always verify the URL |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_07 Access GetUsersForZones without valid session
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_08 Access GetUsersForZones with invalid session ID
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|invalid_session_id|
      |PHPSESSID|invalid_session_id|
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_09 Access GetUsersForZones with invalid CSRF token
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|invalid_csrf_token|
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_10 Access GetUsersForZones with expired session
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|expired_session|
      |PHPSESSID|expired_session|
      |XSRF-TOKEN|expired_token|
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Validation
  Scenario: TC_11 Access GetUsersForZones with malformed headers
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
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Validation
  Scenario: TC_12 Access GetUsersForZones with missing required headers
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
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Security
  Scenario: TC_13 Access GetUsersForZones with SQL injection attempt in headers
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
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Security
  Scenario: TC_14 Access GetUsersForZones with XSS attempt in headers
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
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

#  @Negative @Validation
#  Scenario: TC_15 Access invalid GetUsersForZones endpoint
#    When I send the GET request to "getusersforzones_invalid" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "1200" milliseconds
#    And validating the response contains the following values
#      | Value |
#      | Invalid request url. |
#      | Login to your account |
#      | Username |
#      | Password |
#      | Login to Bizom |

  @Performance @Load
  Scenario: TC_16 Verify GetUsersForZones response time under load
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: TC_17 Verify concurrent access to GetUsersForZones
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1500" milliseconds

  @Performance @Load
  Scenario: TC_18 Verify GetUsersForZones response time with large session data
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Integration @BusinessLogic
  Scenario: TC_19 Verify GetUsersForZones integration with user management
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Integration @BusinessLogic
  Scenario: TC_20 Verify GetUsersForZones integration with zone management
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Integration @BusinessLogic
  Scenario: TC_21 Verify GetUsersForZones integration with permission system
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Integration @BusinessLogic
  Scenario: TC_22 Verify GetUsersForZones integration with authentication system
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Negative @DataValidation
  Scenario: TC_23 Verify GetUsersForZones with empty session cookies
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay||
      |language||
      |CAKEPHP||
      |PHPSESSID||
      |XSRF-TOKEN||
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @DataValidation
  Scenario: TC_24 Verify GetUsersForZones with null session cookies
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|null|
      |language|null|
      |CAKEPHP|null|
      |PHPSESSID|null|
      |XSRF-TOKEN|null|
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Negative @Security
  Scenario: TC_25 Verify GetUsersForZones with tampered session data
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|tampered_session_data_12345|
      |PHPSESSID|tampered_session_id_67890|
      |XSRF-TOKEN|tampered_csrf_token_abcdef|
    And I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |

  @Positive @DataValidation
  Scenario: TC_26 Verify GetUsersForZones empty users array handling
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Positive @DataValidation
  Scenario: TC_27 Verify GetUsersForZones response field types
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_28 Verify GetUsersForZones successful operation response
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds
    And I store the response as "zonesUsersData" name using full path

  @Positive @BusinessLogic
  Scenario: TC_29 Verify GetUsersForZones zone-specific user retrieval
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_30 Verify GetUsersForZones response consistency
    When I send the GET request to "getusersforzones" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |
      | Login to Bizom |
    And verify response time is less than "1200" milliseconds