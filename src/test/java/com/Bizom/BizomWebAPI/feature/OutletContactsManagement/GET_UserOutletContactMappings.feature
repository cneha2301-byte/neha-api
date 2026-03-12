@BizomWebAPI @CE @OutletContactsManagement @OutletContacts @UserOutletContactMappings @SystemOperations
Feature: Outlet Contacts - User Outlet Contact Mappings
  Validates /outletcontacts/useroutletcontactmappings/{userId} endpoint with HTML responses.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get user outlet contact mappings without access token
    When I send the GET request to "user_outlet_contact_mappings" endpoint with path parameters
      |Path|Value|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get user outlet contact mappings with invalid access token
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get user outlet contact mappings with expired access token
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get user outlet contact mappings with malformed access token
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|userId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get user outlet contact mappings with valid access token
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Outletcontacts"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_06 Get user outlet contact mappings with non-numeric userId
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|abc|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Outletcontacts"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_07 Get user outlet contact mappings with very large userId
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|9999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_08 Get user outlet contact mappings with userId zero
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|0|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Outletcontacts"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_09 Invalid endpoint should return not found
#    And I send the GET request to "user_outlet_contact_mappings_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for user outlet contact mappings
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Outletcontacts"
    And verify response time is less than "1200" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for user outlet contact mappings
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Outletcontacts"
    And verify response time is less than "2000" milliseconds

  @Positive @Idempotency
  Scenario: TC_12 Consistent HTML response on consecutive calls for user outlet contact mappings
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Outletcontacts"
    And I store the response as "user_outlet_contact_mappings_first" name using full path
    And I send the GET request to "user_outlet_contact_mappings" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Outletcontacts"


