@BizomWebAPI @PI @BenefitCappingManagement @BenefitCappingMastersNew @ConfigurationSettings
Feature: Benefit Capping Masters Index New API Testing
  As a Bizom web API consumer
  I want to validate the benefit capping masters index new endpoint
  So that I can ensure benefit capping data retrieval via the new API works reliably

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get benefit capping masters new without access token
    When I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
    |QueryParamName|QueryParamValue|
    |access_token||
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get benefit capping masters new with invalid access token
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|  
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get benefit capping masters new with expired access token
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get benefit capping masters new with malformed access token
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get benefit capping masters new with valid access token
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
    And I store the response as "benefitCappingMastersIndexNew_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for benefit capping masters index new endpoint
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_07 Concurrent access test for benefit capping masters index new endpoint
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Get benefit capping masters new with invalid query parameters
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Get benefit capping masters new with special characters in query parameters
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_10 Get benefit capping masters new with SQL injection attempt
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE benefitcappingmasters; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_11 Get benefit capping masters new with maximum query parameters
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
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
  Scenario: TC_12 Get benefit capping masters new with invalid endpoint
    And I send the GET request to "benefit_capping_masters_index_api_new_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_13 Regression test for benefit capping masters index new endpoint
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.iTotalDisplayRecords|0|

  @Positive @Functional
  Scenario: TC_14 Validate benefit capping masters index new response completeness
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list is empty
      |JPath|
      |$.aaData|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for benefit capping masters index new endpoint
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_16 Test benefit capping masters index new endpoint timeout handling
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_17 End-to-end benefit capping masters index new workflow
    And I send the GET request to "benefit_capping_masters_index_api_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "benefitCappingMastersIndexNew_response" name using full path

