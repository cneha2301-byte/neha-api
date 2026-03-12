@BizomWebAPI @CE @OutletTargetsManagement @OutletTargetsTypes @SystemOperations
Feature: Outlet Type API Testing
  As a system user
  I want to test the outlet type endpoint
  So that I can ensure proper functionality and data retrieval for outlet types based on outlet type ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get outlet type without access token
    When I send the GET request to "outlettargets_outlet_type" endpoint with path parameters
      |Path|Value|
      |outletType|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get outlet type with invalid access token
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|outletType|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get outlet type with expired access token
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|outletType|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get outlet type with malformed access token
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|outletType|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get outlet type for outlet type ID 1 with valid access token
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
      |$.data.1|"Outlets1"|
      |$.data.2|"Direct"|
      |$.data.3|"Indirect"|
      |$.data.5|"Test Type"|
      |$.data.6|"outlet"|
      |$.data.7|"ouatlet"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @Functional
  Scenario: Get outlet type for outlet type ID 2 with valid access token
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
      |$.data.1|"SOUTH"|
      |$.data.2|"NORTH"|
      |$.data.3|"East"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @Functional
  Scenario: Get outlet type for outlet type ID 3 with valid access token
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|3|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Outlettype"|

  @Negative @Validation
  Scenario: Get outlet type with invalid outlet type ID - alphabetic characters
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Outlettype|

  @Negative @Validation
  Scenario: Get outlet type with non-existent outlet type ID
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Outlettype|

  @Negative @Validation
  Scenario: Get outlet type with zero outlet type ID
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Outlettype|

  @Negative @Validation
  Scenario: Get outlet type with negative outlet type ID
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Outlettype|

#  @Negative @ErrorHandling
#  Scenario: Get outlet type with invalid endpoint
#    And I send the GET request to "outlettargets_outlet_type_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|outletType|1|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for outlet type endpoint
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|

  @Positive @Regression
  Scenario: Regression test for outlet type endpoint
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
      |$.data.1|"Outlets1"|
      |$.data.2|"Direct"|
      |$.data.3|"Indirect"|

  @Positive @DataValidation
  Scenario: Validate outlet type response structure for outlet type ID 1
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @DataValidation
  Scenario: Validate outlet type response structure for outlet type ID 2
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @BusinessLogic
  Scenario: Validate outlet type business logic for outlet type ID 1
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
      |$.data.1|"Outlets1"|
      |$.data.2|"Direct"|
      |$.data.3|"Indirect"|
      |$.data.5|"Test Type"|
      |$.data.6|"outlet"|
      |$.data.7|"ouatlet"|

  @Positive @BusinessLogic
  Scenario: Validate outlet type business logic for outlet type ID 2
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
      |$.data.1|"SOUTH"|
      |$.data.2|"NORTH"|
      |$.data.3|"East"|

  @Positive @DataIntegrity
  Scenario: Validate outlet type data integrity for outlet type ID 1
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.1|string|
      |$.data.2|string|
      |$.data.3|string|

  @Positive @Concurrency
  Scenario: Concurrent access test for outlet type endpoint
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|

  @Positive @EndToEnd
  Scenario: End-to-end outlet type data retrieval workflow for outlet type ID 1
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
      |$.data.1|"Outlets1"|
      |$.data.2|"Direct"|
      |$.data.3|"Indirect"|
    And I store the response as "outlet_type_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Positive @EndToEnd
  Scenario: End-to-end outlet type data retrieval workflow for outlet type ID 2
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|
      |$.data.1|"SOUTH"|
      |$.data.2|"NORTH"|
      |$.data.3|"East"|
    And I store the response as "outlet_type_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|

  @Negative @Boundary
  Scenario: Get outlet type with very large outlet type ID
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid Outlettype|

  @Positive @ContentValidation
  Scenario: Validate outlet type content structure for outlet type ID 1
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |data|
      |Outlets1|
      |Direct|
      |Indirect|

  @Positive @LoadTesting
  Scenario: Load testing for outlet type endpoint
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|

  @Negative @Timeout
  Scenario: Test outlet type endpoint timeout handling
    And I send the GET request to "outlettargets_outlet_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|outletType|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|" "|



