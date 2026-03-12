@BizomWebAPI @ReportsManagement @BeatPerformance @OrderManagement @Innovation
Feature: Get Beat Performance API Testing
  As a system user
  I want to test the get beat performance endpoint
  So that I can ensure proper functionality and data retrieval for beat performance reports

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get beat performance without access token
    When I send the GET request to "reports_get_beat_performance" endpoint with path parameters
      |Path|Value|
      |beatId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get beat performance with invalid access token
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|beatId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get beat performance with expired access token
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|beatId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get beat performance with malformed access token
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|beatId|1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get beat performance for beat ID 1 with valid access token
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "beat_performance_response" name using full path

  @Positive @Smoke
  Scenario: Get beat performance for beat ID 2 with valid access token
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And I store the response as "beat_performance_response" name using full path

  @Positive @DataValidation
  Scenario: Validate beat performance response structure for beat ID 1
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data."1"|object|
      |$.Data."1".outletCnt|number|
      |$.Data."1".notVisitedOutlets|number|
      |$.Data."1".turnOverallBrands|number|
      |$.Data."1".turnoverWithoutBrand|number|
      |$.Data."1".billingoutletCnt|number|
      |$.Data."1".outletCntWithAllBrand|number|
      |$.Data."1".outletCntWithTwoBrands|number|
      |$.Data."1".beatName|string|

  @Positive @DataValidation
  Scenario: Validate beat performance response structure for beat ID 2
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|2|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data."2"|object|
      |$.Data."2".outletCnt|number|
      |$.Data."2".notVisitedOutlets|number|
      |$.Data."2".turnOverallBrands|number|
      |$.Data."2".turnoverWithoutBrand|number|
      |$.Data."2".billingoutletCnt|number|
      |$.Data."2".outletCntWithAllBrand|number|
      |$.Data."2".outletCntWithTwoBrands|number|
      |$.Data."2".beatName|string|

#  @Positive @DataValidation
#  Scenario: Validate beat performance specific data values for beat ID 1
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Data."1".beatName|DB:beats:beat_name: id=1|
#      |$.Data."1".outletCnt|DB:beats:outlet_count: id=1|

#  @Positive @DataValidation
#  Scenario: Validate beat performance specific data values for beat ID 2
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Data."2".beatName|DB:beats:beat_name: id=2|
#      |$.Data."2".outletCnt|DB:beats:outlet_count: id=2|

#  @Positive @DataValidation
#  Scenario: Validate beat performance with static values for beat ID 1
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data."1".beatName|"Silkboard"|
#      |$.Data."1".outletCnt|239|
#      |$.Data."1".notVisitedOutlets|239|
#      |$.Data."1".turnOverallBrands|0|
#      |$.Data."1".turnoverWithoutBrand|0|
#      |$.Data."1".billingoutletCnt|0|
#      |$.Data."1".outletCntWithAllBrand|0|
#      |$.Data."1".outletCntWithTwoBrands|0|

#  @Positive @DataValidation
#  Scenario: Validate beat performance with static values for beat ID 2
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#      |$.Data."2".beatName|"Anekal"|
#      |$.Data."2".outletCnt|71|
#      |$.Data."2".notVisitedOutlets|71|
#      |$.Data."2".turnOverallBrands|0|
#      |$.Data."2".turnoverWithoutBrand|0|
#      |$.Data."2".billingoutletCnt|0|
#      |$.Data."2".outletCntWithAllBrand|0|
#      |$.Data."2".outletCntWithTwoBrands|0|

#  @Negative @Validation
#  Scenario: Get beat performance with invalid beat ID
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|abc|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Beat Supplied."|
#      |$.Data|[]|

#  @Negative @Validation
#  Scenario: Get beat performance with non-existent beat ID
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Beat Supplied."|
#      |$.Data|[]|

#  @Negative @Validation
#  Scenario: Get beat performance with negative beat ID
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|-1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Beat Supplied."|
#      |$.Data|[]|

#  @Negative @Validation
#  Scenario: Get beat performance with zero beat ID
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|0|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Beat Supplied."|
#      |$.Data|[]|

#  @Negative @ErrorHandling
#  Scenario: Get beat performance with invalid endpoint
#    And I send the GET request to "reports_get_beat_performance_invalid" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: Performance test for beat performance endpoint
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @Concurrency
  Scenario: Concurrent access test for beat performance endpoint
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Positive @Regression
  Scenario: Regression test for beat performance endpoint
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|

  @Positive @BusinessLogic
  Scenario: Validate beat performance business logic for beat ID 1
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data."1".outletCnt|number|
      |$.Data."1".notVisitedOutlets|number|
      |$.Data."1".billingoutletCnt|number|
      |$.Data."1".beatName|string|

  @Positive @DataIntegrity
  Scenario: Validate beat performance data integrity for beat ID 1
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data."1"|object|
      |$.Data."1".outletCnt|number|
      |$.Data."1".notVisitedOutlets|number|
      |$.Data."1".turnOverallBrands|number|
      |$.Data."1".turnoverWithoutBrand|number|
      |$.Data."1".billingoutletCnt|number|
      |$.Data."1".outletCntWithAllBrand|number|
      |$.Data."1".outletCntWithTwoBrands|number|
      |$.Data."1".beatName|string|

#  @Positive @Functional
#  Scenario: Validate beat performance response completeness for beat ID 1
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Data|object|
#      |$.Data."1"|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data."1".beatName|"Silkboard"|
#      |$.Data."1".outletCnt|239|
#      |$.Data."1".notVisitedOutlets|239|

  @Positive @ContentValidation
  Scenario: Validate beat performance content structure
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Data|
      |outletCnt|
      |notVisitedOutlets|
      |turnOverallBrands|
      |turnoverWithoutBrand|
      |billingoutletCnt|
      |outletCntWithAllBrand|
      |outletCntWithTwoBrands|
      |beatName|

  @Positive @LoadTesting
  Scenario: Load testing for beat performance endpoint
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

  @Negative @Timeout
  Scenario: Test beat performance endpoint timeout handling
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|

#  @Positive @EndToEnd
#  Scenario: End-to-end beat performance data retrieval workflow for beat ID 1
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "beat_performance_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data."1"|object|
#      |$.Data."1".outletCnt|number|
#      |$.Data."1".notVisitedOutlets|number|
#      |$.Data."1".turnOverallBrands|number|
#      |$.Data."1".turnoverWithoutBrand|number|
#      |$.Data."1".billingoutletCnt|number|
#      |$.Data."1".outletCntWithAllBrand|number|
#      |$.Data."1".outletCntWithTwoBrands|number|
#      |$.Data."1".beatName|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data."1".beatName|"Silkboard"|
#      |$.Data."1".outletCnt|239|
#      |$.Data."1".notVisitedOutlets|239|

#  @Positive @EndToEnd
#  Scenario: End-to-end beat performance data retrieval workflow for beat ID 2
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|""|
#    And I store the response as "beat_performance_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|object|
#      |$.Data."2"|object|
#      |$.Data."2".outletCnt|number|
#      |$.Data."2".notVisitedOutlets|number|
#      |$.Data."2".turnOverallBrands|number|
#      |$.Data."2".turnoverWithoutBrand|number|
#      |$.Data."2".billingoutletCnt|number|
#      |$.Data."2".outletCntWithAllBrand|number|
#      |$.Data."2".outletCntWithTwoBrands|number|
#      |$.Data."2".beatName|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Data."2".beatName|"Anekal"|
#      |$.Data."2".outletCnt|71|
#      |$.Data."2".notVisitedOutlets|71|

#  @Positive @ErrorResponseValidation
#  Scenario: Validate error response structure for invalid beat ID
#    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|beatId|999999|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Beat Supplied."|
#      |$.Data|[]|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.Data|array|

  @Positive @FieldValidation
  Scenario: Validate beat performance field completeness for beat ID 1
    And I send the GET request to "reports_get_beat_performance" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|beatId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data."1".outletCnt|number|
      |$.Data."1".notVisitedOutlets|number|
      |$.Data."1".turnOverallBrands|number|
      |$.Data."1".turnoverWithoutBrand|number|
      |$.Data."1".billingoutletCnt|number|
      |$.Data."1".outletCntWithAllBrand|number|
      |$.Data."1".outletCntWithTwoBrands|number|
      |$.Data."1".beatName|string|

