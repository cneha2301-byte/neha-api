@BizomWebAPI @CompaniesManagement @Companies @GetCustomOutletFields @ReportsAnalytics @CE
Feature: This feature file contains testcases for GET endpoint Companies - Get Custom Outlet Fields

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Get Custom Outlet Fields - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8     |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "customOutletFieldsResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Get Custom Outlet Fields - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_03 Get Custom Outlet Fields - validate fields array structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
      | $.fields[0].name | "checkbox" |
      | $.fields[0].type | "CheckBox" |
      | $.fields[1].name | "fOrmImage" |
      | $.fields[1].type | "Image" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @FieldTypesValidation
  Scenario: TC_04 Get Custom Outlet Fields - validate different field types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
      | $.fields[0].type | "CheckBox" |
      | $.fields[1].type | "Image" |
      | $.fields[2].type | "Video" |
      | $.fields[3].type | "Image" |
      | $.fields[4].type | "SingleLineText" |
      | $.fields[5].type | "Paragraph" |
      | $.fields[6].type | "Uploaddata" |
      | $.fields[7].type | "RadioButton" |
      | $.fields[8].type | "CheckBox" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @SettingsValidation
  Scenario: TC_05 Get Custom Outlet Fields - validate field settings structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ArrayValidation
  Scenario: TC_06 Get Custom Outlet Fields - validate fields array structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ResponseHeaders
  Scenario: TC_07 Get Custom Outlet Fields - response headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_08 Get Custom Outlet Fields - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |

  @PositiveScenario @EdgeCase
  Scenario: TC_09 Get Custom Outlet Fields - with additional query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |test_param    |test_value    |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @LoadTest
  Scenario: TC_10 Get Custom Outlet Fields - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |

  @PositiveScenario @Concurrent
  Scenario: TC_11 Get Custom Outlet Fields - concurrent request validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_12 Get Custom Outlet Fields - verify data against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataCount
  Scenario: TC_13 Get Custom Outlet Fields - verify fields count against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataConsistency
  Scenario: TC_14 Get Custom Outlet Fields - verify data consistency with database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @SecurityHeaders
  Scenario: TC_15 Get Custom Outlet Fields - security headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @BoundaryTesting
  Scenario: TC_17 Get Custom Outlet Fields - boundary testing with special characters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |special_chars |@#$%^&*()_+-=[]{}':",./<>? |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "Outlet Customization found." |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_25 Get Custom Outlet Fields - invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |invalid_token_12345 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.result  | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Validation
  Scenario: TC_26 Get Custom Outlet Fields - empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getcustomoutletfields" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds


