@BizomWebAPI @CE @DistinctDesignations @UserManagement
Feature: Distinct Designations API Testing
  As a system user
  I want to test the getDistinctDesignations endpoint
  So that I can ensure proper functionality and data retrieval for distinct user designations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get distinct designations without access token
    When I send the GET request to "get_distinct_designations" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get distinct designations with invalid access token
    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get distinct designations with expired access token
    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get distinct designations with malformed access token
    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get distinct designations with valid access token
#    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|["CEO","DM"]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|

#  @Positive @Functional
#  Scenario: Verify distinct designations response structure
#    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|["CEO","DM"]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|

#  @Positive @Regression
#  Scenario: Verify distinct designations data consistency
#    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|["CEO","DM"]|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[0]|DB:users:designation: id=16|

#  @Negative @ErrorHandling
#  Scenario: Get distinct designations with invalid endpoint
#    And I send the GET request to "get_distinct_designations_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for distinct designations endpoint
    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @DataValidation
#  Scenario: Verify distinct designations data integrity
#    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|["CEO","DM"]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|


#  @Positive @Smoke
#  Scenario: Get distinct designations with valid access token - comprehensive validation
#    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|["CEO","DM"]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.data[1]|DB:users:designation: id=4 |

#  @Positive @Functional
#  Scenario: Verify distinct designations response format
#    And I send the GET request to "get_distinct_designations" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data|["CEO","DM"]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|array|

