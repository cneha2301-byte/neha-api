@BizomWebAPI @PI @DiscountsManagement @DiscountsGetSKUnits @IntegrationServices
Feature: Discounts Get SKUnits API Testing
  As a system user
  I want to test the discounts get SKUnits endpoint
  So that I can ensure proper functionality and data retrieval for discounts management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get skunits without access token
    When I send the GET request to "discounts_getskunits" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get skunits with invalid access token
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get skunits with expired access token
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get skunits with malformed access token
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get skunits with valid access token
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|
    And I store the response as "discounts_getskunits_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get skunits response structure and data types
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].mrp|string|
      |$.aaData[0].price|string|
      |$.aaData[0].sku_id|string|
      |$.aaData[0].skucode|string|
      |$.aaData[0].skunit_name|string|
      |$.aaData[0].unitcase|string|
      |$.aaData[0].unitspercase|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate specific skunit values
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].sku_id|"1"|
      |$.aaData[0].skunit_name|"Cafe Cuba"|
      |$.aaData[0].skucode|"Cuba"|
      |$.aaData[1].sku_id|"2"|
      |$.aaData[1].skunit_name|"Maaza"|
      |$.aaData[2].sku_id|"3"|
      |$.aaData[2].skunit_name|"Fanta"|
      |$.aaData[3].sku_id|"4"|
      |$.aaData[3].skunit_name|"Slice"|

  @Positive @Performance
  Scenario: TC_08 Performance test for get skunits endpoint
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for get skunits endpoint
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get skunits with invalid query parameters
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get skunits with special characters in query parameters
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get skunits with SQL injection attempt
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_13 Get skunits with maximum query parameters
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Get skunits invalid endpoint
    And I send the GET request to "discounts_getskunits_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Headers
#  Scenario: TC_15 Validate get skunits response headers
#    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Cache-Control|no-cache|

  @Positive @ResponseStorage
  Scenario: TC_16 Store get skunits response for further use
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "discounts_getskunits_response" name using full path

  @Positive @DataIntegrity
  Scenario: TC_17 Validate get skunits data integrity
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[1]|object|
      |$.aaData[0].sku_id|string|
      |$.aaData[1].sku_id|string|
      |$.aaData[0].skunit_name|string|
      |$.aaData[1].skunit_name|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for get skunits endpoint
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @Functional
  Scenario: TC_19 Validate get skunits response completeness
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].sku_id|"1"|
      |$.aaData[0].skunit_name|"Cafe Cuba"|
      |$.aaData[3].sku_id|"4"|
      |$.aaData[3].skunit_name|"Slice"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate get skunits array structure and content
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[1]|object|
      |$.aaData[0].sku_id|string|
      |$.aaData[1].sku_id|string|
      |$.aaData[0].skunit_name|string|
      |$.aaData[1].skunit_name|string|

  @Positive @ContentValidation
  Scenario: TC_21 Validate get skunits content structure
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |aaData|
      |sku_id|
      |skunit_name|
      |skucode|
      |mrp|
      |price|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for get skunits endpoint
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_23 Test get skunits endpoint timeout handling
    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

#  @Positive @EndToEnd
#  Scenario: TC_24 End-to-end get skunits data retrieval workflow
#    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|61|
#      |$.iTotalDisplayRecords|61|
#    And I store the response as "discounts_getskunits_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].sku_id|string|
#      |$.aaData[0].skunit_name|string|
#      |$.aaData[0].skucode|string|
#      |$.aaData[0].mrp|string|
#      |$.aaData[0].price|string|

#  @Positive @Comprehensive
#  Scenario: TC_25 Comprehensive get skunits validation
#    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[3]|object|
#      |$.aaData[0].sku_id|string|
#      |$.aaData[0].skunit_name|string|
#      |$.aaData[3].sku_id|string|
#      |$.aaData[3].skunit_name|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].sku_id|"1"|
#      |$.aaData[0].skunit_name|"Cafe Cuba"|
#      |$.aaData[3].sku_id|"4"|
#      |$.aaData[3].skunit_name|"Slice"|
#    And I store the response as "discounts_getskunits_response" name using full path
#
#  @Positive @DBValidation
#  Scenario: TC_26 Validate get skunits with database verification
#    And I send the GET request to "discounts_getskunits" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.aaData[0].skunit_name|DB:skunits:name: id=1|


