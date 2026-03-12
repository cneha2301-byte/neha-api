@BizomWebAPI @PI @SchemesManagement @GetSchemeForForeveryType @PaymentProcessing
Feature: GetSchemeForForeveryType API Testing
  As a system user
  I want to test the getschemeForforeverytype endpoint
  So that I can ensure proper functionality and data retrieval for schemes by type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get scheme for forevery type without access token
    When I send the GET request to "get_scheme_for_forevery_type" endpoint with path parameters
      |Path|Value|
      |typeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get scheme for forevery type with invalid access token
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get scheme for forevery type with expired access token
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get scheme for forevery type with malformed access token
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|typeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get scheme for forevery type for type ID 1 with valid access token
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason["1"]|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|object|

  @Negative @Validation
  Scenario: Get scheme for forevery type with blank type ID
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"Data not sent"|

  @Negative @Validation
  Scenario: Get scheme for forevery type with invalid type ID
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"Data not sent"|

  @Negative @Validation
  Scenario: Get scheme for forevery type with non-numeric type ID
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
      |$.Reason|"Data not sent"|

  # @Negative @ErrorHandling
  # Scenario: Get scheme for forevery type with invalid endpoint
    # And I send the GET request to "get_scheme_for_forevery_type_invalid" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get scheme for forevery type endpoint
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get scheme for forevery type endpoint
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get scheme for forevery type for type ID 1 with valid access token - DB validation
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|object|

  @Positive @Functional
  Scenario: Get scheme for forevery type for type ID 2 with valid access token
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason["2"]|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|object|

  @Positive @Functional
  Scenario: Get scheme for forevery type for type ID 2 with valid access token - DB validation
    And I send the GET request to "get_scheme_for_forevery_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|typeId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|object|

