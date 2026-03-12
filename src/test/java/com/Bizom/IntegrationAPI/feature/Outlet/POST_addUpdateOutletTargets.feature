@AddUpdateOutletTargets @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of post end point of addUpdateOutletTargets
  @addUpdateOutletTargetsPositive
  Scenario: TC_01 addUpdateOutletTargets -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I post the request with "POST_addUpdateOutletTargets" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    And I modify fields with random values and remove fields in "POST_addUpdateOutletTargets" payload
      | JPath         | Value       |
      | $.data[0].fromDate | todayDate |
      | $.data[0].toDate | futureDate:1 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Request Processed Successfully, please check the success and error detail   |
    And I verify the data got updated as needed from DB
      | expectedColumn                            | expectedValue |
      | DB:outlettargets:entitytype_id:id = (SELECT MAX(id) FROM outlettargets) | 5312|
    And verify response time is less than "1500" milliseconds

  @addUpdateOutletTargetsEmptyEntityType
  Scenario: TC_02 addUpdateOutletTargets -  empty entityType
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_addUpdateOutletTargets" payload
      | JPath         | Value       |
      | $.data[0].fromDate | todayDate |
      | $.data[0].toDate | futureDate:1 |
      | $.data[0].entityType |  |
    And I post the request with "POST_addUpdateOutletTargets" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | true   |
      | $.Reason  | "Please enter entityType" |
    And verify response time is less than "1500" milliseconds

  @addUpdateOutletTargetsEmptyEntityTypeId
  Scenario: TC_03 addUpdateOutletTargets -  empty entityType id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_addUpdateOutletTargets" payload
      | JPath         | Value       |
      | $.data[0].fromDate | todayDate |
      | $.data[0].toDate | futureDate:1 |
      | $.data[0].entityTypeId |  |
    And I post the request with "POST_addUpdateOutletTargets" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result | true   |
      | $.Reason  | "Kindly pass either entityTypeId or entityTypeErpId. Both cannot be empty." |
    And verify response time is less than "1500" milliseconds

  @addUpdateOutletTargetsEmptyFromDate
  Scenario: TC_04 addUpdateOutletTargets -  empty from date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I post the request with "POST_addUpdateOutletTargets" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    And I modify fields with random values and remove fields in "POST_addUpdateOutletTargets" payload
      | JPath         | Value       |
      | $.data[0].fromDate |  |
      | $.data[0].toDate | futureDate:1 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Request Processed Successfully, please check the success and error detail   |
    And I verify the data got updated as needed from DB
      | expectedColumn                            | expectedValue |
      | DB:outlettargets:entitytype_id:id = (SELECT MAX(id) FROM outlettargets) | 5312|
    And verify response time is less than "1500" milliseconds

  @addUpdateOutletTargetsEmptyToDate
  Scenario: TC_05 addUpdateOutletTargets -  empty to date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I post the request with "POST_addUpdateOutletTargets" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    And I modify fields with random values and remove fields in "POST_addUpdateOutletTargets" payload
      | JPath         | Value       |
      | $.data[0].fromDate | todayDate |
      | $.data[0].toDate |  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result  | true   |
      | $.Reason  | Request Processed Successfully, please check the success and error detail   |
    And I verify the data got updated as needed from DB
      | expectedColumn                            | expectedValue |
      | DB:outlettargets:entitytype_id:id = (SELECT MAX(id) FROM outlettargets) | 5312|
    And verify response time is less than "1500" milliseconds