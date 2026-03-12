@Execution
@QpsSchemes
Feature: This feature file will contain creation of QPS schemes

  @CreateQpsSchemePosetive
  Scenario: TC_01 CreateQPSScheme prorated -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_createQpsSchemeApi" payload
      |JPath     | Value    |
      |$.0.Scheme.startdate|todayDate|
      |$.0.Scheme.enddate|futureDate:30|
      |$.1.Scheme.startdate|todayDate|
      |$.1.Scheme.enddate|futureDate:30|
      |$.2.Scheme.startdate|todayDate|
      |$.2.Scheme.enddate|futureDate:30|
      |$.0.Scheme.startdate|todayDate|
      |$.0.Scheme.enddate|futureDate:30|
      |$.group.Scheme.startdate|todayDate|
      |$.group.Scheme.enddate|futureDate:30|
      |$.group.Scheme.skunit_erpid[0]|DB:skunits:skucode: id=1|
      |$.group.Scheme.skunit_erpid[1]|DB:skunits:skucode: id=2|
    And I post the request with "POST_createQpsSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | .Reason  | ["Scheme saved Successfully"] |
    And verify response time is less than "2500" milliseconds


   # -----------------------------------------------------------------------------------------------------------------------------------

  @CreateQpsSchemePosetive
  Scenario: TC_02 CreateQPSScheme slab based -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|/|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/json           |
    And I modify fields with random values and remove fields in "POST_createQpsSchemeApi" payload
      |JPath     | Value    |
      |$.0.Scheme.startdate|todayDate|
      |$.0.Scheme.enddate|futureDate:30|
      |$.1.Scheme.startdate|todayDate|
      |$.1.Scheme.enddate|futureDate:30|
      |$.2.Scheme.startdate|todayDate|
      |$.2.Scheme.enddate|futureDate:30|
      |$.0.Scheme.startdate|todayDate|
      |$.0.Scheme.enddate|futureDate:30|
      |$.group.Scheme.startdate|todayDate|
      |$.group.Scheme.enddate|futureDate:30|
      |$.group.Scheme.applytype|slab|
      |$.group.Scheme.skunit_erpid[0]|DB:skunits:skucode: id=1|
      |$.group.Scheme.skunit_erpid[1]|DB:skunits:skucode: id=2|
      |$.group.Scheme.name|randomString|
      |$.group.Scheme.erp_id|randomInt|
    And I post the request with "POST_createQpsSchemeApi" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value    |
      | .Reason  | ["Scheme saved Successfully"] |
    And verify response time is less than "2500" milliseconds