@BizomWebAPI @OS @PaymentsManagement @IndexWithDate @SalesOperations
Feature: Index With Date API Testing
  As a system user
  I want to test the index with date endpoint
  So that I can ensure proper functionality and data retrieval for payments with date range

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get index with date without access token
    When I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get index with date with valid access token and dates
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|
    And I store the response as "index_with_date_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate index with date response structure
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate index with date draw field
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate index with date recordsTotal field
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.recordsTotal|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.recordsTotal|number|

  @Positive @DataValidation
  Scenario: TC_09 Validate index with date recordsFiltered field
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.recordsFiltered|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.recordsFiltered|number|

  @Positive @DataValidation
  Scenario: TC_10 Validate index with date data array field
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_11 Validate index with date warehousePL array field
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.warehousePL|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.warehousePL|array|

  @Positive @DataValidation
  Scenario: TC_12 Validate index with date complete structure
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|

  @Positive @Performance
  Scenario: TC_13 Performance test for index with date endpoint
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|

  @Positive @Concurrency
  Scenario: TC_14 Concurrent access test for index with date endpoint
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|

  @Negative @Validation
  Scenario: TC_15 Get index with date with invalid date format for fromdate
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020/04/22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get index with date with invalid date format for todate
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025/11/24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get index with date with fromdate greater than todate
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2025-11-24|
      |||todate|2020-04-22|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|

  @Negative @Validation
  Scenario: TC_18 Get index with date with empty fromdate
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate||
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Get index with date with empty todate
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_20 Get index with date with same fromdate and todate
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2020-04-22|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|

  @Negative @Boundary
  Scenario: TC_21 Get index with date with very large date range
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2000-01-01|
      |||todate|2099-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|

#  @Negative @ErrorHandling
#  Scenario: TC_22 Get index with date with invalid endpoint
#    And I send the GET request to "payments_indexwithdate_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
#      |||todate|2025-11-24|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_23 Validate index with date business logic
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate index with date data integrity
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|

  @Positive @Regression
  Scenario: TC_25 Regression test for index with date endpoint
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|

  @Positive @Functional
  Scenario: TC_26 Validate index with date response completeness
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|
      |warehousePL|
    And I store the response as "index_with_date_response" name using full path

  @Positive @DataValidation
  Scenario: TC_27 Validate index with date DataTables structure consistency
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2020-04-22|
      |||todate|2025-11-24|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
      |$.data|[]|
      |$.warehousePL|[]|

  @Positive @Boundary
  Scenario: TC_28 Validate index with date with different date ranges
    And I send the GET request to "payments_indexwithdate" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2024-01-01|
      |||todate|2024-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|1|
      |$.recordsTotal|0|
      |$.recordsFiltered|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|number|
      |$.recordsTotal|number|
      |$.recordsFiltered|number|
      |$.data|array|
      |$.warehousePL|array|

