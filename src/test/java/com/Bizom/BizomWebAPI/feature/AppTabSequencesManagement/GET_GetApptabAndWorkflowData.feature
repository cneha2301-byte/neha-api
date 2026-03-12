@BizomWebAPI @AppTabSequencesManagement @GetApptabAndWorkflowData @CE
Feature: Get Apptab And Workflow Data API Testing
  As a system user
  I want to test the getApptabAndWorkflowData endpoint
  So that I can ensure proper functionality and data retrieval for apptab and workflow data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get apptab and workflow data without access token
    When I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with path parameters
      |Path|Value|
      |entityType|designations|
      |id|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get apptab and workflow data with invalid access token
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get apptab and workflow data with expired access token
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get apptab and workflow data with malformed access token
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get apptab and workflow data with valid request
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
      |$.data.Userworkflow|[]|
      |$.data.Useractivityformmapping|[]|
      |$.data.Usergenericformmapping|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|
    And I store the response as "apptab_workflow_data_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate apptab and workflow data response structure
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
      |$.data.Userworkflow|[]|
      |$.data.Useractivityformmapping|[]|
      |$.data.Usergenericformmapping|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate apptab and workflow data with different entity type
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|users|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|

  @Positive @DataValidation
  Scenario: TC_08 Validate apptab and workflow data with different ID
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|

  @Positive @Performance
  Scenario: TC_09 Performance test for apptab and workflow data endpoint
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @DataIntegrity
  Scenario: TC_10 Validate apptab and workflow data data integrity
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|

  @Positive @Functional
  Scenario: TC_11 Validate apptab and workflow data response completeness
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
      |$.data.Userworkflow|[]|
      |$.data.Useractivityformmapping|[]|
      |$.data.Usergenericformmapping|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|
    And validating the response contains the following values
      |Value|
      |Result|
      |reason|
      |data|
      |Userworkflow|
      |Useractivityformmapping|
      |Usergenericformmapping|

  @Positive @ObjectValidation
  Scenario: TC_12 Validate apptab and workflow data object structure
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data.Userworkflow|[]|
      |$.data.Useractivityformmapping|[]|
      |$.data.Usergenericformmapping|[]|

  @Positive @EndToEnd
  Scenario: TC_13 End-to-end apptab and workflow data retrieval workflow
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "apptab_workflow_data_response" name using full path
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
      |$.data.Userworkflow|[]|
      |$.data.Useractivityformmapping|[]|
      |$.data.Usergenericformmapping|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|

  @Negative @Validation
  Scenario: TC_14 Get apptab and workflow data with invalid entity type
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|invalid_entity|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Validation
  Scenario: TC_15 Get apptab and workflow data with invalid ID
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|abc|
    Then I should see the response code as "500"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get apptab and workflow data with non-existent ID
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|99999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @Validation
  Scenario: TC_17 Get apptab and workflow data with empty entity type
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType||
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

  @Negative @ErrorHandling
  Scenario: TC_18 Get apptab and workflow data with invalid endpoint
    And I send the GET request to "apptabsequences_getapptabandworkflowdata_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Concurrency
  Scenario: TC_19 Concurrent access test for apptab and workflow data endpoint
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for apptab and workflow data endpoint
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Negative @Timeout
  Scenario: TC_21 Test apptab and workflow data endpoint timeout handling
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|

  @Positive @Regression
  Scenario: TC_22 Regression test for apptab and workflow data endpoint
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
      |$.data.Userworkflow|[]|
      |$.data.Useractivityformmapping|[]|
      |$.data.Usergenericformmapping|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|

  @Positive @BusinessLogic
  Scenario: TC_23 Validate apptab and workflow data business logic
    And I send the GET request to "apptabsequences_getapptabandworkflowdata" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|entityType|designations|
      |||id|5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.reason|""|
      |$.data.Userworkflow|[]|
      |$.data.Useractivityformmapping|[]|
      |$.data.Usergenericformmapping|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.reason|string|
      |$.data|object|
      |$.data.Userworkflow|array|
      |$.data.Useractivityformmapping|array|
      |$.data.Usergenericformmapping|array|

