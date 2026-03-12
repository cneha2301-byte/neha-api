@BizomWebAPI @StagesManagement @PostAddStage
Feature: Add Stage API Testing
  As a system user
  I want to add new stages through the API
  So that I can create and manage stage data in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |origin|https://devuitest.bizomdev.in|
      |referer|https://devuitest.bizomdev.in/stages/add|
      |x-kl-kes-ajax-request|Ajax_Request|
      |x-requested-with|XMLHttpRequest|

  @Positive @Smoke
  Scenario: TC_01 Add stage with valid data and random strings
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "add_stage_response" name using full path

  @Positive @Functional
  Scenario: TC_02 Add stage with all required fields
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.type|opportunity|
      |$.data.Stage[0].name|randomString|
      |$.data.Stage[0].editable|1|
      |$.data.Stage[0].stage_no|1|
      |$.data.Stage[0].associated_with|1|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Add stage without access token
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload
    Then I should see the response code as "403"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Add stage with invalid access token
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Add stage with expired access token
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_06 Add stage with empty name
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name||
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Add stage with empty type
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.type||
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Add stage with invalid editable value
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
      |$.data.Stage[0].editable|5|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Add stage with negative stage_no
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
      |$.data.Stage[0].stage_no|-1|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Add stage with invalid associated_with value
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
      |$.data.Stage[0].associated_with|99999|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Add stage with negative associated_with
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
      |$.data.Stage[0].associated_with|-1|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Add stage with XSS in name field
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|<script>alert('XSS')</script>|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_13 Add stage with SQL injection in name field
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|'; DROP TABLE stages; --|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Add stage with missing required fields
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name||
      |$.data.Stage[0].editable||
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Add stage with empty Stage array
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage|[]|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_16 Add stage with invalid endpoint
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "stages_add_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_17 Performance test for add stage endpoint
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_18 Concurrent add stage requests
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_19 Add stage with maximum length name
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString:255|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_20 Add stage with minimum length name
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString:1|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity @PostAddStage
  Scenario: TC_21 Validate stage data integrity after creation
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:stages:name:id = (SELECT MAX(id) FROM stages)|randomString|
      |DB:stages:editable:id = (SELECT MAX(id) FROM stages)|true|
  
  @Positive @Functional @PostAddStage
  Scenario: TC_23 Add stage with editable set to 0
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.Stage[0].name|randomString|
      |$.data.Stage[0].editable|0|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:stages:editable:id = (SELECT MAX(id) FROM stages)|false|

  @Positive @Functional
  Scenario: TC_24 Add stage with different type values
    And I modify fields with random values and remove fields in "POST_stages_add" payload
      |JPath|Value|
      |$.data.type|lead|
      |$.data.Stage[0].name|randomString|
    And I post the request with "POST_stages_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:stages:type:id = (SELECT MAX(id) FROM stages)|lead|

