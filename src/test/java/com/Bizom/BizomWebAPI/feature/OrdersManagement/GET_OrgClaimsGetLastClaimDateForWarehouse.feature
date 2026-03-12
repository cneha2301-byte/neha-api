@BizomWebAPI @OS @OrdersManagement @OrgClaims @LastClaimDate @SystemOperations
Feature: OrgClaims - Get Last Claim Date For Warehouse
  This feature validates the /orgclaims/getlastclaimdateforwarehouse endpoint which returns last claim dates.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get last claim date without access token
    When I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get last claim date with invalid access token
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get last claim date with expired access token
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get last claim date with malformed access token
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get last claim date with valid access token
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.lastToDate|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
      |$.lastToDate|0000-00-00|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_06 Get last claim date with invalid query parameters
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Get last claim date with special characters in query parameters
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_08 Get last claim date with SQL injection attempt
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE orgclaims; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_09 Get last claim date with maximum query parameters
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_10 Get last claim date with invalid endpoint
#    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_11 Performance test for last claim date endpoint
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_12 Regression test for last claim date endpoint
    And I send the GET request to "orgclaims_get_last_claim_date_for_warehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

