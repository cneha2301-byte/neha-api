@BizomWebAPI @CustomReportsManagement @CustomReportsBilledOutlets @SupportingFunctions @CE
Feature: Custom Reports Billed Outlets API Testing
  As a system user
  I want to test the custom reports billed outlets endpoint
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
  Scenario: TC_01 Get custom reports billed outlets without access token
    When I send the GET request to "customreports_apibilledoutlets" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get custom reports billed outlets with invalid access token
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get custom reports billed outlets with expired access token
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get custom reports billed outlets with malformed access token
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get custom reports billed outlets with valid access token
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "customreports_billedoutlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate custom reports billed outlets response structure
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate custom reports billed outlets specific data values
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|

  @Positive @DataValidation
  Scenario: TC_08 Validate custom reports billed outlets with static values
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|
      |$.aaData[0][2]|0|
      |$.aaData[0][3]|0|
      |$.aaData[0][4]|0|
      |$.aaData[0][5]|0|
      |$.aaData[0][6]|0|
      |$.aaData[0][7]|0|
      |$.aaData[0][8]|0|
      |$.aaData[0][9]|0|
      |$.aaData[0][10]|0|
      |$.aaData[0][11]|0|
      |$.aaData[0][12]|0|
      |$.aaData[0][13]|0|
      |$.aaData[0][14]|0|
      |$.aaData[0][15]|0|
      |$.aaData[0][16]|0|
      |$.aaData[0][17]|0|
      |$.aaData[0][18]|0|
      |$.aaData[0][19]|0|

  @Positive @Performance
  Scenario: TC_09 Performance test for custom reports billed outlets endpoint
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for custom reports billed outlets endpoint
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: TC_11 Get custom reports billed outlets with invalid query parameters
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: TC_12 Get custom reports billed outlets with special characters in query parameters
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Security
  Scenario: TC_13 Get custom reports billed outlets with SQL injection attempt
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE customreports; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Boundary
  Scenario: TC_14 Get custom reports billed outlets with maximum query parameters
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get custom reports billed outlets with invalid endpoint
#    And I send the GET request to "customreports_apibilledoutlets_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate custom reports billed outlets business logic
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate custom reports billed outlets data integrity
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|number|
      |$.aaData[0][3]|number|
      |$.aaData[0][4]|number|
      |$.aaData[0][5]|number|
      |$.aaData[0][6]|number|
      |$.aaData[0][7]|number|
      |$.aaData[0][8]|number|
      |$.aaData[0][9]|number|
      |$.aaData[0][10]|number|
      |$.aaData[0][11]|number|
      |$.aaData[0][12]|number|
      |$.aaData[0][13]|number|
      |$.aaData[0][14]|number|
      |$.aaData[0][15]|number|
      |$.aaData[0][16]|number|
      |$.aaData[0][17]|number|
      |$.aaData[0][18]|number|
      |$.aaData[0][19]|number|

  @Positive @Regression
  Scenario: TC_18 Regression test for custom reports billed outlets endpoint
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @Functional
  Scenario: TC_19 Validate custom reports billed outlets response completeness
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate custom reports billed outlets array structure and content
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[1]|array|
      |$.aaData[2]|array|
      |$.aaData[3]|array|
      |$.aaData[4]|array|
      |$.aaData[5]|array|
      |$.aaData[6]|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|
  @Positive @ContentValidation
  Scenario: TC_21 Validate custom reports billed outlets content structure
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |SLV Traders|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for custom reports billed outlets endpoint
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: TC_23 Test custom reports billed outlets endpoint timeout handling
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end custom reports billed outlets data retrieval workflow
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "customreports_billedoutlets_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|

  @Positive @DataHandling
  Scenario: TC_25 Validate custom reports billed outlets data handling
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|array|
      |$.aaData[0][0]|string|
      |$.aaData[0][1]|string|
      |$.aaData[0][2]|number|
      |$.aaData[0][3]|number|
      |$.aaData[0][4]|number|
      |$.aaData[0][5]|number|
      |$.aaData[0][6]|number|
      |$.aaData[0][7]|number|
      |$.aaData[0][8]|number|
      |$.aaData[0][9]|number|
      |$.aaData[0][10]|number|
      |$.aaData[0][11]|number|
      |$.aaData[0][12]|number|
      |$.aaData[0][13]|number|
      |$.aaData[0][14]|number|
      |$.aaData[0][15]|number|
      |$.aaData[0][16]|number|
      |$.aaData[0][17]|number|
      |$.aaData[0][18]|number|
      |$.aaData[0][19]|number|

  @Positive @ResponseStructure
  Scenario: TC_26 Validate custom reports billed outlets response structure consistency
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|
  @Positive @Headers
  Scenario: TC_27 Get custom reports billed outlets - verify response headers
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2000" milliseconds

  @Positive @Store
  Scenario: TC_28 Store response for custom reports billed outlets
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I store the response as "customreports_billedoutlets_stored_response" name using full path
    And verify response time is less than "2000" milliseconds

  @Positive @MultiEntryValidation
  Scenario: TC_29 Validate custom reports billed outlets multiple entries
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][0]|"2"|
      |$.aaData[0][1]|"SLV Traders"|
      |$.aaData[1][0]|"8"|
      |$.aaData[1][1]|"SLV Traders"|
      |$.aaData[2][0]|"9"|
      |$.aaData[2][1]|"test1"|
      |$.aaData[3][0]|"13"|
      |$.aaData[3][1]|"testuser_tourplan"|
      |$.aaData[4][0]|"10"|
      |$.aaData[4][1]|"sadha"|
      |$.aaData[5][0]|"16"|
      |$.aaData[5][1]|"lion12"|
      |$.aaData[6][0]|"23"|
      |$.aaData[6][1]|"kji"|

  @Positive @NumericValidation
  Scenario: TC_30 Validate custom reports billed outlets numeric values
    And I send the GET request to "customreports_apibilledoutlets" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData[0][2]|number|
      |$.aaData[0][3]|number|
      |$.aaData[0][4]|number|
      |$.aaData[0][5]|number|
      |$.aaData[0][6]|number|
      |$.aaData[0][7]|number|
      |$.aaData[0][8]|number|
      |$.aaData[0][9]|number|
      |$.aaData[0][10]|number|
      |$.aaData[0][11]|number|
      |$.aaData[0][12]|number|
      |$.aaData[0][13]|number|
      |$.aaData[0][14]|number|
      |$.aaData[0][15]|number|
      |$.aaData[0][16]|number|
      |$.aaData[0][17]|number|
      |$.aaData[0][18]|number|
      |$.aaData[0][19]|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0][2]|0|
      |$.aaData[0][3]|0|
      |$.aaData[0][4]|0|
      |$.aaData[0][5]|0|
      |$.aaData[0][6]|0|
      |$.aaData[0][7]|0|
      |$.aaData[0][8]|0|
      |$.aaData[0][9]|0|
      |$.aaData[0][10]|0|
      |$.aaData[0][11]|0|
      |$.aaData[0][12]|0|
      |$.aaData[0][13]|0|
      |$.aaData[0][14]|0|
      |$.aaData[0][15]|0|
      |$.aaData[0][16]|0|
      |$.aaData[0][17]|0|
      |$.aaData[0][18]|0|
      |$.aaData[0][19]|0|
