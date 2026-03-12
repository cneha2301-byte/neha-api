@BizomWebAPI @SkuUnitsManagement @GetUserSkunit @ProductManagement @OS
Feature: Get User Skunit API Testing
  As a system user
  I want to test the skunits getUserSkunit endpoint
  So that I can ensure proper functionality and retrieval of user-specific skunits

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get user skunit without access token
    When I send the GET request to "skunits_get_user_skunit" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user skunit with invalid access token
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get user skunit with expired access token
#    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get user skunit with malformed access token
#    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get user skunit with valid access token
#    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.pagination.page|"1"|
#      |$.pagination.limit|"1000"|
#    And I store the response as "user_skunit_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate pagination and data array structure
#    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.pagination|object|
#      |$.pagination.page|string|
#      |$.pagination.limit|string|
#      |$.data|array|
#      |$.data[0]|object|

  @Positive @NestedValidation
  Scenario: Validate nested objects in first skunit item
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].Skunit|object|
      |$.data[0].Skunit.id|string|
      |$.data[0].Skunit.name|string|
      |$.data[0].Skunit.Brand|object|
      |$.data[0].Skunit.Brand.id|string|
      |$.data[0].Skunit.Brand.name|string|
      |$.data[0].Skunit.Subbrand|object|
      |$.data[0].Skunit.Subbrand.id|null|
      |$.data[0].Skunit.Subbrand.name|null|
      |$.data[0].Skunit.Category|object|
      |$.data[0].Skunit.Category.id|string|
      |$.data[0].Skunit.Category.name|string|
      |$.data[0].Skunit.Subcategory|object|
      |$.data[0].Skunit.Subcategory.id|string|
      |$.data[0].Skunit.Subcategory.name|string|

#  @Positive @StaticValues
#  Scenario: Validate sample static values for first item
#    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].Skunit.name|Cafe Cuba|
#      |$.data[0].Skunit.Brand.name|oOKCPj|
#      |$.data[0].Skunit.Category.name|Juice|
#      |$.data[0].Skunit.Subcategory.name|Maaza|

  @Positive @ContentValidation
  Scenario: Validate user skunit content presence
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |pagination|
      |data|
      |Skunit|
      |Brand|
      |Category|

  @Positive @Performance
  Scenario: Performance test for get user skunit endpoint
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for get user skunit endpoint
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user skunit with invalid query parameters
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get user skunit with special characters in query parameters
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get user skunit with SQL injection attempt
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get user skunit with maximum query parameters
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
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
  Scenario: Get user skunit with invalid endpoint
    And I send the GET request to "skunits_get_user_skunit_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"

#  @Positive @Regression
#  Scenario: Regression test for get user skunit endpoint
#    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: Validate get user skunit response completeness
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end get user skunit retrieval workflow
    And I send the GET request to "skunits_get_user_skunit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "user_skunit_response" name using full path
