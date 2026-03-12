@BizomWebAPI @ClaimsManagement @ClaimTypes @GetClaimTypesForBlocking @ReportsAnalyticsGroup2 @CE
Feature: This feature file contains testcases for GET endpoint Claim Types - Get Claim Types For Blocking

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Get Claim Types For Blocking - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8   |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "claimTypesForBlockingResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Get Claim Types For Blocking - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentValidation
  Scenario: TC_03 Get Claim Types For Blocking - validate all claim types data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
      | $.data.allClaimTypes.3 | "Travel" |
      | $.data.allClaimTypes.4 | "Daily Allowance" |
      | $.data.allClaimTypes.5 | "Lodging and Boarding" |
      | $.data.allClaimTypes.6 | "Local Conveyance" |
      | $.data.allClaimTypes.7 | "HRA" |
      | $.data.allClaimTypes.8 | "Mobile" |
      | $.data.allClaimTypes.9 | "Misc" |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @BlockedClaimTypes
  Scenario: TC_04 Get Claim Types For Blocking - validate blocked claim types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
      | $.data.blockedClaimTypes | [] |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ObjectValidation
  Scenario: TC_05 Get Claim Types For Blocking - validate nested object structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ResponseHeaders
  Scenario: TC_06 Get Claim Types For Blocking - response headers validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8   |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @Performance
  Scenario: TC_07 Get Claim Types For Blocking - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |

  @PositiveScenario @EdgeCase
  Scenario: TC_08 Get Claim Types For Blocking - with additional query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |test_param    |test_value    |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @LoadTest
  Scenario: TC_09 Get Claim Types For Blocking - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |

  @PositiveScenario @Concurrent
  Scenario: TC_10 Get Claim Types For Blocking - concurrent request validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_11 Get Claim Types For Blocking - verify data against database
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And I verify API response at path with DB and static values
      | JPath     | Value |
      | $.data.allClaimTypes.3 | DB:claimtypes:name: id=3 AND isactive=1 |
      | $.data.allClaimTypes.4 | DB:claimtypes:name: id=4 AND isactive=1 |
      | $.data.allClaimTypes.5 | DB:claimtypes:name: id=5 AND isactive=1 |
      | $.data.allClaimTypes.6 | DB:claimtypes:name: id=6 AND isactive=1 |
      | $.data.allClaimTypes.7 | DB:claimtypes:name: id=7 AND isactive=1 |
      | $.data.allClaimTypes.8 | DB:claimtypes:name: id=8 AND isactive=1 |
      | $.data.allClaimTypes.9 | DB:claimtypes:name: id=9 AND isactive=1 |

  @PositiveScenario @DataStructure
  Scenario: TC_12   Get Claim Types For Blocking - validate complete data structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @BoundaryTesting
  Scenario: TC_13 Get Claim Types For Blocking - boundary testing with special characters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
      |special_chars |@#$%^&*()_+-=[]{};':",./<>? |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @ContentType
  Scenario: TC_14 Get Claim Types For Blocking - validate content type and encoding
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8   |
      | Connection    | keep-alive                  |
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Data found" |
      | $.status  | 200   |
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_15 Get Claim Types For Blocking - invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
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
  Scenario: TC_16 Get Claim Types For Blocking - empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "claimtypes_getclaimtypesforblocking" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | |
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

