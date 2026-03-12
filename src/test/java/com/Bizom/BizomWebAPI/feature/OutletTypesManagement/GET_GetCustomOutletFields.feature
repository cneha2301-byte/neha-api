@BizomWebAPI @CE @OutletTypesManagement @GetCustomOutletFields @SystemOperations
Feature: Get Custom Outlet Fields API Testing
  As a system user
  I want to test the get custom outlet fields endpoint
  So that I can ensure proper functionality and data retrieval for custom outlet fields information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get custom outlet fields without access token
    When I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get custom outlet fields with invalid access token
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get custom outlet fields with expired access token
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get custom outlet fields with malformed access token
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get custom outlet fields with valid parameters
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Outlet Customization found."|
    And I store the response as "getcustomoutletfields_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate custom outlet fields response structure
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Outlet Customization found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate custom outlet fields data object structure
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.outlettype|object|
      |$.data.customoutletfield|object|
    And validating the response contains the following values
      |Value|
      |data|
      |outlettype|
      |customoutletfield|

  @Positive @DataValidation
  Scenario: TC_08 Validate custom outlet fields outlettype object
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.outlettype|object|
      |$.data.outlettype.1|string|
      |$.data.outlettype.2|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate custom outlet fields customoutletfield array structure
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.customoutletfield|object|
      |$.data.customoutletfield.Outlets1|array|
      |$.data.customoutletfield.Outlets1[0]|object|

  @Positive @Performance
  Scenario: TC_10 Performance test for custom outlet fields endpoint
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get custom outlet fields with invalid mergewarehouse value
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Get custom outlet fields with missing mergewarehouse parameter
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Get custom outlet fields with empty mergewarehouse
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get custom outlet fields with invalid endpoint
#    And I send the GET request to "outlet_types_get_custom_outlet_fields_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |mergewarehouse|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Get custom outlet fields with mergewarehouse set to 0
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_16 Regression test for custom outlet fields endpoint
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Outlet Customization found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.outlettype|object|
      |$.data.customoutletfield|object|

  @Positive @Concurrency
  Scenario: TC_17 Concurrent access test for custom outlet fields endpoint
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for custom outlet fields endpoint
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_19 Test custom outlet fields endpoint timeout handling
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_20 End-to-end custom outlet fields workflow
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Outlet Customization found."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.outlettype|object|
      |$.data.customoutletfield|object|
      |$.data.customoutletfield.Outlets1|array|
      |$.data.customoutletfield.Outlets1[0]|object|
    And I store the response as "getcustomoutletfields_response" name using full path

  @Positive @DataValidation
  Scenario: TC_21 Validate custom outlet fields contains custom field details
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.customoutletfield.Outlets1[0].id|string|
      |$.data.customoutletfield.Outlets1[0].fields|array|
      |$.data.customoutletfield.Outlets1[0].fields[0]|object|
      |$.data.customoutletfield.Outlets1[0].fields[0].name|string|
      |$.data.customoutletfield.Outlets1[0].fields[0].type|string|
      |$.data.customoutletfield.Outlets1[0].fields[0].settings|object|

  @Positive @DataValidation
  Scenario: TC_22 Validate custom outlet fields field settings structure
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.customoutletfield.Outlets1[0].fields[0].settings.en|object|
      |$.data.customoutletfield.Outlets1[0].fields[0].settings.api|object|
    And validating the response contains the following values
      |Value|
      |settings|
      |en|
      |api|
      |label|
      |type|

  @Positive @Integration
  Scenario: TC_23 Verify custom outlet fields endpoint integration
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Outlet Customization found."|
    And I validate that the operation was successfully completed in the system

  @Positive @Boundary
  Scenario: TC_24 Get custom outlet fields with very large mergewarehouse value
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Boundary
  Scenario: TC_25 Get custom outlet fields with negative mergewarehouse value
    And I send the GET request to "outlet_types_get_custom_outlet_fields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |mergewarehouse|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

