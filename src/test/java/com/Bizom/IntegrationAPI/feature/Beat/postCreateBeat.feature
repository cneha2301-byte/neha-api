@CreateBeat @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of GET end point of Create Beat Api
  @CreateBeatPositive
  Scenario: TC_01 CreateBeat -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I post the request with "postCreateBeat" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And verify response time is less than "1500" milliseconds
    And I store the response as "CreateBeat" name using full path


  @CreateBeatNoErp
  Scenario: TC_02 CreateBeat -  no erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I remove the "$.Beats[0].erpid" from "postCreateBeat" payload
    And I post the request with "postCreateBeat" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Row Index - 0 -ZoneId Please enter mandatory fields"|

  @CreateBeatWrongErp
  Scenario: TC_02 CreateBeat -  Wrong zone erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postCreateBeat" payload
      | JPath                      | Value              |
      |  $.Beats[0].zone_erpid       | 212121212  |

    And I post the request with "postCreateBeat" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Row Index - 0 -zone_erpid The value does not exist"|