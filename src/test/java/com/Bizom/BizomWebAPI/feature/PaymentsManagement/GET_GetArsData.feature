@PaymentsManagement @GetArsData @SalesOperations
#this API have notice in response so for a time being we are not testing this API
Feature: Get ARS Data API Testing
  As a system user
  I want to test the get ARS data endpoint
  So that I can ensure proper functionality and JSON response validation for ARS data retrieval

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get ARS data without access token
    When I send the GET request to "payments_get_ars_data" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |isRapidOrder|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get ARS data with invalid access token
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |isRapidOrder|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get ARS data with expired access token
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |isRapidOrder|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get ARS data with malformed access token
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |isRapidOrder|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get ARS data with valid access token and isRapidOrder=0
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#    And verify response time is less than "2500" milliseconds
#    And I store the response as "payments_get_ars_data_response" name using full path

#  @Positive @DataValidation
#  Scenario: TC_06 Validate get ARS data JSON response structure
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And verify response time is less than "2500" milliseconds

#  @Positive @DataValidation
#  Scenario: TC_07 Validate get ARS data response data types
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.totalAmount|number|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And verify response time is less than "2500" milliseconds

#  @Positive @ContentValidation
#  Scenario: TC_08 Validate get ARS data response content
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |aaData|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |totalAmount|

  @Positive @ResponseHeaders
  Scenario: TC_09 Verify get ARS data response headers
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isRapidOrder|0|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

#  @Positive @Performance
#  Scenario: TC_10 Performance test for get ARS data endpoint
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|

#  @Positive @Concurrency
#  Scenario: TC_11 Concurrent access test for get ARS data endpoint
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|

  @Positive @Functional
  Scenario: TC_12 Get ARS data with isRapidOrder=1
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isRapidOrder|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.totalAmount|number|

  @Negative @Validation
  Scenario: TC_13 Get ARS data with invalid isRapidOrder value
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isRapidOrder|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get ARS data without isRapidOrder parameter
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.totalAmount|number|

#  @Negative @Validation
#  Scenario: TC_15 Get ARS data with special characters in query parameters
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|

  @Negative @Security
  Scenario: TC_16 Get ARS data with SQL injection attempt
    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |isRapidOrder|'; DROP TABLE payments; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @Boundary
#  Scenario: TC_17 Get ARS data with maximum query parameters
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|

#  @Negative @ErrorHandling
#  Scenario: TC_18 Get ARS data with invalid endpoint
#    And I send the GET request to "payments_get_ars_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

#  @Positive @Functional
#  Scenario: TC_19 Verify get ARS data endpoint functionality
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And contentType as "application/json; charset=UTF-8"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#
#  @Positive @BusinessLogic
#  Scenario: TC_20 Validate get ARS data business logic
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.totalAmount|number|
#
#  @Positive @DataIntegrity
#  Scenario: TC_21 Validate get ARS data data integrity
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.totalAmount|number|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @Regression
#  Scenario: TC_22 Regression test for get ARS data endpoint
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.totalAmount|number|
#
#  @Positive @Functional
#  Scenario: TC_23 Validate get ARS data response completeness
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#      |$.totalAmount|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.totalAmount|number|
#    And validating the response contains the following values
#      |Value|
#      |aaData|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |totalAmount|
#    And I store the response as "payments_get_ars_data_response" name using full path
#
#  @Positive @AaDataFieldValidation
#  Scenario: TC_24 Validate get ARS data aaData array field
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData|[]|
#
#  @Positive @TotalRecordsFieldValidation
#  Scenario: TC_25 Validate get ARS data total records fields
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.iTotalRecords|0|
#      |$.iTotalDisplayRecords|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#
#  @Positive @TotalAmountFieldValidation
#  Scenario: TC_26 Validate get ARS data totalAmount field
#    And I send the GET request to "payments_get_ars_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |isRapidOrder|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.totalAmount|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.totalAmount|number|

