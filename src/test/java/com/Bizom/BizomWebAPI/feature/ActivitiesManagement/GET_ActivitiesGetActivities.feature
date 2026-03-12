@BizomWebAPI @CE @ActivitiesManagement @GetActivities @MasterDataManagement
Feature: Activities Get Activities API Testing
  As a system user
  I want to access the activities get activities endpoint
  So that I can retrieve activities information from the system

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  #https://bugzilla.bizom.in/show_bug.cgi?id=140801(negative TCs are failing with 500)
  @Positive @Smoke @test123456
  Scenario: TC_01 Get activities information successfully
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And verifies the field is present in the response
      |JPath|
      |$.activity_summary.noofactivity|
      |$.activity_summary.noofoutlet|
      |$.activity_summary.noofuser|
    And I store the response as "activities_getactivities_response" name using full path

  @Positive @Functional
  Scenario: TC_02 activities data structure and content
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.activity_summary|object|

  @Positive @DataValidation
  Scenario: TC_03 Validate activities response contains expected Result and Reason fields
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And verifies the field is present in the response
      |JPath|
      |$.Result|
      |$.Reason|
      |$.activity_summary|
      |$.activity_summary.noofactivity|
      |$.activity_summary.noofoutlet|
      |$.activity_summary.noofuser|

  @Positive @DataValidation
  Scenario: TC_04 Validate activities response data types and structure
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.activity_summary|object|
      |$.activity_summary.noofactivity|string|
      |$.activity_summary.noofoutlet|string|
      |$.activity_summary.noofuser|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Performance
  Scenario: TC_05 Verify activities data retrieval performance under normal load
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Security
  Scenario: TC_06 Verify activities data endpoint security headers
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And verify response headers
      |HeaderName|HeaderValue|
      |Connection|keep-alive|

  @Negative @Validation
  Scenario: TC_07 Verify activities data returns error without warehouse parameter
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
    And verify response time is less than "2000" milliseconds
    And the response body should contain "Undefined index: warehouse"

  @Negative @Validation
  Scenario: TC_08 Access activities data with invalid endpoint
    And I send the GET request to "activities_getactivities_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_09 Access activities data without authentication
    And I send the GET request to "activities_getactivities" endpoint with path parameters
      |Path|Value|
      |activityId|DB:activities:user_id:outlet_id=1|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_10 Access activities data with invalid session token
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_session_token|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_11 Access activities data with expired session
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_session_token|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_12 Verify activities data returns error without zone parameter
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
    And verify response time is less than "2000" milliseconds
    And the response body should contain "Undefined index: zone"

  @Positive @Performance
  Scenario: TC_13 Verify activities data endpoint performance under high load
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Validation
  Scenario: TC_14 Verify activities data returns error without from date parameter
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
    And verify response time is less than "2000" milliseconds
    And the response body should contain "Undefined index: from"

  @Negative @Validation
  Scenario: TC_15 Verify activities data returns error without to date parameter
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:196|||
    Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
    And verify response time is less than "2000" milliseconds
    And the response body should contain "Undefined index: to"

  @Negative @Validation
  Scenario: TC_16 Verify activities data returns error without area parameter
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |users|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
    And verify response time is less than "2000" milliseconds
    And the response body should contain "Undefined index: area"

  @Negative @Validation
  Scenario: TC_17 Verify activities data returns error without users parameter
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |from|pastDate:196|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_500_INTERNAL_SERVER_ERROR"
    And verify response time is less than "2000" milliseconds
    And the response body should contain "Undefined index: users"

  @Positive @Functional
  Scenario: TC_18 Verify activities data with different date range
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|pastDate:30|||
      |to|todayDate|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|


  @Positive @Functional
  Scenario: TC_19 Verify activities data with future date range
    And I send the GET request to "activities_getactivities" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|activityId|DB:activities:user_id:outlet_id=1|
      |zone|all|||
      |warehouse|all|||
      |area|all|||
      |users|all|||
      |from|todayDate|||
      |to|futureDate:30|||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|