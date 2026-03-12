@BizomWebAPI @TourBudgetsManagement @PcpDetailsByUserAndDate @OutletManagement @innovation
Feature: Get PCP Details By User And Date API Testing
  As a system user
  I want to test the get PCP details by user and date endpoint
  So that I can ensure proper functionality and data retrieval for tour budgets management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get PCP details by user and date without access token
    When I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with path parameters
      |Path|Value|
      |userId|1|
      |date|2025-01-23|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get PCP details by user and date with invalid access token
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get PCP details by user and date with expired access token
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get PCP details by user and date with malformed access token
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get PCP details by user and date with valid user ID and date
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And I store the response as "pcp_details_by_user_and_date_response" name using full path

  @Positive @DataValidation
  Scenario: Validate PCP details by user and date response structure
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: Validate PCP details by user and date with static values
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

  @Negative @Validation
  Scenario: Get PCP details by user and date with invalid user ID
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

  @Negative @Validation
  Scenario: Get PCP details by user and date with non-numeric user ID
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|abc|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get PCP details by user and date with negative user ID
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|-1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

  @Negative @Validation
  Scenario: Get PCP details by user and date with zero user ID
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|0|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

#  @Negative @Validation
#  Scenario: Get PCP details by user and date with invalid date format
#    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#      |||date|invalid-date|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Data."|

  @Negative @Validation
  Scenario: Get PCP details by user and date with future date
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2099-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

  @Negative @Validation
  Scenario: Get PCP details by user and date with past date
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2020-01-01|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

#  @Negative @Validation
#  Scenario: Get PCP details by user and date with different date format
#    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#      |||date|01-23-2025|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Data."|

#  @Negative @ErrorHandling
#  Scenario: Get PCP details by user and date with invalid endpoint
#    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#      |||date|2025-01-23|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for PCP details by user and date endpoint
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for PCP details by user and date endpoint
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

  @Positive @BusinessLogic
  Scenario: Validate PCP details by user and date business logic
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataIntegrity
  Scenario: Validate PCP details by user and date data integrity
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: Regression test for PCP details by user and date endpoint
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: Validate PCP details by user and date response completeness
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: Validate PCP details by user and date content structure
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Invalid Data.|

  @Positive @LoadTesting
  Scenario: Load testing for PCP details by user and date endpoint
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

  @Negative @Timeout
  Scenario: Test PCP details by user and date endpoint timeout handling
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|

  @Positive @EndToEnd
  Scenario: End-to-end PCP details by user and date data retrieval workflow
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And I store the response as "pcp_details_by_user_and_date_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @UserParameterValidation
  Scenario: Validate PCP details by user and date with different user IDs
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|2|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DateParameterValidation
  Scenario: Validate PCP details by user and date with different dates
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-02-15|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @FieldValidation
  Scenario: Validate PCP details by user and date field completeness
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ErrorResponseValidation
  Scenario: Validate PCP details by user and date error response
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999|
      |||date|2025-01-23|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @CombinedParameterValidation
  Scenario: Validate PCP details by user and date with various user and date combinations
    And I send the GET request to "tourbudgets_get_pcp_details_by_user_and_date" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|3|
      |||date|2025-03-10|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Data."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

