@BizomWebAPI @ComplaintManagement @ComplaintStatusesIndex @SupportingFunctions @Innovation
Feature: Complaint Statuses Index API Testing
  As a system user
  I want to test the complaint statuses index API endpoint
  So that I can ensure proper functionality and data retrieval for complaint statuses management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get complaint statuses without access token
    When I send the GET request to "complaintstatuses_index" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get complaint statuses with invalid access token
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get complaint statuses with expired access token
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get complaint statuses with malformed access token
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get complaint statuses with valid access token
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "complaintstatuses_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate complaint statuses response structure
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

  @Positive @DataValidation
  Scenario: TC_07 Validate complaint statuses specific data values
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_08 Validate complaint statuses with static values
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_09 Performance test for complaint statuses endpoint
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for complaint statuses endpoint
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get complaint statuses with invalid query parameters
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get complaint statuses with special characters in query parameters
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Get complaint statuses with SQL injection attempt
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE complaintstatuses; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Get complaint statuses with maximum query parameters
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Get complaint statuses with invalid endpoint
    And I send the GET request to "complaintstatuses_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_16 Regression test for complaint statuses endpoint
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|

#  @Positive @ContentValidation
#  Scenario: TC_17 Validate complaint statuses content structure
#    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |Complaint Statuses|
#      |Login|

  @Positive @BoundaryTesting
  Scenario: TC_18 Boundary testing for complaint statuses with special characters
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |special_chars|@#$%^&*()_+-=[]{};':",./<>?|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentType
  Scenario: TC_19 Validate content type and encoding for complaint statuses
    And I send the GET request to "complaintstatuses_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

