@BizomWebAPI @CE @OutletsManagement @DuplicateOutlets @SystemOperations
Feature: Get Duplicate Outlets New API Testing
  As a system user
  I want to test the get duplicate outlets new endpoint
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
  Scenario: TC_01 Get duplicate outlets without access token
    When I send the GET request to "outlets_get_duplicate_outlets_new" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get duplicate outlets with invalid access token
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get duplicate outlets with expired access token
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get duplicate outlets with malformed access token
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get duplicate outlets with valid access token
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "duplicate_outlets_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate duplicate outlets response structure
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.duplicateOutlets|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate duplicate outlets array structure
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.duplicateOutlets|array|

  @Positive @Functional
  Scenario: TC_08 Get duplicate outlets with warehouse ID filter
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |warehouse_id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.duplicateOutlets|array|

  @Positive @Functional
  Scenario: TC_09 Get duplicate outlets with area ID filter
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |area_id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.duplicateOutlets|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for duplicate outlets endpoint
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_11 Get duplicate outlets with invalid query parameters
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Boundary
  Scenario: TC_12 Get duplicate outlets with maximum query parameters
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
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

  @Negative @ErrorHandling
  Scenario: TC_13 Get duplicate outlets with invalid endpoint
    And I send the GET request to "outlets_get_duplicate_outlets_new_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_14 Validate duplicate outlets business logic - no duplicates found
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.duplicateOutlets|array|

  @Positive @BusinessLogic
  Scenario: TC_15 Validate duplicate outlets with empty array
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.duplicateOutlets|array|

  @Positive @DataIntegrity
  Scenario: TC_16 Validate duplicate outlets data integrity
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.duplicateOutlets|array|

  @Positive @Functional
  Scenario: TC_17 Validate duplicate outlets response completeness
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |duplicateOutlets|

  @Positive @LoadTesting
  Scenario: TC_18 Load testing for duplicate outlets endpoint
    And I send the GET request to "outlets_get_duplicate_outlets_new" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|



