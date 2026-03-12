@AddCreditNote @Sanity @All @Execution @allPost
Feature: This feature file is of the testcases of GET end point of Add Credit Api
  @AddCreditNotePositive
  Scenario: TC_01 add creditnote -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | Result  | true   |
    And verify response time is less than "1500" milliseconds
    And I store the response as "postAddCreditNote" name using full path

#  @AddCreditNoteNoWarehouseErp
#  Scenario: TC_03 Creditnote -  no warehouse erp id given
#    Given I set up base URI for transactions
#    When I set up request specification
#      | HeaderName        | HeaderValue                |
#      | Accept            | */*                        |
#      | Connection        | keep-alive                 |
#      | Accept-Encoding   | gzip, deflate, br          |
#      | Content-Type      | application/json           |
#
#    When I remove the "$.[0].Cdnote.warehouse_erp_id" from "postAddCreditNote" payload
#    And I post the request with "postAddCreditNote" payload with query parameter
#      |Query         |Value                           |
#      |access_token  |687aa995fd7479804423d95522ce343f2e122973  |
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      | JPath              | Value                      |
#      | $.Result            | false |
#      | $.Reason            | "Invalid request.Please pass valid field Outlet: No Data Found"|

  @AddCreditNoteNoOutletErp
  Scenario: TC_02 Creditnote -  no outlet erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I remove the "$.[0].Cdnote.outlet_erp_id" from "postAddCreditNote" payload
    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Invalid request.Please pass valid field"|

  @AddCreditNoteNoType
  Scenario: TC_03 creditnote -  no type given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I remove the "$.[0].Cdnote.type" from "postAddCreditNote" payload
    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Request has errors present. Please check response for more details."|

  @AddCreditNoteNoAmount
  Scenario: TC_04 Creditnote -  no amount given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I remove the "$.[0].Cdnote.amount" from "postAddCreditNote" payload
    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Request has errors present. Please check response for more details."|
      | $.Data[0].Reason    | "The amount should be greater than zero."|


  @AddCreditNoteNegativeAmount
  Scenario: TC_05 Credit note - negative amount
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                      | Value              |
      |  $.[0].Cdnote.amount       |   -20  |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Request has errors present. Please check response for more details."|
      | $.Data[0].Reason    | "The amount should be greater than zero."|

  @AddCreditNotefutureDate
  Scenario: TC_06 Credit note
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                      | Value              |
      |  $.[0].Cdnote.fordate       |   2026-07-14 |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | true |

  @AddCreditNotePastDate
  Scenario: TC_07 Credit note
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                      | Value              |
      |  $.[0].Cdnote.fordate       |   2024-07-14 |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | true |

  @AddCreditNoteWrongtype
  Scenario: TC_08 Credit note - wrong type
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                      | Value              |
      |  $.[0].Cdnote.type       |   aklasl  |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath              | Value                      |
      | $.Result            | false |
      | $.Reason            | "Request has errors present. Please check response for more details."|
      | $.Data[0].Reason    | "Please provide correct note type as credit or debit."|

  @AddCreditNoteWrongWarehouseErp
  Scenario: TC_09 Creditnote - Wrong warehouse erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                             | Value         |
      | $.[0].Cdnote.warehouse_erp_id     | trp123343434  |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |

    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |

    And the response field "$.Reason" should exactly be "Invalid request. Warehouse: Warehouse Erp Id {value} are invalid." using value from "$.[0].Cdnote.warehouse_erp_id" in the payload


  @AddCreditNoteWrongOutletErp
  Scenario: TC_10 Creditnote - Wrong Outlet erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                             | Value         |
      | $.[0].Cdnote.outlet_erp_id     | trp123343434  |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |

    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |

    And the response field "$.Reason" should exactly be "Invalid request. Outlet: Erp Id {value} are invalid" using value from "$.[0].Cdnote.outlet_erp_id" in the payload

  @AddCreditNoteBlankErpId
  Scenario: TC_11 Creditnote - blank erp erp id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                             | Value         |
      | $.[0].Cdnote.outlet_erp_id     |   |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |

    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Invalid request.Please pass valid field |

  @AddCreditNoteBlankAmount
  Scenario: TC_12 Creditnote - blank amount id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                             | Value         |
      | $.[0].Cdnote.amount     |   |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |

    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Request has errors present. Please check response for more details. |

  @AddCreditNoteBlankType
  Scenario: TC_13 Creditnote - blank type id given
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName        | HeaderValue                |
      | Accept            | */*                        |
      | Connection        | keep-alive                 |
      | Accept-Encoding   | gzip, deflate, br          |
      | Content-Type      | application/json           |

    When I modify the fields in "postAddCreditNote" payload
      | JPath                             | Value         |
      | $.[0].Cdnote.type     |   |

    And I post the request with "postAddCreditNote" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |

    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false |
      | $.Reason  | Request has errors present. Please check response for more details. |