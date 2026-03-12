@BizomWebAPI @CallsManagement @AddCall @Transaction @Post
Feature: This feature file contains testcases for POST /calls/add endpoint

#-------------------------------------------------------------------------------------------------

  @Test_1-positive
  Scenario: TC_01 Create new call - positive case (random transactionId)
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.transactionId|randomInt|
      |$.forDate|randomDateTime|
      |$.startTime|randomDateTime|
      |$.endTime|randomDateTime|
      |$.latitude|randomLatitude|
      |$.longitude|randomLongitude|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.data.transactionId|notNull|
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:calls:transactionId: id=(SELECT MAX(id) FROM calls)|$.data.transactionId|

  @Test_2-positive
  Scenario: TC_02 Create call with same transactionId again (duplicate)
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.transactionId|000020255678012048572825|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.reason|"Call Data already Exist"|
    And verify response time is less than "2500" milliseconds

  @Test_3-negative @Validation
  Scenario: TC_03 Missing required numeric fields (warehouseId)
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.warehouseId| |
      |$.transactionId|randomInt|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Test_4-negative @Validation
  Scenario: TC_04 Invalid data types in numeric fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.warehouseId|invalidNumber|
      |$.transactionId|randomInt|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Test_5-negative @Security
  Scenario: TC_05 SQL injection attempt in transactionId
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.transactionId|'; DROP TABLE calls; --|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Test_6-negative @Security
  Scenario: TC_06 XSS attempt in address field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.address|<script>alert('XSS')</script>|
      |$.transactionId|randomInt|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Test_7-positive @Performance
  Scenario: TC_07 Performance test for calls/add
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.transactionId|randomInt|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Test_8-positive @Concurrency
  Scenario: TC_08 Concurrent calls to POST /calls/add
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.transactionId|randomInt|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Test_9-positive @StoreResponse
  Scenario: TC_09 Store response and assert fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddCall" payload
      |JPath|Value|
      |$.transactionId|randomInt|
    And I post the request with "POST_AddCall" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I store the response as "postAddCall_response" name using full path
    And verifies the field is not null
      |JPath|
      |$.data.transactionId|
      |$.data.callId|

  #-------------------------------------------------------------------------------------------------
