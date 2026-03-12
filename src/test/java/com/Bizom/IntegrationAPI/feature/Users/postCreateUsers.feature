@CreateUsers @Sanity @All  @Execution @allPost
Feature: TC5194 This feature file is of the testcases of post end point of postCreateUsers
  @CreateUsersPositive
  Scenario: TC_01 CreateUsers -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      |XPath         |Value   |
      | User/username | randomStr |
      | User/employeeid |  random |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "true"   |
      |   Reason |  "User added successfully."  |
    And verify response time is less than "2500" milliseconds

  @CreateUsersBlankUserName
  Scenario: TC_02 CreateUsers -  blank user name case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      | XPath         | Value       |
      | /User/username  |  |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      | Reason  | "Username already exists for some other company."   |
    And verify response time is less than "1500" milliseconds

  @CreateUsersWithOutNameCase
  Scenario: TC_03 CreateUsers -   Create a new User with  out name case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      |XPath         |Value   |
      | User/username | randomStr |
      | User/employeeid |  random |
      |User/name        |         |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value  |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      |   Reason | "Invalid Auth"  |
    And verify response time is less than "2500" milliseconds

  @CreateUsersWithOutPassword
  Scenario: TC_04 CreateUsers -   Create a new User with  out Password
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      |XPath         |Value   |
      | User/username | randomStr |
      | User/employeeid |  random |
      | User/password    |  |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value  |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      |   Reason | "User Name or Password not sent for creating User." |
    And verify response time is less than "2500" milliseconds

  @CreateUsersWithOutNameCaseForAlreadyCreatedUser
  Scenario: TC_05 CreateUsers -   Post With Out Name Case For already CreatedUser
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      |XPath         |Value   |
      |User/name        |         |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value  |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "true"   |
      |   Reason | "User updated successfully"  |
    And verify response time is less than "2500" milliseconds

  @CreateUserswithwrongResourceURI
  Scenario: TC_06 CreateUsers - Post API with wrong Resource URI
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "Invalid_PostCreateUsers" XML payload
      |XPath         |Value   |
      | User/username | randomStr |
      | User/employeeid |  random |
    And I post the request with "Invalid_PostCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value  |
      |access_token  | Access_TOKEN |
    Then I should see the response code as "404"
    And verify response time is less than "1500" milliseconds

  @CreateUsersWithOutAccessToken
  Scenario: TC_07 CreateUsers -  Post API with out Access Token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      |XPath         |Value   |
      | User/username | randomStr |
      | User/employeeid |  random |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath     | Value    |
      |error      | invalid_request|
    And verify response time is less than "2500" milliseconds

  @CreateUsersWithWrongAccessToken
  Scenario: TC_08 CreateUsers -  Post API with Invalid Access Token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      |XPath         |Value   |
      | User/username | randomStr |
      | User/employeeid |  random |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  | gguywgaus56787sgabj |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath     | Value    |
      |error      | invalid_grant|
    And verify response time is less than "2500" milliseconds

  @CreateUserswithEmptyBody
  Scenario: TC_09 CreateUsers -  Post the API with empty body
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I send empty body with "postCreateUsers" XML request
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      | Reason | "Invalid Auth"  |
    And verify response time is less than "2500" milliseconds


