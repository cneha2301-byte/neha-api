@BizomWebAPI @CE @OutletContactsManagement @OutletContacts @GetUserMappedOutcontact @SystemOperations
Feature: Outlet Contacts - Get User Mapped Outlet Contact
  Validates /outletcontacts/getusermappedoutcontact endpoint responses and behaviors.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get user mapped outlet contact without access token
    When I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get user mapped outlet contact with invalid access token
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get user mapped outlet contact with expired access token
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get user mapped outlet contact with malformed access token
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get user mapped outlet contact with valid access token - No data message object
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.message|object|
      |$.message.error|string|
      |$.Outletcontact|array|
    And validating the response contains the following values
      |Value|
      |result|
      |message|
      |error|
      |Outletcontact|
    And I store the response as "user_mapped_outcontact_response" name using full path

  @Positive @Performance
  Scenario: TC_06 Performance test for user mapped outlet contact endpoint
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|

  @Positive @Headers
  Scenario: TC_07 Validate response key presence for user mapped outlet contact
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |result|
      |message|
      |error|
      |Outletcontact|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_08 Regression check for user mapped outlet contact endpoint
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|

  @Positive @Idempotency
  Scenario: TC_09 Consistent response on consecutive calls for user mapped outlet contact
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|
    And I store the response as "user_mapped_outcontact_first" name using full path
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|

  @Negative @Validation
  Scenario: TC_10 Get user mapped outlet contact with additional unknown query param
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |unknown_param|unknown_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|

  @Negative @Validation
  Scenario: TC_11 Get user mapped outlet contact with special characters in query parameters
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|

  @Negative @Security
  Scenario: TC_12 Get user mapped outlet contact with SQL injection attempt
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|

  @Negative @Boundary
  Scenario: TC_13 Get user mapped outlet contact with maximum query parameters
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
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
      |$.result|true|
      |$.message.error|No Data Found|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Invalid endpoint path should return not found for user mapped outlet contact
#    And I send the GET request to "outletcontacts_get_user_mapped_outcontact_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_15  Load testing for user mapped outlet contact endpoint
    And I send the GET request to "outletcontacts_get_user_mapped_outcontact" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.message.error|No Data Found|


