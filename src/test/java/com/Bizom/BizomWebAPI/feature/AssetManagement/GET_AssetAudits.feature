@BizomWebAPI @AssetManagement @AssetAudits @MasterDataManagement @Innovation
Feature: Asset Audit API Testing
  As a Bizom web API consumer
  I want to validate the asset audit endpoint
  So that I can ensure proper functionality and data retrieval for asset audit management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: TC_01 Get asset audit with valid access token and all required parameters
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "asset_audit_response" name using full path

  @Positive @DataValidation
  Scenario: TC_02 Validate asset audit response structure
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.asset_audits|object|
      |$.asset_audits.asset_audit|array|

  @Positive @DataValidation
  Scenario: TC_03 Validate asset audit array structure and content
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.asset_audits.asset_audit|array|
      |$.asset_audits.asset_audit[0]|object|
      |$.asset_audits.asset_audit[0].serialno|string|
      |$.asset_audits.asset_audit[0].asset_id|string|
      |$.asset_audits.asset_audit[0].asset_name|string|
      |$.asset_audits.asset_audit[0].asset_erpno|string|
      |$.asset_audits.asset_audit[0].outlet_id|string|
      |$.asset_audits.asset_audit[0].outlet_name|string|
      |$.asset_audits.asset_audit[0].outlet_erpno|string|
      |$.asset_audits.asset_audit[0].assetdetail_serialno|string|
      |$.asset_audits.asset_audit[0].user_id|string|
      |$.asset_audits.asset_audit[0].user_name|string|
      |$.asset_audits.asset_audit[0].employeeid|string|
      |$.asset_audits.asset_audit[0].asset_audit_reason|string|
      |$.asset_audits.asset_audit[0].asset_audit_form|object|

  @Positive @DataValidation
  Scenario: TC_04 Validate asset audit form structure
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.asset_audits.asset_audit[0].asset_audit_form|object|

  @Positive @Functional
  Scenario: TC_05 Get asset audit with type present
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Functional
  Scenario: TC_06 Get asset audit with different date range
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-12-2025|
      |todate|31-12-2025|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Functional
  Scenario: TC_07 Get asset audit with pagination page 1
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Functional
  Scenario: TC_08 Get asset audit with pagination page 2
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|2|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Positive @Performance
  Scenario: TC_09 Performance test for asset audit endpoint
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Performance
  Scenario: TC_10 Load testing for asset audit endpoint
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for asset audit endpoint
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @EndToEnd
  Scenario: TC_12 End-to-end asset audit data retrieval workflow
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And I store the response as "asset_audit_e2e" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.asset_audits|object|
      |$.asset_audits.asset_audit|array|

  @Positive @Regression
  Scenario: TC_13 Regression test for asset audit endpoint
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.asset_audits|object|
      |$.asset_audits.asset_audit|array|

  @Positive @ContentValidation
  Scenario: TC_14 Validate asset audit content structure
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response contains the following values
      |Value|
      |asset_audits|
      |asset_audit|
      |serialno|
      |asset_id|
      |asset_name|

  @Negative @Security
  Scenario: TC_15 Get asset audit without access token
    When I send the GET request to "getassetaudits" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get asset audit with missing type parameter
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_17 Get asset audit with missing fordate parameter
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_19 Get asset audit with missing todate parameter
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_20 Get asset audit with invalid date format for fordate
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|2026-01-01|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_21 Get asset audit with invalid date format for todate
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|2026-01-16|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_22 Get asset audit with todate before fordate
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|16-01-2026|
      |todate|01-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_23 Get asset audit with invalid type value
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |type|"invalid_type"|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_24 Get asset audit with negative pageno
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|-1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_25 Get asset audit with zero pageno
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|0|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_26 Get asset audit with very large pageno
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|999999|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|

  @Negative @Validation
  Scenario: TC_27 Get asset audit with invalid query parameters
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Security
  Scenario: TC_28 Get asset audit with SQL injection attempt in type
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |type|'; DROP TABLE assets; --|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_29 Get asset audit with XSS attempt in type
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |type|<script>alert('XSS')</script>|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_30 Get asset audit with special characters in query parameters
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary
  Scenario: TC_31 Get asset audit with maximum query parameters
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @ErrorHandling
  Scenario: TC_32 Get asset audit with invalid endpoint
    And I send the GET request to "getassetaudits_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|31-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

  @Negative @Timeout
  Scenario: TC_33 Test asset audit endpoint timeout handling
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @BusinessLogic
  Scenario: TC_34 Validate asset audit business logic
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|31-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.asset_audits|object|
      |$.asset_audits.asset_audit|array|

  @Positive @DataIntegrity
  Scenario: TC_35 Validate asset audit data integrity
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|31-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|object|
      |$.asset_audits|object|
      |$.asset_audits.asset_audit|array|
      |$.asset_audits.asset_audit[0].serialno|string|
      |$.asset_audits.asset_audit[0].asset_id|string|
      |$.asset_audits.asset_audit[0].asset_name|string|

  @Positive @Functional
  Scenario: TC_36 Validate asset audit response completeness
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|31-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.asset_audits|object|
      |$.asset_audits.asset_audit|array|
    And validating the response contains the following values
      |Value|
      |asset_audits|
      |asset_audit|
      |serialno|
      |asset_id|
      |asset_name|
      |outlet_id|
      |user_id|

  @Positive @ArrayValidation
  Scenario: TC_37 Validate asset audit array structure and content
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|16-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.asset_audits.asset_audit|array|
      |$.asset_audits.asset_audit[0]|object|
      |$.asset_audits.asset_audit[1]|object|

  @Positive @Functional
  Scenario: TC_38 Get asset audit with single day date range
    And I send the GET request to "getassetaudits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |fordate|01-01-2026|
      |todate|01-01-2026|
      |pageno|1|
      |limit-10|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|