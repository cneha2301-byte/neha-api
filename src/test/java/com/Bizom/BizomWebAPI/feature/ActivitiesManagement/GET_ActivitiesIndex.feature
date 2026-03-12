@BizomWebAPI @CE @ActivitiesManagement @GetActivitiesIndex @MasterDataManagement
Feature: Activities API Testing
  As a system user
  I want to test the activities endpoint
  So that I can ensure proper functionality and data retrieval for activities management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get activities without access token
    When I send the GET request to "activities_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get activities with invalid access token
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
       |JPath|Value|
       |$.result|false|
       |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get activities with expired access token
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
       |JPath|Value|
       |$.result|false|
       |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get activities with malformed access token
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
       |JPath|Value|
       |$.result|false|
       |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get activities with valid access token
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"
    And I store the response as "activities_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate activities response structure
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"
    And validating the response contains the following values
      |Value|
      |Activity|
      |table|
      |Name|
      |Description|
      |Status|

  @Positive @DataValidation
  Scenario: TC_07 Validate activities specific data values
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"
    And validating the response contains the following values
      |Value|
      |ADD ACTIVITY|
      |Description|
      |Status|
      |Active|
      |ERP ID|

  @Positive @DataValidation
  Scenario: TC_08 Validate activities with static values
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"
    And validating the response contains the following values
      |Value|
      |Activity|
      |table|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for activities endpoint
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"

  @Negative @Validation
  Scenario: TC_10 Get activities with invalid query parameters
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"

  @Negative @Validation
  Scenario: TC_11 Get activities with special characters in query parameters
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"


  @Negative @Boundary
  Scenario: TC_12 Get activities with maximum query parameters
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"

  @Negative @ErrorHandling
  Scenario: TC_13 Get activities with invalid endpoint
    And I send the GET request to "activities_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds


  @Positive @DataIntegrity
  Scenario: TC_14 Validate activities data integrity
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"
    And validating the response contains the following values
      |Value|
      |Activity|
      |table|
      |Name|
      |Description|
      |Status|



  @Positive @Functional
  Scenario: TC_15 Validate activities response completeness
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"
    And validating the response contains the following values
      |Value|
      |Activity|
      |ADD ACTIVITY|
      |Description|
      |Status|
      |Active|
      |ERP ID|

  @Positive @LoadTesting
  Scenario: TC_16 Load testing for activities endpoint
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the HTML response should contain page title "Activities"


  @Positive @EndToEnd
  Scenario: TC_17 End-to-end activities data retrieval workflow
    And I send the GET request to "activities_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Activities"
    And I store the response as "activities_response" name using full path
    And validating the response contains the following values
      |Value|
      |Activity|
      |table|
      |Name|
      |Description|
      |Status|
      |ADD ACTIVITY|
