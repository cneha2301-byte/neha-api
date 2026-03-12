@BizomWebAPI @NoDueCertificatesManagement @GetSprintDetailsWithParams @WorkflowAutomation @OS
Feature: Get Sprint Details With Parameters API Testing
  As a system user
  I want to test the get sprint details endpoint with sprint ID parameter
  So that I can ensure proper functionality and data retrieval for no due certificates sprint details by ID

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get sprint details with parameters without access token
    When I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with path parameters
      |Path|Value|
      |sprintId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get sprint details with parameters with invalid access token
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|sprintId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get sprint details with parameters with expired access token
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|sprintId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get sprint details with parameters with malformed access token
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|sprintId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get sprint details with parameters for sprint ID 1 with valid access token
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|The frequency is not configured for the warehouse/company.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Functional
  Scenario: Get sprint details with parameters for different sprint ID
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Negative @Validation
  Scenario: Get sprint details with parameters with invalid sprint ID
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get sprint details with parameters with non-existent sprint ID
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|999999|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get sprint details with parameters with negative sprint ID
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|-1|
    Then I should see the response code as "500"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get sprint details with parameters with zero sprint ID
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get sprint details with parameters with invalid endpoint
#    And I send the GET request to "noduecertificates_getsprintdetails_with_params_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|sprintId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get sprint details with parameters endpoint
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Regression
  Scenario: Regression test for get sprint details with parameters endpoint
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|The frequency is not configured for the warehouse/company.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|

  @Positive @Smoke
  Scenario: Get sprint details with parameters for sprint ID 1 - DB validation
    And I send the GET request to "noduecertificates_getsprintdetails_with_params" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|sprintId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.result|false|
      |$.reason|The frequency is not configured for the warehouse/company.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.reason|string|


