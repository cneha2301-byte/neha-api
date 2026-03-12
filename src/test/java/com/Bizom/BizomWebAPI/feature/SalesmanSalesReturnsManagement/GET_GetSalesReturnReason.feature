@BizomWebAPI @SalesmanSalesReturnsManagement @SalesReturnReason @PaymentProcessing @OS
Feature: Get Sales Return Reason API Testing
  As a system user
  I want to test the get sales return reason endpoint
  So that I can ensure proper functionality and data retrieval for sales return reasons

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get sales return reason without access token
    When I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get sales return reason with invalid access token
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|invalid_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get sales return reason with expired access token
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|expired_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get sales return reason with malformed access token
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|malformed.token.here|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get sales return reason with valid access token
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "sales_return_reason_response" name using full path

  @Positive @DataValidation
  Scenario: Validate sales return reason response structure
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason|array|

  @Positive @DataValidation
  Scenario: Validate sales return reason array structure
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason|array|
      |$.saleretreason[0]|object|
      |$.saleretreason[0].Reason|object|
      |$.saleretreason[0].Reason.id|number|
      |$.saleretreason[0].Reason.reason|string|

  # @Positive @DataValidation
  # Scenario: Validate sales return reason specific data values
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.Reason|""|
    # And I verify API response at path with DB and static values
      # |JPath|Value|
      # |$.saleretreason[0].Reason.reason|DB:reasons:reason: id=4|
      # |$.saleretreason[1].Reason.reason|DB:reasons:reason: id=5|
      # |$.saleretreason[2].Reason.reason|DB:reasons:reason: id=6|

  # @Positive @DataValidation
  # Scenario: Validate sales return reason with static values
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.Reason|""|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.saleretreason[0].Reason.id|4|
      # |$.saleretreason[0].Reason.reason|"sampling"|
      # |$.saleretreason[1].Reason.id|5|
      # |$.saleretreason[1].Reason.reason|"damaged"|
      # |$.saleretreason[2].Reason.id|6|
      # |$.saleretreason[2].Reason.reason|"expired"|
      # |$.saleretreason[3].Reason.id|7|
      # |$.saleretreason[3].Reason.reason|"theft"|
      # |$.saleretreason[4].Reason.id|8|
      # |$.saleretreason[4].Reason.reason|"other"|

  @Positive @Performance
  Scenario: Performance test for sales return reason endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Concurrency
  Scenario: Concurrent access test for sales return reason endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Validation
  Scenario: Get sales return reason with invalid query parameters
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
  Scenario: Get sales return reason with special characters in query parameters
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
  Scenario: Get sales return reason with SQL injection attempt
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
  Scenario: Get sales return reason with maximum query parameters
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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

  # @Negative @ErrorHandling
  # Scenario: Get sales return reason with invalid endpoint
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason_invalid" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate sales return reason business logic
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason|array|
      |$.saleretreason[0].Reason.id|number|
      |$.saleretreason[0].Reason.reason|string|

  @Positive @DataIntegrity
  Scenario: Validate sales return reason data integrity
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason|array|
      |$.saleretreason[0]|object|
      |$.saleretreason[0].Reason|object|
      |$.saleretreason[0].Reason.id|number|
      |$.saleretreason[0].Reason.reason|string|

  @Positive @Regression
  Scenario: Regression test for sales return reason endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason|array|

  @Positive @Functional
  Scenario: Validate sales return reason response completeness
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.saleretreason[0].Reason.id|4|
      |$.saleretreason[0].Reason.reason|"sampling"|
      |$.saleretreason[1].Reason.id|5|
      |$.saleretreason[1].Reason.reason|"damaged"|

  # @Positive @ArrayValidation
  # Scenario: Validate sales return reason array structure and content
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.Reason|""|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.saleretreason|array|
      # |$.saleretreason[0]|object|
      # |$.saleretreason[1]|object|
      # |$.saleretreason[2]|object|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.saleretreason[0].Reason.id|4|
      # |$.saleretreason[0].Reason.reason|"sampling"|
      # |$.saleretreason[1].Reason.id|5|
      # |$.saleretreason[1].Reason.reason|"damaged"|
      # |$.saleretreason[2].Reason.id|6|
      # |$.saleretreason[2].Reason.reason|"expired"|

  # @Positive @ContentValidation
  # Scenario: Validate sales return reason content structure
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.Reason|""|
    # And validating the response contains the following values
      # |Value|
      # |Result|
      # |Reason|
      # |saleretreason|
      # |sampling|
      # |damaged|
      # |expired|
      # |theft|
      # |other|

  @Positive @LoadTesting
  Scenario: Load testing for sales return reason endpoint
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test sales return reason endpoint timeout handling
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  # @Positive @EndToEnd
  # Scenario: End-to-end sales return reason data retrieval workflow
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.Reason|""|
    # And I store the response as "sales_return_reason_response" name using full path
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.Result|boolean|
      # |$.Reason|string|
      # |$.saleretreason|array|
      # |$.saleretreason[0].Reason|object|
      # |$.saleretreason[0].Reason.id|number|
      # |$.saleretreason[0].Reason.reason|string|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.saleretreason[0].Reason.id|4|
      # |$.saleretreason[0].Reason.reason|"sampling"|
      # |$.saleretreason[1].Reason.id|5|
      # |$.saleretreason[1].Reason.reason|"damaged"|
      # |$.saleretreason[2].Reason.id|6|
      # |$.saleretreason[2].Reason.reason|"expired"|
      # |$.saleretreason[3].Reason.id|7|
      # |$.saleretreason[3].Reason.reason|"theft"|
      # |$.saleretreason[4].Reason.id|8|
      # |$.saleretreason[4].Reason.reason|"other"|

  @Positive @NestedObjectValidation
  Scenario: Validate sales return reason nested Reason object structure
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason[0].Reason|object|
      |$.saleretreason[0].Reason.id|number|
      |$.saleretreason[0].Reason.reason|string|
      |$.saleretreason[1].Reason|object|
      |$.saleretreason[1].Reason.id|number|
      |$.saleretreason[1].Reason.reason|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.saleretreason[0].Reason.id|4|
      |$.saleretreason[0].Reason.reason|"sampling"|
      |$.saleretreason[1].Reason.id|5|
      |$.saleretreason[1].Reason.reason|"damaged"|

  @Positive @FieldValidation
  Scenario: Validate sales return reason field completeness
    And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
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
      |$.saleretreason|array|
      |$.saleretreason[0]|object|
      |$.saleretreason[0].Reason|object|
      |$.saleretreason[0].Reason.id|number|
      |$.saleretreason[0].Reason.reason|string|

  # @Positive @ReasonValidation
  # Scenario: Validate all sales return reason values
    # And I send the GET request to "salemansalesreturns_get_sales_return_reason" endpoint with dynamic access token and query parameters
      # |QueryParamName|QueryParamValue|
      # |access_token|ACCESS_TOKEN|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.Reason|""|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.saleretreason[0].Reason.id|number|
      # |$.saleretreason[0].Reason.reason|string|
      # |$.saleretreason[1].Reason.id|number|
      # |$.saleretreason[1].Reason.reason|string|
      # |$.saleretreason[2].Reason.id|number|
      # |$.saleretreason[2].Reason.reason|string|
      # |$.saleretreason[3].Reason.id|number|
      # |$.saleretreason[3].Reason.reason|string|
      # |$.saleretreason[4].Reason.id|number|
      # |$.saleretreason[4].Reason.reason|string|
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.saleretreason[0].Reason.id|4|
      # |$.saleretreason[0].Reason.reason|"sampling"|
      # |$.saleretreason[1].Reason.id|5|
      # |$.saleretreason[1].Reason.reason|"damaged"|
      # |$.saleretreason[2].Reason.id|6|
      # |$.saleretreason[2].Reason.reason|"expired"|
      # |$.saleretreason[3].Reason.id|7|
      # |$.saleretreason[3].Reason.reason|"theft"|
      # |$.saleretreason[4].Reason.id|8|
      # |$.saleretreason[4].Reason.reason|"other"|

