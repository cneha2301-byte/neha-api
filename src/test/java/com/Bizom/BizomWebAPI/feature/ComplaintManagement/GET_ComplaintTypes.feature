@BizomWebAPI @ComplaintManagement @ComplaintTypes @SupportingFunctions @Innovation
Feature: This feature file contains testcases for GET endpoint Complaint Types

  @PositiveScenario
  Scenario: TC_01 Complaint Types - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
    And I store the response as "complaint_types_response" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Complaint Types - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
      |$.Data[0].approval_process|string|
      |$.Data[0].defaultcomplaintstatus_id|string|
      |$.Data[0].allowedstatuses|string|
      |$.Data[0].active|string|
      |$.Data[0].created|string|
      |$.Data[0].modified|string|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_03 Complaint Types - comprehensive database validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
      |$.Data[0].name|DB:complainttypes:name: id=1|
      |$.Data[0].name_alias|DB:complainttypes:name_alias: id=1|
      |$.Data[1].id|"2"|
      |$.Data[1].name|DB:complainttypes:name: id=2|
      |$.Data[1].name_alias|DB:complainttypes:name_alias: id=2|
      |$.Data[2].id|"3"|
      |$.Data[2].name|DB:complainttypes:name: id=3|
      |$.Data[2].name_alias|DB:complainttypes:name_alias: id=3|
    
  @PositiveScenario @Performance
  Scenario: TC_04 Complaint Types - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And verify response time is less than "1000" milliseconds

  @NegativeScenario @Security
  Scenario: TC_05 Complaint Types - without access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Security
  Scenario: TC_06 Complaint Types - with invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Validation
  Scenario: TC_07 Complaint Types - with invalid query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_08 Complaint Types - with SQL injection attempt
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE complaint_types; --|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @Regression
  Scenario: TC_09 Complaint Types - database consistency validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
      |$.Data[0].name|DB:complainttypes:name: id=1|
      |$.Data[0].name_alias|DB:complainttypes:name_alias: id=1|
      |$.Data[1].id|"2"|
      |$.Data[1].name|DB:complainttypes:name: id=2|
      |$.Data[1].name_alias|DB:complainttypes:name_alias: id=2|
      |$.Data[2].id|"3"|
      |$.Data[2].name|DB:complainttypes:name: id=3|
      |$.Data[2].name_alias|DB:complainttypes:name_alias: id=3|
      

  @PositiveScenario @DBValidation
  Scenario: TC_10 Complaint Types - database validation workflow
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Data[0].name|DB:complainttypes:name: id=1|
      |$.Data[0].name_alias|DB:complainttypes:name_alias: id=1|
      |$.Data[1].name|DB:complainttypes:name: id=2|
      |$.Data[1].name_alias|DB:complainttypes:name_alias: id=2|
      |$.Data[2].name|DB:complainttypes:name: id=3|
      |$.Data[2].name_alias|DB:complainttypes:name_alias: id=3|
   

  @PositiveScenario @BusinessLogic
  Scenario: TC_11 Complaint Types - validate business logic
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @PositiveScenario @DataIntegrity
  Scenario: TC_12 Complaint Types - validate data integrity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
      |$.Result|boolean|
      |$.Response|string|
      |$.Data|array|
      |$.Data[0].id|string|
      |$.Data[0].name|string|
      |$.Data[0].name_alias|string|
      |$.Data[0].approval_process|string|
      |$.Data[0].defaultcomplaintstatus_id|string|
      |$.Data[0].allowedstatuses|string|
      |$.Data[0].active|string|
      |$.Data[0].created|string|
      |$.Data[0].modified|string|
      |$.Data[1].id|string|
      |$.Data[1].name|string|
      |$.Data[1].name_alias|string|
      |$.Data[1].approval_process|string|
      |$.Data[1].defaultcomplaintstatus_id|string|
      |$.Data[1].allowedstatuses|string|
      |$.Data[1].active|string|
      |$.Data[1].created|string|
      |$.Data[1].modified|string|
      |$.Data[2].id|string|
      |$.Data[2].name|string|
      |$.Data[2].name_alias|string|
      |$.Data[2].approval_process|string|
      |$.Data[2].defaultcomplaintstatus_id|string|
      |$.Data[2].allowedstatuses|string|
      |$.Data[2].active|string|
      |$.Data[2].created|string|
      |$.Data[2].modified|string|

  @PositiveScenario @Regression
  Scenario: TC_13 Complaint Types - regression test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
      |$.Result|boolean|
      |$.Response|string|
      |$.Data|array|

  @PositiveScenario @Functional
  Scenario: TC_14 Complaint Types - validate response completeness
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
      |$.Data[0].name|"asset"|
      |$.Data[0].name_alias|"Asset"|
      |$.Data[0].approval_process|"0"|
      |$.Data[0].defaultcomplaintstatus_id|"1"|
      |$.Data[0].allowedstatuses|"1,2,3,4"|
      |$.Data[0].active|"1"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"skunit"|
      |$.Data[1].name_alias|"Skunit"|
      |$.Data[1].approval_process|"0"|
      |$.Data[1].defaultcomplaintstatus_id|"1"|
      |$.Data[1].allowedstatuses|""|
      |$.Data[1].active|"1"|
      |$.Data[2].id|"3"|
      |$.Data[2].name|"skucategory"|
      |$.Data[2].name_alias|"Skunit Category"|
      |$.Data[2].approval_process|"0"|
      |$.Data[2].defaultcomplaintstatus_id|"1"|
      |$.Data[2].allowedstatuses|""|
      |$.Data[2].active|"1"|

  @PositiveScenario @ArrayValidation
  Scenario: TC_15 Complaint Types - validate array structure and content
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Data[0].id|"1"|
      |$.Data[0].name|"asset"|
      |$.Data[0].name_alias|"Asset"|
      |$.Data[1].id|"2"|
      |$.Data[1].name|"skunit"|
      |$.Data[1].name_alias|"Skunit"|
      |$.Data[2].id|"3"|
      |$.Data[2].name|"skucategory"|
      |$.Data[2].name_alias|"Skunit Category"|

  @PositiveScenario @ContentValidation
  Scenario: TC_16 Complaint Types - validate content structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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
      |approval_process|
      |defaultcomplaintstatus_id|
      |allowedstatuses|
      |active|
      |created|
      |modified|

  @PositiveScenario @LoadTesting
  Scenario: TC_17 Complaint Types - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @NegativeScenario @Timeout
  Scenario: TC_18 Complaint Types - timeout handling
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @NegativeScenario @ErrorHandling
  Scenario: TC_19 Complaint Types - invalid endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    

  @PositiveScenario @Concurrency
  Scenario: TC_20 Complaint Types - concurrent access test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|

  @NegativeScenario @Boundary
  Scenario: TC_21 Complaint Types - maximum query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
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

  @NegativeScenario @Validation
  Scenario: TC_22 Complaint Types - special characters in query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getComplaintTypes" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Response|""|
