@BizomWebAPI @CE @WarehousesManagement @GetWarehousesIndex @SystemIntegration
Feature: Warehouses API
  As a system user
  I want to retrieve warehouses information through the web interface
  So that I can access warehouse data for various operations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: TC_01 Retrieve warehouses list successfully
    When I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system

  @Positive @Functional
  Scenario: TC_02 Verify warehouses page contains expected HTML elements
    When I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @DataValidation
  Scenario: TC_03 Verify warehouses data structure and content
    When I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value       |
      | Warehouse   |
      | table       |
      | data        |
      | Name        |
      | Code        |
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_04 Verify response time performance for warehouses retrieval
    When I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @Security
  Scenario: TC_05 Verify warehouses access with valid session
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_06 Access warehouses without authentication cookies
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_07 Access warehouses with invalid session token
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|Invalid_ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_08 Access warehouses with malformed URL
    When I send the GET request to "warehouses_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN_123|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_09 Access warehouses with expired session
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_10 Access warehouses with missing session authentication
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_11 Access warehouses with SQL injection attempt in session
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_12 Access warehouses with XSS attempt in headers
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Load
  Scenario: TC_13 Verify warehouses endpoint handles concurrent requests
    When I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Boundary @Validation
  Scenario: TC_14 Verify warehouses endpoint with maximum header size
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Integration @EndToEnd
  Scenario: TC_15 Complete warehouses retrieval workflow with session validation
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2000" milliseconds
    And I validate that the operation was successfully completed in the system
    And validating the response contains the following values
      | Value  |
      | Warehouse  |
      | table  |

  @Security @Authentication
  Scenario: TC_16 Verify warehouses access with different user sessions
    And I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Performance @Stress
  Scenario: TC_17 Verify warehouses endpoint performance under load
    When I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And validating the response contains the following values
      | Value  |
      | Warehouse  |
      | table  |

  @DataValidation @Functional
  Scenario: TC_22 Verify warehouses page contains warehouse-specific elements
    When I send the GET request to "warehouses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value            |
      |ERP ID  |
      |Zone|
    And verify response time is less than "2000" milliseconds
