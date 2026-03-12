@BizomWebAPI @ClaimTypesManagement @ClaimTypes @GetClaimType @SystemIntegration @CE
Feature: Claim Types - Get Claim Type API Testing
  As a system user
  I want to retrieve a claim type by id
  So that the API returns the correct structure and metadata for that claim type

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get claim type without access token (claimTypeId 5)
#    When I send the GET request to "claimtypes_get_claim_type" endpoint with path parameters
#      |Path|Value|
#      |claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|"Data Found"|
#      |$.status|200|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get claim type with invalid access token
#    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|"Data Found"|
#      |$.status|200|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get claim type for claimTypeId 5 with valid access token
    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|5|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Found"|
      |$.status|200|
      |$.data.id|"5"|
      |$.data.name|"Lodging and Boarding"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|
      |$.status|number|
      |$.data|object|
    And verify response time is less than "1500" milliseconds

  @Positive @Functional
  Scenario: Validate full claim type payload (claimTypeId 5)
    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|5|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Found"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.id|string|
      |$.data.name|string|
      |$.data.companyId|string|
      |$.data.isActive|string|
      |$.data.type|string|
      |$.data.createdDate|string|
      |$.data.fields|array|
      |$.data.fields[0].id|string|
      |$.data.fields[0].name|string|
      |$.data.fields[0].type|string|
      |$.data.fields[0].isMandatory|boolean|
    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get claim type with invalid claimTypeId (non-numeric)
#    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|abc|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.reason|"Data Not Found"|
#      |$.data|null|
#    And verify response time is less than "2000" milliseconds

  @Positive @Regression
  Scenario: Regression test for claimtypes/getClaimType for claimTypeId 5
    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|5|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Data Found"|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance baseline for claimtypes/getClaimType (claimTypeId 5)
    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|5|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

#  @Negative @Boundary
#  Scenario Outline: Get claim type for boundary claimTypeId values
#    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|<claimTypeId>|
#    Then I should see the response code as "200"
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.data|object|
#
#    Examples:
#      |claimTypeId|
#      |0|
#      |-1|
#      |2147483647|
#      |9999999999|


  @Positive @Smoke
  Scenario: Get claim type with null checking
    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|5|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.templateName|null|
      |$.data.combinations|null|
      |$.data.combinationHierarchy|null|

  @Positive @MultipleIDs
  Scenario Outline: Smoke test multiple claimTypeIds
    And I send the GET request to "claimtypes_get_claim_type" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|<claimTypeId>|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|

    Examples:
      |claimTypeId|
      |1|
      |2|
      |5|
      |10|
