@BizomWebAPI @PI @SchemesManagement @GetQpsSchemes @PaymentProcessing
Feature: Get QPS Schemes API Testing
  As a system user
  I want to test the get QPS schemes endpoint
  So that I can ensure proper functionality and data retrieval for QPS schemes

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get QPS schemes without access token
    When I send the GET request to "schemes_get_qps_schemes" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  # @Negative @Security
  # Scenario: Get QPS schemes with invalid access token
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |invalid_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2000" milliseconds

  # @Negative @Security
  # Scenario: Get QPS schemes with expired access token
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |expired_token_12345|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2000" milliseconds

  # @Negative @Security
  # Scenario: Get QPS schemes with malformed access token
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |malformed.token.here|
    # Then I should see the response code as "200"
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|false|
      # |$.error.code|401|
      # |$.error.message|Invalid Access Token or Credentials|
    # And verify response time is less than "2000" milliseconds

  # @Positive @Smoke
  # Scenario: Get QPS schemes with valid access token
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
      # |$.reason|""|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.result|boolean|
      # |$.reason|string|
      # |$.data|object|

  # @Positive @Functional
  # Scenario: Get QPS schemes and validate response structure
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
      # |$.reason|""|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.result|boolean|
      # |$.reason|string|
      # |$.data|object|

  # @Positive @DataValidation
  # Scenario: Validate QPS schemes data structure
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data|object|
      # |$.data.*|object|
      # |$.data.*.schemegroup_id|string|
      # |$.data.*.name|string|
      # |$.data.*.startdatetime|string|
      # |$.data.*.enddatetime|string|
      # |$.data.*.slabs|array|
      # |$.data.*.for_skunits|array|

  # @Positive @DataValidation
  # Scenario: Validate QPS schemes slabs structure
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.*.slabs[0]|object|
      # |$.data.*.slabs[0].forquantity|string|
      # |$.data.*.slabs[0].foramount|string|
      # |$.data.*.slabs[0].schemetype|string|
      # |$.data.*.slabs[0].type|string|
      # |$.data.*.slabs[0].type_value|string|
      # |$.data.*.slabs[0].scheme_id|string|

  # @Positive @DataValidation
  # Scenario: Validate QPS schemes for_skunits structure
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.*.for_skunits[0]|object|
      # |$.data.*.for_skunits[0].skunitId|string|
      # |$.data.*.for_skunits[0].skunitName|string|

  # @Positive @DataValidation
  # Scenario: Validate QPS schemes complete data structure
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
      # |$.reason|""|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.result|boolean|
      # |$.reason|string|
      # |$.data|object|
      # |$.data.*.schemegroup_id|string|
      # |$.data.*.name|string|
      # |$.data.*.startdatetime|string|
      # |$.data.*.enddatetime|string|
      # |$.data.*.slabs|array|
      # |$.data.*.slabs[0].forquantity|string|
      # |$.data.*.slabs[0].foramount|string|
      # |$.data.*.slabs[0].schemetype|string|
      # |$.data.*.slabs[0].type|string|
      # |$.data.*.slabs[0].type_value|string|
      # |$.data.*.slabs[0].scheme_id|string|
      # |$.data.*.for_skunits|array|
      # |$.data.*.for_skunits[0].skunitId|string|
      # |$.data.*.for_skunits[0].skunitName|string|

  # @Negative @ErrorHandling
  # Scenario: Get QPS schemes with invalid endpoint
    # And I send the GET request to "schemes_get_qps_schemes_invalid" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "404"
    # And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get QPS schemes endpoint
    And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  # @Positive @Regression
  # Scenario: Regression test for get QPS schemes endpoint
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
      # |$.reason|""|

  # @Positive @EndToEnd
  # Scenario: End-to-end get QPS schemes data retrieval workflow
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
      # |$.reason|""|
    # And I store the response as "get_qps_schemes_response" name using full path
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.result|boolean|
      # |$.reason|string|
      # |$.data|object|
      # |$.data.*|object|
      # |$.data.*.schemegroup_id|string|
      # |$.data.*.name|string|
      # |$.data.*.slabs|array|
      # |$.data.*.for_skunits|array|

  # @Positive @DataValidation
  # Scenario: Validate QPS schemes with cash scheme type
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.*.slabs[?(@.schemetype == 'cash')]|array|
      # |$.data.*.slabs[?(@.schemetype == 'cash')].foramount|string|
      # |$.data.*.slabs[?(@.schemetype == 'cash')].type_value|string|

  # @Positive @DataValidation
  # Scenario: Validate QPS schemes with SKU scheme type
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.*.slabs[?(@.schemetype == 'sku')]|array|
      # |$.data.*.slabs[?(@.schemetype == 'sku')].forquantity|string|
      # |$.data.*.slabs[?(@.schemetype == 'sku')].type_value|string|

  # @Positive @DataValidation
  # Scenario: Validate QPS schemes datetime format
    # And I send the GET request to "schemes_get_qps_schemes" endpoint with dynamic access token and query parameters
      # |Query         |Value         |
      # |access_token  |ACCESS_TOKEN  |
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.result|true|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.*.startdatetime|string|
      # |$.data.*.enddatetime|string|

