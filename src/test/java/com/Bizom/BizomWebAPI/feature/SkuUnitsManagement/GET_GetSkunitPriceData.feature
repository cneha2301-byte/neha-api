@BizomWebAPI @SkuUnitsManagement @GetSkunitPriceData @ProductManagement @OS
Feature: Get Skunit Price Data API Testing
  As a system user
  I want to test the skunits getSkunitPriceData endpoint
  So that I can retrieve price and MRP data for a given skunit by ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get skunit price data without access token
    When I send the GET request to "skunits_get_skunit_price_data" endpoint with path parameters
      |Path|Value|
      |skunitId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skunit price data with invalid access token
#    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|skunitId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skunit price data with expired access token
#    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|skunitId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get skunit price data with malformed access token
#    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|skunitId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get skunit price data for skunit ID 1 with valid access token
    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skunitId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|No Data Found|
      |$.priceData['1'].Skunit.id|"1"|
      |$.priceData['1'].Skunit.price|"25.00000"|
      |$.priceData['1'].Skunit.mrp|"28.00000"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.priceData|object|
      |$.priceData['1']|object|
      |$.priceData['1'].Skunit|object|
      |$.priceData['1'].Skunit.id|string|
      |$.priceData['1'].Skunit.price|string|
      |$.priceData['1'].Skunit.mrp|string|
    And I store the response as "skunit_price_data_1_response" name using full path

#  @Positive @DBValidation
#  Scenario: DB validate price and MRP for skunit ID 1
#    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|skunitId|1|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.priceData['1'].Skunit.price|DB:skunits:price: id=1|
#      |$.priceData['1'].Skunit.mrp|DB:skunits:mrp: id=1|

#  @Negative @Validation
#  Scenario: Get skunit price data with blank skunit ID
#    And I send the GET request to "skunits_get_skunit_price_data_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|No Data Found|

#  @Negative @Validation
#  Scenario: Get skunit price data with invalid skunit ID
#    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|skunitId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"false"|
#      |$.Reason|No Data Found|
#      |$.priceData|Data not found.|

#  @Negative @ErrorHandling
#  Scenario: Get skunit price data with invalid endpoint
#    And I send the GET request to "skunits_get_skunit_price_data_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get skunit price data endpoint
    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skunitId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get skunit price data endpoint
    And I send the GET request to "skunits_get_skunit_price_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skunitId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
