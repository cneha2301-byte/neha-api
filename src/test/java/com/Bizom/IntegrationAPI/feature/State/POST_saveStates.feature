@SaveStates @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of post end point of saveStates
  @SaveStatesPositive
  Scenario: TC_01 saveStates -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  | randomStr |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | true   |
      | $.reason  | "Data saved successfully!!"   |
    And I verify the data got updated as needed from DB
      | expectedColumn                            | expectedValue |
      | DB:states:id:id = (SELECT MAX(id) FROM states) | randomInt |
      | DB:states:name:id = (SELECT MAX(id) FROM states) | randomStr |
    And verify response time is less than "1500" milliseconds

  @SaveStatesEmptyName
  Scenario: TC_02 saveStates -  empty name
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  |  |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
      | $.reason  | "The Key: name should not be empty at row:1"   |
    And verify response time is less than "1500" milliseconds

  @SaveStatesDuplicateName
  Scenario: TC_03 saveStates -  duplicate name
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  | DB:states:name:id=38 |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
      | $.reason  | "Duplicate state name at row: 1"   |
    And verify response time is less than "1500" milliseconds

  @SaveStatesEmptyCountryId
  Scenario: TC_04 saveStates -  empty country id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  | randomString |
      | /States/State/country_id  |  |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
      | $.reason  | "Enter Valid country_id for saving states at row:1\n"   |
    And verify response time is less than "1500" milliseconds

  @SaveStatesEmptyCode
  Scenario: TC_05 saveStates -  empty code
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  | randomString |
      | /States/State/code  |  |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
      | $.reason  | "The Key: code should not be empty at row:1"   |
    And verify response time is less than "1500" milliseconds

  @SaveStatesEmptyCode
  Scenario: TC_06 saveStates -  Without Accesstoken
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  | randomString |
      | /States/State/code  |  |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.error  | invalid_request   |
      | $.error_description  | The access token was not found.|
    And verify response time is less than "1500" milliseconds

  @SaveStatesEmptyCode
  Scenario: TC_07 saveStates -  With  EMPTY  Accesstoken Value
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  | randomString |
      | /States/State/code  |  |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.error  | invalid_request   |
      | $.error_description  | The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed.|
    And verify response time is less than "1500" milliseconds


  @SaveStatesEmptyCode
  Scenario: TC_07 saveStates -  With  invalid   Accesstoken Value
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/name  | randomString |
      | /States/State/code  |  |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  | invalidaccesstokenedhejfefgcuygr |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.error  | invalid_grant   |
      | $.error_description  | The access token provided is invalid.|
    And verify response time is less than "1500" milliseconds


  @SaveStatesEmptyName
  Scenario: TC_08 saveStates -  empty isunionterritories & unique erpid [ it will get false result as it will consider duplicate name which is given in xml]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | randomInt |
      | /States/State/isunionterritories  |  |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
    And verify response time is less than "2500" milliseconds


  @SaveStatesEmptyName
  Scenario: TC_09 saveStates -  with value 1 isunionterritories [Data will save successfully]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | APITest001 |
      | /States/State/name  | APITest001 |
      | /States/State/isunionterritories  | 1 |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | true   |
      | $.reason  | "Data saved successfully!!"   |

@SaveStatesEmptyName @Neha09
  Scenario: TC_10 saveStates -  with value 0 isunionterritories [Data will save successfully]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_saveStates" XML payload
      |XPath       |Value       |
      | /States/State/erp_id  | APITest001 |
      | /States/State/name  | APITest001 |
      | /States/State/isunionterritories  | 0 |
    And I post the request with "POST_saveStates" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | true   |
      | $.reason  | "Data saved successfully!!"   |
  And I verify the data got updated as needed from DB
    | expectedColumn                                                                 | expectedValue           |
    | DB:states:name:id = (SELECT id FROM states WHERE erp_id = 'APITest001') | APITest001  |
    And verify response time is less than "2500" milliseconds

