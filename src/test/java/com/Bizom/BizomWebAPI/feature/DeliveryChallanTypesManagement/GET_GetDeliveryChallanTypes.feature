@BizomWebAPI @CE @DeliveryChallanTypesManagement @GetDeliveryChallanTypes @IntegrationServices
Feature: Get Delivery Challan Types API Testing
  As a system user
  I want to test the get delivery challan types endpoint
  So that I can ensure proper functionality and data retrieval for delivery challan types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get delivery challan types without access token
    When I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get delivery challan types with invalid access token
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
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
  Scenario: TC_03 Get delivery challan types with expired access token
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
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
  Scenario: TC_04 Get delivery challan types with malformed access token
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
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
  Scenario: TC_05 Get delivery challan types with valid access token
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
    And I store the response as "delivery_challan_types_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate delivery challan types response structure
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate delivery challan types response format
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Performance
  Scenario: TC_08 Performance test for delivery challan types endpoint
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for delivery challan types endpoint
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_10 Get delivery challan types with invalid query parameters
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_11 Get delivery challan types with special characters in query parameters
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Security
  Scenario: TC_12 Get delivery challan types with SQL injection attempt
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE deliverychallantypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Boundary
  Scenario: TC_13 Get delivery challan types with maximum query parameters
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
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

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get delivery challan types with invalid endpoint
#    And I send the GET request to "deliverychallantypes_getdeliverychallantypes_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate delivery challan types business logic
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate delivery challan types data integrity
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: TC_17 Regression test for delivery challan types endpoint
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_18 Validate delivery challan types response completeness
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ObjectValidation
  Scenario: TC_19 Validate delivery challan types response structure and content
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ContentValidation
  Scenario: TC_20 Validate delivery challan types content structure
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |No delivery challan types found in the system.|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for delivery challan types endpoint
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Timeout
  Scenario: TC_22 Test delivery challan types endpoint timeout handling
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end delivery challan types data retrieval workflow
    And I send the GET request to "deliverychallantypes_getdeliverychallantypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No delivery challan types found in the system."|
    And I store the response as "delivery_challan_types_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

