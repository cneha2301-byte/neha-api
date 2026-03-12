@UploadPjp @Sanity @All @Execution @allPost
Feature: This feature file is of the testcases of GET end point of Product Master Api
  @UploadPjpPositive
  Scenario: TC_01 Pjp -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And verify response time is less than "1500" milliseconds
    And I store the response as "UploadPjp" name using full path


  @UploadPjpPrevDate
  Scenario: TC_02 Pjp -  fordate is a past date
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postUploadPjp" payload
      | JPath                      | Value              |
      |  $[0].fordate        |2019-08-04  |

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 fordate(dd-mm-yyyy) Oops u cannot upload pjp for date less than current date." |

  @UploadPjpWrongErp
  Scenario: TC_03 Pjp -  Wrong erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postUploadPjp" payload
      | JPath                      | Value              |
      |  $[0].beat_erpid       | 212121212  |

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 beat_erpid not exist is Inactive/Not Found"|

  @UploadPjpWrongEmpId
  Scenario: TC_04 Pjp -  Wrong emp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postUploadPjp" payload
      | JPath                      | Value              |
      |  $[0].employeeid       | 212121212  |

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 employeeid not found / inactive"|

  @UploadPjpNoErp
  Scenario: TC_05 Pjp -  no erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I remove the "$[0].beat_erpid" from "postUploadPjp" payload
    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 beat_id or beat_erpid is mandatory"|

  @UploadPjpNoEmpId
  Scenario: TC_06 Pjp -  no employee id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I remove the "$[0].employeeid" from "postUploadPjp" payload
    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 employeeid or user_id is mandatory"|

  @UploadPjpFutureDate
  Scenario: TC_07 Pjp -  fordate is a future date
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postUploadPjp" payload
      | JPath                      | Value              |
      |  $[0].fordate        | 2026-08-09  |

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | true |


#  @UploadPjpNegativeFreq
#  Scenario: TC_08 Pjp -  negative freq id given
#    Given I set up base URI for transactions
#    When I set up request specification
#      | HeaderName        | HeaderValue                |
#      | Accept            | */*                        |
#      | Connection        | keep-alive                 |
#      | Accept-Encoding   | gzip, deflate, br          |
#      | Content-Type      | application/json           |
#
#    When I modify the fields in "postUploadPjp" payload
#      | JPath                      | Value              |
#      |  $[0].frequency       | "-2"  |
#
#    And I post the request with "postUploadPjp" payload with query parameter
#      |Query         |Value                           |
#      |access_token  |687aa995fd7479804423d95522ce343f2e122973  |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      | JPath              | Value                      |
#      | $.Result            | false |
#      | $.Reason            | "Rowindex - 0 employeeid not found / inactive"|

  @UploadPjpBlankErp
  Scenario: TC_10 Pjp -  blank erp
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postUploadPjp" payload
      | JPath                      | Value              |
      |  $[0].beat_erpid        |   |

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 beat_id or beat_erpid is mandatory"|

  @UploadPjpBlankFordate @a
  Scenario: TC_11 Pjp -  blank fordate
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postUploadPjp" payload
      | JPath                      | Value              |
      |  $[0].fordate        |   |

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 fordate(dd-mm-yyyy) Oops u cannot upload pjp for date less than current date."|

  @UploadPjpBlankEmployeeId
  Scenario: TC_12 Pjp -  blank emp id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postUploadPjp" payload
      | JPath                      | Value              |
      |  $[0].employeeid        |   |

    And I post the request with "postUploadPjp" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Rowindex - 0 employeeid or user_id is mandatory"|




