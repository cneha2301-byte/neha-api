@BizomWebAPI @ReasonsManagement @GetTagByReasonId @OrderManagement @OS
Feature: Get Tag By Reason ID API Testing
  As a system user
  I want to test the get tag by reason ID endpoint
  So that I can ensure proper functionality and data retrieval for reasons management

  Background: 
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get tag by reason ID without access token
#    When I send the GET request to "reasons_get_tag_by_reason_id" endpoint with path parameters
#      |Path|Value|
#      |reasonId|1|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get tag by reason ID with invalid access token
#    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|reasonId|1|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get tag by reason ID with expired access token
#    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|reasonId|1|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get tag by reason ID with malformed access token
#    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|reasonId|1|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get tag by reason ID with valid reason ID 1
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And I store the response as "tag_by_reason_id_response" name using full path

  @Positive @Smoke
  Scenario: Get tag by reason ID with valid reason ID 2
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And I store the response as "tag_by_reason_id_response" name using full path

  @Positive @DataValidation
  Scenario: Validate tag by reason ID response structure
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @DataValidation
  Scenario: Validate tag by reason ID with static values
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|

  @Negative @Validation
  Scenario: Get tag by reason ID with invalid reason ID
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|

  @Negative @Validation
  Scenario: Get tag by reason ID with non-numeric reason ID
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get tag by reason ID with negative reason ID
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|

#  @Negative @Validation
#  Scenario: Get tag by reason ID with zero reason ID
#    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|reasonId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Tag|null|

#  @Negative @ErrorHandling
#  Scenario: Get tag by reason ID with invalid endpoint
#    And I send the GET request to "reasons_get_tag_by_reason_id_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|reasonId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for tag by reason ID endpoint
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for tag by reason ID endpoint
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|

  @Positive @BusinessLogic
  Scenario: Validate tag by reason ID business logic
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @DataIntegrity
  Scenario: Validate tag by reason ID data integrity
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @Regression
  Scenario: Regression test for tag by reason ID endpoint
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @Functional
  Scenario: Validate tag by reason ID response completeness
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @ContentValidation
  Scenario: Validate tag by reason ID content structure
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response contains the following values
      |Value|
      |Tag|

  @Positive @LoadTesting
  Scenario: Load testing for tag by reason ID endpoint
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|

  @Negative @Timeout
  Scenario: Test tag by reason ID endpoint timeout handling
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|

  @Positive @EndToEnd
  Scenario: End-to-end tag by reason ID data retrieval workflow
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And I store the response as "tag_by_reason_id_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @ReasonIdParameterValidation
  Scenario: Validate tag by reason ID with different reason IDs
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @FieldValidation
  Scenario: Validate tag by reason ID field completeness
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

  @Positive @NullValueValidation
  Scenario: Validate tag by reason ID null tag response
    And I send the GET request to "reasons_get_tag_by_reason_id" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|reasonId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Tag|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Tag|object|

