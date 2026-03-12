@BizomWebAPI @PayeeDetailsManagement @PayeeDetails @SalesOperations @CE
Feature: Get Document Name Data API Testing
  As a system user
  I want to test the get document name data endpoint
  So that I can ensure proper functionality and data retrieval for payee document name data

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get document name data without access token
    When I send the GET request to "payeedetails_get_document_name_data" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get document name data with invalid access token
#    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get document name data with expired access token
#    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get document name data with malformed access token
#    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get document name data with valid access token
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And I store the response as "document_name_data_response" name using full path

  @Positive @DataValidation
  Scenario: Validate document name data response structure
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.document1_url|string|

#  @Positive @DataValidation
#  Scenario: Validate document name data specific data values
#    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.document1_url|DOCUMENT1URL|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.document1_url|DB:payeedetails:document1_url: id=1|

  @Positive @DataValidation
  Scenario: Validate document name data with static values
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Positive @Performance
  Scenario: Performance test for document name data endpoint
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Positive @Concurrency
  Scenario: Concurrent access test for document name data endpoint
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Negative @Validation
  Scenario: Get document name data with invalid query parameters
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Negative @Validation
  Scenario: Get document name data with special characters in query parameters
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Negative @Security
  Scenario: Get document name data with SQL injection attempt
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE payeedetails; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Negative @Boundary
  Scenario: Get document name data with maximum query parameters
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
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
      |$.document1_url|DOCUMENT1URL|

#  @Negative @ErrorHandling
#  Scenario: Get document name data with invalid endpoint
#    And I send the GET request to "payeedetails_get_document_name_data_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: Validate document name data business logic
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Positive @DataIntegrity
  Scenario: Validate document name data data integrity
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.document1_url|string|

  @Positive @Regression
  Scenario: Regression test for document name data endpoint
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.document1_url|string|

  @Positive @Functional
  Scenario: Validate document name data response completeness
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.document1_url|string|

  @Positive @ContentValidation
  Scenario: Validate document name data content structure
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And validating the response contains the following values
      |Value|
      |document1_url|

  @Positive @LoadTesting
  Scenario: Load testing for document name data endpoint
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Negative @Timeout
  Scenario: Test document name data endpoint timeout handling
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|

  @Positive @EndToEnd
  Scenario: End-to-end document name data retrieval workflow
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And I store the response as "document_name_data_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.document1_url|string|

  @Positive @ArrayValidation
  Scenario: Validate document name data response structure and content
    And I send the GET request to "payeedetails_get_document_name_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.document1_url|DOCUMENT1URL|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.document1_url|string|

