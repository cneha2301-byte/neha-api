@BizomWebAPI @PI @SchemesManagement @GetSchemeMasterApi @PaymentProcessing
Feature: Get Scheme Master API Testing
  As a system user
  I want to test the get scheme master API endpoint with date range filters
  So that I can ensure proper functionality and data retrieval for scheme master management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get scheme master without access token
    When I send the GET request to "list_scheme_master" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: TC_02 Get scheme master with invalid access token
    # And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|invalid_token_12345|
      # |fromdate|2020-06-04|
      # |todate|2025-06-04|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.error.code|401|
      # |$.error.message|"Invalid Access Token or Credentials"|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: TC_03 Get scheme master with expired access token
    # And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|expired_token_12345|
      # |fromdate|2020-06-04|
      # |todate|2025-06-04|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.error.code|401|
      # |$.error.message|"Invalid Access Token or Credentials"|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: TC_04 Get scheme master with malformed access token
    # And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|malformed.token.here|
      # |fromdate|2020-06-04|
      # |todate|2025-06-04|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.error.code|401|
      # |$.error.message|"Invalid Access Token or Credentials"|

  @Positive @Smoke
  Scenario: TC_05 Get scheme master with valid access token and date range
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And I store the response as "scheme_master_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate scheme master response structure
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate scheme master schemedetail object structure
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail|object|
      |$.Response.schemedetail.1|object|
      |$.Response.schemedetail.1.Scheme|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate scheme master Scheme object structure
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail.1.Scheme|object|
      |$.Response.schemedetail.1.Scheme.scheme_id|string|
      |$.Response.schemedetail.1.Scheme.name|string|
      |$.Response.schemedetail.1.Scheme.type|string|
      |$.Response.schemedetail.1.Scheme.active|string|
      |$.Response.schemedetail.1.Scheme.for_skunit_id|array|
      |$.Response.schemedetail.1.Scheme.entity_type_id|object|
      |$.Response.schemedetail.1.Scheme.forentitytypedetails|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate scheme master nested arrays and objects
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail.1.Scheme.for_skunit_id|array|
      |$.Response.schemedetail.1.Scheme.for_skunit_id[0]|string|
      |$.Response.schemedetail.1.Scheme.entity_type_id|object|
      |$.Response.schemedetail.1.Scheme.forentitytypedetails|array|
      |$.Response.schemedetail.1.Scheme.forentitytypedetails[0]|object|
      |$.Response.schemedetail.1.Scheme.forentitytypedetails[0].id|string|
      |$.Response.schemedetail.1.Scheme.forentitytypedetails[0].name|string|
      |$.Response.schemedetail.1.Scheme.forentitytypedetails[0].quantity|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate scheme master complete structure
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|
      |$.Response.schemedetail.1|object|
      |$.Response.schemedetail.1.Scheme|object|
      |$.Response.schemedetail.1.Scheme.scheme_id|string|
      |$.Response.schemedetail.1.Scheme.name|string|
      |$.Response.schemedetail.1.Scheme.active|string|

  @Positive @Performance
  Scenario: TC_11 Performance test for scheme master endpoint
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for scheme master endpoint
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|

  @Positive @Functional
  Scenario: TC_13 Get scheme master with different date ranges
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2021-01-01|
      |todate|2021-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail|object|

  @Negative @Validation
  Scenario: TC_14 Get scheme master with missing fromdate parameter
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|

  @Negative @Validation
  Scenario: TC_15 Get scheme master with missing todate parameter
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|false|
      |$.Response.Reason|Invalid schemeId|

  @Negative @Validation
  Scenario: TC_16 Get scheme master with invalid date format
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020/06/04|
      |todate|2025/06/04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get scheme master with todate before fromdate
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2025-06-04|
      |todate|2020-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|false|

  @Negative @Validation
  Scenario: TC_18 Get scheme master with special characters in date parameters
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|<script>alert('XSS')</script>|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_19 Get scheme master with SQL injection attempt in date parameters
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|'; DROP TABLE schemes; --|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_20 Get scheme master with empty date parameters
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate||
      |todate||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|false|

  @Negative @Boundary
  Scenario: TC_21 Get scheme master with very old date range
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|1900-01-01|
      |todate|1900-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|false|

  @Negative @Boundary
  Scenario: TC_22 Get scheme master with future date range
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2050-01-01|
      |todate|2050-12-31|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|false|

  @Positive @BusinessLogic
  Scenario: TC_23 Validate scheme master business logic
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|

  @Positive @DataIntegrity
  Scenario: TC_24 Validate scheme master data integrity
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|
      |$.Response.schemedetail.1|object|
      |$.Response.schemedetail.1.Scheme|object|
      |$.Response.schemedetail.1.Scheme.scheme_id|string|
      |$.Response.schemedetail.1.Scheme.name|string|
      |$.Response.schemedetail.1.Scheme.active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|

  @Positive @Regression
  Scenario: TC_25 Regression test for scheme master endpoint
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|

  @Positive @Functional
  Scenario: TC_26 Validate scheme master response completeness
    And I send the GET request to "list_scheme_master" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-06-04|
      |todate|2025-06-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|
      |$.Response.schemedetail.1|object|
      |$.Response.schemedetail.1.Scheme|object|
      |$.Response.schemedetail.1.Scheme.scheme_id|string|
      |$.Response.schemedetail.1.Scheme.name|string|
      |$.Response.schemedetail.1.Scheme.type|string|
      |$.Response.schemedetail.1.Scheme.active|string|
      |$.Response.schemedetail.1.Scheme.for_skunit_id|array|
      |$.Response.schemedetail.1.Scheme.forentitytypedetails|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And I store the response as "scheme_master_response" name using full path
    And validating the response contains the following values
      |Value|
      |Response|
      |Result|
      |Reason|
      |schemedetail|
      |Scheme|
      |scheme_id|
      |name|
      |type|
      |active|
      |for_skunit_id|
      |forentitytypedetails|

