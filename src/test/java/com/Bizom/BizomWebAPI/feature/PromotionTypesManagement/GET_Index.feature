@BizomWebAPI @PromotionTypesManagement @PromotionTypes @OrderManagement @Innovation
Feature: Promotion Types Index API Testing
  As a system user
  I want to test the promotion types index endpoint
  So that I can ensure proper functionality and data retrieval for promotion types management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get promotion types index without access token
    When I send the GET request to "promotiontypes_index" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get promotion types index with invalid access token
#    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.message|Invalid Token|
#      |$.extensions.name|JsonWebTokenError|
#      |$.extensions.message|invalid signature|

#  @Negative @Security
#  Scenario: Get promotion types index with expired access token
#    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.message|Invalid Token|
#      |$.extensions.name|JsonWebTokenError|
#      |$.extensions.message|invalid signature|

#  @Negative @Security
#  Scenario: Get promotion types index with malformed access token
#    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.message|Invalid Token|
#      |$.extensions.name|JsonWebTokenError|
#      |$.extensions.message|invalid signature|

  @Positive @Smoke
  Scenario: Get promotion types index with valid access token
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "promotion_types_index_response" name using full path

  @Positive @DataValidation
  Scenario: Validate promotion types index response structure
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.message|string|
      |$.extensions|object|
      |$.extensions.name|string|
      |$.extensions.message|string|

  @Positive @DataValidation
  Scenario: Validate promotion types index specific data values
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|

#  @Positive @DataValidation
#  Scenario: Validate promotion types index with static values for error response
#    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.message|Invalid Token|
#      |$.extensions.name|JsonWebTokenError|
#      |$.extensions.message|invalid signature|

  @Positive @Performance
  Scenario: Performance test for promotion types index endpoint
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for promotion types index endpoint
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get promotion types index with invalid query parameters
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: Get promotion types index with special characters in query parameters
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |sSearch|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get promotion types index with SQL injection attempt
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |sSearch|'; DROP TABLE promotiontypes; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: Get promotion types index with maximum query parameters
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iColumns|4|
      |iDisplayStart|0|
      |iDisplayLength|50|
      |mDataProp_0|0|
      |mDataProp_1|1|
      |mDataProp_2|2|
      |mDataProp_3|3|
      |sSearch||
      |iSortCol_0|0|
      |sSortDir_0|asc|
      |iSortingCols|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get promotion types index with invalid endpoint
    And I send the GET request to "promotiontypes_index_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate promotion types index business logic
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: Validate promotion types index data integrity
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.message|string|
      |$.extensions|object|
      |$.extensions.name|string|
      |$.extensions.message|string|

  @Positive @Regression
  Scenario: Regression test for promotion types index endpoint
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.message|string|
      |$.extensions|object|

  @Positive @Functional
  Scenario: Validate promotion types index response completeness
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.message|string|
      |$.extensions|object|
      |$.extensions.name|string|
      |$.extensions.message|string|

#  @Positive @ObjectValidation
#  Scenario: Validate promotion types index object structure and content
#    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.message|Invalid Token|
#      |$.extensions.name|JsonWebTokenError|
#      |$.extensions.message|invalid signature|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.message|string|
#      |$.extensions|object|
#      |$.extensions.name|string|
#      |$.extensions.message|string|

#  @Positive @ContentValidation
#  Scenario: Validate promotion types index content structure
#    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token|
#      |sEcho|1|
#      |iDisplayStart|0|
#      |iDisplayLength|50|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.message|Invalid Token|
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |message|
#      |extensions|
#      |name|
#      |JsonWebTokenError|
#      |invalid signature|

  @Positive @LoadTesting
  Scenario: Load testing for promotion types index endpoint
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Timeout
  Scenario: Test promotion types index endpoint timeout handling
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Positive @EndToEnd
  Scenario: End-to-end promotion types index retrieval workflow
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|0|
      |iDisplayLength|50|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "promotion_types_index_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.message|string|
      |$.extensions|object|
      |$.extensions.name|string|
      |$.extensions.message|string|

  @Positive @Pagination
  Scenario: Test promotion types index with pagination parameters
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|2|
      |iDisplayStart|0|
      |iDisplayLength|25|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Pagination
  Scenario: Test promotion types index with different page size
    And I send the GET request to "promotiontypes_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |sEcho|1|
      |iDisplayStart|10|
      |iDisplayLength|100|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

