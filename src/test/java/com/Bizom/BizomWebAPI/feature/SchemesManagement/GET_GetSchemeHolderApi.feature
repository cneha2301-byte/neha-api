@BizomWebAPI @PI @SchemesManagement @GetSchemeHolderApi @PaymentProcessing
Feature: Get Scheme Holder API Testing
  As a system user
  I want to test the get scheme holder API endpoint with date range filters
  So that I can ensure proper functionality and data retrieval for scheme holder management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get scheme holder without access token
    When I send the GET request to "list_scheme_holder" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: TC_02 Get scheme holder with invalid access token
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|invalid_token_12345|
      # |fromdate|2020-07-04|
      # |todate|2020-09-04|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.code|401   |
      # |$.message|"Invalid Access Token or Credentials"|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: TC_03 Get scheme holder with expired access token
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|expired_token_12345|
      # |fromdate|2020-07-04|
      # |todate|2020-09-04|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.code|401|
      # |$.message|"Invalid Access Token or Credentials"|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: TC_04 Get scheme holder with malformed access token
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|malformed.token.here|
      # |fromdate|2020-07-04|
      # |todate|2020-09-04|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.code|401|
      # |$.message|"Invalid Access Token or Credentials"|
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get scheme holder with valid access token and date range
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And I store the response as "scheme_holder_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate scheme holder response structure
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
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
      |$.Response.manualschemestoremove|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate scheme holder schemedetail object structure
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail|object|
      |$.Response.schemedetail.2|object|
      |$.Response.schemedetail.2.Scheme|object|
      |$.Response.schemedetail.2.Holder|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate scheme holder Holder array structure
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail.2.Holder|array|
      |$.Response.schemedetail.2.Holder[0]|object|
      |$.Response.schemedetail.2.Holder[0].Schemeholder|object|
      |$.Response.schemedetail.2.Holder[0].Warehouse|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate scheme holder Schemeholder object structure
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail.2.Holder[0].Schemeholder|object|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.id|string|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.scheme_id|string|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.holdertype|string|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.active|string|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.approved|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate scheme holder Scheme object structure
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.schemedetail.2.Scheme|object|
      |$.Response.schemedetail.2.Scheme.scheme_id|string|
      |$.Response.schemedetail.2.Scheme.name|string|
      |$.Response.schemedetail.2.Scheme.type|string|
      |$.Response.schemedetail.2.Scheme.active|string|
      |$.Response.schemedetail.2.Scheme.for_skunit_id|array|
      |$.Response.schemedetail.2.Scheme.free_skus|array|

  @Positive @DataValidation
  Scenario: TC_11 Validate scheme holder complete structure
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
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
      |$.Response.schemedetail.2|object|
      |$.Response.schemedetail.2.Scheme|object|
      |$.Response.schemedetail.2.Holder|array|
      |$.Response.manualschemestoremove|array|

  @Positive @Performance
  Scenario: TC_12 Performance test for scheme holder endpoint
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for scheme holder endpoint
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|

  # @Positive @Functional
  # Scenario: TC_14 Get scheme holder with different date ranges
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate|2021-01-01|
      # |todate|2021-12-31|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Response.Result|false|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.Response.schemedetail|object|
      # |$.Response.manualschemestoremove|array|

  # @Negative @Validation
  # Scenario: TC_15 Get scheme holder without date parameters
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Response.Result|false|
      # |$.Response.Reason|Kindly select date range|

  # @Negative @Validation
  # Scenario: TC_16 Get scheme holder with missing fromdate parameter
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |todate|2020-09-04|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Response.Result|false|
      # |$.Response.Reason|Kindly select date range|

  # @Negative @Validation
  # Scenario: TC_17 Get scheme holder with missing todate parameter
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate|2020-07-04|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Response.Result|false|
      # |$.Response.Reason|Kindly select date range|

  # @Negative @Validation
  # Scenario: TC_18 Get scheme holder with invalid date format
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate|2020/07/04|
      # |todate|2020/09/04|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Get scheme holder with todate before fromdate
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-09-04|
      |todate|2020-07-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|false|

  # @Negative @Validation
  # Scenario: TC_20 Get scheme holder with special characters in date parameters
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate|<script>alert('XSS')</script>|
      # |todate|2020-09-04|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: TC_21 Get scheme holder with SQL injection attempt in date parameters
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate|'; DROP TABLE schemes; --|
      # |todate|2020-09-04|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds

  # @Negative @Boundary
  # Scenario: TC_22 Get scheme holder with empty date parameters
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate||
      # |todate||
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Response.Result|false|
      # |$.Response.Reason|Kindly select date range|

  # @Negative @Boundary
  # Scenario: TC_23 Get scheme holder with very old date range
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate|1900-01-01|
      # |todate|1900-12-31|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |$.Response.Result|true|

  # @Negative @Boundary
  # Scenario: TC_24 Get scheme holder with future date range
    # And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
      # |fromdate|2050-01-01|
      # |todate|2050-12-31|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Response.Result|false|

  @Positive @BusinessLogic
  Scenario: TC_25 Validate scheme holder business logic
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
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
      |$.Response.manualschemestoremove|array|

  @Positive @DataIntegrity
  Scenario: TC_26 Validate scheme holder data integrity
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|
      |$.Response.schemedetail.2|object|
      |$.Response.schemedetail.2.Scheme|object|
      |$.Response.schemedetail.2.Holder|array|
      |$.Response.schemedetail.2.Holder[0]|object|
      |$.Response.schemedetail.2.Holder[0].Schemeholder|object|
      |$.Response.manualschemestoremove|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|

  @Positive @Regression
  Scenario: TC_27 Regression test for scheme holder endpoint
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
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
      |$.Response.manualschemestoremove|array|

  @Positive @Functional
  Scenario: TC_28 Validate scheme holder response completeness
    And I send the GET request to "list_scheme_holder" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fromdate|2020-07-04|
      |todate|2020-09-04|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|boolean|
      |$.Response.Reason|string|
      |$.Response.schemedetail|object|
      |$.Response.schemedetail.2|object|
      |$.Response.schemedetail.2.Scheme|object|
      |$.Response.schemedetail.2.Scheme.scheme_id|string|
      |$.Response.schemedetail.2.Scheme.name|string|
      |$.Response.schemedetail.2.Scheme.type|string|
      |$.Response.schemedetail.2.Scheme.active|string|
      |$.Response.schemedetail.2.Holder|array|
      |$.Response.schemedetail.2.Holder[0]|object|
      |$.Response.schemedetail.2.Holder[0].Schemeholder|object|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.id|string|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.scheme_id|string|
      |$.Response.schemedetail.2.Holder[0].Schemeholder.holdertype|string|
      |$.Response.manualschemestoremove|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|true|
      |$.Response.Reason|Data found|
    And I store the response as "scheme_holder_response" name using full path
    And validating the response contains the following values
      |Value|
      |Response|
      |Result|
      |Reason|
      |schemedetail|
      |Scheme|
      |Holder|
      |Schemeholder|
      |manualschemestoremove|

