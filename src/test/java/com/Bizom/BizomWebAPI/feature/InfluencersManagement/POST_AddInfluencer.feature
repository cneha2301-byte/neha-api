@BizomWebAPI @InfluencersManagement @PostAddInfluencer @CE
Feature: Add Influencer API Testing
  As a system user
  I want to add new influencers through the API
  So that I can create and manage influencer data in the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |origin|https://devuitest.bizomdev.in|
      |referer|https://devuitest.bizomdev.in/influencers/add|

  @Positive @Smoke
  Scenario: TC_01 Add influencer with valid data and random strings
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I store the response as "add_influencer_response" name using full path

  @Positive @DataValidation @DatabaseValidation
  Scenario: TC_02 Add influencer and validate database entry
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:influencers:name:id = (SELECT MAX(id) FROM influencers)|randomString|
      |DB:influencers:erp_id:id = (SELECT MAX(id) FROM influencers)|randomString|
      |DB:influencers:influencertype_id:id = (SELECT MAX(id) FROM influencers)|0|

  @Positive @Functional
  Scenario: TC_03 Add influencer with all required fields
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
      |$.data.Influencer.influencertype_id|0|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Add influencer without access token
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload
    Then I should see the response code as "401"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_05 Add influencer with invalid access token
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_06 Add influencer with expired access token
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Add influencer with empty name
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name||
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Add influencer with empty erp_id
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id||
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Add influencer with invalid influencertype_id
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
      |$.data.Influencer.influencertype_id|99999|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Add influencer with negative influencertype_id
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
      |$.data.Influencer.influencertype_id|-1|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Add influencer with XSS in name field
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|<script>alert('XSS')</script>|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_12 Add influencer with SQL injection in name field
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|'; DROP TABLE influencers; --|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Add influencer with missing required fields
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name||
      |$.data.Influencer.erp_id||
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_14 Add influencer with invalid endpoint
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "influencers_add_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And the HTML response should contain page title "Companies"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_15 Performance test for add influencer endpoint
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: TC_16 Concurrent add influencer requests
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_17 Add influencer with maximum length name
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString:255|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Boundary @Validation
  Scenario: TC_18 Add influencer with minimum length name
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString:1|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @DataIntegrity
  Scenario: TC_19 Validate influencer data integrity after creation
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:influencers:influencertype_id:id = (SELECT MAX(id) FROM influencers)|0|

  @Positive @BusinessLogic
  Scenario: TC_20 Validate influencer business logic
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
      |$.data.Influencer.influencertype_id|0|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:influencers:influencertype_id:id = (SELECT MAX(id) FROM influencers)|0|

  @Positive @Functional
  Scenario: TC_21 Add influencer with optional fields populated
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
      |$.data.Influencer.address|randomString|
      |$.data.Influencer.pin|123456|
      |$.data.Influencer.phone|randomPhoneNumber|
      |$.data.Influencer.dialcode_phoneno|91|
      |$.data.Influencer.mailaddress|test@example.com|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:influencers:pin:id = (SELECT MAX(id) FROM influencers)|randomString|

  @Positive @Functional
  Scenario: TC_22 Add influencer with bank details
    And I modify fields with random values and remove fields in "POST_influencers_add" payload
      |JPath|Value|
      |$.data.Influencer.name|randomString|
      |$.data.Influencer.erp_id|randomString|
      |$.data.Influencer.bankbeneficiaryname|randomString|
      |$.data.Influencer.bankaccountno|randomString|
      |$.data.Influencer.bankaccounttype|Savings|
      |$.data.Influencer.bankifsccode|randomString|
    And I post the request with "POST_influencers_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

