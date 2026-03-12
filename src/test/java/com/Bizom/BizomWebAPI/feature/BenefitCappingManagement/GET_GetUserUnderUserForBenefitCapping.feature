@BizomWebAPI @PI @BenefitCappingManagement @GetUserUnderUserForBenefitCapping @ConfigurationSettings
Feature: Get User Under User For Benefit Capping API Testing
  As a system user
  I want to test the get user under user for benefit capping endpoint
  So that I can ensure proper functionality and data retrieval for benefit capping user management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get user under user for benefit capping without access token
    When I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get user under user for benefit capping with invalid access token
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get user under user for benefit capping with expired access token
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get user under user for benefit capping with malformed access token
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get user under user for benefit capping with valid access token
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "user_under_user_benefit_capping_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate user under user for benefit capping response structure
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate user under user for benefit capping Data array structure
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate user under user for benefit capping User object fields
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate user under user for benefit capping nested User structure
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for user under user for benefit capping endpoint
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for user under user for benefit capping endpoint
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: TC_12 Get user under user for benefit capping with invalid query parameters
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
  Scenario: TC_13 Get user under user for benefit capping with special characters in query parameters
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
  Scenario: TC_14 Get user under user for benefit capping with SQL injection attempt
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE users; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_15 Get user under user for benefit capping with maximum query parameters
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
  Scenario: TC_16 Get user under user for benefit capping with invalid endpoint
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate user under user for benefit capping business logic
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate user under user for benefit capping data integrity
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for user under user for benefit capping endpoint
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|

  @Positive @Functional
  Scenario: TC_20 Validate user under user for benefit capping response completeness
    And I send the GET request to "benefitcappings_getuserunderuserforbenefitcapping" endpoint with dynamic access token and query parameters
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
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].User|object|
      |$.Data[0].User.id|string|
      |$.Data[0].User.name|string|
    And I store the response as "user_under_user_benefit_capping_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |User|
      |id|
      |name|

