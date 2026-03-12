@BizomWebAPI @PI @DiscountsManagement @IntegrationServices
Feature: Discounts Get Discounts For Outlet API Testing
  As a system user
  I want to test the discounts getdiscountsforoutlet endpoint with path parameters
  So that I can ensure proper functionality and dynamic path handling for discount IDs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get discounts for outlet without access token
    When I send the GET request to "discounts_getdiscountsforoutlet" endpoint with path parameters
      |Path|Value|
      |discountId|2|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get discounts for outlet with invalid access token
#    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|discountId|2|
#    Then I should see the response code as "200"
#    Then the HTML response should contain page title " "
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_03 Get discounts for outlet with expired access token
#    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|discountId|2|
#    Then I should see the response code as "200"
#    Then the HTML response should contain page title " "
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_04 Get discounts for outlet with malformed access token
#    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|discountId|2|
#    Then I should see the response code as "200"
#    Then the HTML response should contain page title " "
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @Smoke @PathParam
#  Scenario: TC_05 Get discounts for outlet for discountId 2
#    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|discountId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Discounts|array|
#      |$.Discounts[0]|object|
#      |$.Discounts[0].Discount|object|
#      |$.Discounts[0].Discount.id|string|
#      |$.Discounts[0].Discount.fromlevelname|string|
#      |$.Discounts[0].Discount.fromlevelid|string|
#      |$.Discounts[0].Discount.skunit_id|string|
#      |$.Discounts[0].Discount.discount|string|
#      |$.Discounts[0].Discount.discountvalue|string|
#      |$.Discounts[0].Discount.tolevelname|string|
#      |$.Discounts[0].Discount.outlet_id|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Discounts[0].Discount.id|"12926"|
#      |$.Discounts[0].Discount.fromlevelname|"zone"|
#      |$.Discounts[0].Discount.fromlevelid|"1"|
#      |$.Discounts[0].Discount.skunit_id|"1"|
#      |$.Discounts[0].Discount.discount|"0.0000"|
#      |$.Discounts[0].Discount.discountvalue|"1.0000"|
#      |$.Discounts[0].Discount.tolevelname|"outlet"|
#      |$.Discounts[0].Discount.outlet_id|"2"|

  @Positive @DataValidation
  Scenario: TC_06 Validate response structure and data types
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Discounts|array|
      |$.Discounts[0]|object|
      |$.Discounts[0].Discount|object|
      |$.Discounts[0].Discount.id|string|
      |$.Discounts[0].Discount.outlet_id|string|

  @Positive @Performance
  Scenario: TC_07 Performance test for getdiscountsforoutlet endpoint
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_08 Concurrent access test for getdiscountsforoutlet endpoint
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get discounts for outlet with invalid query parameters
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
      |invalid_param|invalid_value|        | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_10 Get discounts for outlet with invalid discountId format
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Get discounts for outlet with SQL injection attempt
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
      |test_param|'; DROP TABLE discounts; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get discounts for outlet with special characters in query parameters
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_13 Get discounts for outlet with maximum query parameters
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
      |param1|value1|                      | |
      |param2|value2|                      | |
      |param3|value3|                      | |
      |param4|value4|                      | |
      |param5|value5|                      | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Get discounts for outlet invalid endpoint with path param
    And I send the GET request to "discounts_getdiscountsforoutlet_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_15 Validate getdiscountsforoutlet data integrity
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Discounts|array|
      |$.Discounts[0]|object|
      |$.Discounts[0].Discount.id|string|
      |$.Discounts[0].Discount.outlet_id|string|

  @Positive @Regression
  Scenario: TC_16 Regression test for getdiscountsforoutlet endpoint
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Functional
#  Scenario: TC_17 Validate getdiscountsforoutlet response completeness
#    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|discountId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Discounts[0].Discount.id|"12926"|
#      |$.Discounts[0].Discount.outlet_id|"2"|

  @Positive @ArrayValidation
  Scenario: TC_18 Validate getdiscountsforoutlet array structure and content
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Discounts|array|
      |$.Discounts[0]|object|
      |$.Discounts[0].Discount|object|

  @Positive @ContentValidation
  Scenario: TC_19 Validate getdiscountsforoutlet content structure
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Discounts|
      |Discount|
      |id|
      |fromlevelname|
      |fromlevelid|
      |skunit_id|
      |discount|
      |discountvalue|
      |tolevelname|
      |outlet_id|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for getdiscountsforoutlet endpoint
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_21 Test getdiscountsforoutlet endpoint timeout handling
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end getdiscountsforoutlet data retrieval workflow
    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "discounts_getdiscountsforoutlet_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Discounts|array|
      |$.Discounts[0].Discount.id|string|
      |$.Discounts[0].Discount.outlet_id|string|

#  @Positive @Headers
#  Scenario: TC_23 Validate getdiscountsforoutlet response headers
#    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|discountId|2|
#    Then I should see the response code as "200"
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Cache-Control|private, no-cache, no-store, must-revalidate|
#    And verify response time is less than "2500" milliseconds

#  @Positive @DBValidation @DiscountsGetDiscountsForOutlet
#  Scenario: TC_24 Validate getdiscountsforoutlet with database verification
#    And I send the GET request to "discounts_getdiscountsforoutlet" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|discountId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Discounts[0].Discount.fromlevelname|DB:discounts:fromlevelname: id=3|


