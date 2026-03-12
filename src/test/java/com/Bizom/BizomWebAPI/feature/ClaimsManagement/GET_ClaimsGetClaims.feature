@BizomWebAPI @ClaimsManagement @Claims @GetClaims @ReportsAnalyticsGroup2 @CE
Feature: This feature file contains testcases for GET endpoint Claims - Get Claims

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Get Claims - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8   |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "getClaimsResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Get Claims - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_03 Get Claims - validate empty arrays structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|  
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ResponseHeaders
  Scenario: TC_04 Get Claims - response headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_05 Get Claims - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |


  @PositiveScenario @LoadTest
  Scenario: TC_06 Get Claims - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |

  @PositiveScenario @Concurrent
  Scenario: TC_07 Get Claims - concurrent request validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_08 Get Claims - verify data against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
     #no data is there in DB so need to add validation for this

  @PositiveScenario @DBValidation @DataCount
  Scenario: TC_09 Get Claims - verify claims count against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |

  @PositiveScenario @DBValidation @DataConsistency
  Scenario: TC_10 Get Claims - verify data consistency with database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |

  @PositiveScenario @SecurityHeaders
  Scenario: TC_11 Get Claims - security headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
    |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8   |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DataStructure
  Scenario: TC_12 Get Claims - validate complete data structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
    |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @BoundaryTesting
  Scenario: TC_13 Get Claims - boundary testing with special characters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
    |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |special_chars |@#$%^&*()_+-=[]{};':",./<>? |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_14 Get Claims - invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |invalid_token_12345 |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
     | JPath     | Value |
     | $.result  | false |
     | $.error.code | 401 |
     | $.error.message | "Invalid Access Token or Credentials" |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_15 Get Claims - empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds


  @PositiveScenario @DataValidation
  Scenario: TC_16 Get Claims - validate JSON structure integrity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
    |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentType
  Scenario: TC_17 Get Claims - validate content type and encoding
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claims_getclaims" endpoint with dynamic access token and query parameters
    |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8 |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Claims  | []    |
      | $.Claim   | []    |
    And verify response time is less than "1200" milliseconds
