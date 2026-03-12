@BizomWebAPI @CompaniesManagement @Companies @GetFindMyNearestOutletLogoUrlForCompany @ReportsAnalytics @CE
Feature: This feature file contains testcases for GET endpoint Companies - Get Find My Nearest Outlet Logo URL For Company

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Get Find My Nearest Outlet Logo URL - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8  |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "outletLogoUrlResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Get Find My Nearest Outlet Logo URL - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_03 Get Find My Nearest Outlet Logo URL - validate outlet logo configuration data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
      | $.Url | "" |
      | $.BgColor | "" |
      | $.BottomMessage | "" |
      | $.PopupMessage | "" |
      | $.HeadingLabel | "" |
      | $.TitleLabel | "" |
      | $.OutletPicSupport | 0 |
      | $.GTMCode | "" |
      | $.ClickToCallPhoneNo | "0" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @URLValidation
  Scenario: TC_04 Get Find My Nearest Outlet Logo URL - validate URL field structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
      | $.Url | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ConfigurationValidation
  Scenario: TC_05 Get Find My Nearest Outlet Logo URL - validate outlet configuration settings
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
      | $.BgColor | "" |
      | $.BottomMessage | "" |
      | $.PopupMessage | "" |
      | $.HeadingLabel | "" |
      | $.TitleLabel | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @SupportValidation
  Scenario: TC_06 Get Find My Nearest Outlet Logo URL - validate outlet support settings
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
      | $.OutletPicSupport | 0 |
      | $.GTMCode | "" |
      | $.ClickToCallPhoneNo | "0" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ResponseHeaders
  Scenario: TC_07 Get Find My Nearest Outlet Logo URL - response headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8   |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_08 Get Find My Nearest Outlet Logo URL - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |

  @PositiveScenario @EdgeCase
  Scenario: TC_09 Get Find My Nearest Outlet Logo URL - with additional query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |test_param    |test_value    |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @LoadTest
  Scenario: TC_10 Get Find My Nearest Outlet Logo URL - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |

  @PositiveScenario @SecurityHeaders
  Scenario: TC_11 Get Find My Nearest Outlet Logo URL - security headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DataStructure
  Scenario: TC_12   Get Find My Nearest Outlet Logo URL - validate complete data structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_13 Get Find My Nearest Outlet Logo URL - invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |invalid_token_12345 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                   | Value           |
      | $.result                 | false |
      | $.error.code | 401 |
      | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Validation
   Scenario: TC_14 Get Find My Nearest Outlet Logo URL - empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_getfindmynearestoutletlogourlforcompany" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

