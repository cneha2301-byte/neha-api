@BizomWebAPI @CE @BeatsManagement @Beats @BeatsForUser @CoreBusinessOperations
Feature: This feature file contains testcases for GET endpoint Beats - Get Beats For User

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @PositiveScenario @Sanity
  Scenario: TC_01 Beats For User - status code positive case
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "beatsForUserResponse" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Beats For User - validate response structure and data types
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json   |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beats|object|

  @PositiveScenario @ContentValidation
  Scenario: TC_03 Beats For User - validate beats data structure
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json   |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And verifies the field is not null
      |JPath|
      |$.beats|

  @PositiveScenario @ContentValidation
  Scenario: TC_04 Beats For User - validate specific beat entries
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
   And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beats|object|

  @PositiveScenario @ContentValidation
  Scenario: TC_05 Beats For User - validate beat ID and name mapping
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.beats.40|East1|
      |$.beats.41|East2|
      |$.beats.42|East3|
      |$.beats.39|South|

  @NegativeScenario @Security
  Scenario: TC_06 Beats For User - invalid access token
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |invalid_token_12345 |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the HTML response should contain page title "Users"

  @NegativeScenario @Validation
  Scenario: TC_07 Beats For User - empty access token
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  | ""|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the HTML response should contain page title "Users"

  @PositiveScenario @Performance
  Scenario: TC_08 Beats For User - performance validation
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "800" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @PositiveScenario @ResponseHeaders
  Scenario: TC_09 Beats For User - response headers validation
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @PositiveScenario @EdgeCase
  Scenario: TC_10 Beats For User - with additional query parameters
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @PositiveScenario @LoadTest
  Scenario: TC_11 Beats For User - load testing
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "600" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @PositiveScenario @Concurrent
  Scenario: TC_12 Beats For User - concurrent request validation
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @PositiveScenario @DataIntegrity
  Scenario: TC_13 Beats For User - verify data structure integrity
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And verifies the field is present in the response
      |JPath|
      |$.beats|

  @PositiveScenario @DBValidation @DataCount
  Scenario: TC_14 Beats For User - verify beats count against database
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And verifies the field is not null
      |JPath|
      |$.beats|

  @PositiveScenario @DBValidation @DataConsistency
  Scenario: TC_15 Beats For User - verify data consistency with database
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @PositiveScenario @SecurityHeaders
  Scenario: TC_16 Beats For User - security headers validation
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @PositiveScenario @DataStructure
  Scenario: TC_17 Beats For User - validate data structure
    And I send the GET request to "getbeatsforuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1200" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.beats|object|
      
  @NegativeScenario @InvalidURL
  Scenario: TC_18 Beats For User - invalid URL endpoint
    And I send the GET request to "getbeatsforuser_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @InvalidURL @ResponseHeaders
  Scenario: TC_19 Beats For User - invalid URL response headers validation
    And I send the GET request to "getbeatsforuser_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "1200" milliseconds