@BizomWebAPI @PI @DiscountsManagement @DiscountsUpdateDiscountById @IntegrationServices
Feature: Discounts Update Discount By Id API Testing
  As a system user
  I want to test the discounts updateDiscountById endpoint with path parameters
  So that I can ensure proper functionality and dynamic path handling for discount IDs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Update discount by id without access token
    When I send the GET request to "discounts_updatediscountbyid" endpoint with path parameters
      |Path|Value|
      |discountId|1|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Update discount by id with invalid access token
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|discountId|1|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Update discount by id with expired access token
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|discountId|1|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Update discount by id with malformed access token
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|discountId|1|
    Then I should see the response code as "200"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @PathParam
  Scenario: TC_05 Update discount by id for discountId 1
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And I store the response as "discounts_updatediscountbyid_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate update discount by id response structure
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataValidation
  Scenario: TC_07 Validate update discount by id specific data values
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|

  @Positive @DataValidation
  Scenario: TC_08 Validate update discount by id with static values
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|

  @Positive @Performance
  Scenario: TC_09 Performance test for update discount by id endpoint
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|

  @Positive @Concurrency
  Scenario: TC_10 Concurrent access test for update discount by id endpoint
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|

  @Negative @Validation
  Scenario: TC_11 Update discount by id with invalid query parameters
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
      |invalid_param|invalid_value|        | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Update discount by id with special characters in query parameters
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
      |test_param|<script>alert('XSS')</script>|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Update discount by id with SQL injection attempt
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
      |test_param|'; DROP TABLE discounts; --|||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_14 Update discount by id with maximum query parameters
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
      |param1|value1|                      | |
      |param2|value2|                      | |
      |param3|value3|                      | |
      |param4|value4|                      | |
      |param5|value5|                      | |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_15 Update discount by id invalid endpoint with path param
    And I send the GET request to "discounts_updatediscountbyid_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate update discount by id business logic
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate update discount by id data integrity
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Regression
  Scenario: TC_18 Regression test for update discount by id endpoint
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Functional
  Scenario: TC_19 Validate update discount by id response completeness
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|

  @Positive @ContentValidation
  Scenario: TC_20 Validate update discount by id content structure
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Discount deleted|

  @Positive @LoadTesting
  Scenario: TC_21 Load testing for update discount by id endpoint
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: TC_22 Test update discount by id endpoint timeout handling
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: TC_23 End-to-end update discount by id data retrieval workflow
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And I store the response as "discounts_updatediscountbyid_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @DataHandling
  Scenario: TC_24 Validate update discount by id data handling
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @ResponseStructure
  Scenario: TC_25 Validate update discount by id response structure consistency
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Positive @Headers
  Scenario: TC_26 Validate update discount by id response headers
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage
  Scenario: TC_27 Store update discount by id response for further use
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|1|
    Then I should see the response code as "200"
    And I store the response as "discounts_updatediscountbyid_response" name using full path
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_28 Update discount by id with invalid discountId format
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_29 Update discount by id with non-existent discountId
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional @PathParam
  Scenario: TC_30 Update discount by id for different discountId values
    And I send the GET request to "discounts_updatediscountbyid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Discount deleted!"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|


