@BizomWebAPI @PI @SchemesManagement @SaveSchemeEnrolment @PaymentProcessing
Feature: SaveSchemeEnrolment API Testing
  As a system user
  I want to test the saveSchemeEnrolment endpoint
  So that I can ensure proper functionality for saving scheme enrolment data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Save scheme enrolment without access token
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token||
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Save scheme enrolment with invalid access token
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Save scheme enrolment with expired access token
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Save scheme enrolment with malformed access token
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Save scheme enrolment with valid parameters
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Scheme cannot be enrolled after Scheme end date."|
    And I store the response as "saveschemeenrolment_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate save scheme enrolment response structure
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Scheme cannot be enrolled after Scheme end date."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.EnrolledData|object|

  @Positive @DataValidation
  Scenario: TC_07 Validate EnrolledData object structure
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.EnrolledData|object|
      |$.EnrolledData["21"]|object|
      |$.EnrolledData["21"].id|string|
      |$.EnrolledData["21"].warehouse_id|string|
      |$.EnrolledData["21"].outlet_id|string|
      |$.EnrolledData["21"].schemegroup_id|string|
      |$.EnrolledData["21"].scheme_id|string|
      |$.EnrolledData["21"].enroldate|string|
      |$.EnrolledData["21"].createdby_user|string|
      |$.EnrolledData["21"].modifiedby_user|string|
      |$.EnrolledData["21"].createdby_username|string|
      |$.EnrolledData["21"].modifiedby_username|string|

  @Positive @DataValidation
  Scenario: TC_08 Validate EnrolledData nested object fields
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.EnrolledData["21"].warehouse_id|"2"|
      |$.EnrolledData["21"].outlet_id|"19"|
      |$.EnrolledData["21"].schemegroup_id|"21"|
      |$.EnrolledData["21"].scheme_id|"25"|

  @Positive @DataValidation
  Scenario: TC_09 Validate save scheme enrolment response contains required fields
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |EnrolledData|
      |id|
      |warehouse_id|
      |outlet_id|
      |schemegroup_id|
      |scheme_id|
      |enroldate|
      |createdby_username|

  @Negative @Validation
  Scenario: TC_10 Save scheme enrolment with invalid warehouseId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.warehouseId|abc|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_11 Save scheme enrolment with invalid outletId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.outletId|xyz|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_12 Save scheme enrolment with invalid schemegroupId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.schemegroupId|invalid|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_13 Save scheme enrolment with invalid schemeId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.schemeId|invalid|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Save scheme enrolment with missing warehouseId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.warehouseId|""|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Save scheme enrolment with missing outletId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.outletId|""|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Save scheme enrolment with missing schemegroupId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.schemegroupId|""|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Save scheme enrolment with missing schemeId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.schemeId|""|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_18 Save scheme enrolment with empty body
    And I send empty body with "POST_save_scheme_enrolment" request
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: TC_19 Save scheme enrolment with invalid endpoint
    And I post the request with "POST_save_scheme_enrolment_invalid" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_20 Performance test for save scheme enrolment endpoint
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @BusinessLogic
  Scenario: TC_21 Save scheme enrolment with different warehouseId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.warehouseId|1|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @BusinessLogic
  Scenario: TC_22 Save scheme enrolment with different outletId
    And I modify fields with random values and remove fields in "POST_save_scheme_enrolment" payload
      |JPath|Value|
      |$.outletId|1|
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"

  @Positive @Regression
  Scenario: TC_23 Regression test for save scheme enrolment endpoint
    And I post the request with "POST_save_scheme_enrolment" payload with dynamic access token and query parameters
      |Query|Value|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "application/json; charset=UTF-8"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Scheme cannot be enrolled after Scheme end date."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.EnrolledData|object|
      |$.EnrolledData["21"]|object|
    And I store the response as "saveschemeenrolment_response" name using full path

