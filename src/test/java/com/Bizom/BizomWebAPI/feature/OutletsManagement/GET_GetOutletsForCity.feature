@BizomWebAPI @CE @OutletsManagement @GetOutletsForCity @InventoryOperations
Feature: Get Outlets For City API Testing
  As a system user
  I want to test the get outlets for city endpoint
  So that I can ensure the correct outlet listing is returned for a city

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for city without access token
    When I send the GET request to "outlets_get_outlets_for_city" endpoint with path parameters
      |Path|Value|
      |cityId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets for city with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|cityId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for city with expired access token
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|cityId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for city with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|cityId|2|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get outlets for city with valid access token
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|
#      |$.Data['16']|"Test"|
#      |$.Data['769']|"test123BLR"|
#    And I store the response as "outlets_city_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for city response structure
    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cityId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data['16']|string|
      |$.Data['769']|string|

#  @Positive @DataValidation
#  Scenario: TC_07 Validate outlets for city specific data values
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data['770']|"phon"|
#      |$.Data['16']|"Test"|

#  @Positive @ContentValidation
#  Scenario: TC_08 Validate outlets for city content structure
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Data|
#      |Test|
#      |test123BLR|

#  @Positive @Performance
#  Scenario: TC_09 Performance test for outlets for city endpoint
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @Concurrency
#  Scenario: TC_10 Concurrent access test for outlets for city endpoint
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @LoadTesting
#  Scenario: TC_11 Load testing for outlets for city endpoint
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Positive @Regression
#  Scenario: TC_12 Regression test for outlets for city endpoint
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|

#  @Positive @EndToEnd
#  Scenario: TC_13 End-to-end outlets for city data retrieval workflow
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Data Found"|
#    And I store the response as "outlets_city_response" name using full path

#  @Negative @Validation
#  Scenario: TC_14 Get outlets for city with invalid query parameters
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#      |invalid_param|invalid_value| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Negative @Validation
#  Scenario: TC_15 Get outlets for city using special characters in query parameters
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#      |test_param|<script>alert('XSS')</script>| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

#  @Negative @Security
#  Scenario: TC_16 Get outlets for city with SQL injection attempt
#    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|cityId|2|
#      |test_param|'; DROP TABLE outlets; --| | |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_17 Get outlets for city using large city identifier
    And I send the GET request to "outlets_get_outlets_for_city" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cityId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_18 Get outlets for city using invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_city_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|cityId|2|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

