@BizomWebAPI @CE @OutletsManagement @GETOutletDetails @InventoryOperations
Feature: Get Outlet Details API Testing
  As a system user
  I want to test the get outlet details endpoint
  So that I can ensure proper functionality and data retrieval for outlet summary information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlet details without access token
    When I send the GET request to "outlets_get_outlet_details" endpoint with path parameters
      |Path|Value|
      |outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet details with invalid access token
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlet details with expired access token
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get outlet details with malformed access token
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get outlet details for outlet ID 1 with valid access token
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data.Id|"1"|
      |$.data.Name|"SLV Traders"|
    And I store the response as "outlet_details_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate outlet details response structure
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
      |$.alias|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate outlet details data object structure
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.Id|string|
      |$.data.Name|string|
      |$.data.Address|string|
      |$.data.Phone|string|
      |$.data.Pan|string|
      |$.data.StateId|string|
      |$.data.Level|string|
      |$.data.warehouse_id|string|
      |$.data.standardoutlet|string|
      |$.data.is_mt_outlet|boolean|

  @Positive @DataValidation
  Scenario: TC_08 Validate outlet details specific field values
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data.Id|"1"|
      |$.data.Name|"SLV Traders"|
      |$.data.Address|"Bangalore"|
      |$.data.Phone|"9886145638"|
      |$.data.Pan|"4321"|
      |$.data.warehouse_id|"1"|
      |$.data.Level|"cash"|

  @Positive @Functional
  Scenario: TC_09 Get outlet details for outlet ID 2 with valid access token
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|

  @Positive @Performance
  Scenario: TC_10 Performance test for outlet details endpoint
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_11 Get outlet details with SQL injection attempt
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |test_param|'; DROP TABLE outlets; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|

  @Negative @Boundary
  Scenario: TC_12 Get outlet details with maximum query parameters
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
      |param1|value1|                    | |
      |param2|value2|                    | |
      |param3|value3|                    | |
      |param4|value4|                    | |
      |param5|value5|                    | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_13 Get outlet details with invalid endpoint
    And I send the GET request to "outlets_get_outlet_details_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate outlet details business logic
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data.standardoutlet|"0"|
      |$.data.is_mt_outlet|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.standardoutlet|string|
      |$.data.is_mt_outlet|boolean|

  @Positive @DataIntegrity
  Scenario: TC_15 Validate outlet details data integrity with database
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data.Name|DB:outlets:name:id=1|

  @Positive @Regression
  Scenario: TC_16 Regression test for outlet details endpoint
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.alias|object|

  @Positive @Functional
  Scenario: TC_17 Validate outlet details response completeness
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Id|
      |Name|
      |Address|
      |Phone|
      |Pan|
      |StateId|
      |Level|
      |warehouse_id|
      |alias|

  @Positive @ContentValidation
  Scenario: TC_18 Validate outlet details content structure
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |data|
      |alias|

  @Positive @LoadTesting
  Scenario: TC_19 Load testing for outlet details endpoint
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_20 End-to-end outlet details retrieval workflow
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.data.Id|"1"|
      |$.data.Name|"SLV Traders"|
      |$.data.Address|"Bangalore"|
      |$.data.Phone|"9886145638"|
      |$.data.Pan|"4321"|
      |$.data.warehouse_id|"1"|
      |$.data.Level|"cash"|
      |$.data.standardoutlet|"0"|
      |$.data.is_mt_outlet|false|
    And I store the response as "outlet_details_e2e_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.Id|string|
      |$.data.Name|string|
      |$.data.Address|string|
      |$.data.Phone|string|
      |$.data.StateId|string|
      |$.data.warehouse_id|string|
      |$.alias|object|

  @Positive @Idempotency
  Scenario: TC_21 Idempotency test for outlet details endpoint
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "outlet_details_first_call" name using full path
    And I send the GET request to "outlets_get_outlet_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|


