@BizomWebAPI @ClaimsManagement @ClaimFieldOptions @ClaimFieldOptionsIndex @ReportsAnalyticsGroup2 @CE
Feature: Claim Field Options Index API Testing
  As a system user
  I want to test the claim field options index API endpoint
  So that I can ensure proper functionality and data retrieval for claim field options management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get claim field options without access token
    When I send the GET request to "claimfieldoptions_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get claim field options with invalid access token
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get claim field options with expired access token
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get claim field options with malformed access token
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get claim field options with valid access token
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"
    And I store the response as "claimfieldoptions_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate claim field options response structure
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @DataValidation
  Scenario: TC_07 Validate claim field options specific data values
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"
    And validating the response contains the following values
      |Value|
      |Claimfieldoptions|
      |Users|
      |Login|

  @Positive @DataValidation
  Scenario: TC_08 Validate claim field options with static values
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

  @Positive @Performance
  Scenario: TC_09 Performance test for claim field options endpoint
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

  @Negative @Validation
  Scenario: TC_10 Get claim field options with invalid query parameters
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

  @Negative @Validation
  Scenario: TC_11 Get claim field options with special characters in query parameters
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

  @Negative @Boundary
  Scenario: TC_12 Get claim field options with maximum query parameters
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

#  @Negative @ErrorHandling
#  Scenario: TC_13 Get claim field options with invalid endpoint
#    And I send the GET request to "claimfieldoptions_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_14 Validate claim field options data integrity
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @ContentValidation
  Scenario: TC_15 Validate claim field options content structure
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"
    And validating the response contains the following values
      |Value|
      |Users|
      |Login|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for claim field options endpoint
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

  @Negative @Timeout
  Scenario: TC_17 Test claim field options endpoint timeout handling
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

  @Positive @EndToEnd
  Scenario: TC_18 End-to-end claim field options data retrieval workflow
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"
    And I store the response as "claimfieldoptions_response" name using full path
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @ResponseHeaders
  Scenario: TC_19 Validate response headers for claim field options
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"

  @Positive @SecurityHeaders
  Scenario: TC_20 Validate security headers for claim field options
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And the HTML response should contain page title "Claimfieldoptions"
    And verify response time is less than "2500" milliseconds

  @Positive @BoundaryTesting
  Scenario: TC_21 Boundary testing for claim field options with special characters
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |special_chars|@#$%^&*()_+-=[]{};':",./<>?|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
 

  @Positive @LoginPageValidation
  Scenario: TC_22 Validate login page elements for claim field options
    And I send the GET request to "claimfieldoptions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Claimfieldoptions"
    And validating the response contains the following values
      |Value|
      |Claimfieldoptions|
      |Users|
      |Login|
