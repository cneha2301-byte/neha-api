@BizomWebAPI @OS @OrdersManagement @Orders @GETOrdersRunBackgroundprocessSequence @WorkflowAutomation
Feature: Orders - Run Background Process Sequence
  This feature validates the /orders/runBackgrounprocessSequence endpoint which returns a JSON response.
  #Some time the API is giving inconsistant response
  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Run background process without access token
    When I send the GET request to "orders_run_backgroundprocess_sequence" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title " "
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Run background process with invalid access token
    And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Run background process with expired access token
    And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Run background process with malformed access token
    And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Run background process with valid access token
    And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|Process restarted.|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
    And verify response time is less than "2000" milliseconds
    And I store the response as "run_backgroundprocess_sequence_response" name using full path

  @Positive @Headers
  Scenario: TC_06 Validate response headers for run background process
    And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
    And verify response time is less than "2000" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_07 Invalid endpoint path should redirect to Users page
#    And I send the GET request to "orders_run_backgroundprocess_sequence_invalid" endpoint
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2000" milliseconds

#	@Positive @Validation
#	Scenario: TC_08 Validate exact values present in JSON response
#		And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
#			|QueryParamName|QueryParamValue|
#			|access_token|ACCESS_TOKEN|
#		Then I should see the response code as "200"
#		And validating the response contains the following values
#			|Value|
#			|false|
#			|"Invalid request sent."|
#		And verify response time is less than "2000" milliseconds

#	@Positive @Performance
#	Scenario: TC_09 Validate strict performance for run background process
#		And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
#			|QueryParamName|QueryParamValue|
#			|access_token|ACCESS_TOKEN|
#		Then I should see the response code as "200"
#		And the fields in response should match with expected values
#			|JPath|Value|
#			|$.Result|false|
#			|$.Reason|Process restarted.|
#		And verify response time is less than "800" milliseconds

	@Positive @Idempotency
	Scenario: TC_10 Validate consistent response on consecutive invocations
		And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
			|QueryParamName|QueryParamValue|
			|access_token|ACCESS_TOKEN|
		Then I should see the response code as "200"
		And the fields in response should match with expected values
			|JPath|Value|
			|$.Result|true|
			|$.Reason|Process restarted.|
		And I store the response as "run_bg_seq_first" name using full path
		And I send the GET request to "orders_run_backgroundprocess_sequence" endpoint with dynamic access token and query parameters
			|QueryParamName|QueryParamValue|
			|access_token|ACCESS_TOKEN|
		Then I should see the response code as "200"
		And the fields in response should match with expected values
			|JPath|Value|
			|$.Result|true|
			|$.Reason|Process restarted.|
		And verify response time is less than "2000" milliseconds



