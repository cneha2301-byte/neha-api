@BizomWebAPI @CompaniesManagement @ApiGetOrganization @ReportsAnalytics @CE
#https://bugzilla.bizom.in/show_bug.cgi?id=140258[Bug]
Feature: This feature file contains testcases for GET endpoint Companies - Api Get Organization

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Api Get Organization - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8  |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "organizationResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Api Get Organization - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|String|
      |$.data|Object|
      |$.data.company|Object|
      |$.data.zone|Array|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_03 Api Get Organization - validate company data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
      | $.data.company.id | "470212" |
      | $.data.company.name | "ui" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.company.id|String|
      |$.data.company.name|String|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ZoneValidation
  Scenario: TC_04 Api Get Organization - validate zones data structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
      | $.data.zone[0].id | "1" |
      | $.data.zone[0].name | "SOUTH" |
      | $.data.zone[1].id | "2" |
      | $.data.zone[1].name | "NORTH" |
      | $.data.zone[2].id | "3" |
      | $.data.zone[2].name | "East" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.zone|Array|
      |$.data.zone[0].id|String|
      |$.data.zone[0].name|String|
      |$.data.zone[1].id|String|
      |$.data.zone[1].name|String|
      |$.data.zone[2].id|String|
      |$.data.zone[2].name|String|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ArrayValidation
  Scenario: TC_05 Api Get Organization - validate zones array structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.zone|Array|
      |$.data.zone[0]|Object|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ResponseHeaders
  Scenario: TC_06 Api Get Organization - response headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_07 Api Get Organization - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |

  @PositiveScenario @EdgeCase
  Scenario: TC_08 Api Get Organization - with additional query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |test_param    |test_value    |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @LoadTest
  Scenario: TC_09 Api Get Organization - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |

  @PositiveScenario @Concurrent
  Scenario: TC_10 Api Get Organization - concurrent request validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_11 Api Get Organization - verify data against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.data.company.name | DB:companies:name: id=470212|
      | $.data.zone[0].name | DB:zones:name: id=1 |

  @PositiveScenario @DBValidation @DataCount
  Scenario: TC_12 Api Get Organization - verify zones count against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |

  @PositiveScenario @DBValidation @DataConsistency
  Scenario: TC_13 Api Get Organization - verify data consistency with database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |

  @PositiveScenario @SecurityHeaders
  Scenario: TC_14 Api Get Organization - security headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8  |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DataStructure
  Scenario: TC_15 Api Get Organization - validate complete data structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|String|
      |$.data|Object|
      |$.data.company|Object|
      |$.data.company.id|String|
      |$.data.company.name|String|
      |$.data.zone|Array|
      |$.data.zone[0]|Object|
      |$.data.zone[0].id|String|
      |$.data.zone[0].name|String|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @BoundaryTesting
  Scenario: TC_16 Api Get Organization - boundary testing with special characters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |special_chars |@#$%^&*()_+-=[]{};':",./<>? |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentType
  Scenario: TC_17 Api Get Organization - validate content type and encoding
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8    |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @JSONValidation
  Scenario: TC_18 Api Get Organization - validate JSON structure integrity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.data|Object|
      |$.data.zone|Array|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @NestedObjectValidation
  Scenario: TC_19 Api Get Organization - validate nested object structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|Object|
      |$.data.company|Object|
      |$.data.company.id|String|
      |$.data.company.name|String|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ArrayLength
  Scenario: TC_20 Api Get Organization - validate zones array length and content
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | "true" |
      | $.Reason  | "" |
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data.zone|Array|
      |$.data.zone[0]|Object|
      |$.data.zone[0].id|String|
      |$.data.zone[0].name|String|
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_21 Api Get Organization - invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
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
  Scenario: TC_22 Api Get Organization - empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "companies_apigetorganization" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | |
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "1200" milliseconds



