@BizomWebAPI @ClaimTypesManagement @ClaimTypes @GetAllFieldsDetails @SystemIntegration @CE
Feature: Claim Types - Get All Fields Details API Testing
  As a system user
  I want to retrieve field details for a given claim type id
  So that the API returns the correct list of fields and their metadata

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get fields details without access token (claimTypeId 5)
#    When I send the GET request to "claimtypes_get_all_fields_details" endpoint with path parameters
#      |Path|Value|
#      |claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get fields details with invalid access token
#    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get fields details with expired access token
#    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get fields details for claimTypeId 5 with valid access token
#    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.result|boolean|
#      |$.reason|string|
#      |$.data|array|
#    And verify response time is less than "1500" milliseconds

#  @Positive @Functional
#  Scenario: Get fields details payload structure for claimTypeId 5 (non-empty)
#    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#      |$.data[0].fieldId|number|
#      |$.data[0].fieldName|string|
#      |$.data[0].fieldType|string|
#      |$.data[0].isMandatory|boolean|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Validation
#  Scenario: Get fields details with invalid claimTypeId (non-numeric)
#    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|abc|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#      |$.data|[]|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Regression
#  Scenario: Regression test for claimtypes/getAllFieldsDetails for claimTypeId 5
#    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|claimTypeId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.reason|""|
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance baseline for claimtypes/getAllFieldsDetails (claimTypeId 5)
    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|claimTypeId|5|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @Negative @Boundary
  Scenario Outline: Get fields details for boundary claimTypeId values
    And I send the GET request to "claimtypes_get_all_fields_details" endpoint with dynamic access token, path and query parameters
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

