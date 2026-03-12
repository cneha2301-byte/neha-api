@BizomWebAPI @CustomReportsManagement @CustomReportsGetOrdersStats @SupportingFunctions @CE
 #Notice is coming from the response[Bug], AFTER FIX WILL add @BizomWebAPI tag
Feature: Custom Reports Get Orders Stats Testing
  As a system user
  I want to test the custom reports get orders stats endpoint
  So that I can ensure proper functionality and data retrieval for custom reports management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get orders stats without access token
    When I send the GET request to "customreports_getordersstats" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get orders stats with invalid access token
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get orders stats with expired access token
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get orders stats with malformed access token
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get orders stats with valid access token
#    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.totalpjpoutlets|115|
#      |$.totaloutlets|2060|
#      |$.productivecalls|2059|
#      |$.totalquantity|54199313.11958333|
#      |$.outletsadded|0|
#    And I store the response as "customreports_getordersstats_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate orders stats response structure
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user|object|
      |$.totalpjpoutlets|number|
      |$.totaloutlets|number|
      |$.productivecalls|number|
      |$.totalquantity|number|
      |$.outletsadded|number|

  @Positive @DataValidation
  Scenario: TC_07 Validate product entries structure under user
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user["1"].productname|string|
      |$.user["1"].quantity|number|
      |$.user["6"].productname|string|
      |$.user["6"].quantity|number|

  @Positive @SpecificValues
  Scenario: TC_08 Validate sample product values
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.user["1"].productname|Cafe Cuba|
      |$.user["2"].productname|Maaza|
      |$.user["3"].productname|Fanta|
      |$.user["4"].productname|Slice|

  @Positive @Performance
  Scenario: TC_09 Performance test for get orders stats endpoint
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get orders stats with invalid query parameters
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get orders stats with special characters in query parameters
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get orders stats with SQL injection attempt
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE customreports; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_13 Get orders stats with maximum query parameters
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get orders stats invalid endpoint
#    And I send the GET request to "customreports_getordersstats_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_15 Store get orders stats response for further use
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "customreports_getordersstats_response" name using full path

#  @Positive @BusinessLogic
#  Scenario: TC_16 Validate orders stats business logic
#    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.totalpjpoutlets|115|
#      |$.totaloutlets|2060|
#      |$.productivecalls|2059|
#      |$.totalquantity|54199313.11958333|
#      |$.outletsadded|0|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate orders stats data integrity
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user|object|
      |$.totalpjpoutlets|number|
      |$.totaloutlets|number|
      |$.productivecalls|number|
      |$.totalquantity|number|
      |$.outletsadded|number|
      |$.user["1"].productname|string|
      |$.user["1"].quantity|number|
      |$.user["6"].productname|string|
      |$.user["6"].quantity|number|

  @Positive @Regression
  Scenario: TC_18 Regression test for orders stats endpoint
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user|object|
      |$.totalpjpoutlets|number|
      |$.totaloutlets|number|
      |$.productivecalls|number|
      |$.totalquantity|number|
      |$.outletsadded|number|

  @Positive @Functional
  Scenario: TC_19 Validate orders stats response completeness
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.user["1"].productname|Cafe Cuba|
      |$.user["2"].productname|Maaza|
      |$.user["3"].productname|Fanta|
      |$.user["4"].productname|Slice|

  @Positive @ObjectValidation
  Scenario: TC_20 Validate user object structure and content
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user|object|
      |$.user["1"]|object|
      |$.user["6"]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.user["1"].productname|Cafe Cuba|
      |$.user["1"].quantity|5435.541666666632|
      |$.user["6"].productname|Kurkure|
      |$.user["6"].quantity|4168763.707916667|

  @Positive @ContentValidation
  Scenario: TC_21 Validate orders stats content structure
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |user|
      |totalpjpoutlets|
      |totaloutlets|
      |productivecalls|
      |totalquantity|
      |outletsadded|
      |productname|
      |quantity|

#  @Positive @LoadTesting
#  Scenario: TC_22 Load testing for orders stats endpoint
#    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.totalpjpoutlets|115|
#      |$.totaloutlets|2060|
#      |$.productivecalls|2059|

#  @Negative @Timeout
#  Scenario: TC_23 Test orders stats endpoint timeout handling
#    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.totalpjpoutlets|115|
#      |$.totaloutlets|2060|
#      |$.productivecalls|2059|

#  @Positive @EndToEnd
#  Scenario: TC_24 End-to-end orders stats data retrieval workflow
#    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.totalpjpoutlets|115|
#      |$.totaloutlets|2060|
#      |$.productivecalls|2059|
#      |$.totalquantity|54199313.11958333|
#      |$.outletsadded|0|
#    And I store the response as "customreports_getordersstats_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.user|object|
#      |$.totalpjpoutlets|number|
#      |$.totaloutlets|number|
#      |$.productivecalls|number|
#      |$.totalquantity|number|
#      |$.outletsadded|number|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.user["1"].productname|Cafe Cuba|
#      |$.user["2"].productname|Maaza|
#      |$.user["3"].productname|Fanta|
#      |$.user["4"].productname|Slice|

#  @Positive @Headers
#  Scenario: TC_25 Validate orders stats response headers
#    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Cache-Control|no-cache|

  @Positive @DataCompleteness
  Scenario: TC_26 Validate orders stats data completeness
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user["1"]|object|
      |$.user["2"]|object|
      |$.user["3"]|object|
      |$.user["4"]|object|
      |$.user["5"]|object|
      |$.user["6"]|object|
      |$.user["13"]|object|

  @Positive @EdgeCase
  Scenario: TC_27 Validate orders stats edge cases
    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.user["1"].productname|string|
      |$.user["1"].quantity|number|
      |$.user["6"].productname|string|
      |$.user["6"].quantity|number|

#  @Positive @Comprehensive
#  Scenario: TC_28 Comprehensive orders stats validation
#    And I send the GET request to "customreports_getordersstats" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.user|object|
#      |$.totalpjpoutlets|number|
#      |$.totaloutlets|number|
#      |$.productivecalls|number|
#      |$.totalquantity|number|
#      |$.outletsadded|number|
#      |$.user["1"]|object|
#      |$.user["1"].productname|string|
#      |$.user["1"].quantity|number|
#      |$.user["6"]|object|
#      |$.user["6"].productname|string|
#      |$.user["6"].quantity|number|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.user["1"].productname|Cafe Cuba|
#      |$.user["1"].quantity|5435.541666666632|
#      |$.user["6"].productname|Kurkure|
#      |$.user["6"].quantity|4168763.707916667|
#    And I store the response as "customreports_getordersstats_response" name using full path
#

