@Retailer  @GRN @allPost
Feature: Payments - getmbretailerGrndetails
  Validates GRN details retrieval by GRN IDs.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|json|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "getmbretailerGrndetails" payload
      | JPath           | Value |
      | $.grnIds[0]    | 1     |
    And I post the request with "getmbretailerGrndetails" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value       |
      | $.Result           | true        |
      | $.Reason           | Data found  |
      | $.Data[0].id       | "1"          |
      | $.Data[0].status   | Delivered   |
    And verify response time is less than "1500" milliseconds

  @Positive
  Scenario: TC_02 GRN id 2 returns Not Delivered
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath           | Value |
      | $.grnIds[0]     | 2     |
    And I post the request with "getmbretailerGrndetails" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value         |
      | $.Result           | true          |
      | $.Reason           | Data found    |
      | $.Data[0].id       | "2"           |
      | $.Data[0].status   | NotDelivered |
    And verify response time is less than "2000" milliseconds

  @Positive
  Scenario: TC_03 GRN id 3 returns Pending
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath           | Value |
      | $.grnIds[0]     | 3     |
    And I post the request with "getmbretailerGrndetails" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value     |
      | $.Result           | true      |
      | $.Reason           | Data found|
      | $.Data[0].id       | "3"       |
      | $.Data[0].status   | Pending   |
    And verify response time is less than "1500" milliseconds

  @Negative @Security
  Scenario: TC_04 Missing access token
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath           | Value |
      | $.grnIds[0]     | 1     |
    And I post the request with "getmbretailerGrndetails" payload
    Then I should see the response code as "403"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_05 Invalid access token
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath           | Value |
      | $.grnIds[0]     | 1     |
    And I post the request with "getmbretailerGrndetails" payload with query parameter
      |Query       |Value       |
      |access_token|invalid_token_123|
    And the fields in response should match with expected values
      | JPath              | Value         |
      | $.result           | false          |
      | $.error.code       | 401           |
      | $.error.message   | "Invalid Access Token or Credentials" |
    And verify response time is less than "2000" milliseconds

  @Negative
  Scenario: TC_06 Empty body
    And I send empty body with "getmbretailerGrndetails" request
    And I post the request with "getmbretailerGrndetails" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "3500" milliseconds

  @Negative
  Scenario: TC_07 Malformed JSON body
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath       | Value |
      | $.grnIds    | not_an_array |
    And I post the request with "getmbretailerGrndetails" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value     |
      | $.Result           | false      |
      | $.Reason           |     "Data not found"      |

    And verify response time is less than "3500" milliseconds

  @Negative
  Scenario: TC_08 Empty grnIds array
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath       | Value |
      | $.grnIds    | []    |
    And I post the request with "getmbretailerGrndetails" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value     |
      | $.Result           | false      |
      | $.Reason           | "Data not found"|

    And verify response time is less than "2000" milliseconds

  @Negative
  Scenario: TC_09 Non-existent grn id
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath           | Value |
      | $.grnIds[0]     | 99999 |
    And I post the request with "getmbretailerGrndetails" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value     |
      | $.Result           | false      |
      | $.Reason           | "Data not found"|
    And verify response time is less than "2000" milliseconds

  @Negative
  Scenario: TC_10 Multiple grnIds in request
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath       | Value            |
      | $.grnIds    | [1,2,3]         |
    And I post the request with "getmbretailerGrndetails" payload with dynamic access token and query parameters
      |Query       |Value       |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value     |
      | $.Result           | false      |
      | $.Reason           | "Data not found"|
    And verify response time is less than "2000" milliseconds

  @DBvalidation
  Scenario: TC_11 DB validation for status of grn
    When I modify fields with values and fields with random values in "getmbretailerGrndetails" payload
      | JPath           | Value |
      | $.grnIds[0]     | 2     |
    And I post the request with "getmbretailerGrndetails" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value         |
      | $.Result           | true          |
      | $.Reason           | Data found    |
      | $.Data[0].id       | "2"           |
      | $.Data[0].status   | NotDelivered |
        And I verify API response at path with DB and static values
      |JPath|Value|
      | $.Data[0].status | DB:mbretailergrndetails:status: id=2 |


