@AddOrders @Sanity @All @Execution @allPost
Feature: This feature file is of the testcases of GET end point of Add Credit Api
  @AddOrders
  Scenario: TC_01 add order -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | result  | true   |
    And verify response time is less than "1500" milliseconds

  @AddOrderNoOutletId
  Scenario: TC_02 order -  no outlet erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    And I modify fields with random values and remove fields in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.outletId|           |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | false |
      | $.message           | "Buyer details not sent."|

  @AddOrderNoSkuId
  Scenario: TC_03 order - no sku  id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.orderDetail.skunitId|        |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | false |
      | $.message           | "Kindly pass either skunitId or erpSkuId or skuCodeForEntity in orderDetail."|

  @AddOrderPastFordate
  Scenario: TC_04 order - past fordate given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.fordate            |2024-07-17           |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | true |
  @AddOrderFutureFordate
  Scenario: TC_05 order - future fordate given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.fordate            |2026-07-17           |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | true |

  @AddOrderWrongFromOutletId
  Scenario: TC_06 order - wrong from outlet id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.fromOutletId            |12           |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | false |
    And the response field "$.message" should exactly be "{value} Parent outlet should have a warehouse mapped to it. OR Warehouse/Distributor Id does not exist." using value from "$.data.fromOutletId" in the payload

  @AddOrderWrongSkuId
  Scenario: TC_07 order - wrong sku id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.orderDetail.skunitId | 1212    |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | false |
    And the response field "$.message" should exactly be "SkuIds {value} are invalid" using value from "$.data.orderDetail.skunitId" in the payload

  @AddOrderBlankSkuId
  Scenario: TC_08 order - blank sku id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |
  And I modify fields with values and fields with random values in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.orderDetail.skunitId |       |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | false |
      |$.message            |"Kindly pass either skunitId or erpSkuId or skuCodeForEntity in orderDetail."|

  @AddOrderBlankOutletId
  Scenario: TC_09 order - blank oulet id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "postAddOrders" payload
      |JPath                      |Value            |
      |$.data.outletId |       |
      |$.data.erpid               |randomInt           |
    And I post the request with "postAddOrders" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.result            | false |
      |$.message            |"Buyer details not sent."|


