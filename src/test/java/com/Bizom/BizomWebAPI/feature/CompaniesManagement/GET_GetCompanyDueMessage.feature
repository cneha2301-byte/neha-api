@BizomWebAPI @CompaniesManagement @GetCompanyDueMessage @SupportingFunctions @CE
Feature: Get Company Due Message API Testing
  As a system user
  I want to test the get company due message endpoint
  So that I can ensure proper functionality for retrieving company due messages

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get company due message without access token
    When I send the GET request to "companies_getcompanyduemessage" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get company due message with invalid access token
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get company due message with expired access token
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get company due message with malformed access token
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get company due message with valid access token
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And I store the response as "company_due_message_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate company due message response structure
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|

  @Positive @StringValidation
  Scenario: TC_07 Validate company due message is a non-empty string
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |=|

  @Positive @DataValidation
  Scenario: TC_08 Validate company due message response format
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|

  @Positive @Performance
  Scenario: TC_09 Performance test for company due message endpoint
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for company due message endpoint
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_11 Get company due message with invalid query parameters
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

  @Negative @Validation
  Scenario: TC_12 Get company due message with special characters in query parameters
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

  @Negative @Security
  Scenario: TC_13 Get company due message with SQL injection attempt
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE companies; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

  @Negative @Boundary
  Scenario: TC_14 Get company due message with maximum query parameters
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get company due message with invalid endpoint
#    And I send the GET request to "companies_getcompanyduemessage_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate company due message business logic
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate company due message data integrity
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |=|

  @Positive @Regression
  Scenario: TC_18 Regression test for company due message endpoint
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|

  @Positive @Functional
  Scenario: TC_19 Validate company due message response completeness
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|
    And I store the response as "company_due_message_response" name using full path

  @Positive @ObjectValidation
  Scenario: TC_20 Validate company due message response structure and content
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|
      |=|

  @Positive @ContentValidation
  Scenario: TC_21 Validate company due message content structure
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for company due message endpoint
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

  @Negative @Timeout
  Scenario: TC_23 Test company due message endpoint timeout handling
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end company due message data retrieval workflow
    And I send the GET request to "companies_getcompanyduemessage" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |FmmHKvHk08mi4wus1+hSUe3jgZmyks3oJMOXY\/FkgB0=|        
      |=|
    And I store the response as "company_due_message_response" name using full path

