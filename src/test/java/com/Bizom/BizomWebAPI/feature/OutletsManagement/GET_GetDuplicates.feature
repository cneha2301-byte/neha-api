@BizomWebAPI @CE @OutletsManagement @OutletsDuplicates @InventoryOperations
Feature: Get Duplicates API Testing
  As a system user
  I want to test the get duplicates endpoint
  So that I can ensure proper functionality and data retrieval for duplicate outlet detection

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get duplicates without access token
    When I send the GET request to "outlets_get_duplicates" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get duplicates with invalid access token
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get duplicates with expired access token
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get duplicates with malformed access token
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get duplicates with valid access token
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And I store the response as "duplicates_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate duplicates response structure
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data.duplicates|array|
      |$.Data.outletInfo|array|
      |$.Data.outletStatus|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate duplicates response with empty arrays
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.duplicates|array|
      |$.Data.outletInfo|array|
      |$.Data.outletStatus|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.duplicates|[]|
      |$.Data.outletInfo|[]|
      |$.Data.outletStatus|[]|

  @Positive @Performance
  Scenario: TC_08 Performance test for duplicates endpoint
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for duplicates endpoint
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Negative @Validation
  Scenario: TC_10 Get duplicates with invalid query parameters
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Negative @Validation
  Scenario: TC_11 Get duplicates with special characters in query parameters
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Negative @Security
  Scenario: TC_12 Get duplicates with SQL injection attempt
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Negative @Boundary
  Scenario: TC_13 Get duplicates with maximum query parameters
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
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
      |$.Reason|No duplicates found.|

#  @Negative @ErrorHandling
#  Scenario: TC_14 Get duplicates with invalid endpoint
#    And I send the GET request to "outlets_get_duplicates_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_15 Validate duplicates business logic
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate duplicates data integrity
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.duplicates|array|
      |$.Data.outletInfo|array|
      |$.Data.outletStatus|array|

  @Positive @Regression
  Scenario: TC_17 Regression test for duplicates endpoint
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.duplicates|array|

  @Positive @Functional
  Scenario: TC_18 Validate duplicates response completeness
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data.duplicates|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.duplicates|[]|
      |$.Data.outletInfo|[]|
      |$.Data.outletStatus|[]|

  @Positive @ContentValidation
  Scenario: TC_19 Validate duplicates content structure
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |duplicates|
      |outletInfo|
      |outletStatus|
      |No duplicates found.|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for duplicates endpoint
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Negative @Timeout
  Scenario: TC_21 Test duplicates endpoint timeout handling
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end duplicates data retrieval workflow
    And I send the GET request to "outlets_get_duplicates" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|No duplicates found.|
    And I store the response as "duplicates_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.duplicates|array|
      |$.Data.outletInfo|array|
      |$.Data.outletStatus|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.duplicates|[]|
      |$.Data.outletInfo|[]|
      |$.Data.outletStatus|[]|

