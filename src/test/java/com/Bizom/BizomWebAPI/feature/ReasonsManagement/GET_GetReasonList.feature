@BizomWebAPI @ReasonsManagement @Reasons @OrderManagement @OS
Feature: Get Reason List API Testing
  As a system user
  I want to test the get reason list endpoint
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
  Scenario: Get reason list without access token
    When I send the GET request to "reasons_get_reason_list" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get reason list with invalid access token
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
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
#  Scenario: Get reason list with expired access token
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
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
#  Scenario: Get reason list with malformed access token
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get reason list with valid access token
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And I store the response as "reason_list_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate reason list response structure
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|

#  @Positive @DataValidation
#  Scenario: Validate reason list data array structure
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].reasonId|string|
#      |$.data[0].reasonCategoryName|string|
#      |$.data[0].reason|string|
#      |$.data[0].reasonTypeId|string|
#      |$.data[0].reasonIsActive|string|
#      |$.data[0].reasonCategoryId|string|

#  @Positive @DataValidation
#  Scenario: Validate reason list specific data values
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[0].reason|DB:reasons:reason: id=1|
#      |$.data[1].reason|DB:reasons:reason: id=2|
#      |$.data[2].reason|DB:reasons:reason: id=3|
#
#  @Positive @DataValidation
#  Scenario: Validate reason list with static values
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].reasonId|"1"|
#      |$.data[0].reasonCategoryName|"delete_sale"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[1].reasonId|"2"|
#      |$.data[1].reasonCategoryName|"edit_sale"|
#      |$.data[1].reason|"Edit sale"|
#
#  @Positive @Performance
#  Scenario: Performance test for reason list endpoint
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#
#  @Positive @Concurrency
#  Scenario: Concurrent access test for reason list endpoint
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#
#  @Negative @Validation
#  Scenario: Get reason list with invalid query parameters
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#
#  @Negative @Validation
#  Scenario: Get reason list with special characters in query parameters
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|

#  @Negative @Security
#  Scenario: Get reason list with SQL injection attempt
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE reasons; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|

#  @Negative @Boundary
#  Scenario: Get reason list with maximum query parameters
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|

#  @Negative @ErrorHandling
#  Scenario: Get reason list with invalid endpoint
#    And I send the GET request to "reasons_get_reason_list_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

#  @Positive @BusinessLogic
#  Scenario: Validate reason list business logic
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data[0].reasonIsActive|string|
#      |$.data[0].reasonCategoryId|string|

#  @Positive @DataIntegrity
#  Scenario: Validate reason list data integrity
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|
#      |$.data[0].reasonId|string|
#      |$.data[0].reasonCategoryName|string|
#      |$.data[0].reason|string|
#      |$.data[0].reasonType|object|
#      |$.data[0].reasonTypeId|string|
#      |$.data[0].reasonTag|string|
#      |$.data[0].reasonIsActive|string|
#      |$.data[0].reasonCreated|string|
#      |$.data[0].reasonModified|string|
#      |$.data[0].reasonCategoryId|string|

#  @Positive @Regression
#  Scenario: Regression test for reason list endpoint
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|

#  @Positive @Functional
#  Scenario: Validate reason list response completeness
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].reasonId|"1"|
#      |$.data[0].reasonCategoryName|"delete_sale"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[1].reasonId|"2"|
#      |$.data[1].reasonCategoryName|"edit_sale"|
#      |$.data[1].reason|"Edit sale"|

#  @Positive @ArrayValidation
#  Scenario: Validate reason list array structure and content
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[1]|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].reasonId|"1"|
#      |$.data[0].reasonCategoryName|"delete_sale"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[1].reasonId|"2"|
#      |$.data[1].reasonCategoryName|"edit_sale"|
#      |$.data[1].reason|"Edit sale"|

#  @Positive @ContentValidation
#  Scenario: Validate reason list content structure
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response contains the following values
#      |Value|
#      |draw|
#      |recordsTotal|
#      |recordsFiltered|
#      |data|
#      |reasonId|
#      |reasonCategoryName|
#      |reason|
#      |reasonTypeId|
#      |reasonIsActive|

#  @Positive @LoadTesting
#  Scenario: Load testing for reason list endpoint
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|

#  @Negative @Timeout
#  Scenario: Test reason list endpoint timeout handling
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|

#  @Positive @EndToEnd
#  Scenario: End-to-end reason list data retrieval workflow
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And I store the response as "reason_list_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#      |$.data|array|
#      |$.data[0].reasonId|string|
#      |$.data[0].reasonCategoryName|string|
#      |$.data[0].reason|string|
#      |$.data[0].reasonTypeId|string|
#      |$.data[0].reasonIsActive|string|
#      |$.data[0].reasonCategoryId|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].reasonId|"1"|
#      |$.data[0].reasonCategoryName|"delete_sale"|
#      |$.data[0].reason|"Delete sale"|
#      |$.data[1].reasonId|"2"|
#      |$.data[1].reasonCategoryName|"edit_sale"|
#      |$.data[1].reason|"Edit sale"|

#  @Positive @PaginationValidation
#  Scenario: Validate reason list pagination metadata
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.draw|string|
#      |$.recordsTotal|string|
#      |$.recordsFiltered|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.recordsTotal|$.recordsFiltered|

#  @Positive @CategoryValidation
#  Scenario: Validate reason list category data
#    And I send the GET request to "reasons_get_reason_list" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.draw|"0"|
#      |$.recordsTotal|"34"|
#      |$.recordsFiltered|"34"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data[0].reasonCategoryName|string|
#      |$.data[0].reasonCategoryId|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data[0].reasonCategoryName|"delete_sale"|
#      |$.data[0].reasonCategoryId|"1"|
#      |$.data[3].reasonCategoryName|"sale_return"|
#      |$.data[3].reasonCategoryId|"4"|

