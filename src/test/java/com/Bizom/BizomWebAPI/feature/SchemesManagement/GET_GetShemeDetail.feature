@BizomWebAPI @PI @SchemesManagement @GetShemeDetail @PaymentProcessing
Feature: Get Scheme Detail API Testing
  As a system user
  I want to test the get scheme detail endpoint
  So that I can ensure proper functionality and data retrieval for scheme details management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get scheme detail without access token
    When I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||schemeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get scheme detail with invalid access token
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|schemeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get scheme detail with expired access token
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|schemeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get scheme detail with malformed access token
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|schemeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get scheme detail with valid access token
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "scheme_detail_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate scheme detail response structure
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate scheme detail data object structure
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.forskus|array|
      |$.data.freeskus|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate scheme detail forskus array structure
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.forskus|array|
      |$.data.forskus[0]|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate scheme detail freeskus array structure
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.freeskus|array|
      |$.data.freeskus[0]|object|
      |$.data.freeskus[0].freequantity|string|
      |$.data.freeskus[0].max_quantity|string|
      |$.data.freeskus[0].ceiling|string|
      |$.data.freeskus[0].skus|array|

  @Positive @DataValidation
  Scenario: TC_10 Validate scheme detail freeskus nested skus array
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.freeskus[0].skus|array|
      |$.data.freeskus[0].skus[0]|string|

  @Positive @DataValidation
  Scenario: TC_11 Validate scheme detail complete structure
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.forskus|array|
      |$.data.freeskus|array|
      |$.data.freeskus[0]|object|
      |$.data.freeskus[0].freequantity|string|
      |$.data.freeskus[0].max_quantity|string|
      |$.data.freeskus[0].ceiling|string|
      |$.data.freeskus[0].skus|array|
      |$.data.freeskus[0].skus[0]|string|

  @Positive @Performance
  Scenario: TC_12 Performance test for scheme detail endpoint
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Concurrency
  Scenario: TC_13 Concurrent access test for scheme detail endpoint
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Functional
  Scenario: TC_14 Get scheme detail with different scheme IDs
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.forskus|array|
      |$.data.freeskus|array|

  @Negative @Validation
  Scenario: TC_15 Get scheme detail with invalid query parameters
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
      |invalid_param|invalid_value||       |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Negative @Validation
  Scenario: TC_16 Get scheme detail with special characters in scheme ID
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Security
  Scenario: TC_17 Get scheme detail with SQL injection attempt in scheme ID
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|'; DROP TABLE schemes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_18 Get scheme detail with empty scheme ID
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_19 Get scheme detail with invalid endpoint
    And I send the GET request to "schemes_getshemetail_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_20 Validate scheme detail business logic
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.forskus|array|
      |$.data.freeskus|array|

  @Positive @DataIntegrity
  Scenario: TC_21 Validate scheme detail data integrity
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.forskus|array|
      |$.data.freeskus|array|
      |$.data.freeskus[0]|object|
      |$.data.freeskus[0].freequantity|string|
      |$.data.freeskus[0].max_quantity|string|
      |$.data.freeskus[0].ceiling|string|
      |$.data.freeskus[0].skus|array|
      |$.data.freeskus[0].skus[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|

  @Positive @Regression
  Scenario: TC_22 Regression test for scheme detail endpoint
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.forskus|array|
      |$.data.freeskus|array|

  @Positive @Functional
   Scenario: TC_23 Validate scheme detail response completeness
    And I send the GET request to "schemes_getshemetail" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.forskus|array|
      |$.data.freeskus|array|
      |$.data.freeskus[0]|object|
      |$.data.freeskus[0].freequantity|string|
      |$.data.freeskus[0].max_quantity|string|
      |$.data.freeskus[0].ceiling|string|
      |$.data.freeskus[0].skus|array|
      |$.data.freeskus[0].skus[0]|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And I store the response as "scheme_detail_response" name using full path
    And validating the response contains the following values
      |Value|
      |result|
      |reason|
      |data|
      |forskus|
      |freeskus|
      |freequantity|
      |max_quantity|
      |ceiling|
      |skus|

