@Retailer @ChildOutlets @Sanity @allGet
Feature: This feature file contains testcases for GET endpoint getOutletAndChildOutlet

  @getOutletAndChildOutletPositive
  Scenario: TC_01 getOutletAndChildOutlet - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | true  |
      | $.Reason      | ""    |
      | $.Data.id     | "2"   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path

  @getOutletAndChildOutletPositive
  Scenario: TC_02 getOutletAndChildOutlet - different valid outlet IDs
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | true  |
      | $.Data.id     | "1"   |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path

  @OutletsNegative
  Scenario: TC_03 getOutletAndChildOutlet - non-existent outlet ID
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Please Select Outlet " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path

  @OutletsNegative
  Scenario: TC_04 getOutletAndChildOutlet - invalid outlet ID format
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|invalid|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath         | Value |
      | $.Result      | false |
      | $.Reason      | "Please Select Outlet " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path

  @OutletsNegative
  Scenario: TC_05 getOutletAndChildOutlet - empty outlet ID
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId||
    Then I should see the response code as "500"
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path



  @OutletsNegative
  Scenario: TC_06 getOutletAndChildOutlet - negative outlet ID
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|-1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value        |
      | $.Result   | false  |
      | $.Reason | "Please Select Outlet "|
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path

  @OutletsNegative
  Scenario: TC_07 getOutletAndChildOutlet - zero outlet ID
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|0|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value        |
      | $.Result   | false  |
      | $.Reason |"Please Select Outlet " |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path

  @OutletsPositive
  Scenario: TC_08 getOutletAndChildOutlet - verify response structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                               |
      | $.Result                            |
      | $.Reason                            |
      | $.Data                              |
      | $.Data.id                           |
      | $.Data.name                         |
      | $.Data.address                      |
      | $.Data.panno                        |
      | $.Data.gstinno                      |
      | $.Data.outletdata                   |
      | $.Data.outletdata.id                |
      | $.Data.outletdata.name              |
      | $.Data.outletdata.address           |
      | $.Data.outletdata.phoneno           |
      | $.Data.outletdata.email             |
      | $.Data.outletdata.state_id          |
      | $.Data.outletdata.city_id           |
      | $.Data.outletdata.latitude          |
      | $.Data.outletdata.longitude         |
      | $.Data.childOutlets                 |
      | $.Data.isEntitylimitationEnabled    |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path

  @OutletsPositive
  Scenario: TC_09 getOutletAndChildOutlet - verify outlet data structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getOutletAndChildOutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verifies the field is present in the response
      | JPath                           |
      | $.Data.outletdata.id            |
      | $.Data.outletdata.name          |
      | $.Data.outletdata.address       |
      | $.Data.outletdata.phoneno       |
      | $.Data.outletdata.email         |
      | $.Data.outletdata.ownername     |
      | $.Data.outletdata.erp_id        |
      | $.Data.outletdata.outletstate_id|
      | $.Data.outletdata.created       |
      | $.Data.outletdata.modified      |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletDetails" name using full path
