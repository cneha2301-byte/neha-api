@UserCustomFields @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of UserCustomFields

  @UserCustomFieldsPositive
  Scenario: TC_01 UserCustomFields -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getUserCustomFields" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue                           |Path          |Value         |
      |access_token  |ACCESS_TOKEN  |type          |json   |

    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1500" milliseconds
    And I store the response as "UserCustomFields" name using full path

  @UserCustomFieldsNoParams
  Scenario: TC_02 UserCustomFields -  no param
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getUserCustomFields_NoParams" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |

    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.Result  | true   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1500" milliseconds
    And I store the response as "UserCustomFields" name using full path

  @UserCustomFieldsNoAuth
  Scenario: TC_03 UserCustomFields -  no auth case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getUserCustomFields" endpoint with query and path parameters
      |QueryParamName|QueryParamValue                           |Path          |Value         |
      |  |                                          |type          |json   |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath         | Value        |
      | $.error  | invalid_request   |
      | $.error_description  | The access token was not found.   |
    And verify response headers
      | HeaderName    | HeaderValue        |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom            |
      | Connection    | keep-alive       |
    And verify response time is less than "1500" milliseconds
    And I store the response as "skuList" name using full path