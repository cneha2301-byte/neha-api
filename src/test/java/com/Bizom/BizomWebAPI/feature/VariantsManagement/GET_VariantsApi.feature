@BizomWebAPI @CE @VariantsManagement @VariantsApi @SystemIntegration
Feature: Variants API Testing
  As a system user
  I want to test the variants API endpoint
  So that I can ensure proper functionality and data retrieval for variants management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get variants API without access token
    When I send the GET request to "variants_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get variants API with invalid access token
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get variants API with expired access token
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get variants API with malformed access token
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get variants API with valid access token
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "variants_api_response" name using full path

  @Positive @DataValidation
  Scenario: Validate variants API response structure
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Variants|array|

  @Positive @DataValidation
  Scenario: Validate variants API specific data values
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Variants[0].name|DB:variants:name: id=1|
      |$.Variants[1].name|DB:variants:name: id=2|

  @Positive @DataValidation
  Scenario: Validate variants API with static values
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
      |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

  @Positive @Performance
  Scenario: Performance test for variants API endpoint
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for variants API endpoint
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get variants API with invalid query parameters
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get variants API with special characters in query parameters
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: Get variants API with SQL injection attempt
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE variants; --|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: Get variants API with maximum query parameters
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: Get variants API with invalid endpoint
#    And I send the GET request to "variants_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    # And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate variants API business logic
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
     
      |$.Variants[0].name|DB:variants:name: id=1|
     
      |$.Variants[1].name|DB:variants:name: id=2|

  @Positive @DataIntegrity
  Scenario: Validate variants API data integrity
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Variants|array|
      |$.Variants[0].id|string|
      |$.Variants[0].name|string|
      |$.Variants[1].id|string|
      |$.Variants[1].name|string|

  @Positive @Regression
  Scenario: Regression test for variants API endpoint
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Variants|array|

  @Positive @Functional
  Scenario: Validate variants API response completeness
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Variants|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
      |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

  @Positive @ArrayValidation
  Scenario: Validate variants API array structure and content
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Variants|array|
      |$.Variants[0]|object|
      |$.Variants[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
      |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

  @Positive @ContentValidation
  Scenario: Validate variants API content structure
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Variants|
      |id|
      |name|
      |Variant10|
      |Variant11|

  @Positive @LoadTesting
  Scenario: Load testing for variants API endpoint
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test variants API endpoint timeout handling
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @EndToEnd
  Scenario: End-to-end variants API data retrieval workflow
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "variants_api_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Variants|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
     |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

  @Positive @VariantsDataValidation
  Scenario: Validate variants API data completeness and accuracy
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Variants|array|
      |$.Variants[0].id|string|
      |$.Variants[0].name|string|
      |$.Variants[1].id|string|
      |$.Variants[1].name|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
     |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

  @Positive @VariantsManagementValidation
  Scenario: Validate variants API management interface
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
     
      |$.Variants[0].name|DB:variants:name: id=1|
     
      |$.Variants[1].name|DB:variants:name: id=2|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
     |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

  @Positive @VariantsStructureValidation
  Scenario: Validate variants API structure consistency
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Variants|array|
      |$.Variants[0]|object|
      |$.Variants[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
     |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

  @Positive @VariantsContentValidation
  Scenario: Validate variants API content accuracy
    And I send the GET request to "variants_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Variants|
      |id|
      |name|
      |Variant10|
      |Variant11|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Variants[0].id|"1"|
      |$.Variants[0].name|Variant10|
     |$.Variants[1].id|"2"|
      |$.Variants[1].name|Variant11|

