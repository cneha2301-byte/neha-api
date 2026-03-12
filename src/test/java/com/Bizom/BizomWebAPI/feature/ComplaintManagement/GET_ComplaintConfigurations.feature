@BizomWebAPI @ComplaintManagement @ComplaintConfigurations @SupportingFunctions @Innovation
Feature: This feature file contains testcases for GET endpoint Complaint Configurations

  @PositiveScenario
  Scenario: TC_01 Complaint Configurations - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "1200" milliseconds
    And I store the response as "complaint_configurations_response" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Complaint Configurations - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.ComplaintStatuses|array|
      |$.Data.ComplaintConfigurations|array|
      |$.Data.ComplaintTypes|array|
      |$.Data.ComplaintPriorities|array|
      |$.Data.ComplaintStatuses[0].id|string|
      |$.Data.ComplaintStatuses[0].name|string|
      
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_03 Complaint Configurations - comprehensive database validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data.ComplaintStatuses[0].id|"1"|
      |$.Data.ComplaintStatuses[0].name|DB:complaintstatuses:name: id=1|
      |$.Data.ComplaintStatuses[0].name_alias|DB:complaintstatuses:name_alias: id=1|
      |$.Data.ComplaintStatuses[1].id|"2"|
      |$.Data.ComplaintStatuses[1].name|DB:complaintstatuses:name: id=2|
      |$.Data.ComplaintStatuses[1].name_alias|DB:complaintstatuses:name_alias: id=2|
      
  @PositiveScenario @Performance
  Scenario: TC_04 Complaint Configurations - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And verify response time is less than "1000" milliseconds

  @NegativeScenario @Security
  Scenario: TC_05 Complaint Configurations - without access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Security
  Scenario: TC_06 Complaint Configurations - with invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Validation
  Scenario: TC_07 Complaint Configurations - with invalid query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_08 Complaint Configurations - with SQL injection attempt
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE complaintstatuses; --|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @Regression
  Scenario: TC_09 Complaint Configurations - database consistency validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data.ComplaintStatuses[0].id|"1"|
      |$.Data.ComplaintStatuses[0].name|DB:complaintstatuses:name: id=1|
      |$.Data.ComplaintStatuses[0].name_alias|DB:complaintstatuses:name_alias: id=1|
      
  Scenario: TC_10 Complaint Configurations - end-to-end database validation workflow
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data.ComplaintStatuses[0].name|DB:complaintstatuses:name: id=1|
      |$.Data.ComplaintStatuses[0].name_alias|DB:complaintstatuses:name_alias: id=1|
      |$.Data.ComplaintStatuses[1].name|DB:complaintstatuses:name: id=2|
      |$.Data.ComplaintStatuses[1].name_alias|DB:complaintstatuses:name_alias: id=2|

  @PositiveScenario @BusinessLogic
  Scenario: TC_11 Complaint Configurations - validate business logic
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|

  @PositiveScenario @DataIntegrity
  Scenario: TC_12 Complaint Configurations - validate data integrity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.ComplaintStatuses|array|
      |$.Data.ComplaintConfigurations|array|
      |$.Data.ComplaintTypes|array|
      |$.Data.ComplaintPriorities|array|
      |$.Data.ComplaintStatuses[0].id|string|
      |$.Data.ComplaintStatuses[0].name|string|

  @PositiveScenario @Regression
  Scenario: TC_13 Complaint Configurations - regression test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Data|object|
      |$.Data.ComplaintStatuses|array|
      |$.Data.ComplaintConfigurations|array|
      |$.Data.ComplaintTypes|array|
      |$.Data.ComplaintPriorities|array|

  @PositiveScenario @Functional
  Scenario: TC_14 Complaint Configurations - validate response completeness
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|object|
      |$.Data.ComplaintStatuses|array|
      |$.Data.ComplaintConfigurations|array|
      |$.Data.ComplaintTypes|array|
      |$.Data.ComplaintPriorities|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.ComplaintStatuses[0].id|"1"|
      |$.Data.ComplaintStatuses[0].name|"opened"|
      |$.Data.ComplaintStatuses[0].name_alias|"Opened"|
      |$.Data.ComplaintStatuses[0].active|"1"|
      |$.Data.ComplaintStatuses[0].allowaction|"1"|
      |$.Data.ComplaintStatuses[1].id|"2"|
      |$.Data.ComplaintStatuses[1].name|"inprogress"|
      |$.Data.ComplaintStatuses[1].name_alias|"In-Progress"|
      

  @PositiveScenario @ArrayValidation
  Scenario: TC_15 Complaint Configurations - validate array structure and content
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data.ComplaintStatuses|array|
      |$.Data.ComplaintConfigurations|array|
      |$.Data.ComplaintTypes|array|
      |$.Data.ComplaintPriorities|array|
      |$.Data.ComplaintStatuses[0]|object|
      |$.Data.ComplaintStatuses[1]|object|
      |$.Data.ComplaintStatuses[2]|object|
      |$.Data.ComplaintStatuses[3]|object|
      |$.Data.ComplaintTypes[0]|object|
      |$.Data.ComplaintTypes[1]|object|
      |$.Data.ComplaintTypes[2]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data.ComplaintStatuses[0].id|"1"|
      |$.Data.ComplaintStatuses[0].name|"opened"|
      |$.Data.ComplaintStatuses[0].name_alias|"Opened"|
      |$.Data.ComplaintStatuses[1].id|"2"|
      |$.Data.ComplaintStatuses[1].name|"inprogress"|
      |$.Data.ComplaintStatuses[1].name_alias|"In-Progress"|
      |$.Data.ComplaintStatuses[2].id|"3"|
      |$.Data.ComplaintStatuses[2].name|"closed"|
      |$.Data.ComplaintStatuses[2].name_alias|"Closed"|
      |$.Data.ComplaintStatuses[3].id|"4"|
      |$.Data.ComplaintStatuses[3].name|"rejected"|
      |$.Data.ComplaintStatuses[3].name_alias|"Rejected"|
      |$.Data.ComplaintTypes[0].id|"1"|
      |$.Data.ComplaintTypes[0].name|"asset"|
      |$.Data.ComplaintTypes[0].name_alias|"Asset"|
      |$.Data.ComplaintTypes[1].id|"2"|
      |$.Data.ComplaintTypes[1].name|"skunit"|
      |$.Data.ComplaintTypes[1].name_alias|"Skunit"|
      |$.Data.ComplaintTypes[2].id|"3"|
      |$.Data.ComplaintTypes[2].name|"skucategory"|
      |$.Data.ComplaintTypes[2].name_alias|"Skunit Category"|

  @PositiveScenario @ContentValidation
  Scenario: TC_16 Complaint Configurations - validate content structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
    And validating the response contains the following values
      |Value|
      |Data|
      |ComplaintStatuses|
      |ComplaintConfigurations|
      |ComplaintTypes|
      |ComplaintPriorities|
      |id|
      |name|
      |name_alias|
      |active|
      |allowaction|
      |created|
      |modified|
      |nextstatusid|
      |approval_process|
      |defaultcomplaintstatus_id|
      |allowedstatuses|

  @PositiveScenario @LoadTesting
  Scenario: TC_17 Complaint Configurations - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|

  @NegativeScenario @Timeout
  Scenario: TC_18 Complaint Configurations - timeout handling
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|

  @NegativeScenario @ErrorHandling
  Scenario: TC_19 Complaint Configurations - invalid endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @PositiveScenario @Concurrency
  Scenario: TC_20 Complaint Configurations - concurrent access test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|

  @NegativeScenario @Boundary
  Scenario: TC_21 Complaint Configurations - maximum query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|

  @NegativeScenario @Validation
  Scenario: TC_22 Complaint Configurations - special characters in query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintConfigurations" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|"Data fetched successfully."|
