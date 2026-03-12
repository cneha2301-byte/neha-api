@BizomWebAPI @CE @TargetsManagement @Targets @AchievementMultiUser
Feature: Targets Achievement Multi User API Testing
  As a system user
  I want to test the targets achievement multiuser endpoint
  So that I can ensure proper functionality and JSON response validation for multi-user achievement data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get targets achievement multiuser without access token
    When I send the GET request to "targets_achievementmultiuser" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get targets achievement multiuser with invalid access token
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get targets achievement multiuser with expired access token
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get targets achievement multiuser with malformed access token
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get targets achievement multiuser with valid access token
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
    And verify response time is less than "2500" milliseconds
    And I store the response as "targets_achievementmultiuser_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate targets achievement multiuser JSON response structure
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_07 Validate targets achievement multiuser response data types
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.Result|boolean|
      |$.*.Reason|string|
      |$.*.Startdate|string|
      |$.*.Enddate|string|
      |$.*.user_id|string|
      |$.*.targetachievement|object|
      |$.*.targetachievement.skus|object|
      |$.*.targetachievement.targetamount|number|
      |$.*.targetachievement.targetqnt|number|
      |$.*.targetachievement.tlsd|number|
      |$.*.targetachievement.dropsize|number|
      |$.*.targetachievement.totalcalls|number|
      |$.*.targetachievement.percentproductivecall|number|
      |$.*.targetachievement.lpsc|number|
      |$.*.targetachievement.newoutlets|number|
      |$.*.targetachievement.amountachievement|number|
      |$.*.targetachievement.achievementqnt|number|
      |$.*.targetachievement.tlsdachievement|number|
      |$.*.targetachievement.outletsachievement|number|
      |$.*.targetachievement.tcachievement|number|
      |$.*.targetachievement.lpscachievement|number|
      |$.*.targetachievement.percentproductivecallachievement|number|
      |$.*.targetachievement.dropsizeachievement|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_08 Validate targets achievement multiuser response content
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Achievement data fetched.|
      |Startdate|
      |Enddate|
      |targetachievement|
      |skus|
      |targetamount|
      |targetqnt|
      |tlsd|
      |dropsize|
      |totalcalls|
      |percentproductivecall|
      |lpsc|
      |newoutlets|
      |amountachievement|
      |achievementqnt|
      |tlsdachievement|
      |outletsachievement|
      |tcachievement|
      |lpscachievement|
      |percentproductivecallachievement|
      |dropsizeachievement|
      |user_id|

  @Positive @ResponseHeaders
  Scenario: TC_09 Verify targets achievement multiuser response headers
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @DataValidation
  Scenario: TC_10 Validate targets achievement multiuser skus object structure
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.targetachievement.skus|object|
    And validating the response contains the following values
      |Value|
      |skus|
      |targetamount|
      |targetqnt|

  @Positive @DataValidation
  Scenario: TC_11 Validate targets achievement multiuser individual sku structure
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.targetachievement.skus.*|object|
      |$.*.targetachievement.skus.*.target|number|
      |$.*.targetachievement.skus.*.achievement|number|
      |$.*.targetachievement.skus.*.name|string|
      |$.*.targetachievement.skus.*.skunit_id|string|
      |$.*.targetachievement.skus.*.skucode|string|
      |$.*.targetachievement.skus.*.runrate|number|

  @Positive @DataValidation
  Scenario: TC_12 Validate targets achievement multiuser complete nested structure
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.Result|boolean|
      |$.*.Reason|string|
      |$.*.Startdate|string|
      |$.*.Enddate|string|
      |$.*.user_id|string|
      |$.*.targetachievement|object|
      |$.*.targetachievement.skus|object|
      |$.*.targetachievement.skus.*|object|
      |$.*.targetachievement.skus.*.target|number|
      |$.*.targetachievement.skus.*.achievement|number|
      |$.*.targetachievement.skus.*.name|string|
      |$.*.targetachievement.skus.*.skunit_id|string|
      |$.*.targetachievement.skus.*.skucode|string|
      |$.*.targetachievement.skus.*.runrate|number|
      |$.*.targetachievement.targetamount|number|
      |$.*.targetachievement.targetqnt|number|
      |$.*.targetachievement.tlsd|number|
      |$.*.targetachievement.dropsize|number|
      |$.*.targetachievement.totalcalls|number|
      |$.*.targetachievement.percentproductivecall|number|
      |$.*.targetachievement.lpsc|number|
      |$.*.targetachievement.newoutlets|number|
      |$.*.targetachievement.amountachievement|number|
      |$.*.targetachievement.achievementqnt|number|
      |$.*.targetachievement.tlsdachievement|number|
      |$.*.targetachievement.outletsachievement|number|
      |$.*.targetachievement.tcachievement|number|
      |$.*.targetachievement.lpscachievement|number|
      |$.*.targetachievement.percentproductivecallachievement|number|
      |$.*.targetachievement.dropsizeachievement|number|

  @Positive @Performance
  Scenario: TC_13 Performance test for targets achievement multiuser endpoint
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|

  @Positive @Concurrency
  Scenario: TC_14 Concurrent access test for targets achievement multiuser endpoint
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|

  @Negative @Validation
  Scenario: TC_15 Get targets achievement multiuser with invalid query parameters
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|

  @Negative @Validation
  Scenario: TC_16 Get targets achievement multiuser with special characters in query parameters
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|

  @Negative @Security
  Scenario: TC_17 Get targets achievement multiuser with SQL injection attempt
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE targets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|

  @Negative @Boundary
  Scenario: TC_18 Get targets achievement multiuser with maximum query parameters
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|

  @Negative @ErrorHandling
  Scenario: TC_19 Get targets achievement multiuser with invalid endpoint
    And I send the GET request to "targets_achievementmultiuser_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_20 Verify targets achievement multiuser endpoint functionality
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "application/json"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|

  @Positive @BusinessLogic
  Scenario: TC_21 Validate targets achievement multiuser business logic
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.targetachievement|object|
      |$.*.targetachievement.skus|object|
      |$.*.targetachievement.targetamount|number|
      |$.*.targetachievement.amountachievement|number|

  @Positive @DataIntegrity
  Scenario: TC_22 Validate targets achievement multiuser data integrity
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.Result|boolean|
      |$.*.Reason|string|
      |$.*.Startdate|string|
      |$.*.Enddate|string|
      |$.*.user_id|string|
      |$.*.targetachievement|object|
      |$.*.targetachievement.skus|object|
      |$.*.targetachievement.targetamount|number|
      |$.*.targetachievement.targetqnt|number|
      |$.*.targetachievement.tlsd|number|
      |$.*.targetachievement.dropsize|number|
      |$.*.targetachievement.totalcalls|number|
      |$.*.targetachievement.percentproductivecall|number|
      |$.*.targetachievement.lpsc|number|
      |$.*.targetachievement.newoutlets|number|
      |$.*.targetachievement.amountachievement|number|
      |$.*.targetachievement.achievementqnt|number|
      |$.*.targetachievement.tlsdachievement|number|
      |$.*.targetachievement.outletsachievement|number|
      |$.*.targetachievement.tcachievement|number|
      |$.*.targetachievement.lpscachievement|number|
      |$.*.targetachievement.percentproductivecallachievement|number|
      |$.*.targetachievement.dropsizeachievement|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And verify response time is less than "2500" milliseconds

  @Positive @Regression
  Scenario: TC_23 Regression test for targets achievement multiuser endpoint
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.Result|boolean|
      |$.*.Reason|string|
      |$.*.Startdate|string|
      |$.*.Enddate|string|
      |$.*.user_id|string|
      |$.*.targetachievement|object|
      |$.*.targetachievement.skus|object|

  @Positive @Functional
  Scenario: TC_24 Validate targets achievement multiuser response completeness
    And I send the GET request to "targets_achievementmultiuser" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.*.Result|[true]|
      |$.*.Reason|["Achievement data fetched."]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.*.Result|boolean|
      |$.*.Reason|string|
      |$.*.Startdate|string|
      |$.*.Enddate|string|
      |$.*.user_id|string|
      |$.*.targetachievement|object|
      |$.*.targetachievement.skus|object|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Achievement data fetched.|
      |Startdate|
      |Enddate|
      |targetachievement|
      |skus|
      |targetamount|
    And I store the response as "targets_achievementmultiuser_response" name using full path

