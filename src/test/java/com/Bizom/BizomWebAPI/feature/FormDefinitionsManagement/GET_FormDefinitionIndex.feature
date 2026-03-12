@BizomWebAPI @FormDefinitionsManagement @FormDefinitionsManagementIndex @DataProcessing @CE
Feature: Form Definitions Index API Testing
  As a Bizom web API consumer
  I want to validate the form definitions index endpoint
  So that I can ensure form definitions HTML page is rendered correctly

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get form definitions index without access token
    When I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get form definitions index with invalid access token
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get form definitions index with expired access token
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get form definitions index with malformed access token
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "" 
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get form definitions index with valid request
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And I store the response as "form_definitions_index_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate form definitions index HTML response structure
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataValidation
  Scenario: TC_07 Validate form definitions index HTML content
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And validating the response contains the following values
      |Value|
      |Form Definitions|
      |html|
      |body|

  @Positive @Performance
  Scenario: TC_08 Performance test for form definitions index endpoint
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for form definitions index endpoint
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

  @Negative @Validation
  Scenario: TC_10 Get form definitions index with invalid query parameters
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

  @Negative @Validation
  Scenario: TC_11 Get form definitions index with special characters in query parameters
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

  @Negative @Security
  Scenario: TC_12 Get form definitions index with SQL injection attempt
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE formdefinitions; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

  @Negative @Boundary
  Scenario: TC_13 Get form definitions index with maximum query parameters
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get form definitions index with invalid endpoint
#    And I send the GET request to "formdefinitions_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate form definitions index business logic
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate form definitions index data integrity
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And validating the response contains the following values
      |Value|
      |Form Definitions|
      |html|
      |body|

  @Positive @Regression
  Scenario: TC_17 Regression test for form definitions index endpoint
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|

  @Positive @Functional
  Scenario: TC_18 Validate form definitions index response completeness
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "form_definitions_index_response" name using full path
    And validating the response contains the following values
      |Value|
      |Form Definitions|
      |html|
      |body|
      |head|

  @Positive @ContentValidation
  Scenario: TC_19 Validate form definitions index HTML element structure
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|
      |h3|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for form definitions index endpoint
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

  @Negative @Timeout
  Scenario: TC_21 Test form definitions index endpoint timeout handling
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end form definitions index data retrieval workflow
    And I send the GET request to "formdefinitions_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain element "h3" with content "Form Definitions"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|
    And I store the response as "form_definitions_index_response" name using full path
    And validating the response contains the following values
      |Value|
      |Form Definitions|
      |html|
      |body|
      |head|
      |h3|

