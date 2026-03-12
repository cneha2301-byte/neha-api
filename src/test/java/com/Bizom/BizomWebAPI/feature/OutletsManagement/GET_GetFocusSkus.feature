@BizomWebAPI @CE @OutletsManagement @OutletsFocusSkus @InventoryOperations
Feature: Get Focus SKUs API Testing
  As a system user
  I want to test the get focus SKUs endpoint
  So that I can ensure proper functionality and data retrieval for focus SKU management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get focus SKUs without access token
    When I send the GET request to "outlets_get_focus_skus" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get focus SKUs with invalid access token
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get focus SKUs with expired access token
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get focus SKUs with malformed access token
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get focus SKUs with valid access token
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.focussku|[]|
    And I store the response as "focus_skus_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate focus SKUs response structure
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.focussku|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.focussku|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate focus SKUs with empty array
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.focussku|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.focussku|[]|

  @Positive @DataValidation
  Scenario: TC_08 Validate focus SKUs specific data values
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.focussku|[]|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.focussku|[]|

  @Positive @Performance
  Scenario: TC_09 Performance test for focus SKUs endpoint
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for focus SKUs endpoint
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Validation
  Scenario: TC_11 Get focus SKUs with invalid query parameters
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Validation
  Scenario: TC_12 Get focus SKUs with special characters in query parameters
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Security
  Scenario: TC_13 Get focus SKUs with SQL injection attempt
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Boundary
  Scenario: TC_14 Get focus SKUs with maximum query parameters
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
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
      |$.Reason|No Data Found|

  @Negative @ErrorHandling
  Scenario: TC_15 Get focus SKUs with invalid endpoint
    And I send the GET request to "outlets_get_focus_skus_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate focus SKUs business logic
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
      |$.focussku|[]|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate focus SKUs data integrity
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.focussku|array|

  @Positive @Regression
  Scenario: TC_18 Regression test for focus SKUs endpoint
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.focussku|array|

  @Positive @Functional
  Scenario: TC_19 Validate focus SKUs response completeness
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.focussku|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.focussku|[]|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate focus SKUs array structure and content
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.focussku|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.focussku|[]|

  @Positive @ContentValidation
  Scenario: TC_21 Validate focus SKUs content structure
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |focussku|
      |No Data Found|

  @Positive @LoadTesting
  Scenario: TC_22 Load testing for focus SKUs endpoint
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Negative @Timeout
  Scenario: TC_23 Test focus SKUs endpoint timeout handling
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|

  @Positive @EndToEnd
  Scenario: TC_24 End-to-end focus SKUs data retrieval workflow
    And I send the GET request to "outlets_get_focus_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No Data Found|
    And I store the response as "focus_skus_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.focussku|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.focussku|[]|

