@BizomWebAPI  @Innovation @EwayBillsManagement @GetDetails @DataProcessing
#this API have notice in response so for a time being we are not testing this API
Feature: Get Details API Testing for Eway Bills
  As a system user
  I want to test the get details endpoint for eway bills
  So that I can ensure proper functionality and data retrieval for eway bills details management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get details without access token
    When I send the GET request to "ewaybills_getdetails" endpoint with path parameters
      |Path|Value|
      |param1|1|
      |param2|1|
      |param3|0|
      |param4|damageclaim|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get details with invalid access token
    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|param1|1|
      |||param2|1|
      |||param3|0|
      |||param4|damageclaim|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get details with expired access token
    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|param1|1|
      |||param2|1|
      |||param3|0|
      |||param4|damageclaim|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get details with malformed access token
    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|param1|1|
      |||param2|1|
      |||param3|0|
      |||param4|damageclaim|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: TC_05 Get details with valid access token
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "ewaybills_getdetails_response" name using full path
#
#  @Positive @DataValidation
#  Scenario: TC_06 Validate get details response structure
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Vehicle|object|
#      |$.Transporter|array|
#      |$.TransporterId|array|
#      |$.State|object|
#      |$.Distance|number|
#      |$.fromPinCode|null|
#      |$.toPinCode|null|
#      |$.ReasonUpdate|object|
#
#  @Positive @DataValidation
#  Scenario: TC_07 Validate get details Vehicle object structure
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Vehicle|object|
#      |$.Vehicle."1"|string|
#
#  @Positive @DataValidation
#  Scenario: TC_08 Validate get details State object structure
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.State|object|
#      |$.State."1"|string|
#      |$.State."2"|string|
#
#  @Positive @DataValidation
#  Scenario: TC_09 Validate get details ReasonUpdate object structure
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.ReasonUpdate|object|
#      |$.ReasonUpdate.Result|boolean|
#      |$.ReasonUpdate.Reason|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.ReasonUpdate.Result|false|
#      |$.ReasonUpdate.Reason|No reason found|
#
#  @Positive @DataValidation
#  Scenario: TC_10 Validate get details complete structure
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Distance|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Vehicle|object|
#      |$.Transporter|array|
#      |$.TransporterId|array|
#      |$.State|object|
#      |$.Distance|number|
#      |$.fromPinCode|null|
#      |$.toPinCode|null|
#      |$.ReasonUpdate|object|
#      |$.ReasonUpdate.Result|boolean|
#      |$.ReasonUpdate.Reason|string|
#
#  @Positive @Performance
#  Scenario: TC_11 Performance test for get details endpoint
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Positive @Concurrency
#  Scenario: TC_12 Concurrent access test for get details endpoint
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Negative @Validation
#  Scenario: TC_13 Get details with invalid path parameters
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|invalid|
#      |||param2|invalid|
#      |||param3|invalid|
#      |||param4|invalid|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Validation
#  Scenario: TC_14 Get details with special characters in path parameters
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_15 Get details with SQL injection attempt in path parameters
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|'; DROP TABLE ewaybills; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @ErrorHandling
#  Scenario: TC_16 Get details with invalid endpoint
#    And I send the GET request to "ewaybills_getdetails_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#
#  @Positive @BusinessLogic
#  Scenario: TC_17 Validate get details business logic
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Distance|0|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Distance|number|
#
#  @Positive @DataIntegrity
#  Scenario: TC_18 Validate get details data integrity
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Vehicle|object|
#      |$.Transporter|array|
#      |$.TransporterId|array|
#      |$.State|object|
#      |$.Distance|number|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Distance|0|
#
#  @Positive @Regression
#  Scenario: TC_19 Regression test for get details endpoint
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Vehicle|object|
#      |$.Transporter|array|
#      |$.TransporterId|array|
#      |$.State|object|
#      |$.Distance|number|
#      |$.fromPinCode|null|
#      |$.toPinCode|null|
#      |$.ReasonUpdate|object|
#
#  @Positive @Functional
#  Scenario: TC_20 Validate get details response completeness
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Distance|0|
#      |$.ReasonUpdate.Result|false|
#      |$.ReasonUpdate.Reason|No reason found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Vehicle|object|
#      |$.Transporter|array|
#      |$.TransporterId|array|
#      |$.State|object|
#      |$.Distance|number|
#      |$.fromPinCode|null|
#      |$.toPinCode|null|
#      |$.ReasonUpdate|object|
#      |$.ReasonUpdate.Result|boolean|
#      |$.ReasonUpdate.Reason|string|
#    And I store the response as "ewaybills_getdetails_response" name using full path
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |Vehicle|
#      |Transporter|
#      |TransporterId|
#      |State|
#      |Distance|
#      |fromPinCode|
#      |toPinCode|
#      |ReasonUpdate|
#
#  @Positive @Boundary
#  Scenario: TC_21 Get details with different path parameter values
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|2|
#      |||param2|2|
#      |||param3|1|
#      |||param4|sales|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#
#  @Positive @EndToEnd
#  Scenario: TC_22 End-to-end get details data retrieval workflow
#    And I send the GET request to "ewaybills_getdetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|param1|1|
#      |||param2|1|
#      |||param3|0|
#      |||param4|damageclaim|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "ewaybills_getdetails_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Vehicle|object|
#      |$.Transporter|array|
#      |$.TransporterId|array|
#      |$.State|object|
#      |$.Distance|number|
#      |$.fromPinCode|null|
#      |$.toPinCode|null|
#      |$.ReasonUpdate|object|
#      |$.ReasonUpdate.Result|boolean|
#      |$.ReasonUpdate.Reason|string|
#
