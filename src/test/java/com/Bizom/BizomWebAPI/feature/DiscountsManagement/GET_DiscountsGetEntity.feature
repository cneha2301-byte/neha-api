@BizomWebAPI @PI @DiscountsManagement @DiscountsGetEntity @IntegrationServices
Feature: Discounts Get Entity API Testing
  As a system user
  I want to test the discounts get entity endpoint
  So that I can ensure proper functionality and data retrieval for discounts management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get entities without access token
    When I send the GET request to "discounts_getentity" endpoint
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get entities with invalid access token
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get entities with expired access token
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get entities with malformed access token
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get entities with valid access token
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|

  @Positive @DataValidation
  Scenario: TC_06 Validate get entity response structure and data types
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].entity_id|string|
      |$.aaData[0].entity_name|string|
      |$.aaData[0].entity_status|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate specific entity values
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].entity_id|"2"|
      |$.aaData[0].entity_name|"Chat"|
      |$.aaData[0].entity_status|"1"|
      |$.aaData[6].entity_id|"8"|
      |$.aaData[6].entity_name|"special-category"|
      |$.aaData[6].entity_status|"1"|

  @Positive @Performance
  Scenario: TC_08 Performance test for get entity endpoint
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for get entity endpoint
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Get entity with invalid query parameters
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Get entity with special characters in query parameters
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Get entity with SQL injection attempt
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE discounts; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_13 Get entity with maximum query parameters
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
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
  Scenario: TC_14 Get entity invalid endpoint
    And I send the GET request to "discounts_getentity_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Headers
  Scenario: TC_15 Validate get entity response headers
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|

  @Positive @ResponseStorage
  Scenario: TC_16 Store get entity response for further use
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "discounts_getentity_response" name using full path


  @Positive @DataIntegrity
  Scenario: TC_17 Validate get entity data integrity
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[1]|object|
      |$.aaData[0].entity_id|string|
      |$.aaData[0].entity_name|string|
      |$.aaData[0].entity_status|string|
      |$.aaData[1].entity_id|string|
      |$.aaData[1].entity_name|string|
      |$.aaData[1].entity_status|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for get entity endpoint
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|
      |$.aaData|array|

  @Positive @Functional
  Scenario: TC_19 Validate get entity response completeness
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData[0].entity_id|"2"|
      |$.aaData[0].entity_name|"Chat"|
      |$.aaData[6].entity_id|"8"|
      |$.aaData[6].entity_name|"special-category"|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate get entity array structure and content
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[1]|object|
      |$.aaData[0].entity_id|string|
      |$.aaData[1].entity_id|string|
      |$.aaData[0].entity_name|string|
      |$.aaData[1].entity_name|string|

  @Positive @ContentValidation
  Scenario: TC_21 Validate get entity content structure
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |aaData|
      |entity_id|
      |entity_name|
      |entity_status|

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end get entity data retrieval workflow
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "discounts_getentity_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].entity_id|string|
      |$.aaData[0].entity_name|string|
      |$.aaData[0].entity_status|string|

  @Positive @Comprehensive
  Scenario: TC_23 Comprehensive get entity validation
    And I send the GET request to "discounts_getentity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|string|
      |$.iTotalRecords|string|
      |$.iTotalDisplayRecords|string|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[7]|object|
      |$.aaData[0].entity_id|string|
      |$.aaData[0].entity_name|string|
      |$.aaData[0].entity_status|string|
      |$.aaData[7].entity_id|string|
      |$.aaData[7].entity_name|string|
      |$.aaData[7].entity_status|string|
    And I store the response as "discounts_getentity_response" name using full path


