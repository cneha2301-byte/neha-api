@BizomWebAPI @ComplaintManagement @ComplaintStatuses @SupportingFunctions @Innovation
Feature: This feature file contains testcases for GET endpoint Complaint Statuses

  @PositiveScenario
  Scenario: TC_01 Complaint Statuses - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "1200" milliseconds
    And I store the response as "complaintstatuses_response" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Complaint Statuses - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|string|
      |$.Data|array|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].name_alias|string|
      |$.Data[0].active|string|
      |$.Data[0].allowaction|string|
      |$.Data[0].created|string|
      |$.Data[0].modified|string|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_03 Complaint Statuses - comprehensive database validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data[0].id|"1"|
      |$.Data[0].name|DB:complaintstatuses:name: id=1|
      |$.Data[0].name_alias|DB:complaintstatuses:name_alias: id=1|
      |$.Data[1].id|"2"|
      |$.Data[1].name|DB:complaintstatuses:name: id=2|
      |$.Data[1].name_alias|DB:complaintstatuses:name_alias: id=2|
      |$.Data[2].id|"3"|
      |$.Data[2].name|DB:complaintstatuses:name: id=3|
      |$.Data[2].name_alias|DB:complaintstatuses:name_alias: id=3|
      |$.Data[3].id|"4"|
      |$.Data[3].name|DB:complaintstatuses:name: id=4|
      |$.Data[3].name_alias|DB:complaintstatuses:name_alias: id=4|

  @PositiveScenario @Performance
  Scenario: TC_04 Complaint Statuses - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And verify response time is less than "1000" milliseconds

  @NegativeScenario @Security
  Scenario: TC_05 Complaint Statuses - without access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Security
  Scenario: TC_06 Complaint Statuses - with invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Validation
  Scenario: TC_07 Complaint Statuses - with invalid query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And verify response time is less than "2000" milliseconds

  @NegativeScenario @Security
  Scenario: TC_08 Complaint Statuses - with SQL injection attempt
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE complaintstatuses; --|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @Regression
  Scenario: TC_09 Complaint Statuses - database consistency validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data[0].id|"1"|
      |$.Data[0].name|DB:complaintstatuses:name: id=1|
      |$.Data[0].name_alias|DB:complaintstatuses:name_alias: id=1|
      |$.Data[1].id|"2"|
      |$.Data[1].name|DB:complaintstatuses:name: id=2|
      |$.Data[1].name_alias|DB:complaintstatuses:name_alias: id=2|
      |$.Data[2].id|"3"|
      |$.Data[2].name|DB:complaintstatuses:name: id=3|
      |$.Data[2].name_alias|DB:complaintstatuses:name_alias: id=3|
      |$.Data[3].id|"4"|
      |$.Data[3].name|DB:complaintstatuses:name: id=4|
      |$.Data[3].name_alias|DB:complaintstatuses:name_alias: id=4|

  @PositiveScenario @DBValidation @EndToEnd
  Scenario: TC_10 Complaint Statuses - end-to-end database validation workflow
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data[0].name|DB:complaintstatuses:name: id=1|
      |$.Data[0].name_alias|DB:complaintstatuses:name_alias: id=1|
      |$.Data[1].name|DB:complaintstatuses:name: id=2|
      |$.Data[1].name_alias|DB:complaintstatuses:name_alias: id=2|
      |$.Data[2].name|DB:complaintstatuses:name: id=3|
      |$.Data[2].name_alias|DB:complaintstatuses:name_alias: id=3|
  @Positive @BusinessLogic
  Scenario: TC_11 Complaint Statuses - validate business logic
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @Positive @DataIntegrity
  Scenario: TC_12 Complaint Statuses - validate data integrity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1600" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|string|
      |$.Data|array|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].name_alias|string|
      |$.Data[0].active|string|
      |$.Data[0].allowaction|string|
      |$.Data[0].created|string|
      |$.Data[0].modified|string|
      |$.Data[1].id|string|
      |$.Data[1].name|string|
      |$.Data[1].name_alias|string|
      |$.Data[1].active|string|
      |$.Data[1].allowaction|string|
      |$.Data[1].created|string|
      |$.Data[1].modified|string|

  @Positive @Regression
  Scenario: TC_13 Complaint Statuses - regression test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Response|string|
      |$.Data|array|

  @Positive @Functional
  Scenario: TC_14 Complaint Statuses - validate response completeness
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"opened"|
      |$.Data[0].name_alias|"Opened"|
      |$.Data[0].active|"1"|
      |$.Data[0].allowaction|"1"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"inprogress"|
      |$.Data[1].name_alias|"In-Progress"|
      |$.Data[1].active|"1"|
      |$.Data[1].allowaction|"1"|
      |$.Data[2].id|"3"|
      |$.Data[2].name|"closed"|
      |$.Data[2].name_alias|"Closed"|
      |$.Data[2].active|"1"|
      |$.Data[2].allowaction|"1"|
      |$.Data[3].id|"4"|
      |$.Data[3].name|"rejected"|
      |$.Data[3].name_alias|"Rejected"|
      |$.Data[3].active|"1"|
      |$.Data[3].allowaction|"0"|

  @Positive @ArrayValidation
  Scenario: TC_15 Complaint Statuses - validate array structure and content
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Data|array|
      |$.Data[0]|object|
      |$.Data[1]|object|
      |$.Data[2]|object|
      |$.Data[3]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"opened"|
      |$.Data[0].name_alias|"Opened"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"inprogress"|
      |$.Data[1].name_alias|"In-Progress"|
      |$.Data[2].id|"3"|
      |$.Data[2].name|"closed"|
      |$.Data[2].name_alias|"Closed"|
      |$.Data[3].id|"4"|
      |$.Data[3].name|"rejected"|
      |$.Data[3].name_alias|"Rejected"|

  @Positive @ContentValidation
  Scenario: TC_16 Complaint Statuses - validate content structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And validating the response contains the following values
      |Value|
      |Data|
      |id|
      |name|
      |name_alias|
      |active|
      |allowaction|
      |created|
      |modified|

  @Positive @LoadTesting
  Scenario: TC_17 Complaint Statuses - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @Negative @Timeout
  Scenario: TC_18 Complaint Statuses - timeout handling
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @Negative @ErrorHandling
  Scenario: TC_19 Complaint Statuses - invalid endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Concurrency
  Scenario: TC_20 Complaint Statuses - concurrent access test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @Negative @Boundary
  Scenario: TC_21 Complaint Statuses - maximum query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
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
      |$.Response|""|

  @Negative @Validation
  Scenario: TC_22 Complaint Statuses - special characters in query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintStatuses" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
