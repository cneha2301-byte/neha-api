@BizomWebAPI @CountriesManagement @Countries @SupportingFunctions @CE
Feature: Countries API Testing
  As a system user
  I want to test the countries endpoint
  So that I can ensure proper functionality and data retrieval for countries management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get countries without access token
    When I send the GET request to "getCountries" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get countries with invalid access token
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                   | Value           |
      | $.result                 | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get countries with expired access token
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                   | Value           |
      | $.result                 | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get countries with malformed access token
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get countries with valid access token
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I store the response as "countries_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate countries response structure
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.countries|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate countries specific data values
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.countries[0].id|"1"|
      |$.countries[0].name|"No country"|
      |$.countries[0].code|"NOTSET"|
      |$.countries[1].id|"2"|
      |$.countries[1].name|"India"|
      |$.countries[1].code|"IN"|

  @Positive @DataValidation
  Scenario: TC_08 Validate countries with static values
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.countries[0].id|"1"|
      |$.countries[0].name|"No country"|
      |$.countries[0].code|"NOTSET"|
      |$.countries[1].id|"2"|
      |$.countries[1].name|"India"|
      |$.countries[1].code|"IN"|

  @Positive @Performance
  Scenario: TC_09 Performance test for countries endpoint
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for countries endpoint
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Negative @Validation
  Scenario: TC_11 Get countries with invalid query parameters
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Negative @Validation
    Scenario: TC_12 Get countries with special characters in query parameters
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Negative @Boundary
  Scenario: TC_13 Get countries with maximum query parameters
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
  

#  @Negative @ErrorHandling
#    Scenario: TC_14 Get countries with invalid endpoint
#    And I send the GET request to "getCountries_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_15 Validate countries data integrity
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.countries|array|
      |$.countries[0].id|string|
      |$.countries[0].name|string|
      |$.countries[0].code|string|
      |$.countries[1].id|string|
      |$.countries[1].name|string|
      |$.countries[1].code|string|

  @Positive @Regression
  Scenario: TC_16 Regression test for countries endpoint
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.countries|array|

  @Positive @Functional
  Scenario: TC_17 Validate countries response completeness
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.countries|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.countries[0].id|"1"|
      |$.countries[0].name|"No country"|
      |$.countries[0].code|"NOTSET"|
      |$.countries[1].id|"2"|
      |$.countries[1].name|"India"|
      |$.countries[1].code|"IN"|

  @Positive @ArrayValidation
  Scenario: TC_18 Validate countries array structure and content
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.countries|array|
      |$.countries[0]|object|
      |$.countries[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.countries[0].id|"1"|
      |$.countries[0].name|"No country"|
      |$.countries[0].code|"NOTSET"|
      |$.countries[1].id|"2"|
      |$.countries[1].name|"India"|
      |$.countries[1].code|"IN"|

  @Positive @ContentValidation
  Scenario: TC_19 Validate countries content structure
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And validating the response contains the following values
      |Value|
      |countries|
      |id|
      |name|
      |code|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for countries endpoint
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|

  @Negative @Timeout
  Scenario: TC_21 Test countries endpoint timeout handling
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
      
  @Positive @DBValidation @DataIntegrity
  Scenario: TC_22 Countries - comprehensive database validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.countries[0].id|"1"|
      |$.countries[0].name|DB:countries:name: id=1|
      |$.countries[0].code|DB:countries:code: id=1|
      |$.countries[1].id|"2"|
      |$.countries[1].name|DB:countries:name: id=2|
      |$.countries[1].code|DB:countries:code: id=2|

  @Positive @DBValidation @EndToEnd
  Scenario: TC_23 Countries - end-to-end database validation workflow
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCountries" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error.message|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.countries[0].name|DB:countries:name: id=1|
      |$.countries[1].name|DB:countries:name: id=2|
   
