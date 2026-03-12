@SetUserTarget @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of post end point of setUserTarget
  @SetUserTargetPositive
  Scenario: TC_01 setUserTarget -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetInvalidEmployeeId
  Scenario: TC_02 setUserTarget -  invalid employee id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].employeeid | 99999999 |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | false   |
      | $.Reason  | "Row Index - 0 Invalid EmpoloyeeId " |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyTlsd
  Scenario: TC_03 setUserTarget -  empty tlsd
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].tlsd | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyDropsize
  Scenario: TC_04 setUserTarget -  empty dropsize
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].dropsize | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyTotalcalls
  Scenario: TC_05 setUserTarget -  empty totalcalls
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].totalcalls | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyPercentproductivecall
  Scenario: TC_06 setUserTarget -  empty percentproductivecall
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].percentproductivecall | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyLpsc
  Scenario: TC_07 setUserTarget -  empty lpsc
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].lpsc | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyNewoutlets
  Scenario: TC_08 setUserTarget -  empty newoutlets
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].newoutlets | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyAmount
  Scenario: TC_09 setUserTarget -  empty amount
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].amount | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Data added successfully   |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptySkunit_erpidWithQty
  Scenario: TC_10 setUserTarget -  empty skunit_erpid with quantity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].skunit_erpid | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | false   |
      | $.Reason  | "Row Index - 0 quantity(units) 10 Quantity should be empty when skunit_id is empty." |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptySkunit_erpidWithQty
  Scenario: TC_11 setUserTarget -  empty skunit_erpid with quantity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].skunit_erpid | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | false   |
      | $.Reason  | "Row Index - 0 quantity(units) 10 Quantity should be empty when skunit_id is empty." |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetInactiveSkunit_erpid
  Scenario: TC_12 setUserTarget -  inactive skunit_erpid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].skunit_erpid | inct |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | false   |
      | $.Reason  | "Row Index - 0 The skunit_id  You cannot add target on the inactive sku." |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetInvalidSkunit_erpid
  Scenario: TC_13 setUserTarget -  invalid skunit_erpid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].skunit_erpid | invalid |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | false   |
      | $.Reason  | "Row Index - 0 Invalid Skunit Erp Id" |
    And verify response time is less than "1500" milliseconds

  @SetUserTargetEmptyQuantity
  Scenario: TC_14 setUserTarget -  empty quantity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_setUserTarget" payload
      | JPath         | Value       |
      | $.Targets[0].quantity | |
    And I post the request with "POST_setUserTarget" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | false   |
      | $.Reason  | "Row Index - 0 quantity(units) Mandatory field cannot be empty." |
    And verify response time is less than "1500" milliseconds