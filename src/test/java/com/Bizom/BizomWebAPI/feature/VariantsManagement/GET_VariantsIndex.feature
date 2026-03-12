@BizomWebAPI @CE @VariantsManagement @VariantsIndex @SystemIntegration
Feature: Variants Index API Testing
  As a system user
  I want to test the variants index endpoint
  So that I can ensure proper functionality and data retrieval for variants management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get variants index without access token
    When I send the GET request to "variants_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get variants index with invalid access token
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get variants index with expired access token
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get variants index with malformed access token
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
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
  Scenario: Get variants index with valid access token
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
    And I store the response as "variants_index_response" name using full path

  @Positive @DataValidation
  Scenario: Validate variants index response structure
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   

  @Positive @DataValidation
  Scenario: Validate variants index HTML content
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   
    And validating the response contains the following values
      |Value|
      |Variant|
      |Name|
      |Description|

  @Positive @DataValidation
  Scenario: Validate variants index with static values
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   

  @Positive @Performance
  Scenario: Performance test for variants index endpoint
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Variants"

  @Positive @Concurrency
  Scenario: Concurrent access test for variants index endpoint
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"

  @Negative @Validation
  Scenario: Get variants index with invalid query parameters
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"

  @Negative @Validation
  Scenario: Get variants index with special characters in query parameters
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"

  @Negative @Security
  Scenario: Get variants index with SQL injection attempt
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE variants; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"

  @Negative @Boundary
  Scenario: Get variants index with maximum query parameters
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"

#  @Negative @ErrorHandling
#  Scenario: Get variants index with invalid endpoint
#    And I send the GET request to "variants_index_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate variants index business logic
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"

  @Positive @DataIntegrity
  Scenario: Validate variants index data integrity
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   

  @Positive @Regression
  Scenario: Regression test for variants index endpoint
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   

  @Positive @Functional
  Scenario: Validate variants index response completeness
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   
    And validating the response contains the following values
      |Value|
      |Variant|
      |Name|
      |Description|

  @Positive @HTMLValidation
  Scenario: Validate variants index HTML structure and content
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   
    And validating the response contains the following values
      |Value|
      |Variant|
      |Name|
      |Description|

  @Positive @ContentValidation
  Scenario: Validate variants index content structure
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
    And validating the response contains the following values
      |Value|
      |Variant|
      |Name|
      |Description|
      |table|
      |html|

  @Positive @LoadTesting
  Scenario: Load testing for variants index endpoint
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Variants"

  @Negative @Timeout
  Scenario: Test variants index endpoint timeout handling
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the HTML response should contain page title "Variants"

  @Positive @EndToEnd
  Scenario: End-to-end variants index data retrieval workflow
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
    And I store the response as "variants_index_response" name using full path
   
    And validating the response contains the following values
      |Value|
      |Variant|
      |Name|
      |Description|

  @Positive @PageTitleValidation
  Scenario: Validate variants index page title specifically
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"


  @Positive @TableStructureValidation
  Scenario: Validate variants index table structure
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   
    And validating the response contains the following values
      |Value|
      |table|
      |Variant|
      |Name|
      |Description|

  @Positive @HTMLStructureValidation
  Scenario: Validate variants index HTML structure consistency
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |body|
      |table|
      |Variant|

  @Positive @ResponseHeadersValidation
  Scenario: Validate variants index response headers
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Server|Bizom|
      |Connection|keep-alive|

  @Positive @VariantsDataValidation
  Scenario: Validate variants index data completeness and accuracy
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
   
    And validating the response contains the following values
      |Value|
      |Variant|
      |Name|
      |Description|
      |table|
      |html|

  @Positive @VariantsManagementValidation
  Scenario: Validate variants index management interface
    And I send the GET request to "variants_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Variants"
    And validating the response contains the following values
      |Value|
      |Variant|
      |Name|
      |Description|

