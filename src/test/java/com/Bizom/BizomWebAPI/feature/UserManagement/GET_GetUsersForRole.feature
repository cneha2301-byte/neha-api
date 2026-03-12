@BizomWebAPI @CE @GetUsersForRole @ReportingOperations
Feature: This feature file contains testcases for GET endpoint GetUsersForRole

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
  Scenario: TC_01 GetUsersForRole - status code positive case
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "getUsersForRoleResponse" name using full path

  @Positive @Functional
  Scenario: TC_02 Verify GetUsersForRole response structure
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |
    And verify response time is less than "1200" milliseconds

  @Positive @DataValidation
  Scenario: TC_03 Verify GetUsersForRole returns valid JSON structure
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "usersForRoleData" name using full path

  @Positive @Performance
  Scenario: TC_04 Verify GetUsersForRole response time performance
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |

  @Positive @SessionManagement
  Scenario: TC_05 Verify GetUsersForRole with valid session management
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1200" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_06 Verify GetUsersForRole business logic validation
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1200" milliseconds

  @Negative @Security
  Scenario: TC_07 Access GetUsersForRole without valid session
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @Security
  Scenario: TC_08 Access GetUsersForRole with invalid session ID
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|invalid_session_id|
      |PHPSESSID|invalid_session_id|
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @Security
  Scenario: TC_09 Access GetUsersForRole with invalid CSRF token
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|nfgae3f1da4s27uq2j1vmtsbck|
      |PHPSESSID|nfgae3f1da4s27uq2j1vmtsbck|
      |XSRF-TOKEN|invalid_csrf_token|
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @Security
  Scenario: TC_10 Access GetUsersForRole with expired session
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|hide|
      |language|en|
      |CAKEPHP|expired_session|
      |PHPSESSID|expired_session|
      |XSRF-TOKEN|expired_token|
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @Validation
  Scenario: TC_11 Access GetUsersForRole with malformed headers
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
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @Validation
  Scenario: TC_12 Access GetUsersForRole with missing required headers
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
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @Security
  Scenario: TC_13 Access GetUsersForRole with SQL injection attempt in headers
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
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @Security
  Scenario: TC_14 Access GetUsersForRole with XSS attempt in headers
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
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

#  @Negative @Validation
#  Scenario: TC_15 Access invalid GetUsersForRole endpoint
#    When I send the GET request to "getusersforrole_invalid" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "1200" milliseconds
#    And validating the response contains the following values
#      | Value |
#      | Login to your account |
#      | Username |
#      | Password |
#      | Invalid request url. |

  @Performance @Load
  Scenario: TC_16 Verify GetUsersForRole response time under load
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: TC_17 Verify concurrent access to GetUsersForRole
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1500" milliseconds

  @Performance @Load
  Scenario: TC_18 Verify GetUsersForRole response time with large session data
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1200" milliseconds

  @Integration @BusinessLogic
  Scenario: TC_19 Verify GetUsersForRole integration with user management
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1200" milliseconds

  @Integration @BusinessLogic
  Scenario: TC_20 Verify GetUsersForRole integration with role management
    When I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1200" milliseconds


  @Negative @DataValidation
  Scenario: TC_23 Verify GetUsersForRole with empty session cookies
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay||
      |language||
      |CAKEPHP||
      |PHPSESSID||
      |XSRF-TOKEN||
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

  @Negative @DataValidation
  Scenario: TC_24 Verify GetUsersForRole with null session cookies
    When I set cookies
      |cookieName|cookieValue|
      |toolbarDisplay|null|
      |language|null|
      |CAKEPHP|null|
      |PHPSESSID|null|
      |XSRF-TOKEN|null|
    And I send the GET request to "getusersforrole" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.data    | []    |
      | $.newdata | []    |

