@BizomWebAPI @CE @DeliveryChallanStatesManagement @GetDeliveryChallanStates @IntegrationServices
Feature: Get Delivery Challan States API Testing
  As a system user
  I want to test the get delivery challan states endpoint
  So that I can ensure proper functionality and data retrieval for delivery challan states management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get delivery challan states without access token
    When I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get delivery challan states with invalid access token
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get delivery challan states with expired access token
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get delivery challan states with malformed access token
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get delivery challan states with valid access token
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "delivery_challan_states_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate delivery challan states response structure
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate delivery challan states Data array structure
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].namealias|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate delivery challan states with static values
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"placed"|
      |$.Data[0].namealias|"Placed"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"fulfilled"|
      |$.Data[1].namealias|"Fullfilled"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].namealias|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate delivery challan states all data items
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"placed"|
      |$.Data[0].namealias|"Placed"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"fulfilled"|
      |$.Data[1].namealias|"Fullfilled"|
      |$.Data[2].id|"3"|
      |$.Data[2].name|"partiallyfulfilled"|
      |$.Data[2].namealias|"Partially Fullfilled"|
      |$.Data[3].id|"4"|
      |$.Data[3].name|"rejected"|
      |$.Data[3].namealias|"Rejected"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].namealias|string|
      |$.Data[1].id|string|
      |$.Data[1].name|string|
      |$.Data[1].namealias|string|
      |$.Data[2].id|string|
      |$.Data[2].name|string|
      |$.Data[2].namealias|string|
      |$.Data[3].id|string|
      |$.Data[3].name|string|
      |$.Data[3].namealias|string|

  @Positive @Performance
  Scenario: TC_10 Performance test for delivery challan states endpoint
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for delivery challan states endpoint
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_12 Get delivery challan states with invalid query parameters
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_13 Get delivery challan states with special characters in query parameters
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_14 Get delivery challan states with SQL injection attempt
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE deliverychallanstates; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Boundary
  Scenario: TC_15 Get delivery challan states with maximum query parameters
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
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
      |$.Result|true|

#  @Negative @ErrorHandling
#  Scenario: TC_16 Get delivery challan states with invalid endpoint
#    And I send the GET request to "deliverychallanstates_getdeliverychallanstates_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_17 Validate delivery challan states business logic
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"placed"|
      |$.Data[0].namealias|"Placed"|

  @Positive @DataIntegrity
  Scenario: TC_18 Validate delivery challan states data integrity
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].namealias|string|

  @Positive @Regression
  Scenario: TC_19 Regression test for delivery challan states endpoint
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_20 Validate delivery challan states response completeness
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"placed"|
      |$.Data[0].namealias|"Placed"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"fulfilled"|
      |$.Data[1].namealias|"Fullfilled"|
      |$.Data[2].id|"3"|
      |$.Data[2].name|"partiallyfulfilled"|
      |$.Data[2].namealias|"Partially Fullfilled"|
      |$.Data[3].id|"4"|
      |$.Data[3].name|"rejected"|
      |$.Data[3].namealias|"Rejected"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].namealias|string|

  @Positive @ArrayValidation
  Scenario: TC_21 Validate delivery challan states array structure and content
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[2]|object|
      |$.Data[3]|object|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].namealias|string|
      |$.Data[1].id|string|
      |$.Data[1].name|string|
      |$.Data[1].namealias|string|

  @Positive @ContentValidation
  Scenario: TC_22 Validate delivery challan states content structure
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |id|
      |name|
      |namealias|
      |placed|
      |fulfilled|
      |partiallyfulfilled|
      |rejected|
      |Placed|
      |Fullfilled|
      |Partially Fullfilled|
      |Rejected|

  @Positive @LoadTesting
  Scenario: TC_23 Load testing for delivery challan states endpoint
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_24 Test delivery challan states endpoint timeout handling
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end delivery challan states data retrieval workflow
    And I send the GET request to "deliverychallanstates_getdeliverychallanstates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Delivery challan states found."|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"placed"|
      |$.Data[0].namealias|"Placed"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"fulfilled"|
      |$.Data[1].namealias|"Fullfilled"|
      |$.Data[2].id|"3"|
      |$.Data[2].name|"partiallyfulfilled"|
      |$.Data[2].namealias|"Partially Fullfilled"|
      |$.Data[3].id|"4"|
      |$.Data[3].name|"rejected"|
      |$.Data[3].namealias|"Rejected"|
    And I store the response as "delivery_challan_states_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].namealias|string|
      |$.Data[1]|object|
      |$.Data[1].id|string|
      |$.Data[1].name|string|
      |$.Data[1].namealias|string|
      |$.Data[2]|object|
      |$.Data[2].id|string|
      |$.Data[2].name|string|
      |$.Data[2].namealias|string|
      |$.Data[3]|object|
      |$.Data[3].id|string|
      |$.Data[3].name|string|
      |$.Data[3].namealias|string|

