@BizomWebAPI @PopsStrataManagement @PopsStrata @OrderManagement @Innovation
Feature: Pops Strata API Get Testing
  As a system user
  I want to test the pops strata api get endpoint
  So that I can ensure proper functionality and data retrieval for pops strata management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get pops strata without access token
    When I send the GET request to "popsstratas_api_get" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get pops strata with invalid access token
    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
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
  Scenario: Get pops strata with expired access token
    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
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
  Scenario: Get pops strata with malformed access token
    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get pops strata with valid access token
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And I store the response as "pops_strata_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate pops strata response structure
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$."1"|string|
#      |$."2"|string|
#      |$."3"|string|
#      |$."4"|string|

#  @Positive @DataValidation
#  Scenario: Validate pops strata specific data values
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$."1"|DB:popsstratas:name: id=1|
#      |$."2"|DB:popsstratas:name: id=2|
#      |$."3"|DB:popsstratas:name: id=3|
#      |$."4"|DB:popsstratas:name: id=4|

#  @Positive @DataValidation
#  Scenario: Validate pops strata with static values
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Positive @Performance
#  Scenario: Performance test for pops strata endpoint
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for pops strata endpoint
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Negative @Validation
#  Scenario: Get pops strata with invalid query parameters
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Negative @Validation
#  Scenario: Get pops strata with special characters in query parameters
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Negative @Security
#  Scenario: Get pops strata with SQL injection attempt
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE popsstratas; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Negative @Boundary
#  Scenario: Get pops strata with maximum query parameters
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

  @Negative @ErrorHandling
  Scenario: Get pops strata with invalid endpoint
    And I send the GET request to "popsstratas_api_get_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate pops strata business logic
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Positive @DataIntegrity
#  Scenario: Validate pops strata data integrity
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$."1"|string|
#      |$."2"|string|
#      |$."3"|string|
#      |$."4"|string|

#  @Positive @Regression
#  Scenario: Regression test for pops strata endpoint
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$."1"|string|
#      |$."2"|string|
#      |$."3"|string|
#      |$."4"|string|

#  @Positive @Functional
#  Scenario: Validate pops strata response completeness
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$."1"|string|
#      |$."2"|string|
#      |$."3"|string|
#      |$."4"|string|

#  @Positive @ObjectValidation
#  Scenario: Validate pops strata object structure and content
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$."1"|string|
#      |$."2"|string|
#      |$."3"|string|
#      |$."4"|string|

#  @Positive @ContentValidation
#  Scenario: Validate pops strata content structure
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And validating the response contains the following values
#      |Value|
#      |Metros|
#      |Five Lacs Plus|
#      |Five Lacs Minus|
#      |One Lacs Minus|

#  @Positive @LoadTesting
#  Scenario: Load testing for pops strata endpoint
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Negative @Timeout
#  Scenario: Test pops strata endpoint timeout handling
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|

#  @Positive @EndToEnd
#  Scenario: End-to-end pops strata retrieval workflow
#    And I send the GET request to "popsstratas_api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$."1"|Metros|
#      |$."2"|Five Lacs Plus|
#      |$."3"|Five Lacs Minus|
#      |$."4"|One Lacs Minus|
#    And I store the response as "pops_strata_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$."1"|string|
#      |$."2"|string|
#      |$."3"|string|
#      |$."4"|string|

