@EditUser @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of post end point of postEditUsers
  @EditUserPositive
  Scenario: TC_01 edit user -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "true"   |
    And verify response time is less than "2500" milliseconds

  @EditUserBlankUserName
  Scenario: TC_02 edit user -  blank user name case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/username  |  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      | Reason  | "Invalid username sent."   |
    And verify response time is less than "1500" milliseconds

  @EditUserBlankName
  Scenario: TC_03 edit user -  blank  name case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/name  |  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      | Reason  | "User not updated, please try again!"   |
    And verify response time is less than "1500" milliseconds

  @EditUserWrongUserName
  Scenario: TC_04 edit user -  wrong user  name case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/username  |abc  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      | Reason  | "Invalid username sent."   |
    And verify response time is less than "1500" milliseconds

  @EditUserEditName
  Scenario: TC_05 edit user -  Edit name case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/name  |randomStr  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "true"   |
    And verify response time is less than "1500" milliseconds

  @EditUserEditPassword
  Scenario: TC_06 edit user -  Edit password case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/password  |random  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "true"   |
    And verify response time is less than "2500" milliseconds

  @EditUserWrongRoleSpecificId
  Scenario: TC_07 edit user -  wrong rolespecific id case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/Rolespecificid  |abc  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
    And verify response time is less than "1500" milliseconds

  @EditUserWrongPhonenumber
  Scenario: TC_08 edit user -  wrong phone number id case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/phoneno  |9129162255126868686  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "false"   |
      | Reason  | "Invalid phone Number"   |
    And verify response time is less than "1500" milliseconds

  @EditUserEditAddress
  Scenario: TC_09 edit user -  wrong address  case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/address  |opop  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "true"   |
    And verify response time is less than "1500" milliseconds

  @EditUserEditPhonenumber
  Scenario: TC_010 edit user -  edit phone number id case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postEditUser" XML payload
      | XPath         | Value       |
      | /User/phoneno  |randomPhoneNo  |
    And I post the request with "postEditUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | "true"   |
    And verify response time is less than "1500" milliseconds

