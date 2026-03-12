@Retailer @OrderForOutlets @Sanity @allGet
Feature: This feature file contains testcases for GET endpoint getOrderForOutlets

  @getOrderForOutletsPositive
  Scenario: TC_01 getOrderForOutlets - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOrderForOutlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | "true" |
      | $.Reason      | ""    |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "OrderForOutlets" name using full path

  @getOrderForOutletsPositive
  Scenario: TC_02 getOrderForOutlets - verify response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOrderForOutlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                            |
      | $.Result                         |
      | $.Data                           |
      | $.Data[0].id                     |
      | $.Data[0].Orderdetail            |
      | $.Data[0].Orderdetail[0].skuName |
      | $.Data[0].Orderdetail[0].amount  |
      | $.Data[0].billing.name           |
      | $.Data[0].shipping.name          |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "2000" milliseconds
    And I store the response as "OrderForOutlets" name using full path

  @getOrderForOutletsPositive
  Scenario: TC_03 getOrderForOutlets - verify data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOrderForOutlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And validating the response field data types
      | JPath   | ExpectedType |
      | $.Result                 | String      |
      | $.Reason                 | string       |
      | $.Data                   | array        |
      | $.Data[0].id                      | string        |
      | $.Data[0].Orderdetail             | array        |
      | $.Data[0].Orderdetail[0].skuName  | string        |
      | $.Data[0].Orderdetail[0].amount   | String        |
      | $.Data[0].billing.name            | string        |
      | $.Data[0].shipping.name          | string        |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And I store the response as "OrderForOutlets" name using full path

  @getOrderForOutletsPositive
  Scenario: TC_04 getOrderForOutlets - different valid outlet IDs
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOrderForOutlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | "true" |
      | $.Reason      | ""    |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And I store the response as "OrderForOutlets" name using full path
    Examples:
      | outletId |
      | 1        |
      | 2        |
      | 5        |
      | 10       |
