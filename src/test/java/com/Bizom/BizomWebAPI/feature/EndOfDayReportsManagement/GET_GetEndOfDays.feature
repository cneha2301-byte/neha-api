@BizomWebAPI @CE @ReportsAnalytics @EndOfDayReportsManagement @EndOfDayGetEndOfDays
Feature: End of Day Reports API Testing
  As a system user
  I want to test the getendofdays endpoint
  So that I can ensure proper functionality and data retrieval for end of day reports management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get end of days without access token
    When I send the GET request to "endofdayreports_get_end_of_days" endpoint
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get end of days with invalid access token
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get end of days with expired access token
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get end of days with malformed access token
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get end of days with valid access token
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "getEndOfDays_response" name using full path

  @Positive @DataValidation
  Scenario: Validate get end of days response structure
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|String|
      |$.Endofdays|Array|

  @Positive @DataValidation
  Scenario: Validate get end of days Endofdayreport structure
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Endofdays|Array|
      |$.Endofdays[0]|Object|
      |$.Endofdays[0].Endofdayreport|Object|
      |$.Endofdays[0].Endofdayreport.fordate|String|
      |$.Endofdays[0].Endofdayreport.user_id|String|
      |$.Endofdays[0].Endofdayreport.targetamount|Number|
      |$.Endofdays[0].Endofdayreport.newoutlets|Number|
      |$.Endofdays[0].Endofdayreport.achievementamount|Number|
      |$.Endofdays[0].Endofdayreport.tlsd|Number|
      |$.Endofdays[0].Endofdayreport.lpsc|Number|
      |$.Endofdays[0].Endofdayreport.modifieddate|String|
      |$.Endofdays[0].Endofdayreport.eod_submitted|Number|
      |$.Endofdays[0].Endofdayreport.totalcashamount|Number|
      |$.Endofdays[0].Endofdayreport.totalcreditamount|Number|
      |$.Endofdays[0].Endofdayreport.totaldiscount|Number|
      |$.Endofdays[0].Endofdayreport.totaldamaged|Number|
      |$.Endofdays[0].Endofdayreport.on_location|String|
      |$.Endofdays[0].Endofdayreport.lastcallendtime|String|
      |$.Endofdays[0].Endofdayreport.off_location|Number|
      |$.Endofdays[0].Endofdayreport.TC|String|
      |$.Endofdays[0].Endofdayreport.PC|String|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary|Array|
      |$.Endofdays[0].Endofdayreport.totalproductivesales|String|
      |$.Endofdays[0].Endofdayreport.totalsales|String|
      |$.Endofdays[0].Endofdayreport.totalnonpjpcalls|Number|
      |$.Endofdays[0].Endofdayreport.totalnonpjpproductivecalls|Number|
      |$.Endofdays[0].Endofdayreport.outletsaddedtoday|Number|
      |$.Endofdays[0].Endofdayreport.newcalls|Number|
      |$.Endofdays[0].Endofdayreport.newcalls_productive_order|Number|
      |$.Endofdays[0].Endofdayreport.newcalls_productive_payment|Number|
      |$.Endofdays[0].Endofdayreport.productive_calls_secondary|Number|
      |$.Endofdays[0].Endofdayreport.dropsize|Number|
      |$.Endofdays[0].Endofdayreport.percentproductivity|Number|
      |$.Endofdays[0].Endofdayreport.todaybeat|String|
      |$.Endofdays[0].Endofdayreport.Endofdaydetails|Array|

  @Positive @DataValidation
  Scenario: Validate get end of days specific data values
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataValidation
  Scenario: Validate get end of days with static values
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @Performance
  Scenario: Performance test for get end of days endpoint
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @Concurrency
  Scenario: Concurrent access test for get end of days endpoint
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: Get end of days with invalid query parameters
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |invalid_param|invalid_value|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: Get end of days with special characters in query parameters
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Security
  Scenario: Get end of days with SQL injection attempt
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |test_param|'; DROP TABLE endofdayreports; --|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Boundary
  Scenario: Get end of days with maximum query parameters
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @ErrorHandling
  Scenario: Get end of days with invalid endpoint
    And I send the GET request to "endofdayreports_get_end_of_days_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate get end of days business logic
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @Positive @DataIntegrity
  Scenario: Validate get end of days data integrity
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|String|
      |$.Endofdays|Array|
      |$.Endofdays[0].Endofdayreport.fordate|String|
      |$.Endofdays[0].Endofdayreport.user_id|String|
      |$.Endofdays[0].Endofdayreport.targetamount|Number|
      |$.Endofdays[0].Endofdayreport.newoutlets|Number|
      |$.Endofdays[0].Endofdayreport.achievementamount|Number|

  @Positive @Regression
  Scenario: Regression test for get end of days endpoint
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|String|
      |$.Endofdays|Array|

  @Positive @Functional
  Scenario: Validate get end of days response completeness
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Endofdays|Array|
      |$.Endofdays[0].Endofdayreport|Object|
      |$.Endofdays[0].Endofdayreport.fordate|String|
      |$.Endofdays[0].Endofdayreport.user_id|String|
      |$.Endofdays[0].Endofdayreport.targetamount|Number|
      |$.Endofdays[0].Endofdayreport.newoutlets|Number|
      |$.Endofdays[0].Endofdayreport.achievementamount|Number|

  @Positive @ArrayValidation
  Scenario: Validate get end of days array structure and content
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Endofdays|Array|
      |$.Endofdays[0]|Object|
      |$.Endofdays[0].Endofdayreport|Object|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary|Array|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary[0]|Object|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary[0].id|Number|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary[0].name|String|
      |$.Endofdays[0].Endofdayreport.Endofdaydetails|Array|

  @Positive @ContentValidation
  Scenario: Validate get end of days content structure
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Endofdays|
      |Endofdayreport|
      |fordate|
      |user_id|
      |targetamount|
      |newoutlets|
      |achievementamount|
      |tlsd|
      |lpsc|
      |modifieddate|
      |eod_submitted|
      |totalcashamount|
      |totalcreditamount|
      |totaldiscount|
      |totaldamaged|
      |on_location|
      |off_location|
      |TC|
      |PC|
      |totalcallssecondary|
      |totalproductivesales|
      |totalsales|
      |totalnonpjpcalls|
      |totalnonpjpproductivecalls|
      |outletsaddedtoday|
      |newcalls|
      |newcalls_productive_order|
      |newcalls_productive_payment|
      |productive_calls_secondary|
      |dropsize|
      |percentproductivity|
      |todaybeat|
      |Endofdaydetails|

  @Positive @LoadTesting
  Scenario: Load testing for get end of days endpoint
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Timeout
  Scenario: Test get end of days endpoint timeout handling
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Positive @EndToEnd
  Scenario: End-to-end get end of days data retrieval workflow
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|en|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I store the response as "getEndOfDays_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|String|
      |$.Reason|String|
      |$.Endofdays|Array|
      |$.Endofdays[0].Endofdayreport|Object|
      |$.Endofdays[0].Endofdayreport.fordate|String|
      |$.Endofdays[0].Endofdayreport.user_id|String|
      |$.Endofdays[0].Endofdayreport.targetamount|Number|
      |$.Endofdays[0].Endofdayreport.on_location|String|
      |$.Endofdays[0].Endofdayreport.TC|String|
      |$.Endofdays[0].Endofdayreport.PC|String|
      |$.Endofdays[0].Endofdayreport.totalcallssecondary|Array|
      |$.Endofdays[0].Endofdayreport.Endofdaydetails|Array|

  @Positive @DataValidation
  Scenario: Get end of days with different language parameter
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |language|hi|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|

  @Negative @Validation
  Scenario: Get end of days with missing language parameter
    And I send the GET request to "endofdayreports_get_end_of_days" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|



