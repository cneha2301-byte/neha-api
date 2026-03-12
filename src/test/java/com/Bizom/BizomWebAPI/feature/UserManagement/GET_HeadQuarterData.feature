@BizomWebAPI @CE @HeadQuarterData @ReportingOperations
Feature: Head Quarter Data API Testing
  As a system user
  I want to test the getHeadQuarterData endpoint
  So that I can ensure proper functionality and data retrieval for headquarter information

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get headquarter data without access token
    When I send the GET request to "get_headquarter_data" endpoint with path parameters
      |Path|Value|
      |headquarterId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get headquarter data with invalid access token
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|headquarterId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get headquarter data with expired access token
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|headquarterId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get headquarter data with malformed access token
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|headquarterId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get headquarter data for valid headquarter ID 1
#    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|headquarterId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|

#  @Positive @Functional
#  Scenario: Get headquarter data for valid headquarter ID 2
#    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|headquarterId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

#  @Positive @Functional
#  Scenario: Get headquarter data for valid headquarter ID 3
#    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|headquarterId|3|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|

  @Negative @Validation
  Scenario: Get headquarter data with invalid headquarter ID
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|headquarterRoles data not found|

  @Negative @Validation
  Scenario: Get headquarter data with non-existent headquarter ID
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|headquarterRoles data not found|

  @Negative @Validation
  Scenario: Get headquarter data with negative headquarter ID
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|headquarterRoles data not found|

  @Negative @Validation
  Scenario: Get headquarter data with zero headquarter ID
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|Invalid request data|

#  @Negative @Validation
#  Scenario: Get headquarter data with special characters in headquarter ID
#    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|headquarterId|@#$%|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds


  @Negative @ErrorHandling
  Scenario: Get headquarter data with invalid endpoint
    And I send the GET request to "get_headquarter_data_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "404"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for headquarter data endpoint
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for headquarter data endpoint
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|headquarterRoles data not found|

#  @Positive @DataValidation
#  Scenario: Verify headquarter data response structure
#    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|headquarterId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|

#  @Positive @Smoke
#  Scenario: Get headquarter data for headquarter ID 1 with comprehensive validation
#    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|headquarterId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|

#  @Positive @Functional
#  Scenario: Get headquarter data for headquarter ID 2 with comprehensive validation
#    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|headquarterId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|false|
#      |$.Reason|string|
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json; charset=UTF-8|
#      |Server|Bizom|
#      |Connection|keep-alive|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|headquarterRoles data not found|

  @Positive @BoundaryTesting
  Scenario: Get headquarter data with maximum valid headquarter ID
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|2147483647|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|headquarterRoles data not found|

  @Positive @BoundaryTesting
  Scenario: Get headquarter data with minimum valid headquarter ID
    And I send the GET request to "get_headquarter_data" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|headquarterId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|headquarterRoles data not found|
