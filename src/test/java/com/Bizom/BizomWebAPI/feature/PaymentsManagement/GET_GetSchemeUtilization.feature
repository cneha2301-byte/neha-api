@BizomWebAPI @OS @PaymentsManagement @GetSchemeUtilization
Feature: Get Scheme Utilization API Testing
  As a system user
  I want to test the get scheme utilization endpoint
  So that I can ensure proper functionality and JSON response validation for scheme utilization data

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
  Scenario: TC_01 Get scheme utilization without access token
    When I send the GET request to "payments_get_scheme_utilization" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get scheme utilization with invalid access token
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get scheme utilization with expired access token
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get scheme utilization with malformed access token
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get scheme utilization with valid access token
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And verify response time is less than "2500" milliseconds
    And I store the response as "payments_get_scheme_utilization_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get scheme utilization JSON response structure
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Validate get scheme utilization response data types
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate get scheme utilization response content
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|

  @Positive @ResponseHeaders
  Scenario: TC_09 Verify get scheme utilization response headers
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for get scheme utilization endpoint
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for get scheme utilization endpoint
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|

  @Negative @Validation
  Scenario: TC_12 Get scheme utilization with invalid query parameters
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_13 Get scheme utilization with special characters in query parameters
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: TC_14 Get scheme utilization with SQL injection attempt
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE payments; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_15 Get scheme utilization with maximum query parameters
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @ErrorHandling
  Scenario: TC_16 Get scheme utilization with invalid endpoint
    And I send the GET request to "payments_get_scheme_utilization_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_17 Verify get scheme utilization endpoint functionality
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "application/json; charset=UTF-8"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|

  @Positive @BusinessLogic
  Scenario: TC_18 Validate get scheme utilization business logic
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate get scheme utilization data integrity
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_20 Regression test for get scheme utilization endpoint
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_21 Validate get scheme utilization response completeness
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
    And I store the response as "payments_get_scheme_utilization_response" name using full path

  @Positive @ResultFieldValidation
  Scenario: TC_22 Validate get scheme utilization Result field
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @DataFieldValidation
  Scenario: TC_23 Validate get scheme utilization data array field
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|

  @Positive @ReasonFieldValidation
  Scenario: TC_24 Validate get scheme utilization Reason field
    And I send the GET request to "payments_get_scheme_utilization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

