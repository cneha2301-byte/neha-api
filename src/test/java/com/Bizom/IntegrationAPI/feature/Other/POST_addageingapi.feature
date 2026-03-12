@AddAgeingApi @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of post end point of addageingapi
  @AddAgeingApiPositive
  Scenario: TC_01 AddAgeingApi -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_addageingapi" XML payload
      |XPath       |Value       |
      | /datas/data/ageingdate  | todayDate |
      | /datas/data/outlet_id   | DB.outlets:id:name="ageing" |
    And I post the request with "POST_addageingapi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | true   |
      | $.reason  | "Ageing Data saved successfully"   |
    And I verify the data got updated as needed from DB
      | expectedColumn                            | expectedValue |
      | DB:ageingoutlets:outlet_id:id = (SELECT MAX(id) FROM ageingoutlets) | 5213 |
    And verify response time is less than "1500" milliseconds

  @AddAgeingApiEmptyOutletId
  Scenario: TC_02 AddAgeingApi -  empty outlet id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_addageingapi" XML payload
      |XPath       |Value       |
      | /datas/data/ageingdate  | todayDate |
      | /datas/data/outlet_id  |  |
    And I post the request with "POST_addageingapi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
      | $.reason  | "Missing mandatory field outlet_id \/ outlet_erp_id. "   |
    And verify response time is less than "1500" milliseconds

  @AddAgeingApiEmptyAgeingDate
  Scenario: TC_03 AddAgeingApi -  empty ageingdate
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_addageingapi" XML payload
      |XPath       |Value       |
      | /datas/data/ageingdate  |  |
    And I post the request with "POST_addageingapi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
      | $.reason  | "Date should be in YYYY-MM-DD format."   |
    And verify response time is less than "1500" milliseconds

  @AddAgeingApiEmptyTotal
  Scenario: TC_04 AddAgeingApi -  empty total
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "POST_addageingapi" XML payload
      |XPath       |Value       |
      | /datas/data/ageingdate  | todayDate |
      | /datas/data/total  |  |
    And I post the request with "POST_addageingapi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.result  | false   |
      | $.reason  | "Values must be numeric and non-empty."   |
    And verify response time is less than "1500" milliseconds