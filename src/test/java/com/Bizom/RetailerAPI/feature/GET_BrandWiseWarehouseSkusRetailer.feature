@Retailer @Brands @Sanity  @allGet
Feature: This feature file contains testcases for GET endpoint getBrandWiseWarehouseSkusRetailer

  @BrandsPositive
  Scenario: TC_01 getBrandWiseWarehouseSkusRetailer - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|8|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | ""    |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @BrandsPositive
  Scenario: TC_02 getBrandWiseWarehouseSkusRetailer - verify response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|8|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                    |
      | $.Result                 |
      | $.Reason                 |
      | $.Data                   |
      | $.Data[0].id            |
      | $.Data[0].name          |
      | $.Data[0].sequence      |
      | $.Data[0].type          |
      | $.Data[0].pictureUrl    |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @BrandsPositive
  Scenario: TC_03 getBrandWiseWarehouseSkusRetailer - verify data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|8|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And validating the response field data types
      | JPath                    | ExpectedType |
      | $.Result                 | boolean      |
      | $.Reason                 | string       |
      | $.Data                   | array        |
      | $.Data[0].id             | string       |
      | $.Data[0].name           | string       |
      | $.Data[0].sequence       | string       |
      | $.Data[0].type           | string       |
      | $.Data[0].pictureUrl     | string       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @BrandsPositive
  Scenario Outline: TC_04 getBrandWiseWarehouseSkusRetailer - different valid outlet IDs
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|<outletId>|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | ""    |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path
    Examples:
      | outletId |
      | 1        |
      | 2        |
      | 5        |
      | 10       |

  @BrandsPositive
  Scenario Outline: TC_05 getBrandWiseWarehouseSkusRetailer - different valid source values
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|8|
      |source|<source>|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | ""    |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path
    Examples:
      | source      |
      | mbRetailer  |
      | web         |
      | mobile      |

  @BrandsNegative
  Scenario: TC_06 getBrandWiseWarehouseSkusRetailer - missing outletId parameter
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Invalid Outlet Id." |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path


  @BrandsNegative
  Scenario: TC_07 getBrandWiseWarehouseSkusRetailer - invalid outletId format
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|invalid|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Invalid Outlet Id." |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @BrandsNegative
  Scenario: TC_08 getBrandWiseWarehouseSkusRetailer - non-existent outletId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|999999|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Invalid Outlet Id." |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @BrandsNegative
  Scenario: TC_09 getBrandWiseWarehouseSkusRetailer - empty outletId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId||
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Invalid Outlet Id." |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @BrandsNegative
  Scenario: TC_10 getBrandWiseWarehouseSkusRetailer - special characters in outletId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|@#$%|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Invalid Outlet Id." |
    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @BrandsPositive
  Scenario: TC_11 getBrandWiseWarehouseSkusRetailer - verify response data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|8|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values

      | JPath                   | Value |
      | $.Data[0].id            |   "7"    |
      | $.Data[0].name          |"MFC PREMIUM"|
      | $.Data[0].sequence      | "1"|
      | $.Data[0].type          |"BRAND"|

    And verify response time is less than "1200" milliseconds
    And I store the response as "brandWiseWarehouseSkus" name using full path

  @DBvalidation
  Scenario: TC_12 getBrandWiseWarehouseSkusRetailer - verify response data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getBrandWiseWarehouseSkusRetailer" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|8|
      |source|mbRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values

      | JPath                   | Value |
      | $.Data[0].id            |   "7"    |
      | $.Data[0].name          |"MFC PREMIUM"|
      | $.Data[0].sequence      | "1"|
      | $.Data[0].type          |"BRAND"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      | $.Data[0].name | DB:brands:name: id=7 |
