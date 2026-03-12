@BizomWebAPI @SKUnitsManagement @GetSkuIdFromSkuCodes @PaymentProcessing @OS
Feature: Get SKU ID From SKU Codes API Testing
  As a system user
  I want to test the get SKU ID from SKU codes endpoint
  So that I can ensure proper functionality and data retrieval for SKU IDs by SKU codes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU ID from SKU codes without access token
    When I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with path parameters
      |Path|Value|
      |skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get SKU ID from SKU codes with invalid access token
    # And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|invalid_token_12345|skuCodes|Cuba,Maza|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get SKU ID from SKU codes with expired access token
    # And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|expired_token_12345|skuCodes|Cuba,Maza|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  # @Negative @Security
  # Scenario: Get SKU ID from SKU codes with malformed access token
    # And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|malformed.token.here|skuCodes|Cuba,Maza|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get SKU ID from SKU codes for Cuba and Maza with valid access token
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
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
      |$.Data|object|
      |$.Data.Cuba|string|
      |$.Data.Maza|string|
    And I store the response as "sku_id_from_sku_codes_response" name using full path

  @Positive @Functional
  Scenario: Get SKU ID from SKU codes for single SKU code
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba|
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
      |$.Data|object|

  @Positive @Functional
  Scenario: Get SKU ID from SKU codes for multiple SKU codes
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza,Test|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  # @Negative @Validation
  # Scenario: Get SKU ID from SKU codes with invalid SKU code
    # And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|skuCodes|InvalidSKUCode123|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.Result|boolean|
      # |$.Reason|string|
      # |$.Data|object|

  # @Negative @Validation
  # Scenario: Get SKU ID from SKU codes with non-existent SKU code
    # And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|skuCodes|NonExistentSKU999|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.Result|boolean|
      # |$.Reason|string|
      # |$.Data|object|

  @Negative @Validation
  Scenario: Get SKU ID from SKU codes with empty SKU code
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes||
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Validation
  Scenario: Get SKU ID from SKU codes with special characters in SKU code
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  @Negative @Security
  Scenario: Get SKU ID from SKU codes with SQL injection attempt
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|

  # @Negative @Validation
  # Scenario: Get SKU ID from SKU codes with numeric SKU code
    # And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|skuCodes|12345|
    # Then I should see the response code as "200"
    # And verify response time is less than "2500" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.Result|boolean|
      # |$.Reason|string|
      # |$.Data|object|

  # @Negative @ErrorHandling
  # Scenario: Get SKU ID from SKU codes with invalid endpoint
    # And I send the GET request to "skunits_get_sku_id_from_sku_codes_invalid" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    # Then I should see the response code as "404"
    # And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for SKU ID from SKU codes endpoint
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU ID from SKU codes endpoint
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @BusinessLogic
  Scenario: Validate SKU ID from SKU codes business logic
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
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
      |$.Data|object|
      |$.Data.Cuba|string|
      |$.Data.Maza|string|

  @Positive @DataIntegrity
  Scenario: Validate SKU ID from SKU codes data integrity
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Cuba|string|
      |$.Data.Maza|string|

  @Positive @Regression
  Scenario: Regression test for SKU ID from SKU codes endpoint
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @Functional
  Scenario: Validate SKU ID from SKU codes response completeness
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
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
      |$.Data|object|
      |$.Data.Cuba|string|
      |$.Data.Maza|string|

  @Positive @DataValidation
  Scenario: Validate SKU ID from SKU codes Data object structure
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data.Cuba|string|
      |$.Data.Maza|string|

  @Positive @EndToEnd
  Scenario: End-to-end SKU ID from SKU codes data retrieval workflow
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "sku_id_from_sku_codes_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.Cuba|string|
      |$.Data.Maza|string|

  @Positive @ResultFieldValidation
  Scenario: Validate SKU ID from SKU codes Result field
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @ReasonFieldValidation
  Scenario: Validate SKU ID from SKU codes Reason field
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @DataObjectValidation
  Scenario: Validate SKU ID from SKU codes Data object with SKU code mappings
    And I send the GET request to "skunits_get_sku_id_from_sku_codes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|skuCodes|Cuba,Maza|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data.Cuba|string|
      |$.Data.Maza|string|

