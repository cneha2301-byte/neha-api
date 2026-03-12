@AddMultiScheme @Sanity @All  @Execution @allPost
Feature: This feature file is of the testcases of post end point of addMultiSchemeApi
  @AddMultiSchemePositive
  Scenario: TC_01 addMultiSchemeApi -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I post the request with "POST_addMultiSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.[0].Result  | true   |
    And verify response time is less than "1500" milliseconds

  @addMultiSchemeEmptySchemegroupName
  Scenario: TC_02 addMultiSchemeApi -  empty Schemegroup name
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_addMultiSchemeApi" payload
      | JPath         | Value       |
      | multipleScheme[0].group.Scheme.name ||
    And I post the request with "POST_addMultiSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.[0].Result | false   |
      | $.[0].Reason  | name in Schemegroup is mandatory |
    And verify response time is less than "1500" milliseconds

  @addMultiSchemeEmptySchemeGroupType
  Scenario: TC_03 addMultiSchemeApi -  empty Scheme Group Type
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_addMultiSchemeApi" payload
      | JPath         | Value       |
      | multipleScheme[0].group.Scheme.type ||
    And I post the request with "POST_addMultiSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.[0].Result | false   |
      | $.[0].Reason  |"in freeskuforsku Group type must should be regular,cash,lpc,qpsquantity,qpsamount "|
    And verify response time is less than "1500" milliseconds

  @addMultiSchemeInvalidSchemeGroupType
  Scenario: TC_04 addMultiSchemeApi -  invalid Scheme Group Type
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_addMultiSchemeApi" payload
      | JPath         | Value       |
      | multipleScheme[0].group.Scheme.type |premium|
    And I post the request with "POST_addMultiSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.[0].Result | false   |
      | $.[0].Reason  |"in freeskuforsku Group type must should be regular,cash,lpc,qpsquantity,qpsamount "|
    And verify response time is less than "1500" milliseconds

  @addMultiSchemeEmptySchemeGroupApplyType
  Scenario: TC_05 addMultiSchemeApi -  empty Scheme Group Apply Type
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_addMultiSchemeApi" payload
      | JPath         | Value       |
      | multipleScheme[0].group.Scheme.applytype ||
    And I post the request with "POST_addMultiSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.[0].Result | false   |
      | $.[0].Reason  | applytype in Schemegroup is mandatory |
    And verify response time is less than "1500" milliseconds

  @addMultiSchemeInvalidSchemeGroupApplyType
  Scenario: TC_06 addMultiSchemeApi -  invalid Scheme Group Apply Type
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with values and fields with random values in "POST_addMultiSchemeApi" payload
      | JPath         | Value       |
      | multipleScheme[0].group.Scheme.applytype |abc|
    And I post the request with "POST_addMultiSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | $.[0].Result | false   |
      | $.[0].Reason  | Scheme apply type should be slab or prorated |
    And verify response time is less than "1500" milliseconds

    @addMultiSchemeEmptyForquantity
    Scenario: TC_07 addMultiSchemeApi -  empty forquantity
      Given I set up base URI for transactions
      When I set up request specification
        |HeaderName|HeaderValue|
        |Accept|*/*|
        |Accept-Encoding|gzip,deflate, br|
        |Connection|keep-alive|
        | Content-Type      | application/json           |
      And I modify fields with values and fields with random values in "POST_addMultiSchemeApi" payload
        | JPath         | Value       |
        | multipleScheme[0].0.Scheme.forquantity ||
        | multipleScheme[0].1.Scheme.forquantity ||
        | multipleScheme[0].2.Scheme.forquantity ||
      And I post the request with "POST_addMultiSchemeApi" payload with dynamic access token and query parameters
        |Query         |Value                           |
        |access_token  |ACCESS_TOKEN  |
      Then I should see the response code as "200"
      And the fields in response should match with expected values
        | JPath     | Value    |
        | $.[0].Result | false   |
        | $.[0].Reason  | In Forskusgroup Skunits_id or Quantity are invalid |
      And verify response time is less than "1500" milliseconds