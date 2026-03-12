@BizomWebAPI @CE @ActivitiesManagement @Activities @SystemIntegration
Feature: Add Activity API Testing
  As a system user
  I want to test the activity add endpoint
  So that I can create activities and validate responses for valid and invalid payloads

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: TC_01 Add activity - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.transactionid|randomTransactionId|
      |$.Activity.fordate|2025-12-10 10:00:00|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"update successfully"|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Add activity without access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token| |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_03 Add activity with missing required field - transactionid
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.transactionid|""|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_04 Add activity with invalid endpoint
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#    And I post the request with "POST_activities_add_invalid" payload with dynamic access token and query parameters
#      |Query|Value|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

  @Positive @DataTypes
  Scenario: TC_05 Add activity - numeric typed fields (numbers instead of strings)
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.activitytype_id|6|
      |$.Activity.latitude|28.8381808|
      |$.Activity.longitude|78.7538197|
      |$.Activity.outlet_id|1|
      |$.Activity.accuracy|10|
      |$.Activity.mocklocation|0|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|"update successfully"|
    And verify response time is less than "2500" milliseconds

  @Positive @DataTypes
  Scenario: TC_06 Add activity - boolean and decimal types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.accuracy|10.5|
      |$.Activity.mocklocation|true|
      |$.Activity.activitytype_id|"6"|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_07 Add activity - null and empty fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.oldlatlong|""|
      |$.Activity.comment|""|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_08 Add activity - invalid latitude/longitude types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.latitude|"not_a_lat"|
      |$.Activity.longitude|"not_a_lng"|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_09 Add activity - missing outlet_id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.outlet_id|""|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"false"|
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_10 Add activity - invalid activitytype_id (non-numeric)
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.activitytype_id|"invalid_type"|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_11 Add activity - SQL injection in comment
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.comment|"'; DROP TABLE activities; --"|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And verify response time is less than "2500" milliseconds

  @Positive @DataTypes
  Scenario: TC_12 Add activity - very large comment and unicode characters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I modify fields with random values and remove fields in "POST_activities_add" payload
      |JPath|Value|
      |$.Activity.comment|"This is a very large comment \u2014 testing unicode and long text. Lorem ipsum dolor sit amet, consectetur adipiscing elit."|
      |$.Activity.transactionid|randomTransactionId|
    And I post the request with "POST_activities_add" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And verify response time is less than "2500" milliseconds
