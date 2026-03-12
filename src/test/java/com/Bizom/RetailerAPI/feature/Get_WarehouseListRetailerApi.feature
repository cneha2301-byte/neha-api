@Retailer @WarehouseListRetailerApi @Sanity  @allGet
Feature: This feature file contains testcases for GET endpoint getWarehouseListRetailerApi

  @WarehouseListRetailerApiPositive
  Scenario: TC_01 getWarehouseListRetailerApi - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
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
    And I store the response as "WarehouseListRetailerApi" name using full path

  @WarehouseListRetailerApiPositive
  Scenario: TC_02 getWarehouseListRetailerApi - verify response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                    |
      | $.Result                 |
      | $.Reason                 |
      | $.Data                   |
      | $.Data[0].id            |
      | $.Data[0].name          |
      | $.Data[0].address      |
      | $.Data[0].phoneno          |
      | $.Data[0].warehouseoutletid    |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path

  @WarehouseListRetailerApiPositive
  Scenario: TC_03 getWarehouseListRetailerApi - verify data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And validating the response field data types
      | JPath                    | ExpectedType |
      | $.Result                 | Boolean      |
      | $.Reason                 | string       |
      | $.Data                   | array        |
      | $.Data[0].id             | string       |
      | $.Data[0].name           | string       |
      | $.Data[0].address       | string       |
      | $.Data[0].phoneno           | string       |
      | $.Data[0].warehouseoutletid     | string       |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path

  @WarehouseListRetailerApiPositive
  Scenario Outline: TC_04 getWarehouseListRetailerApi - different valid outlet IDs
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|<warehouseId>|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | ""    |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path
    Examples:
      | warehouseId |
      | 1        |
      | 2        |
      | 3        |

  @WarehouseListRetailerApiNegative
  Scenario: TC_05 getWarehouseListRetailerApi - missing warehouseId parameter
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|     |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Please Select Warehouse " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path


  @WarehouseListRetailerApiNegative
  Scenario: TC_06 getWarehouseListRetailerApi - invalid warehouseId format
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|invalid|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Please Select Warehouse " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path

  @WarehouseListRetailerApiNegative
  Scenario: TC_07 getWarehouseListRetailerApi - non-existent warehouseId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|999999|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Please Select Warehouse " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path

  @WarehouseListRetailerApiNegative
  Scenario: TC_08 getWarehouseListRetailerApi - empty warehouseId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId||
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Please Select Warehouse " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path

  @WarehouseListRetailerApiNegative
  Scenario: TC_09 getWarehouseListRetailerApi - special characters in warehouseId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|@#$%|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Please Select Warehouse " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "WarehouseListRetailerApi" name using full path

 @WarehouseListRetailerApiPositive
   Scenario: TC_10 getWarehouseListRetailerApi - validate response data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | ""    |
      | $.Data[0].id             | "2"   |
      | $.Data[0].name           | SLV DISTRIBUTOR       |
      | $.Data[0].warehouseoutletid     |"14"      |
    And I store the response as "WarehouseListRetailerApi" name using full path

  @WarehouseListRetailerApiPositive
  Scenario: TC_11 getWarehouseListRetailerApi - validate response data with DB
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getWarehouseListRetailerApi" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|warehouseId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | ""    |
      | $.Data[0].id             | "2"   |
      | $.Data[0].name           | SLV DISTRIBUTOR|
      | $.Data[0].warehouseoutletid |"14"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      | $.Data[0].name | DB:warehouses:name: id=2 && warehouseoutletid=14 |

