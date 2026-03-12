@BizomWebAPI @ReasonsManagement @Reasons @OrderManagement @OS
Feature: Get Reasons API Testing
  As a system user
  I want to test the get reasons endpoint
  So that I can ensure proper functionality and data retrieval for reasons management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get reasons without access token
    When I send the GET request to "reasons_get_reasons" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get reasons with invalid access token
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get reasons with expired access token
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get reasons with malformed access token
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get reasons with valid access token
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "reasons_response" name using full path

  @Positive @DataValidation
  Scenario: Validate reasons response structure
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
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
      |$.data|array|

  @Positive @DataValidation
  Scenario: Validate reasons data array structure
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0]|object|
      |$.data[0].id|string|
      |$.data[0].reasoncategory_id|string|
      |$.data[0].reason|string|
      |$.data[0].Tag|string|
      |$.data[0].is_active|string|
      |$.data[0].category_name|string|
      |$.data[0].category_active|string|

  @Positive @DataValidation
  Scenario: Validate reasons specific data values
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data[0].reason|DB:reasons:reason: id=1|
      |$.data[1].reason|DB:reasons:reason: id=2|
      |$.data[2].reason|DB:reasons:reason: id=3|

#  @Positive @DataValidation
#  Scenario: Validate reasons with static values
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].reasoncategory_id|"1"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[0].category_name|"delete_sale"|
#      |$.data[1].id|"2"|
#      |$.data[1].reasoncategory_id|"2"|
#      |$.data[1].reason|"Edit sale"|
#      |$.data[1].category_name|"edit_sale"|

  @Positive @Performance
  Scenario: Performance test for reasons endpoint
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for reasons endpoint
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get reasons with invalid query parameters
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get reasons with special characters in query parameters
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Security
  Scenario: Get reasons with SQL injection attempt
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE reasons; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Boundary
  Scenario: Get reasons with maximum query parameters
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
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
      |$.Reason|""|

#  @Negative @ErrorHandling
#  Scenario: Get reasons with invalid endpoint
#    And I send the GET request to "reasons_get_reasons_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate reasons business logic
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].is_active|string|
      |$.data[0].category_active|string|
      |$.data[0].is_claimable|string|

#  @Positive @DataIntegrity
#  Scenario: Validate reasons data integrity
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
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
#      |$.data|array|
#      |$.data[0].id|string|
#      |$.data[0].reasoncategory_id|string|
#      |$.data[0].reason|string|
#      |$.data[0].Tag|string|
#      |$.data[0].is_active|string|
#      |$.data[0].created|string|
#      |$.data[0].modified|string|
#      |$.data[0].reasontype|object|
#      |$.data[0].reasontype_id|string|
#      |$.data[0].erp_id|object|
#      |$.data[0].is_claimable|string|
#      |$.data[0].is_salereturn_invoice_no|string|
#      |$.data[0].autoapprove_wo_invoice|string|
#      |$.data[0].category_name|string|
#      |$.data[0].category_active|string|
#      |$.data[0].TAG|string|

  @Positive @Regression
  Scenario: Regression test for reasons endpoint
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
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
      |$.data|array|

#  @Positive @Functional
#  Scenario: Validate reasons response completeness
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].reasoncategory_id|"1"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[0].category_name|"delete_sale"|
#      |$.data[1].id|"2"|
#      |$.data[1].reasoncategory_id|"2"|
#      |$.data[1].reason|"Edit sale"|
#      |$.data[1].category_name|"edit_sale"|

#  @Positive @ArrayValidation
#  Scenario: Validate reasons array structure and content
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[1]|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].reasoncategory_id|"1"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[0].category_name|"delete_sale"|
#      |$.data[1].id|"2"|
#      |$.data[1].reasoncategory_id|"2"|
#      |$.data[1].reason|"Edit sale"|
#      |$.data[1].category_name|"edit_sale"|

#  @Positive @ContentValidation
#  Scenario: Validate reasons content structure
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |data|
#      |id|
#      |reasoncategory_id|
#      |reason|
#      |Tag|
#      |is_active|
#      |category_name|
#      |category_active|

  @Positive @LoadTesting
  Scenario: Load testing for reasons endpoint
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test reasons endpoint timeout handling
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @EndToEnd
#  Scenario: End-to-end reasons data retrieval workflow
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "reasons_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.data[0].id|string|
#      |$.data[0].reasoncategory_id|string|
#      |$.data[0].reason|string|
#      |$.data[0].Tag|string|
#      |$.data[0].is_active|string|
#      |$.data[0].category_name|string|
#      |$.data[0].category_active|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].id|"1"|
#      |$.data[0].reasoncategory_id|"1"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[0].category_name|"delete_sale"|
#      |$.data[1].id|"2"|
#      |$.data[1].reasoncategory_id|"2"|
#      |$.data[1].reason|"Edit sale"|
#      |$.data[1].category_name|"edit_sale"|

#  @Positive @CategoryValidation
#  Scenario: Validate reasons category data
#    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data[0].reasoncategory_id|string|
#      |$.data[0].category_name|string|
#      |$.data[0].category_active|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].reasoncategory_id|"1"|
#      |$.data[0].category_name|"delete_sale"|
#      |$.data[0].category_active|"1"|
#      |$.data[3].reasoncategory_id|"4"|
#      |$.data[3].category_name|"sale_return"|
#      |$.data[3].category_active|"1"|

  @Positive @FieldValidation
  Scenario: Validate reasons field completeness
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].id|string|
      |$.data[0].reasoncategory_id|string|
      |$.data[0].reason|string|
      |$.data[0].Tag|string|
      |$.data[0].is_active|string|
      |$.data[0].created|string|
      |$.data[0].modified|string|
      |$.data[0].reasontype_id|string|
      |$.data[0].is_claimable|string|
      |$.data[0].is_salereturn_invoice_no|string|
      |$.data[0].autoapprove_wo_invoice|string|
      |$.data[0].TAG|string|

  @Positive @ActiveStatusValidation
  Scenario: Validate reasons active status
    And I send the GET request to "reasons_get_reasons" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data[0].is_active|string|
      |$.data[0].category_active|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data[0].is_active|"1"|
      |$.data[0].category_active|"1"|

