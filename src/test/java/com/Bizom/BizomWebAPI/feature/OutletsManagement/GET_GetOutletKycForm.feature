@BizomWebAPI @CE @OutletsManagement @OutletKycForm @InventoryOperations
Feature: Get Outlet KYC Form API Testing
  As a system user
  I want to test the get outlet KYC form endpoint
  So that I can ensure proper functionality and data retrieval for outlet KYC by outlet ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet KYC form without access token
    When I send the GET request to "outlets_get_outlet_kyc_form" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get outlet KYC form with invalid access token
#    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|outletId|1|
#    Then I should see the response code as "200"
#   And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_03 Get outlet KYC form with expired access token
#    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|outletId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get outlet KYC form with malformed access token
#    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|outletId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet KYC form for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.OutletKyc.outletId|"1"|
      |$.OutletKyc.approvedStatus|"1"|
      |$.OutletKyc.areaId|"0"|
      |$.OutletKyc.outletStateId|"1"|
    And I store the response as "outlet_kyc_form_response" name using full path

  @Positive @Functional
  Scenario: TC_06 Get outlet KYC form for outlet ID 2 with valid access token
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.OutletKyc|object|
      |$.OutletKyc.outletId|string|
      |$.OutletKyc.kycForm|null|
      |$.OutletKyc.approvedStatus|string|
      |$.OutletKyc.areaId|string|
      |$.OutletKyc.outletStateId|string|

  @Negative @Validation
  Scenario: TC_07 Get outlet KYC form with invalid outlet ID
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    #giving cake error need to add a step to verify
   

  @Negative @Validation
  Scenario: TC_08 Get outlet KYC form with non-existent outlet ID
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    #giving cake error need to add a step to verify

  @Negative @ErrorHandling
  Scenario: TC_09 Get outlet KYC form with invalid endpoint
    And I send the GET request to "outlets_get_outlet_kyc_form_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet KYC form endpoint
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: TC_11 Regression test for outlet KYC form endpoint
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for outlet KYC form endpoint
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @ContentValidation
  Scenario: TC_13 Validate outlet KYC form content structure
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      |Value|
      |OutletKyc|
      |outletId|
      |kycForm|
      |approvedStatus|
      |areaId|
      |outletStateId|

  @Positive @EndToEnd
  Scenario: TC_14 End-to-end outlet KYC form retrieval workflow
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And I store the response as "outlet_kyc_form_e2e_response" name using full path

  @Negative @Validation
  Scenario: TC_15 Get outlet KYC form with invalid query parameters
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |invalid_param|invalid_value|      | |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get outlet KYC form with special characters in query parameters
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate outlet KYC form business logic
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.OutletKyc.outletId|"1"|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate outlet KYC form data integrity
    And I send the GET request to "outlets_get_outlet_kyc_form" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.OutletKyc|object|
      |$.OutletKyc.outletId|string|
      |$.OutletKyc.approvedStatus|string|


