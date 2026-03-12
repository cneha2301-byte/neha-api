@BizomWebAPI @PI @SchemesManagement @GetForskusForSchemes @PaymentProcessing
Feature: Get SKUs for Schemes API Testing
  As a system user
  I want to test the get SKUs for schemes endpoint
  So that I can ensure proper functionality and data retrieval for SKUs associated with schemes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKUs for schemes without access token
    When I send the GET request to "schemes_get_forskus_for_schemes" endpoint with path parameters
      |Path|Value|
      |schemeId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get SKUs for schemes with invalid access token
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|schemeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get SKUs for schemes with expired access token
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|schemeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get SKUs for schemes with malformed access token
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|schemeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get SKUs for scheme ID 1 with valid access token
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|
    And I store the response as "forskus_for_scheme_1_response" name using full path

  @Positive @Functional
  Scenario: Get SKUs for scheme ID 4 with valid access token
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|
      |$.forskus[1]|object|
      |$.forskus[1].id|string|
      |$.forskus[1].name|string|
    And I store the response as "forskus_for_scheme_4_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKUs for schemes response structure with scheme ID 1
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|

  @Positive @DataValidation
  Scenario: Validate SKUs for schemes response structure with scheme ID 4
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|

  @Positive @ForskusArrayValidation
  Scenario: Validate forskus array structure with multiple SKUs
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|
      |$.forskus[1]|object|
      |$.forskus[1].id|string|
      |$.forskus[1].name|string|
      |$.forskus[2]|object|
      |$.forskus[2].id|string|
      |$.forskus[2].name|string|

  # @Negative @Validation
  # Scenario: Get SKUs for schemes with invalid scheme ID
    # And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|schemeId|abc|
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.result|boolean|
      # |$.error|object|

  @Negative @Validation
  Scenario: Get SKUs for schemes with wrong scheme ID
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error.message|No data found|

  # @Negative @Validation
  # Scenario: Get SKUs for schemes with non-existent scheme ID
    # And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|schemeId|0|
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.result|boolean|
      # |$.error|object|

  # @Negative @ErrorHandling
  # Scenario: Get SKUs for schemes with invalid endpoint
    # And I send the GET request to "schemes_get_forskus_for_schemes_invalid" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|schemeId|1|
    # Then I should see the response code as "404"
    # And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for SKUs for schemes endpoint
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for SKUs for schemes endpoint
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|

  @Positive @BusinessLogic
  Scenario: Validate SKUs for schemes business logic with scheme ID 1
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|

  @Positive @BusinessLogic
  Scenario: Validate SKUs for schemes business logic with scheme ID 4
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|

  @Positive @DataIntegrity
  Scenario: Validate SKUs for schemes data integrity
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|

  @Positive @Regression
  Scenario: Regression test for SKUs for schemes endpoint
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|

  @Positive @Functional
  Scenario: Validate SKUs for schemes response completeness with scheme ID 1
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|

  @Positive @Functional
  Scenario: Validate SKUs for schemes response completeness with scheme ID 4
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|

  @Positive @ErrorArrayValidation
  Scenario: Validate error array is empty for valid scheme ID
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.error|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.error|array|

  @Positive @ErrorObjectValidation
  Scenario: Validate error object structure for invalid scheme ID
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.message|No data found|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|

  @Positive @ResultFieldValidation
  Scenario: Validate result field for valid scheme ID
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @ResultFieldValidation
  Scenario: Validate result field for invalid scheme ID
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

  @Positive @ForskusObjectValidation
  Scenario: Validate forskus object structure with id and name fields
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|

  @Positive @LoadTesting
  Scenario: Load testing for SKUs for schemes endpoint
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|

  @Negative @Timeout
  Scenario: Test SKUs for schemes endpoint timeout handling
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|

  @Positive @EndToEnd
  Scenario: End-to-end SKUs for schemes data retrieval workflow with scheme ID 1
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I store the response as "forskus_for_scheme_1_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|

  @Positive @EndToEnd
  Scenario: End-to-end SKUs for schemes data retrieval workflow with scheme ID 4
    And I send the GET request to "schemes_get_forskus_for_schemes" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|schemeId|4|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.error|[]|
    And I store the response as "forskus_for_scheme_4_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|array|
      |$.forskus|array|
      |$.forskus[0]|object|
      |$.forskus[0].id|string|
      |$.forskus[0].name|string|


