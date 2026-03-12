@Retailer @Sanity @All @getOutletbalance
Feature: This feature file is of the testcases of POST end point of Add SaleReturn Api

  @getOutletbalancePositive
  Scenario: TC_01 POST_getOutletbalance -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0].id | "38" |
      |$.Data[0].outlet_id| "648"|
      |$.Data[0].outletname| "free"|
      |$.Data[0].foroutlet_id| "1"|
      |$.Data[0].warehouse_id| "1"|
      |$.Data[0].warehousename| "SLV Traders"|
      |$.Data[0].balance| "-100.00000"|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_02 POST_getOutletbalance -  verify the response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath        |
      | $.Result     |
      | $.Data       |
      | $.Data[0].id |
      |$.Data[0].outlet_id|
      |$.Data[0].outletname|
      |$.Data[0].foroutlet_id|
      |$.Data[0].warehouse_id|
      |$.Data[0].warehousename|
      |$.Data[0].balance|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_03 POST_getOutletbalance -  resposne structure- data type
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And validating the response field data types
      | JPath        | ExpectedType |
      | $.Result     | Boolean    |
      | $.Data       | array     |
      | $.Data[0].id | string|
      |$.Data[0].outlet_id| string|
      |$.Data[0].outletname| string|
      |$.Data[0].foroutlet_id| string|
      |$.Data[0].warehouse_id| string|
      |$.Data[0].warehousename|string|
      |$.Data[0].balance| string|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_04 POST_getOutletbalance -  warehouse id passed as null
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getOutletbalance" payload
      |JPath                    |Value  |
      |warehouse_id          | null |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0].id | "38" |
      |$.Data[0].outlet_id| "648"|
      |$.Data[0].outletname| "free"|
      |$.Data[0].foroutlet_id| "1"|
      |$.Data[0].warehouse_id| "1"|
      |$.Data[0].warehousename| "SLV Traders"|
      |$.Data[0].balance| "-100.00000"|
    And verify response time is less than "1500" milliseconds



  Scenario: TC_05 POST_getOutletbalance -   outlet id is passed null
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getOutletbalance" payload
      |JPath                    |Value  |
      | outlet_id | null |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | false    |
      | $.Reason | "Invalid data. Please send valid Outlet Id" |

    And verify response time is less than "1500" milliseconds


  Scenario: TC_06 POST_getOutletbalance -  Random number outlet id is passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getOutletbalance" payload
      |JPath                    |Value  |
      |outlet_id  |Random|
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Reason | "data found" |
    And verify response time is less than "1500" milliseconds

  Scenario: TC_07 POST_getOutletbalance -  valid outlet id is passed but unmapped warehouse id is passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getOutletbalance" payload
      |JPath                    |Value  |
      |outlet_id  |648|
      |warehouse_id          | 13 |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Reason | "data found" |

  Scenario: TC_08 POST_getOutletbalance -  invalid access token is passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_getOutletbalance" payload
      |JPath                    |Value  |
      |outlet_id  |648|
      |warehouse_id          | 13 |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  | invalid |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result     | false    |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |

  Scenario Outline: TC_09 POST_getOutletbalance -  different valid outlet IDs
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue      |
      | Accept          | /                |
      | Accept-Encoding | gzip,deflate, br |
      | Connection      | keep-alive       |
      | Content-Type    | application/json |
    And I modify fields with random values and remove fields in "POST_getOutletbalance" payload
      | JPath     | Value       |
      | outlet_id | <outlet_id> |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value |
      | $.Result | true  |
    And verify response time is less than "1500" milliseconds
    And I store the response as "POST_getOutletbalance" name using full path
    Examples:
      | outlet_id |
      | 1         |
      | 2         |
      | 3         |

  @DataValidation
  Scenario: TC_10 POST_getOutletbalance -  dbvalidation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I post the request with "POST_getOutletbalance" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Data[0].id | "38" |
      |$.Data[0].outlet_id| "648"|
      |$.Data[0].outletname| "free"|
      |$.Data[0].foroutlet_id| "1"|
      |$.Data[0].warehouse_id| "1"|
      |$.Data[0].warehousename| "SLV Traders"|
      |$.Data[0].balance| "-100.00000"|
    And I verify API response at path with DB and static values
      |JPath|Value|
      | $.Data[0].outletname| DB:outlets:name: id=648 |
      | $.Data[0].warehousename| DB:outlets:name: warehouse_id=1 |