@BizomWebAPI @PI @SchemesManagement @GetDistWareOfZone @PaymentProcessing
Feature: Get Distributors and Warehouses of Zone API Testing
  As a system user
  I want to test the get distributors and warehouses of zone endpoint
  So that I can ensure proper functionality and data retrieval for zone-based warehouses and distributors

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get distributors and warehouses of zone without access token
    When I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with path parameters
      |Path|Value|
      |zoneId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get distributors and warehouses of zone with invalid access token
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|zoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get distributors and warehouses of zone with expired access token
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|zoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get distributors and warehouses of zone with malformed access token
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|zoneId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get distributors and warehouses of zone with valid zone ID 1
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.warehouses|array|
      |$.data.distributors|array|

  @Positive @Functional
  Scenario: Get distributors and warehouses of zone with valid zone ID 2
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.warehouses|array|
      |$.data.distributors|array|

  @Negative @Validation
  Scenario: Get distributors and warehouses of zone with blank zone ID
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid zoneId"|

  @Negative @Validation
  Scenario: Get distributors and warehouses of zone with invalid zone ID
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
      |$.data.warehouses|[]|
      |$.data.distributors|[]|

  @Negative @Validation
  Scenario: Get distributors and warehouses of zone with non-numeric zone ID
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get distributors and warehouses of zone with negative zone ID
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get distributors and warehouses of zone with zero zone ID
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  # @Negative @ErrorHandling
  # Scenario: Get distributors and warehouses of zone with invalid endpoint
    # And I send the GET request to "schemes_get_dist_ware_of_zone_invalid" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|zoneId|1|
    # Then I should see the response code as "404"
    # And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get distributors and warehouses of zone endpoint
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get distributors and warehouses of zone endpoint
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|

  @Positive @DataValidation
  Scenario: Validate warehouses array structure for zone ID 1
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.warehouses|array|
      |$.data.warehouses[0]|object|
      |$.data.warehouses[0].Warehouse|object|
      |$.data.warehouses[0].Warehouse.id|string|
      |$.data.warehouses[0].Warehouse.name|string|
      |$.data.warehouses[0].Warehouse.erp_id|string|

  @Positive @DataValidation
  Scenario: Validate distributors array structure for zone ID 1
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.distributors|array|
      |$.data.distributors[0]|object|
      |$.data.distributors[0].Warehouse|object|
      |$.data.distributors[0].Warehouse.id|string|
      |$.data.distributors[0].Warehouse.name|string|
      |$.data.distributors[0].Warehouse.erp_id|string|

  @Positive @DataValidation
  Scenario: Validate complete response structure for zone ID 2
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.warehouses|array|
      |$.data.warehouses[0].Warehouse.id|string|
      |$.data.warehouses[0].Warehouse.name|string|
      |$.data.warehouses[0].Warehouse.erp_id|string|
      |$.data.distributors|array|
      |$.data.distributors[0].Warehouse.id|string|
      |$.data.distributors[0].Warehouse.name|string|
      |$.data.distributors[0].Warehouse.erp_id|string|

  @Positive @DataValidation
  Scenario: Validate empty arrays for invalid zone ID
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
      |$.data.warehouses|[]|
      |$.data.distributors|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.warehouses|array|
      |$.data.distributors|array|

  @Positive @EndToEnd
  Scenario: End-to-end get distributors and warehouses of zone data retrieval workflow
    And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|zoneId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data found"|
    And I store the response as "get_dist_ware_of_zone_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.data|object|
      |$.data.warehouses|array|
      |$.data.distributors|array|

  # @Positive @DataValidation
  # Scenario: Validate warehouses data content for zone ID 1
    # And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|zoneId|1|
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.data.warehouses[0].Warehouse.id|string|
      # |$.data.warehouses[0].Warehouse.name|string|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.warehouses[0].Warehouse.id|string|
      # |$.data.warehouses[0].Warehouse.name|string|
      # |$.data.warehouses[0].Warehouse.erp_id|string|

  # @Positive @DataValidation
  # Scenario: Validate distributors data content for zone ID 1
    # And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|zoneId|1|
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.data.distributors[0].Warehouse.id|string|
      # |$.data.distributors[0].Warehouse.name|string|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.distributors[0].Warehouse.id|string|
      # |$.data.distributors[0].Warehouse.name|string|
      # |$.data.distributors[0].Warehouse.erp_id|string|

  # @Positive @DataValidation
  # Scenario: Validate warehouses and distributors for zone ID 2
    # And I send the GET request to "schemes_get_dist_ware_of_zone" endpoint with dynamic access token, path and query parameters
      # |QueryParamName|QueryParamValue|Path|Value|
      # |access_token|ACCESS_TOKEN|zoneId|2|
    # Then I should see the response code as "200"
    # And verify response time is less than "2000" milliseconds
    # And the fields in response should match with expected values
      # |JPath|Value|
      # |$.Result|true|
      # |$.Reason|"Data found"|
      # |$.data.warehouses[0].Warehouse.id|string|
      # |$.data.warehouses[0].Warehouse.name|string|
      # |$.data.distributors[0].Warehouse.id|string|
      # |$.data.distributors[0].Warehouse.name|string|
    # And validating the response field data types
      # |JPath|ExpectedType|
      # |$.data.warehouses|array|
      # |$.data.distributors|array|
      # |$.data.warehouses[0].Warehouse.id|string|
      # |$.data.warehouses[0].Warehouse.name|string|
      # |$.data.distributors[0].Warehouse.id|string|
      # |$.data.distributors[0].Warehouse.name|string|

