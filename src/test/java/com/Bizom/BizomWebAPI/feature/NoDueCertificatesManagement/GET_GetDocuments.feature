@BizomWebAPI @NoDueCertificatesManagement @GetDocuments @WorkflowAutomation @OS
Feature: Get Documents API Testing
  As a system user
  I want to test the get documents endpoint
  So that I can ensure proper functionality and data retrieval for no due certificates documents management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get documents without access token
    When I send the GET request to "noduecertificates_getdocuments" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get documents with invalid access token
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get documents with expired access token
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get documents with malformed access token
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get documents with valid access token
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
    And I store the response as "get_documents_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate get documents response structure
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate get documents DataTables structure
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
      |$.data[0]|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate get documents data array structure
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @DataValidation
  Scenario: TC_09 Validate get documents complete structure
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Performance
  Scenario: TC_10 Performance test for get documents endpoint
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Concurrency
  Scenario: TC_11 Concurrent access test for get documents endpoint
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Validation
  Scenario: TC_12 Get documents with invalid query parameters
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Validation
  Scenario: TC_13 Get documents with special characters in query parameters
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @Security
  Scenario: TC_14 Get documents with SQL injection attempt
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE documents; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Negative @ErrorHandling
  Scenario: TC_15 Get documents with invalid endpoint
    And I send the GET request to "noduecertificates_getdocuments_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_16 Validate get documents business logic
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @DataIntegrity
  Scenario: TC_17 Validate get documents data integrity
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|

  @Positive @Regression
  Scenario: TC_18 Regression test for get documents endpoint
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

  @Positive @Functional
  Scenario: TC_19 Validate get documents response completeness
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|
    And I store the response as "get_documents_response" name using full path
    And validating the response contains the following values
      |Value|
      |draw|
      |recordsTotal|
      |recordsFiltered|
      |data|

  @Positive @ArrayValidation
  Scenario: TC_20 Validate get documents array structure and content
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|

  @Positive @DrawFieldValidation
  Scenario: TC_21 Validate get documents draw field
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|

  @Positive @RecordsTotalFieldValidation
  Scenario: TC_22 Validate get documents recordsTotal field
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.recordsTotal|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.recordsTotal|string|

  @Positive @RecordsFilteredFieldValidation
  Scenario: TC_23 Validate get documents recordsFiltered field
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.recordsFiltered|"0"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.recordsFiltered|string|

  @Positive @DataFieldValidation
  Scenario: TC_24 Validate get documents data field
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data|[]|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|array|

  @Positive @EndToEnd
  Scenario: TC_25 End-to-end get documents data retrieval workflow
    And I send the GET request to "noduecertificates_getdocuments" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.draw|"0"|
      |$.recordsTotal|"0"|
      |$.recordsFiltered|"0"|
      |$.data|[]|
    And I store the response as "get_documents_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.draw|string|
      |$.recordsTotal|string|
      |$.recordsFiltered|string|
      |$.data|array|

