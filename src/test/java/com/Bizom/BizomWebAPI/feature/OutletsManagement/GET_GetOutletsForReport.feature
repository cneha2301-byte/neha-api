@BizomWebAPI @CE @OutletsManagement @GetOutletsForReport @InventoryOperations
Feature: Get Outlets For Report API Testing
  As a system user
  I want to test the get outlets for report endpoint
  So that I can ensure report outlet listings are returned accurately

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets for report without access token
    When I send the GET request to "outlets_get_outlets_for_report" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlets for report with invalid access token
#    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlets for report with expired access token
#    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlets for report with malformed access token
#    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlets for report with valid access token
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|""|
      |$.outlets[0].id|"2"|
      |$.outlets[0].name|"2-Sadha Nanda1-99e1"|
    And I store the response as "outlets_report_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlets for report response structure
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|string|
      |$.outlets|array|
      |$.outlets[0]|object|
      |$.outlets[0].id|string|
      |$.outlets[0].name|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlets for report specific data values
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[1].id|"3"|
      |$.outlets[1].name|"3-chinaAmma Store-erp123"|
      |$.outlets[10].name|"12-test"|

  @Positive @ContentValidation
  Scenario: TC_08 Validate outlets for report content structure
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |outlets|
      |2-Sadha Nanda1-99e1|
      |3-chinaAmma Store-erp123|
      |5-Poonam Provision|
      |7-Smith Bakery|

  @Positive @ArrayValidation
  Scenario: TC_09 Validate outlets array objects for report response
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outlets[5]|object|
      |$.outlets[5].id|string|
      |$.outlets[5].name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.outlets[5].id|"7"|
      |$.outlets[5].name|"7-Smith Bakery"|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlets for report endpoint
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for outlets for report endpoint
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @LoadTesting
  Scenario: TC_12 Load testing for outlets for report endpoint
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @Regression
  Scenario: TC_13 Regression test for outlets for report endpoint
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|""|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end outlets for report data retrieval workflow
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|""|
    And I store the response as "outlets_report_response" name using full path

  @Negative @Validation
  Scenario: TC_15 Get outlets for report with invalid query parameters
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_16 Get outlets for report using special characters in query parameters
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security
  Scenario: TC_17 Get outlets for report with SQL injection attempt
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Boundary
  Scenario: TC_18 Get outlets for report with excessive query parameters
    And I send the GET request to "outlets_get_outlets_for_report" endpoint with dynamic access token and query parameters
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
  Scenario: TC_19 Get outlets for report using invalid endpoint
    And I send the GET request to "outlets_get_outlets_for_report_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

