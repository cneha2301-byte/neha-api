@BizomWebAPI @CompaniesManagement @CompanyTimeStamp @ReportsAnalytics @CE
Feature: Company TimeStamp API Testing
  As a system user
  I want to test the company timestamp endpoint
  So that I can ensure proper functionality and data retrieval for company timestamp management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get company timestamp without access token
    When I send the GET request to "company_timestamp" endpoint
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get company timestamp with invalid access token
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get company timestamp with expired access token
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get company timestamp with malformed access token
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get company timestamp with valid access token
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And I store the response as "company_timestamp_response" name using full path

  @Positive @DataValidation
  Scenario: Validate company timestamp response structure
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timezone_type|number|
      |$.timezone|string|
      |$.timestamp|string|

  @Positive @DataValidation
  Scenario: Validate company timestamp with static values
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Positive @Performance
  Scenario: Performance test for company timestamp endpoint
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Positive @Concurrency
  Scenario: Concurrent access test for company timestamp endpoint
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Negative @Validation
  Scenario: Get company timestamp with invalid query parameters
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Negative @Validation
  Scenario: Get company timestamp with special characters in query parameters
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Negative @Security
  Scenario: Get company timestamp with SQL injection attempt
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE companies; --|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Negative @Boundary
  Scenario: Get company timestamp with maximum query parameters
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Negative @ErrorHandling
  Scenario: Get company timestamp with invalid endpoint
    And I send the GET request to "company_timestamp_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate company timestamp business logic
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.timezone|DB:companies:timezone: id=470212|

  @Positive @DataIntegrity
  Scenario: Validate company timestamp data integrity
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timezone_type|number|
      |$.timezone|string|
      |$.timestamp|string|

  @Positive @Regression
  Scenario: Regression test for company timestamp endpoint
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timezone_type|number|
      |$.timezone|string|
      |$.timestamp|string|

  @Positive @Functional
  Scenario: Validate company timestamp response completeness
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timezone_type|number|
      |$.timezone|string|
      |$.timestamp|string|

  @Positive @ContentValidation
  Scenario: Validate company timestamp content structure
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    And validating the response contains the following values
      |Value|
      |date|
      |timezone_type|
      |timezone|
      |timestamp|

  @Positive @LoadTesting
  Scenario: Load testing for company timestamp endpoint
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Negative @Timeout
  Scenario: Test company timestamp endpoint timeout handling
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

  @Positive @EndToEnd
  Scenario: End-to-end company timestamp data retrieval workflow
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And I store the response as "company_timestamp_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timezone_type|number|
      |$.timezone|string|
      |$.timestamp|string|

  @Positive @TimeStampValidation
  Scenario: Validate company timestamp data accuracy
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timezone_type|number|
      |$.timezone|string|
      |$.timestamp|string|

  @Positive @TimeZoneValidation
  Scenario: Validate company timestamp timezone handling
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.timezone|DB:companies:timezone: id=470212|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.timezone|string|
      |$.timezone_type|number|

  @Positive @DateTimeValidation
  Scenario: Validate company timestamp date and time format
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|

      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|

    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timestamp|string|

  @Positive @NumericValidation
  Scenario: Validate company timestamp numeric values
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And validating the response field data types
      |JPath|ExpectedType|
      |$.timezone_type|number|
      |$.timestamp|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.timezone_type|3|
    

  @Positive @CompanyTimeStampValidation
  Scenario: Validate company timestamp management interface
    And I send the GET request to "company_timestamp" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.timezone|DB:companies:timezone: id=470212|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.date|string|
      |$.timezone_type|number|
      |$.timezone|string|
      |$.timestamp|string|
    And the fields in response should match with expected values
      |JPath|Value|
    
      |$.timezone_type|3|
      |$.timezone|Asia/Kolkata|
    

