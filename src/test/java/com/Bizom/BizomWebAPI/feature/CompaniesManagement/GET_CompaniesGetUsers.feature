@BizomWebAPI @CompaniesManagement @Companies @CompaniesGetUsers @ReportsAnalytics @CE
Feature: This feature file contains testcases for GET endpoint Companies - Get Users 
#fixed-/https://bugzilla.bizom.in/show_bug.cgi?id=140259[Bug]
  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Get Users - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
     And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "usersResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Get Users - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|Boolean|
      |$.outletData|Array|
      |$.users|Object|
      |$.dataval|Array|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ResponseHeaders
  Scenario: TC_03 Get Users - response headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_04 Get Users - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData[0].User|Object|
      |$.outletData[0].Role|Object|
      |$.outletData[0].User.userid|String|
      |$.outletData[0].User.name|String|
      |$.outletData[0].User.longitude|String|
      |$.outletData[0].User.latitude|String|
      |$.outletData[0].Role.roleid|String|
      |$.outletData[0].Role.Rolename|String|

  @PositiveScenario @EdgeCase
  Scenario: TC_05 Get Users - with additional query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |test_param    |test_value    |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @LoadTest
  Scenario: TC_06 Get Users - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |

  @PositiveScenario @Concurrent
  Scenario: TC_07 Get Users - concurrent request validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.users.1.id|String|
      |$.users.1.name|String|
      |$.users.1.latitude|String|
      |$.users.1.longitude|String|
      |$.users.1.roleid|String|
      |$.users.1.Rolename|String|

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_08 Get Users - verify data against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.outletData[0].User.name | DB:users:name: id='1'|
      | $.outletData[0].Role.Rolename | DB:roles:name: id='1'|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|Boolean|
      |$.outletData|Array|
      |$.users|Object|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataCount
  Scenario: TC_09 Get Users - verify users count against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.users.2.name | DB:users:name: id='2'|
      | $.users.3.Rolename | DB:roles:name: id='3'|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.outletData|Array|
      |$.users|Object|
      |$.dataval|Array|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @SecurityHeaders
  Scenario: TC_10 Get Users - security headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @BoundaryTesting
  Scenario: TC_11 Get Users - boundary testing with special characters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |special_chars |@#$%^&*()_+-=[]{};':",./<>? |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @UserContact
  Scenario: TC_12 Get Users - validate user contact information
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | true |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_13 Get Users - invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |invalid_token_12345 |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Validation
  Scenario: TC_14 Get Users - empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getusers" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | |
    Then I should see the response code as "STATUS_200_OK"
    Then the HTML response should contain page title "Users"
    And verify response time is less than "1200" milliseconds

  
