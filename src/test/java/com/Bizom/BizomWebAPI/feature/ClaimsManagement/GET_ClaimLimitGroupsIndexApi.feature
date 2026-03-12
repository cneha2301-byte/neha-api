@BizomWebAPI @ClaimsManagement @ClaimLimitGroups @ClaimLimitGroupsIndexApi @ReportsAnalyticsGroup2 @CE
Feature: Claim Limit Groups Index API Testing
  As a system user
  I want to test the claim limit groups index API endpoint
  So that I can ensure proper functionality and data retrieval for claim limit groups management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get claim limit groups without access token
    When I send the GET request to "claimlimitgroups_indexapi" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get claim limit groups with invalid access token
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                   | Value           |
      | $.result                 | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get claim limit groups with expired access token
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
     And the fields in response should match with expected values
      | JPath                   | Value           |
      | $.result                 | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_04 Get claim limit groups with valid access token
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And I store the response as "claimlimitgroups_response" name using full path

  @Positive @DataValidation
  Scenario: TC_05 Validate claim limit groups response structure
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @DataValidation
  Scenario: TC_06 Validate claim limit groups with static values
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @Performance
  Scenario: TC_07 Performance test for claim limit groups endpoint
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|


  @Negative @Validation
  Scenario: TC_08 Get claim limit groups with invalid query parameters
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Negative @Validation
  Scenario: TC_09 Get claim limit groups with special characters in query parameters
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Negative @Boundary
  Scenario: TC_10 Get claim limit groups with maximum query parameters
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
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
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

#  @Negative @ErrorHandling
#  Scenario: TC_11 Get claim limit groups with invalid endpoint
#    And I send the GET request to "claimlimitgroups_indexapi_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    Then the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_12 Validate claim limit groups data integrity
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @ArrayValidation
  Scenario: TC_13 Validate claim limit groups array structure and content
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.aaData|array|

  @Positive @ContentValidation
  Scenario: TC_14 Validate claim limit groups content structure
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|

  @Positive @LoadTesting
  Scenario: TC_15 Load testing for claim limit groups endpoint
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|

  @Positive @EndToEnd
  Scenario: TC_16 End-to-end claim limit groups data retrieval workflow
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And I store the response as "claimlimitgroups_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|

  @Positive @EmptyDataValidation
  Scenario: TC_17 Validate empty data scenario for claim limit groups
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
    And verify response time is less than "2500" milliseconds

  @Positive @BoundaryTesting
  Scenario: TC_18 Boundary testing for claim limit groups with special characters
    And I send the GET request to "claimlimitgroups_indexapi" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |special_chars|@#$%^&*()_+-=[]{};':",./<>?|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|0|
      |$.iTotalDisplayRecords|0|
      |$.aaData|[]|
