@BizomWebAPI @PI @SchemeCappingsManagement @SchemeCappingsGetEdit
Feature: Scheme Cappings Edit API Testing
  As a system user
  I want to test the scheme cappings edit endpoint
  So that I can ensure proper functionality and JSON response validation for editing scheme cappings

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get scheme cappings edit without access token
    When I send the GET request to "schemecappings_edit" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "4500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get scheme cappings edit with invalid access token
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "4500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get scheme cappings edit with expired access token
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "4500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get scheme cappings edit with malformed access token
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "4500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get scheme cappings edit with valid access token
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And verify response time is less than "4500" milliseconds
    And I store the response as "schemecappings_edit_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate scheme cappings edit JSON response structure
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|
    And verify response time is less than "4500" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Validate scheme cappings edit response data types
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|boolean|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|
    And verify response time is less than "4500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate scheme cappings edit response content
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|
    And verify response time is less than "4500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Positive @ResponseHeaders
  Scenario: TC_09 Verify scheme cappings edit response headers
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "4500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for scheme cappings edit endpoint
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "4500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|

  @Positive @Functional
  Scenario: TC_11 Verify scheme cappings edit endpoint functionality
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "application/json; charset=UTF-8"
    And verify response time is less than "4500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|

  @Negative @ErrorHandling
  Scenario: TC_12 Get scheme cappings edit with invalid endpoint
    And I send the GET request to "schemecappings_edit_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "4500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_13 Validate scheme cappings edit business logic
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|
    And verify response time is less than "4500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_14 Validate scheme cappings edit data integrity
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|boolean|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|
    And verify response time is less than "4500" milliseconds

  @Positive @Regression
  Scenario: TC_15 Regression test for scheme cappings edit endpoint
    And I send the GET request to "schemecappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|false|
    And verify response time is less than "4500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|boolean|

