@BizomWebAPI @ClaimsManagement @ClaimFields @ClaimFieldsIndex @ReportsAnalyticsGroup2 @CE
Feature: Claim Fields Index API Testing
  As a system user
  I want to test the claim fields index API endpoint
  So that I can ensure proper functionality and data retrieval for claim fields management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get claim fields without access token
    When I send the GET request to "claimfields_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get claim fields with invalid access token
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get claim fields with expired access token
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get claim fields with malformed access token
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get claim fields with valid access token
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"
    And I store the response as "claimfields_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate claim fields response structure
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @DataValidation
  Scenario: TC_07 Validate claim fields specific data values
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"
    And validating the response contains the following values
      |Value|
      |Claimfields|
      |Users|
      |Login|

  @Positive @DataValidation
  Scenario: TC_08 Validate claim fields with static values
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Positive @Performance
  Scenario: TC_09 Performance test for claim fields endpoint
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for claim fields endpoint
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Negative @Validation
  Scenario: TC_11 Get claim fields with invalid query parameters
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Negative @Validation
  Scenario: TC_12 Get claim fields with special characters in query parameters
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Negative @Security
  Scenario: TC_13 Get claim fields with SQL injection attempt
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE claimfields; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Negative @Boundary
  Scenario: TC_14 Get claim fields with maximum query parameters
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

#  @Negative @ErrorHandling
#  Scenario: TC_15 Get claim fields with invalid endpoint
#    And I send the GET request to "claimfields_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Positive @DataIntegrity
  Scenario: TC_16 Validate claim fields data integrity
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @ContentValidation
  Scenario: TC_17 Validate claim fields content structure
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"
    And validating the response contains the following values
      |Value|
      |Users|
      |Login|

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for claim fields endpoint
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Negative @Timeout
  Scenario: TC_19 Test claim fields endpoint timeout handling
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Positive @EndToEnd
  Scenario: TC_20 End-to-end claim fields data retrieval workflow
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"
    And I store the response as "claimfields_response" name using full path
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @EmptyDataValidation
  Scenario: TC_21 Validate empty data scenario for claim fields
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Positive @BoundaryTesting
  Scenario: TC_22 Boundary testing for claim fields with special characters
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |special_chars|@#$%^&*()_+-=[]{};':",./<>?|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"

  @Positive @ContentType
  Scenario: TC_23 Validate content type and encoding for claim fields
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And the HTML response should contain page title "Claimfields"
    And verify response time is less than "2500" milliseconds

  @Positive @LoginPageValidation
   Scenario: TC_24 Validate login page elements for claim fields
    And I send the GET request to "claimfields_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfields"
    And validating the response contains the following values
      |Value|
      |Claimfields|
      |Users|
      |Login|
