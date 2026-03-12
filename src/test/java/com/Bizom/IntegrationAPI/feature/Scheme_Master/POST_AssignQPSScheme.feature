@AssignQpsScheme
Feature: This feature file will contain Assigning of QPS schemes

  @AssignQpsSchemePosetive
  Scenario: TC_01 AssignQPSScheme -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AssignQpsSchemeApi" payload
      | JPath     | Value    |
      |$.holderid|DB:warehouses:id: id=1|
      |$.holdertype|warehouse|
      |$.type|multiple|
      |$.startdate|todayDate|
      |$.enddate|futureDate:30|
      |$.scheme_erp_ids|DB:schemegroups:erp_id: id=(SELECT MAX(id) FROM schemegroups)|
    And I post the request with "POST_AssignQpsSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
          Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.Result     | true    |
      | $.Reason  | Scheme assigned successfully.  |
    And verify response time is less than "2500" milliseconds



  @AssignQpsSchemeNegative
  Scenario: TC_02 AssignQPSScheme -  Negative case - remove access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AssignQpsSchemeApi" payload
      | JPath     | Value    |
      |$.holderid|DB:warehouses:id: id=1|
      |$.holdertype|warehouse|
      |$.type|multiple|
      |$.startdate|todayDate|
      |$.enddate|futureDate:30|
      |$.scheme_erp_ids|DB:schemegroups:erp_id: id=(SELECT MAX(id) FROM schemegroups)|
    And I post the request with "POST_AssignQpsSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath               |Value           |
      |$.error             |"invalid_request"|
    And verify response time is less than "2500" milliseconds



  @AssignQpsSchemeNegative
  Scenario: TC_03 AssignQPSScheme -  Negative case - remove holderid blank
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_AssignQpsSchemeApi" payload
      | JPath     | Value    |
      |$.holderid||
      |$.holdertype|warehouse|
      |$.holdertype|warehouse|
      |$.type|multiple|
      |$.startdate|todayDate|
      |$.enddate|futureDate:30|
      |$.scheme_erp_ids|DB:schemegroups:erp_id: id=(SELECT MAX(id) FROM schemegroups)|
    And I post the request with "POST_AssignQpsSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |  ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath               |Value           |
      |$.Result             |false|
      |$.Reason             |Scheme already assigned|
    And verify response time is less than "2500" milliseconds