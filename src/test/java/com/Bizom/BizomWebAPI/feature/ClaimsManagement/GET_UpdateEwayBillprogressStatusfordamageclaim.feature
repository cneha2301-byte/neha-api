@BizomWebAPI @ClaimsManagement @UpdateEwayBillprogressStatusfordamageclaim @ReportsAnalyticsGroup2 @CE
Feature: Update Eway Bill Progress Status For Damage Claim API Testing
  As a system user
  I want to test the update eway bill progress status for damage claim endpoint
  So that I can ensure proper functionality and data retrieval for damage claims eway bill status management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Update eway bill progress status for damage claim without access token
    When I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Update eway bill progress status for damage claim with invalid access token
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Update eway bill progress status for damage claim with expired access token
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Update eway bill progress status for damage claim with malformed access token
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Update eway bill progress status for damage claim with valid access token
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|
    And I store the response as "update_eway_bill_progress_status_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate update eway bill progress status response structure
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|
      |$.Damageclaim|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate update eway bill progress status Damageclaim field
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Damageclaim|null|
    And verify the fields are null
      |JPath|
      |$.Damageclaim|

  @Positive @DataValidation
  Scenario: TC_08 Validate update eway bill progress status complete structure
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|
      |$.Damageclaim|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_09 Performance test for update eway bill progress status endpoint
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for update eway bill progress status endpoint
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|

  @Negative @Validation
  Scenario: TC_11 Update eway bill progress status with invalid query parameters
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|

  @Negative @Validation
  Scenario: TC_12 Update eway bill progress status with special characters in query parameters
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|

  @Negative @Security
  Scenario: TC_13 Update eway bill progress status with SQL injection attempt
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE damageclaims; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|

  @Negative @Boundary
  Scenario: TC_14 Update eway bill progress status with maximum query parameters
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
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
      |$.Result|"true"|
      |$.Reason|Status Updated|

  @Negative @ErrorHandling
  Scenario: TC_15 Update eway bill progress status with invalid endpoint
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate update eway bill progress status business logic
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|
      |$.Damageclaim|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate update eway bill progress status data integrity
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|
      |$.Damageclaim|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And verify the fields are null
      |JPath|
      |$.Damageclaim|

  @Positive @Regression
  Scenario: TC_18 Regression test for update eway bill progress status endpoint
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_19 Validate update eway bill progress status response completeness
    And I send the GET request to "damageclaims_updateewaybillprogressstatusfordamageclaim" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|Status Updated|
      |$.Damageclaim|null|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
    And verify the fields are null
      |JPath|
      |$.Damageclaim|
    And I store the response as "update_eway_bill_progress_status_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Damageclaim|
      |Status Updated|

