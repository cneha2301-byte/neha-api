@BizomWebAPI @CompaniesManagement @CheckDistimanDelivery @ReportsAnalytics @CE
Feature: Check Distiman Delivery API Testing
  As a system user
  I want to test the check distiman delivery endpoint
  So that I can ensure proper functionality and data retrieval for distiman delivery availability checking

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Check distiman delivery without access token
    When I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Check distiman delivery with invalid access token
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|companyId|470212|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials| 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Check distiman delivery with expired access token
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|companyId|470212|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Check distiman delivery with malformed access token
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|

  @Positive @Smoke
  Scenario: TC_05 Check distiman delivery with valid access token
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And I store the response as "check_distiman_delivery_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate check distiman delivery response structure
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Delivery not available in this pincode."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate check distiman delivery with different company ID
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_08 Check distiman delivery for company ID 470212
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Delivery not available in this pincode."|

  @Positive @Performance
  Scenario: TC_09 Performance test for check distiman delivery endpoint
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for check distiman delivery endpoint
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_11 Check distiman delivery with invalid company ID
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: TC_12 Check distiman delivery with special characters in path parameter
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|<script>alert('XSS')</script>|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Check distiman delivery with SQL injection attempt in path parameter
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|'; DROP TABLE companies; --|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Check distiman delivery with invalid query parameters
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
      |invalid_param|invalid_value|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @ErrorHandling
  Scenario: TC_15 Check distiman delivery with invalid endpoint
    And I send the GET request to "companies_checkdistimandelivery_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_16 Validate check distiman delivery business logic
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Delivery not available in this pincode."|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate check distiman delivery data integrity
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for check distiman delivery endpoint
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Delivery not available in this pincode."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_19 Validate check distiman delivery response completeness
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Delivery not available in this pincode."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: TC_20 Validate check distiman delivery content structure
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Delivery|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for check distiman delivery endpoint
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Timeout
  Scenario: TC_22 Test check distiman delivery endpoint timeout handling
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end check distiman delivery data retrieval workflow
    And I send the GET request to "companies_checkdistimandelivery" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|companyId|470212|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Delivery not available in this pincode."|
    And I store the response as "check_distiman_delivery_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

