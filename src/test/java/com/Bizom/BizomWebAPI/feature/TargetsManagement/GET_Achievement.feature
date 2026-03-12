@BizomWebAPI @CE @TargetsManagement @Targets @Achievement @OutletManagement
Feature: Targets Achievement API Testing
  As a system user
  I want to test the targets achievement endpoint
  So that I can ensure proper functionality and data retrieval for target achievement data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get targets achievement without access token
    When I send the GET request to "targets_achievement" endpoint with path parameters
      |Path|Value|
      |fromDate|07-01-2022|
      |toDate|07-01-2024|
      |userId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get targets achievement with invalid access token
#    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|fromDate|07-01-2022|
#      |||toDate|07-01-2024|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get targets achievement with expired access token
#    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|fromDate|07-01-2022|
#      |||toDate|07-01-2024|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get targets achievement with malformed access token
#    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|malformed.token.here|fromDate|07-01-2022|
#      |||toDate|07-01-2024|
#      |||userId|1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

  @Positive @Smoke
  Scenario: Get targets achievement for valid user ID with valid access token
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Startdate|string|
      |$.Enddate|string|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|
    And I store the response as "targets_achievement_response" name using full path

  @Positive @Functional
  Scenario: Get targets achievement for valid user ID - validate skus structure
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.targetachievement.skus|object|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.targetqnt|number|
      |$.targetachievement.tlsd|number|
      |$.targetachievement.dropsize|number|
      |$.targetachievement.totalcalls|number|
      |$.targetachievement.percentproductivecall|number|
      |$.targetachievement.lpsc|number|
      |$.targetachievement.newoutlets|number|
      |$.targetachievement.amountachievement|number|
      |$.targetachievement.achievementqnt|number|
      |$.targetachievement.tlsdachievement|number|
      |$.targetachievement.outletsachievement|number|
      |$.targetachievement.tcachievement|number|
      |$.targetachievement.lpscachievement|number|
      |$.targetachievement.percentproductivecallachievement|number|
      |$.targetachievement.dropsizeachievement|number|

  @Positive @Functional
  Scenario: Get targets achievement for invalid user ID - validate empty skus
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.targetachievement.skus|array|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.targetqnt|number|
      |$.targetachievement.tlsd|number|
      |$.targetachievement.dropsize|number|
      |$.targetachievement.totalcalls|number|
      |$.targetachievement.percentproductivecall|number|
      |$.targetachievement.lpsc|number|
      |$.targetachievement.newoutlets|number|
      |$.targetachievement.amountachievement|number|
      |$.targetachievement.achievementqnt|number|
      |$.targetachievement.tlsdachievement|number|
      |$.targetachievement.outletsachievement|number|
      |$.targetachievement.tcachievement|number|
      |$.targetachievement.lpscachievement|number|
      |$.targetachievement.percentproductivecallachievement|number|
      |$.targetachievement.dropsizeachievement|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.targetachievement.targetamount|0|
      |$.targetachievement.targetqnt|0|
      |$.targetachievement.tlsd|0|
      |$.targetachievement.dropsize|0|
      |$.targetachievement.totalcalls|0|
      |$.targetachievement.percentproductivecall|0|
      |$.targetachievement.lpsc|0|
      |$.targetachievement.newoutlets|0|
      |$.targetachievement.amountachievement|0|
      |$.targetachievement.achievementqnt|0|
      |$.targetachievement.tlsdachievement|0|
      |$.targetachievement.outletsachievement|0|
      |$.targetachievement.tcachievement|0|
      |$.targetachievement.lpscachievement|0|
      |$.targetachievement.percentproductivecallachievement|0|
      |$.targetachievement.dropsizeachievement|0|

  @Positive @DataValidation
  Scenario: Validate targets achievement response structure for valid user
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Startdate|string|
      |$.Enddate|string|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.targetqnt|number|
      |$.targetachievement.tlsd|number|
      |$.targetachievement.dropsize|number|
      |$.targetachievement.totalcalls|number|
      |$.targetachievement.percentproductivecall|number|
      |$.targetachievement.lpsc|number|
      |$.targetachievement.newoutlets|number|
      |$.targetachievement.amountachievement|number|
      |$.targetachievement.achievementqnt|number|
      |$.targetachievement.tlsdachievement|number|
      |$.targetachievement.outletsachievement|number|
      |$.targetachievement.tcachievement|number|
      |$.targetachievement.lpscachievement|number|
      |$.targetachievement.percentproductivecallachievement|number|
      |$.targetachievement.dropsizeachievement|number|

  @Positive @DataValidation
  Scenario: Validate targets achievement skus object structure
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.targetachievement.skus|object|
    And validating the response contains the following values
      |Value|
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

  @Positive @DataValidation
  Scenario: Validate targets achievement with different date ranges
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|01-01-2023|
      |||toDate|31-12-2023|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2023-01-01|
      |$.Enddate|2023-12-31|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Startdate|string|
      |$.Enddate|string|
      |$.targetachievement|object|

  @Positive @DataValidation
  Scenario: Validate targets achievement with different user IDs
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|

  @Positive @Performance
  Scenario: Performance test for targets achievement endpoint
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|

  @Positive @Concurrency
  Scenario: Concurrent access test for targets achievement endpoint
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|

  @Negative @Validation
  Scenario: Get targets achievement with invalid date format
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|invalid-date|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get targets achievement with invalid toDate format
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|invalid-date|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get targets achievement with fromDate after toDate
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2024|
      |||toDate|07-01-2022|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get targets achievement with non-numeric user ID
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get targets achievement with negative user ID
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get targets achievement with zero user ID
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get targets achievement with very large user ID
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|999999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|

  @Negative @Validation
  Scenario: Get targets achievement with special characters in dates
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|<script>alert('XSS')</script>|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: Get targets achievement with SQL injection attempt in user ID
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|'; DROP TABLE targets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get targets achievement with invalid endpoint
#    And I send the GET request to "targets_achievement_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
#      |||toDate|07-01-2024|
#      |||userId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate targets achievement business logic
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.amountachievement|number|

  @Positive @DataIntegrity
  Scenario: Validate targets achievement data integrity
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Startdate|string|
      |$.Enddate|string|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.targetqnt|number|
      |$.targetachievement.tlsd|number|
      |$.targetachievement.dropsize|number|
      |$.targetachievement.totalcalls|number|
      |$.targetachievement.percentproductivecall|number|
      |$.targetachievement.lpsc|number|
      |$.targetachievement.newoutlets|number|
      |$.targetachievement.amountachievement|number|
      |$.targetachievement.achievementqnt|number|
      |$.targetachievement.tlsdachievement|number|
      |$.targetachievement.outletsachievement|number|
      |$.targetachievement.tcachievement|number|
      |$.targetachievement.lpscachievement|number|
      |$.targetachievement.percentproductivecallachievement|number|
      |$.targetachievement.dropsizeachievement|number|

  @Positive @Regression
  Scenario: Regression test for targets achievement endpoint
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Startdate|string|
      |$.Enddate|string|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|

  @Positive @Functional
  Scenario: Validate targets achievement response completeness
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Startdate|string|
      |$.Enddate|string|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.targetqnt|number|
      |$.targetachievement.tlsd|number|
      |$.targetachievement.dropsize|number|
      |$.targetachievement.totalcalls|number|
      |$.targetachievement.percentproductivecall|number|
      |$.targetachievement.lpsc|number|
      |$.targetachievement.newoutlets|number|
      |$.targetachievement.amountachievement|number|
      |$.targetachievement.achievementqnt|number|
      |$.targetachievement.tlsdachievement|number|
      |$.targetachievement.outletsachievement|number|
      |$.targetachievement.tcachievement|number|
      |$.targetachievement.lpscachievement|number|
      |$.targetachievement.percentproductivecallachievement|number|
      |$.targetachievement.dropsizeachievement|number|

  @Positive @ContentValidation
  Scenario: Validate targets achievement content structure
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Achievement data fetched|
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

  @Positive @FieldSpecificValidation
  Scenario: Validate targets achievement Result field
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Positive @FieldSpecificValidation
  Scenario: Validate targets achievement Reason field
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Reason|Achievement data fetched.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Reason|string|

  @Positive @FieldSpecificValidation
  Scenario: Validate targets achievement Startdate and Enddate fields
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Startdate|string|
      |$.Enddate|string|

  @Positive @FieldSpecificValidation
  Scenario: Validate targets achievement targetachievement object
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.targetqnt|number|
      |$.targetachievement.tlsd|number|
      |$.targetachievement.dropsize|number|
      |$.targetachievement.totalcalls|number|
      |$.targetachievement.percentproductivecall|number|
      |$.targetachievement.lpsc|number|
      |$.targetachievement.newoutlets|number|
      |$.targetachievement.amountachievement|number|
      |$.targetachievement.achievementqnt|number|
      |$.targetachievement.tlsdachievement|number|
      |$.targetachievement.outletsachievement|number|
      |$.targetachievement.tcachievement|number|
      |$.targetachievement.lpscachievement|number|
      |$.targetachievement.percentproductivecallachievement|number|
      |$.targetachievement.dropsizeachievement|number|

  @Positive @LoadTesting
  Scenario: Load testing for targets achievement endpoint
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|

  @Negative @Timeout
  Scenario: Test targets achievement endpoint timeout handling
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|

  @Positive @EndToEnd
  Scenario: End-to-end targets achievement data retrieval workflow
    And I send the GET request to "targets_achievement" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromDate|07-01-2022|
      |||toDate|07-01-2024|
      |||userId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|
    And I store the response as "targets_achievement_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Startdate|string|
      |$.Enddate|string|
      |$.targetachievement|object|
      |$.targetachievement.skus|object|
      |$.targetachievement.targetamount|number|
      |$.targetachievement.targetqnt|number|
      |$.targetachievement.tlsd|number|
      |$.targetachievement.dropsize|number|
      |$.targetachievement.totalcalls|number|
      |$.targetachievement.percentproductivecall|number|
      |$.targetachievement.lpsc|number|
      |$.targetachievement.newoutlets|number|
      |$.targetachievement.amountachievement|number|
      |$.targetachievement.achievementqnt|number|
      |$.targetachievement.tlsdachievement|number|
      |$.targetachievement.outletsachievement|number|
      |$.targetachievement.tcachievement|number|
      |$.targetachievement.lpscachievement|number|
      |$.targetachievement.percentproductivecallachievement|number|
      |$.targetachievement.dropsizeachievement|number|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Achievement data fetched.|
      |$.Startdate|2022-01-07|
      |$.Enddate|2024-01-07|

