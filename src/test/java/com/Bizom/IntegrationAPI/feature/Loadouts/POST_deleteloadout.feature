@Loadouts1 @Sanity @All @allPost @Execution
Feature: This feature file contains testcases for POST endpoint delete loadouts

  # @DeleteLoadoutsBusinessRule
  # Scenario: TC_01 DeleteLoadouts - business validation with sample payload
  #   Given I set up base URI for transactions
  #   When I set up request specification
  #     |HeaderName|HeaderValue|
  #     |Content-Type|application/json|
  #     |Accept|*/*|
  #     |Accept-Encoding|gzip,deflate, br|
  #     |Connection|keep-alive|
  #   And I post the request with "postDeleteLoadouts" payload with dynamic access token and query parameters
  #     |QueryParamName|QueryParamValue|
  #     |access_token|ACCESS_TOKEN|
  #   Then I should see the response code as "200"
  #   And validating the response contains the following values
  #     | Value                                                                 |
  #     | Loadout id(s) 27,28 could not be deleted.                             |
  #     | already approved \/ Rejected                                          |
  #   And the fields in response should match with expected values
  #     | JPath        | Value |
  #     | $.Result     | false |
  #     | $.saveResult | false |
  #   And verify response headers
  #     | HeaderName    | HeaderValue                 |
  #     | Content-Type  | text/html; charset=UTF-8    |
  #     | Server        | Bizom                       |
  #     | Connection    | keep-alive                  |
  #   And verify response time is less than "1200" milliseconds
  #   And I store the response as "DeleteLoadouts" name using full path

  @DeleteLoadoutsNoAuth
  Scenario: TC_02 DeleteLoadouts - no auth token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postDeleteLoadouts" payload
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
    And I store the response as "DeleteLoadouts" name using full path

  @DeleteLoadoutsEmptyArray
  Scenario: TC_03 DeleteLoadouts - empty ids array
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postDeleteLoadouts_empty" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "DeleteLoadouts" name using full path

  @DeleteLoadoutsInvalidTypes
  Scenario: TC_04 DeleteLoadouts - invalid types in ids array
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postDeleteLoadouts_invalid" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | text/html; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "DeleteLoadouts" name using full path

  @DeleteLoadoutsPositive
  Scenario: TC_04 DeleteLoadouts - Positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "postDeleteLoadout" payload with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Data.loadout_ids|DB:loadouts.id: id=27,28|
    And verify response time is less than "1200" milliseconds
    And I store the response as "DeleteLoadouts" name using full path