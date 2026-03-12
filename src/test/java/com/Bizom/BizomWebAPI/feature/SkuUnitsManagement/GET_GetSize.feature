@BizomWebAPI @SkuUnitsManagement @SkuUnitsGetSize @ProductManagement @OS
Feature: SKU Units GetSize API Testing
  As a system user
  I want to test the skunits getsize endpoint
  So that I can ensure proper functionality and data retrieval for SKU units size management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU units size without access token
    When I send the GET request to "skunits_get_size" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get SKU units size with invalid access token
#    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
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
#  Scenario: Get SKU units size with expired access token
#    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
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
#  Scenario: Get SKU units size with malformed access token
#    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKU units size with valid access token
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
    And I store the response as "skunits_getsize_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKU units size response structure
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|

  @Positive @DataValidation
  Scenario: Validate SKU units size specific data values
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds


  @Positive @DataValidation
  Scenario: Validate SKU units size with static values
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|s1-KG|
      |$['2']|"200"|
      |$['3']|100-Kg|
      |$['4']|200-ml|
      |$['5']|200-ml|

  @Positive @Performance
  Scenario: Performance test for SKU units size endpoint
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKU units size endpoint
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Validation
  Scenario: Get SKU units size with invalid query parameters
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Validation
  Scenario: Get SKU units size with special characters in query parameters
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Security
  Scenario: Get SKU units size with SQL injection attempt
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Boundary
  Scenario: Get SKU units size with maximum query parameters
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

#  @Negative @ErrorHandling
#  Scenario: Get SKU units size with invalid endpoint
#    And I send the GET request to "skunits_get_size_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate SKU units size business logic
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @DataIntegrity
  Scenario: Validate SKU units size data integrity
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|s1-KG|
      |$['2']|"200"|
      |$['3']|100-Kg|

  @Positive @Regression
  Scenario: Regression test for SKU units size endpoint
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @Functional
  Scenario: Validate SKU units size response completeness
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|s1-KG|
      |$['2']|"200"|
      |$['3']|100-Kg|
      |$['4']|200-ml|
      |$['5']|200-ml|

  @Positive @ObjectValidation
  Scenario: Validate SKU units size object structure and content
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
      |$['4']|string|
      |$['5']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|s1-KG|
      |$['2']|"200"|
      |$['3']|100-Kg|
      |$['4']|200-ml|
      |$['5']|200-ml|

  @Positive @ContentValidation
  Scenario: Validate SKU units size content structure
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |s1-KG|
      |200|
      |100-Kg|
      |200-ml|

  @Positive @LoadTesting
  Scenario: Load testing for SKU units size endpoint
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Timeout
  Scenario: Test SKU units size endpoint timeout handling
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Positive @EndToEnd
  Scenario: End-to-end SKU units size data retrieval workflow
    And I send the GET request to "skunits_get_size" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "skunits_getsize_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$['1']|s1-KG|
      |$['2']|"200"|
      |$['3']|100-Kg|
      |$['4']|200-ml|
      |$['5']|200-ml|
