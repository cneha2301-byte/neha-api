@Loadouts @Sanity @All @allPost @Execution
Feature: This feature file contains testcases for POST endpoint approve all loadouts

  @ApproveLoadoutsBusinessRule
  Scenario: TC_01 ApproveLoadouts - business validation with sample payload
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      | Value                                           |
      | Index - 0 Skunit warehouse fordate not matching |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path
    
      @ApproveLoadoutsNoAuth
  Scenario: TC_02 ApproveLoadouts - no auth token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postApproveLoadouts" payload
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                | Value                          |
      | $.error              | invalid_request                |
      | $.error_description  | The access token was not found.|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsInvalidDateFormat
  Scenario: TC_03 ApproveLoadouts - invalid date format in fordate
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value       |
      | $.loadouts[0].fordate    | 2025/10/14  |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsNegativeQuantities
  Scenario: TC_04 ApproveLoadouts - negative quantities
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value |
      | $.loadouts[0].cases      | -1    |
      | $.loadouts[0].units      | -5    |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path


  @ApproveLoadoutsEmptyArray
  Scenario: TC_05 ApproveLoadouts - empty loadouts array
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postApproveLoadouts_empty" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsMissingRequiredFields
  Scenario: TC_06 ApproveLoadouts - missing required fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                          | Value |
      | $.loadouts[0].warehouse_erp_id |       |
      | $.loadouts[0].employeeid       |       |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsInvalidTypes
  Scenario: TC_07 ApproveLoadouts - invalid types for numeric fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value |
      | $.loadouts[0].cases      | abc   |
      | $.loadouts[0].units      | xyz   |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsMultipleItems
  Scenario: TC_08 ApproveLoadouts - multi loadouts payload
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postApproveLoadouts_multiple" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsFutureDate
  Scenario: TC_09 ApproveLoadouts - fordate in far future
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value       |
      | $.loadouts[0].fordate    | 2035-01-01  |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsZeroQuantities
  Scenario: TC_10 ApproveLoadouts - zero quantities
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value |
      | $.loadouts[0].cases      | 0     |
      | $.loadouts[0].units      | 0     |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsEmptyFordate
  Scenario: TC_11 ApproveLoadouts - empty fordate
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value |
      | $.loadouts[0].fordate    |       |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsEmptySkunit
  Scenario: TC_12 ApproveLoadouts - empty skunit_erp_id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                          | Value |
      | $.loadouts[0].skunit_erp_id    |       |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsLongSkunit
  Scenario: TC_13 ApproveLoadouts - very long skunit_erp_id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                          | Value |
      | $.loadouts[0].skunit_erp_id    | FantaFantaFantaFantaFantaFantaFantaFantaFantaFantaFantaFanta |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsInvalidWarehouse
  Scenario: TC_14 ApproveLoadouts - invalid warehouse_erp_id characters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                          | Value |
      | $.loadouts[0].warehouse_erp_id | TRP@@@###$$$ |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsInvalidEmployeeId
  Scenario: TC_15 ApproveLoadouts - non-numeric employeeid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value |
      | $.loadouts[0].employeeid | ABC   |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsNullFields
  Scenario: TC_16 ApproveLoadouts - null critical fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I set null value to the fields in "postApproveLoadouts" payload
      | JPath                          |
      | $.loadouts[0].warehouse_erp_id |
      | $.loadouts[0].skunit_erp_id    |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsWhitespaceIds
  Scenario: TC_17 ApproveLoadouts - whitespace-only identifiers
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                          | Value |
      | $.loadouts[0].warehouse_erp_id |      |
      | $.loadouts[0].skunit_erp_id    |      |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsLargeQuantities
  Scenario: TC_18 ApproveLoadouts - extremely large quantities
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                     | Value     |
      | $.loadouts[0].cases      | 2147483647|
      | $.loadouts[0].units      | 2147483647|
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsDuplicateItems
  Scenario: TC_19 ApproveLoadouts - duplicate items in multi payload
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postApproveLoadouts_multiple" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsUnicodeIds
  Scenario: TC_20 ApproveLoadouts - unicode characters in IDs
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    When I modify the fields in "postApproveLoadouts" payload
      | JPath                          | Value        |
      | $.loadouts[0].warehouse_erp_id | 746585878       |
      | $.loadouts[0].skunit_erp_id    | 4547857        |
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path

  @ApproveLoadoutsWrongContentType
  Scenario: TC_21 ApproveLoadouts - wrong Content-Type header
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/plain|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postApproveLoadouts" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "ApproveLoadouts" name using full path