@Loadouts @Sanity @All @allGet @Execution
Feature: This feature file is of the testcases of GET end point of list Users

  @LoadoutsPositive
  Scenario: TC_01 Loadouts -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |10|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsNoParam
  Scenario: TC_02 loadouts  - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsNoAuth
  Scenario: TC_03 loadouts -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with query parameters
      |QueryParamName|QueryParamValue                           |
      |fromdate      |2021-01-17                                          |
      |todate        |2025-01-17                                          |
      |limit        |100                                          |
      |startseq      |0                             |
      |endseq        |9                  |
      |datetype       |created                                          |
      |loadoutstate_id        |3                  |
      |fromtime      |10%3A29%3A31                                          |
      |totime        |12%3A29%3A34                                          |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.error  | invalid_request   |
      | $.error_description  | The access token was not found.   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsInvalidDateRange
  Scenario: TC_04 loadouts - invalid date range (fromdate in future, todate in past)
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2026-01-01|
      |todate        |2024-01-01|
      |datetype      |created|
      |limit         |10|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | false   |
      | $.Reason | No Loadouts Found   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsInvalidDateFormat
  Scenario: TC_05 loadouts - invalid date format in fromdate
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025/10/13|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |10|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsLimitZero
  Scenario: TC_06 loadouts - limit as zero
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |0|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsLimitNegative
  Scenario: TC_07 loadouts - limit as negative value
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |-1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsLimitNull
  Scenario: TC_08 loadouts - limit as null
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |null|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsInvalidDatetype
  Scenario: TC_09 loadouts - invalid datetype value
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |future|
      |limit         |10|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

      @LoadoutsUpdatedPositive
  Scenario: TC_10 loadouts - positive case with datetype updated and small limit
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-01|
      |todate        |2025-10-13|
      |datetype      |updated|
      |limit         |5|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result      | true         |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsPaginationEndBeforeStart
  Scenario: TC_11 loadouts - pagination endseq less than startseq
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |10|
      |startseq      |10|
      |endseq        |5|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | false   |
      | $.Reason | No Loadouts Found   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsPaginationNegativeStart
  Scenario: TC_12 loadouts - pagination negative startseq
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |10|
      |startseq      |-1|
      |endseq        |5|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | false   |
      | $.Reason | No Loadouts Found   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsInvalidLimitType
  Scenario: TC_13 loadouts - invalid non-numeric limit
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |ten|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value               |
      | $.Result   | true         |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsInvalidStateIdType
  Scenario: TC_14 loadouts - invalid non-numeric loadoutstate_id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token      |ACCESS_TOKEN|
      |fromdate          |2025-09-17|
      |todate            |2025-10-13|
      |datetype          |created|
      |limit             |10|
      |loadoutstate_id   |ABC|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | false   |
      | $.Reason | No Loadouts Found   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsInvalidTimeFormat
  Scenario: TC_15 loadouts - invalid time format in fromtime
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |10|
      |fromtime      |150-AAA-AAA|
      |totime        |120-AAA-AAA|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value               |
      | $.Result   | true         |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsFromtimeGreaterThanTotime
  Scenario: TC_16 loadouts - fromtime greater than totime
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |10|
      |fromtime      |15:00:00|
      |totime        |12:00:00|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | false   |
      | $.Reason | No Loadouts Found   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path

  @LoadoutsLimitOne
  Scenario: TC_17 loadouts - positive boundary with limit 1
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getLoadouts" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |fromdate      |2025-09-17|
      |todate        |2025-10-13|
      |datetype      |created|
      |limit         |1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result      | true         |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "Loadouts" name using full path