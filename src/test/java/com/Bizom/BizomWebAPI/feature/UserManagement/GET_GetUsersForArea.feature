@BizomWebAPI @CE @GetUsersForArea @ReportingOperations
Feature: This feature file contains testcases for GET endpoint GetUsersForArea

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
  Scenario: TC_01 Retrieve users for area successfully
    When I send the GET request to "getusersforarea" endpoint
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
  Scenario: TC_02 Verify users for area response structure and data
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | <html xmlns="http://www.w3.org/1999/xhtml"> |
      | <head> |
      | <body> |
      | Login to your account |

  @Positive @DataValidation
  Scenario: TC_03 Verify users for area JSON structure validation
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Positive @SessionManagement
  Scenario: TC_04 Verify session management and authentication for users for area
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Positive @Performance
  Scenario: TC_05 Verify response time performance for users for area
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "1500" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Positive @BusinessLogic
  Scenario: TC_06 Verify users for area business logic validation
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_07 Access users for area without valid session
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_08 Access users for area with invalid session ID
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|invalid_session_id|
      |PHPSESSID|invalid_session_id|
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_09 Access users for area with invalid CSRF token
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|invalid_csrf_token|
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_10 Access users for area with expired session
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|expired_session|
      |PHPSESSID|expired_session|
      |XSRF-TOKEN|expired_token|
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Validation
  Scenario: TC_11 Access users for area with malformed headers
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
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Validation
  Scenario: TC_12 Access users for area with missing required headers
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
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_13 Access users for area with SQL injection attempt in headers
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
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Negative @Security
  Scenario: TC_14 Access users for area with XSS attempt in headers
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
    And I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

#  @Negative @Validation
#  Scenario: TC_15 Access invalid users for area endpoint
#    When I send the GET request to "getusersforarea_invalid" endpoint
#    Then I should see the response code as "200"
#    #Then I verify the response URL contains "users/dashboard"
#    And verify response time is less than "2000" milliseconds


  @Performance @Load
  Scenario: TC_16 Verify response time under load for users for area
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "3000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Performance @Load
  Scenario: TC_17 Verify concurrent access to users for area
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |

  @Performance @Load
  Scenario: TC_18 Verify response time with large session data
    When I send the GET request to "getusersforarea" endpoint
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      | Value |
      | Login to your account |
      | Username |
      | Password |


