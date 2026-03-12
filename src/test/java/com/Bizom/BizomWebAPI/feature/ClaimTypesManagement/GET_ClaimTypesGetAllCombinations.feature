@BizomWebAPI @ClaimTypesManagement @ClaimTypes @GetAllCombinations @SystemIntegration @CE
Feature: Claim Types - Get All Combinations API Testing
  As a system user
  I want to retrieve all combinations for a given claim type id
  So that the API returns the correct structure and data for the requested claim type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get all combinations without access token
    When I send the GET request to "claimtypes_get_all_combinations" endpoint with path parameters
      |Path|Value|
      |claimTypeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get all combinations with invalid access token
#    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|claimTypeId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get all combinations with expired access token
#    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|claimTypeId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get all combinations with malformed access token
#    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|claimTypeId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get all combinations for claimTypeId 1 with valid access token
    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.data|array|
    And verify response time is less than "1500" milliseconds

  @Positive @Functional
  Scenario: Get all combinations for a claimTypeId that returns non-empty data (example id 2)
    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
      |$.data[0].id|number|
      |$.data[0].name|string|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get all combinations with invalid claimTypeId (non-numeric)
    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|abc|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
    And verify response time is less than "2000" milliseconds

  @Positive @Regression
  Scenario: Regression test for claimtypes/getAllCombinations for claimTypeId 1
    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|""|
      |$.data|[]|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance baseline for claimtypes/getAllCombinations (claimTypeId 1)
    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Boundary
  Scenario Outline: Get all combinations for various claimTypeId boundary values
    And I send the GET request to "claimtypes_get_all_combinations" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|<claimTypeId>|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.data|array|

    Examples:
      |claimTypeId|
      |0|
      |-1|
      |2147483647|
      |9999999999|


