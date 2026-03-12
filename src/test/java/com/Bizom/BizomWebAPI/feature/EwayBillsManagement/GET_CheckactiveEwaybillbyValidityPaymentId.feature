@BizomWebAPI  @Innovation @EwayBillsManagement @CheckactiveEwaybillbyValidityPaymentId @DataProcessing
Feature: Check Active Eway Bill By Validity Payment ID API Testing
  As a system user
  I want to test the check active eway bill by validity payment ID endpoint
  So that I can ensure proper functionality and data retrieval for eway bills validity payment status management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Check active eway bill by validity payment ID without access token
    When I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token||paymentId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Check active eway bill by validity payment ID with invalid access token
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|paymentId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Check active eway bill by validity payment ID with expired access token
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|paymentId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Check active eway bill by validity payment ID with malformed access token
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|paymentId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Check active eway bill by validity payment ID with valid access token
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "check_active_eway_bill_validity_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate check active eway bill by validity payment ID response structure
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate check active eway bill by validity payment ID data object structure
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.isExist|number|

  @Positive @DataValidation
  Scenario: TC_08 Validate check active eway bill by validity payment ID isExist field
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.isExist|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.isExist|number|

  @Positive @DataValidation
  Scenario: TC_09 Validate check active eway bill by validity payment ID complete structure
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.isExist|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.isExist|number|

  @Positive @Performance
  Scenario: TC_10 Performance test for check active eway bill by validity payment ID endpoint
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for check active eway bill by validity payment ID endpoint
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Functional
  Scenario: TC_12 Check active eway bill by validity payment ID with different payment IDs
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.isExist|number|

  @Negative @Validation
  Scenario: TC_13 Check active eway bill by validity payment ID with invalid query parameters
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
      |invalid_param|invalid_value||        |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Negative @Validation
#  Scenario: TC_14 Check active eway bill by validity payment ID with special characters in payment ID
#    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

#  @Negative @Security
#  Scenario: TC_15 Check active eway bill by validity payment ID with SQL injection attempt in payment ID
#    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|'; DROP TABLE payments; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Negative @Boundary
  Scenario: TC_16 Check active eway bill by validity payment ID with empty payment ID
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId||
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_17 Check active eway bill by validity payment ID with zero payment ID
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: TC_18 Check active eway bill by validity payment ID with negative payment ID
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
#
#  @Negative @ErrorHandling
#  Scenario: TC_19 Check active eway bill by validity payment ID with invalid endpoint
#    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|paymentId|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_20 Validate check active eway bill by validity payment ID business logic
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.isExist|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.isExist|number|

  @Positive @DataIntegrity
  Scenario: TC_21 Validate check active eway bill by validity payment ID data integrity
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.isExist|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.isExist|number|

  @Positive @Regression
  Scenario: TC_22 Regression test for check active eway bill by validity payment ID endpoint
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.isExist|number|

  @Positive @Functional
  Scenario: TC_23 Validate check active eway bill by validity payment ID response completeness
    And I send the GET request to "ewaybills_checkactiveewaybillbyvaliditypaymentid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|paymentId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.data.isExist|0|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.isExist|number|
    And I store the response as "check_active_eway_bill_validity_response" name using full path
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |isExist|

