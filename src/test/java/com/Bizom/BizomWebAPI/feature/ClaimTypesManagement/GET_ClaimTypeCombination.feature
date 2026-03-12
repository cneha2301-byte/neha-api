@BizomWebAPI @ClaimTypesManagement @ClaimTypes @GetCombination @SystemIntegration @CE
Feature: Claim Types - Get Combination API Testing
  As a system user
  I want to retrieve a specific combination for a claim type
  So that the API returns the correct combination details or appropriate error messages

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @NotFound
#  Scenario: Get combination with non-existent combination id (claimTypeId 5, combinationId 10)
#    When I send the GET request to "claimtypes_get_combination" endpoint with path parameters
#      |Path|Value|
#      |claimTypeId|5|
#      |combinationId|10|
#    Then I should see the response code as "404"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|"combo with id: 10 and claimTypeId: 5 not found"|
#      |$.status|404|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get combination without access token
#    When I send the GET request to "claimtypes_get_combination" endpoint with path parameters
#      |Path|Value|
#      |claimTypeId|5|
#      |combinationId|10|
#    Then I should see the response code as "404"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get combination with invalid access token
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|invalid_token_12345|claimTypeId|5|combinationId|10|
#    Then I should see the response code as "404"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get combination with invalid claimTypeId (non-numeric)
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|abc|combinationId|10|
#    Then I should see the response code as "404"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get combination with invalid combinationId (non-numeric)
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|combinationId|xyz|
#    Then I should see the response code as "404"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get combination for valid claimTypeId and combinationId with valid access token
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|combinationId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.status|number|
#      |$.data|array|
#    And verify response time is less than "1500" milliseconds

#  @Positive @Functional
#  Scenario: Validate combination response structure when found
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|combinationId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Regression
#  Scenario: Regression test for claimtypes/getCombination (claimTypeId 5, combinationId 1)
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|combinationId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Performance
#  Scenario: Performance baseline for claimtypes/getCombination
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|combinationId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1200" milliseconds

#  @Negative @Boundary
#  Scenario Outline: Get combination for boundary path parameter values
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|<claimTypeId>|combinationId|<combinationId>|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.data|array|
#
#    Examples:
#      |claimTypeId|combinationId|
#      |0|0|
#      |-1|-1|
#      |2147483647|2147483647|
#      |9999999999|9999999999|

#  @Positive @MultipleIDs
#  Scenario Outline: Smoke test multiple combination ids for a given claim type
#    And I send the GET request to "claimtypes_get_combination" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|combinationId|<combinationId>|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#
#    Examples:
#      |combinationId|
#      |1|
#      |5|
#      |10|
#      |20|
#      |100|
