@Retailer @SalereturnReasons @Sanity  @allGet
Feature: This feature file contains testcases for GET endpoint getSalereturnReasons

  @SalereturnReasonsPositive
  Scenario: TC_01 getSalereturnReasons - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getSalereturnReasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | "Data present"   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "SalereturnReasons" name using full path

  @SalereturnReasonsPositive
  Scenario: TC_02 getSalereturnReasons - verify response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getSalereturnReasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                    |
      | $.Result                 |
      | $.Reason                 |
      | $.Data                   |
    And verify response time is less than "1200" milliseconds
    And I store the response as "SalereturnReasons" name using full path

  @SalereturnReasonsPositive
  Scenario: TC_03 getSalereturnReasons - verify data in response
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getSalereturnReasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
    | JPath      | Value |
    | $.Result   | true          |
    | $.Reason   | Data present  |
    | $.Data.4   | sampling      |
    | $.Data.5   | damaged       |
    | $.Data.6   | expired       |
    | $.Data.7   | theft         |
    | $.Data.8   | other         |
    And verify response time is less than "1200" milliseconds
    And I store the response as "SalereturnReasons" name using full path
    
    @SalereturnReasonsPositive @DataValidation
  Scenario: TC_04 getSalereturnReasons - verify data vlidation with DB
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getSalereturnReasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath      | Value |
      | $.Result   | true          |
      | $.Reason   | Data present  |
      | $.Data.4   | sampling      |
      | $.Data.5   | damaged       |
      | $.Data.6   | expired       |
      | $.Data.7   | theft         |
      | $.Data.8   | other         |
    And I verify API response at path with DB and static values
      |JPath|Value|
      | $.Data.4 | DB:reasons:reason: id=4 |
      | $.Data.5 | DB:reasons:reason: id=5 |
      | $.Data.6 | DB:reasons:reason: id=6 |
      | $.Data.7 | DB:reasons:reason: id=7 |
      | $.Data.8 | DB:reasons:reason: id=8 |

