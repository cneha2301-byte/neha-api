@BizomWebAPI @CE @OutletContactsManagement @OutletContacts @GetOutletContactForOtherEntity @SystemOperations
Feature: Outlet Contacts - Get Outlet Contact For Other Entity
  Validates /outletcontacts/getOutletContactForOtherEntity endpoint responses and behaviors.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet contact for other entity without access token
    When I send the GET request to "outletcontacts_get_for_other_entity" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet contact for other entity with invalid access token
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet contact for other entity with expired access token
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet contact for other entity with malformed access token
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet contact for other entity with valid access token - No data case
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
    And I store the response as "outlet_contact_for_other_entity_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for outlet contact for other entity endpoint
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @Headers
  Scenario: TC_07 Validate response key presence for outlet contact for other entity
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_08 Regression check for outlet contact for other entity endpoint
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Positive @Idempotency
  Scenario: TC_09 Consistent response on consecutive calls for outlet contact for other entity
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|
    And I store the response as "outlet_contact_for_other_entity_first" name using full path
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Validation
  Scenario: TC_10 Get outlet contact for other entity with additional unknown query param
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |unknown_param|unknown_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Validation
  Scenario: TC_11 Get outlet contact for other entity with special characters in query parameters
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Security
  Scenario: TC_12 Negative Get outlet contact for other entity with SQL injection attempt
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|

  @Negative @Boundary
  Scenario: TC_13 Get outlet contact for other entity with maximum query parameters
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
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
      |$.Result|false|
      |$.Reason|No data found.|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Invalid endpoint path should return not found for outlet contact for other entity
#    And I send the GET request to "outletcontacts_get_for_other_entity_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for outlet contact for other entity endpoint
    And I send the GET request to "outletcontacts_get_for_other_entity" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No data found.|


