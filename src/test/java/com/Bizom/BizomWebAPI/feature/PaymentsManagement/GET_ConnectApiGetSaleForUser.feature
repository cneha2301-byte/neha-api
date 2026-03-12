@BizomWebAPI @OS @PaymentsManagement @ConnectApiGetSaleForUser
Feature: Connect API Get Sale For User API Testing
  As a system user
  I want to test the connect API get sale for user endpoint
  So that I can ensure proper functionality and JSON response validation for getting sales data for user

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
  Scenario: TC_01 Get sale for user without access token
    When I send the GET request to "payments_connect_api_get_sale_for_user" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get sale for user with invalid access token
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get sale for user with expired access token
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get sale for user with malformed access token
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get sale for user with valid access token
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
    And verify response time is less than "2500" milliseconds
    And I store the response as "payments_connect_api_get_sale_for_user_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get sale for user JSON response structure
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Validate get sale for user response data types
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Settings|object|
      |$.Settings.EnableDistToDistSale|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate get sale for user response content
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Settings|
      |EnableDistToDistSale|
      |both|

  @Positive @ResponseHeaders
  Scenario: TC_09 Verify get sale for user response headers
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for get sale for user endpoint
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for get sale for user endpoint
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|

  @Negative @Validation
  Scenario: TC_12 Get sale for user with invalid query parameters
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: TC_13 Get sale for user with special characters in query parameters
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: TC_14 Get sale for user with SQL injection attempt
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: TC_15 Get sale for user with maximum query parameters
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: TC_16 Get sale for user with invalid endpoint
    And I send the GET request to "payments_connect_api_get_sale_for_user_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_17 Verify get sale for user endpoint functionality
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "application/json; charset=UTF-8"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|

  @Positive @BusinessLogic
  Scenario: TC_18 Validate get sale for user business logic
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Data|array|
      |$.Settings|object|
      |$.Settings.EnableDistToDistSale|string|

  @Positive @DataIntegrity
  Scenario: TC_19 Validate get sale for user data integrity
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Settings|object|
      |$.Settings.EnableDistToDistSale|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_20 Regression test for get sale for user endpoint
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Settings|object|
      |$.Settings.EnableDistToDistSale|string|

  @Positive @Functional
  Scenario: TC_21 Validate get sale for user response completeness
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.Settings.EnableDistToDistSale|both|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Settings|object|
      |$.Settings.EnableDistToDistSale|string|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |Settings|
      |EnableDistToDistSale|
      |both|
    And I store the response as "payments_connect_api_get_sale_for_user_response" name using full path

  @Positive @ResultFieldValidation
  Scenario: TC_22 Validate get sale for user Result field
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
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
  Scenario: TC_23 Validate get sale for user Data array field
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data|[]|

  @Positive @SettingsFieldValidation
  Scenario: TC_24 Validate get sale for user Settings object and EnableDistToDistSale field
    And I send the GET request to "payments_connect_api_get_sale_for_user" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Settings.EnableDistToDistSale|both|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Settings|object|
      |$.Settings.EnableDistToDistSale|string|

