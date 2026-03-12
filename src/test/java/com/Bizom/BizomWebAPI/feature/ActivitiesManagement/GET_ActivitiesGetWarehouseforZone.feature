@BizomWebAPI @CE @ActivitiesManagement @GetWarehouseforZone @MasterDataManagement
Feature: Activities Get Warehouse for Zone API Testing
  As a system user
  I want to access the activities get warehouse for zone endpoint
  So that I can retrieve warehouse information for specific zones in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: TC_01 Get warehouse information for zone successfully
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Functional
  Scenario: TC_02 Verify warehouse data structure and content
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @DataValidation
  Scenario: TC_03 Validate warehouse data contains expected warehouse names
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      | JPath | Value                        |
      | $.1   | SLV Traders                  |
      | $.2   | SLV DISTRIBUTOR              |
      | $.3   | Laksmi Venkateswara warehouses |
      | $.7   | test                        |
      | $.8   | test                        |
      | $.9   | bty                         |

  @Positive @DataValidation
  Scenario: TC_04 Validate warehouse data contains numeric keys and string values
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Performance
  Scenario: TC_05 Verify warehouse data retrieval performance under normal load
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Security
  Scenario: TC_06 Verify warehouse data endpoint security headers
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And verify response headers
      | HeaderName | HeaderValue |
      | X-Frame-Options | SAMEORIGIN |

  @Positive @Integration
  Scenario: TC_07 Verify warehouse data endpoint integration with session management
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Negative @Validation
  Scenario: TC_08 Access warehouse data with invalid endpoint
    And I send the GET request to "activities_getWarehouseforZone_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_09 Access warehouse data without authentication
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_10 Access warehouse data with invalid session token
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_session_token|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials | 
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_11 Access warehouse data with expired session
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_session_token|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | Invalid Access Token or Credentials | 
    And verify response time is less than "2000" milliseconds

  @Negative @Performance
  Scenario: TC_12 Access warehouse data endpoint performance under high load
    And I send the GET request to "activities_getWarehouseforZone" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Security
  Scenario: TC_13 Access warehouse data with SQL injection attempt in headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=hhn7tku376sqmv8f5ou5ksfm1s; PHPSESSID=hhn7tku376sqmv8f5ou5ksfm1s; XSRF-TOKEN=eyJpdiI6ImZhVkpOZGpNK0FSd2JudHZ1dFNiYkE9PSIsInZhbHVlIjoiak5kdk9Nck1pM2EzbXJNYWJCTGY2TmYySW56RHlUSWd6RDdZQU9QRlk1VWtZc0R1N1RTQTI0Y3M0c0VLVlYrVE5RaTBVRFlQaDJkcG1qbTMzRGszcGw3NFdReXpoclAwaHQ3NnpJR3BZKzdOa1ZiZXRFdjFDQUNjSmlHNEJsWVgiLCJtYWMiOiJmYmFjYjU4ZDkzNzAzNDUxNDhkMTg4ZGQzMjNiMDViNmNlZjUxYjYyMzJlMTM4NDU0NmVhY2Q0ODM4ODFkNTZhIiwidGFnIjoiIn0%3D |
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
      | x-ht-session-id           | '; DROP TABLE warehouses; --                                                                                                                  |
    And I send the GET request to "activities_getWarehouseforZone" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_14 Access warehouse data with XSS attempt in headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=hhn7tku376sqmv8f5ou5ksfm1s; PHPSESSID=hhn7tku376sqmv8f5ou5ksfm1s; XSRF-TOKEN=eyJpdiI6ImZhVkpOZGpNK0FSd2JudHZ1dFNiYkE9PSIsInZhbHVlIjoiak5kdk9Nck1pM2EzbXJNYWJCTGY2TmYySW56RHlUSWd6RDdZQU9QRlk1VWtZc0R1N1RTQTI0Y3M0c0VLVlYrVE5RaTBVRFlQaDJkcG1qbTMzRGszcGw3NFdReXpoclAwaHQ3NnpJR3BZKzdOa1ZiZXRFdjFDQUNjSmlHNEJsWVgiLCJtYWMiOiJmYmFjYjU4ZDkzNzAzNDUxNDhkMTg4ZGQzMjNiMDViNmNlZjUxYjYyMzJlMTM4NDU0NmVhY2Q0ODM4ODFkNTZhIiwidGFnIjoiIn0%3D |
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
      | x-ht-session-id           | <script>alert('XSS')</script>                                                                                                                 |
    And I send the GET request to "activities_getWarehouseforZone" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
