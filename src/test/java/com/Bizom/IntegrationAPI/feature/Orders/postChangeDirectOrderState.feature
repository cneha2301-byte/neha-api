@ChangeDirectOrderState @Sanity @All  @Execution @allPost
Feature:  TC5101 This feature file is of the testcases of post ChangeDirectOrderState

  Background:
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
    And I store the response as "add_order" name


  @ChangeDirectOrderStatePositiveTo2
  Scenario: TC_01 ChangeDirectOrderState -  positive case- change to 2
    And I modify the field with values from stored response "add_order" and from datatable in "postChangeDirectOrderState" payload
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |$.orderId    |
      |$.neworderstate_id|2                          |             |
    And I post the request with "postChangeDirectOrderState" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And verify response time is less than "1500" milliseconds

  @ChangeDirectOrderStatePositiveTo4
  Scenario: TC_02 ChangeDirectOrderState -  positive case- change to 4
    And I modify the field with values from stored response "add_order" and from datatable in "postChangeDirectOrderState" payload
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |$.orderId    |
      |$.neworderstate_id|4                          |             |
    And I post the request with "postChangeDirectOrderState" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And verify response time is less than "1500" milliseconds

  @ChangeDirectOrderStatePositiveTo2then4
  Scenario: TC_03 ChangeDirectOrderState -  positive case- change to 2 then 4
    And I modify the field with values from stored response "add_order" and from datatable in "postChangeDirectOrderState" payload
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |$.orderId    |
      |$.neworderstate_id|2  |                                     |
    And I post the request with "postChangeDirectOrderState" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And I modify the field with values from stored response "add_order" and from datatable in "postChangeDirectOrderState" payload
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |    |
      |$.neworderstate_id|4 |             |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And verify response time is less than "1500" milliseconds

  @ChangeDirectOrderStateToNegative4then2
    #Failing in Automation need some changes
  Scenario: TC_04 Post API with ChangeDirectOrderState -  negative case- change to 4 then 2
    And I modify the field with values from stored response "add_order" and from datatable in "postChangeDirectOrderState" payload
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |$.orderId    |
      |$.neworderstate_id|4  |                                     |
    And I post the request with "postChangeDirectOrderState" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN                 |
    Then I should see the response code as "200"
    And  I print the current request payload
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And I update the fields of "add_order" payload from the stored response "postChangeDirectOrderState" as chain api making the request map empty
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |$.orderId    |
      |$.neworderstate_id|  2                         |             |
    Then I should see the response code as "200"
    And  I print the current request payload
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | false   |
      | Reason |   This order cannot move to nextstate. Because next state id is invalid.      |
    And verify response time is less than "1500" milliseconds


  @ChangeDirectOrderWithOutToken
  Scenario: TC_05 ChangeDirectOrderState - Post API with out Access Token
    And I modify the field with values from stored response "add_order" and from datatable in "postChangeDirectOrderState" payload
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |$.orderId    |
      |$.neworderstate_id|2                          |             |
    And I post the request with "postChangeDirectOrderState" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|                  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | error  | invalid_request   |
    And verify response time is less than "1500" milliseconds

  @ChangeDirectOrderWithWrongToken
  Scenario: TC_06 ChangeDirectOrderState - Post API with wrong Access Token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify the field with values from stored response "add_order" and from datatable in "postChangeDirectOrderState" payload
      |JPath             |Value                      |ResponseJPath|
      |$.order_id        |storedResponse             |$.orderId    |
      |$.neworderstate_id|2                          |             |
    And I post the request with "postChangeDirectOrderState" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|      xyz            |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | error  | invalid_grant   |
    And verify response time is less than "1500" milliseconds

  @ChangeDirectOrderWithEmptyBody
  Scenario: TC_07 ChangeDirectOrderState - Post API with out Body
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send empty body with "postChangeDirectOrderState" request with out curly braces
    And I post the request with "postChangeDirectOrderState" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|   Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | false   |
    And verify response time is less than "1500" milliseconds