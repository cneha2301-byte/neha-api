@BizomWebAPI @LeaveConfigurationsManagement @LeaveConfigurations @SystemIntegration @CE
Feature: Get Leave Configuration Details API Testing
  As a system user
  I want to test the leave configuration details endpoint
  So that I can retrieve leave configuration by id and validate responses for valid and invalid ids

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

#  @Negative @Security
#  Scenario: Get configuration details without access token
#    When I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with path parameters
#      |Path|Value|
#      |id|3|
#    Then I should see the response code as "401"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get configuration details with invalid access token
#    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|invalid_token_12345|id|3|
#    Then I should see the response code as "401"
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get configuration details with expired access token
#    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|expired_token_12345|id|3|
#    Then I should see the response code as "401"
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get configuration details for id 3 (role: DISTRIBUTOR MANAGER)
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.leaveDetails.id|"3"|
      |$.leaveDetails.frequency|"monthly"|
      |$.leaveDetails.leaveType|"Leave"|

  @Positive @Smoke
  Scenario: Get configuration details for id 4 (role: ADMIN)
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|4|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.leaveDetails.id|"4"|
      |$.leaveDetails.frequency|"quarterly"|
      |$.leaveDetails.leaveType|"CazzLeave"|

  @Negative @Validation
  Scenario: Get configuration details with non-existent id should return invalid request
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|9999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Request"|

  @Negative @Validation
  Scenario: Get configuration details with invalid id format
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Request"|

  @Positive @Performance
  Scenario: Performance test for getConfigurationDetails endpoint
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @DataValidation
  Scenario: Validate leaveDetails field types for id 3
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.leaveDetails.id|string|
      |$.leaveDetails.max_leave_in_a_year|string|
      |$.leaveDetails.yearly_carry_forward_count|string|
      |$.leaveDetails.frequency|string|
      |$.leaveDetails.startdate|string|
      |$.leaveDetails.detailEntity|string|
      |$.leaveDetails.isStartDateEditable|string|

  @Positive @DataValidation
  Scenario: Validate carry_forward representation for id 3 and id 4
    # id 3 has carry_forward as string "1" and id 4 has carry_forward as boolean false
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.leaveDetails.carry_forward|"1"|
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.leaveDetails.carry_forward|false|

  @Positive @ContentValidation
  Scenario: Validate detailEntity text for id 3 and id 4
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.leaveDetails.detailEntity|"role: DISTRIBUTOR MANAGER"|
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|4|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.leaveDetails.detailEntity|"role: ADMIN"|

#  @Negative @Security
#  Scenario: Path parameter SQL injection attempt
#    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|'; DROP TABLE leaveconfigurations; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|false|
#      |$.Reason|"Invalid Request"|

  @Negative @Boundary
  Scenario: Get configuration details with id 0 (boundary)
    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"Invalid Request"|

#  @Negative @Validation
#  Scenario: Missing id path parameter should return error
#    When I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling
  Scenario: Get configuration details with invalid endpoint
    And I send the GET request to "leaveconfigurations_getConfigurationDetails_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|3|
    Then I should see the response code as "404"
    And verify response time is less than "2500" milliseconds

#  @DBvalidation
#  Scenario: DB validation for configuration details id 3
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|3|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.leaveDetails.id|DB:leaveconfigurations:id: id=3|
#      |$.leaveDetails.frequency|DB:leaveconfigurations:frequency: id=3|
#      |$.leaveDetails.leaveType|DB:leaveconfigurations:leaveType: id=3|
#      |$.leaveDetails.carry_forward|DB:leaveconfigurations:carry_forward: id=3|
#      |$.leaveDetails.detailEntity|DB:leaveconfigurations:detailEntity: id=3|

#  @DBvalidation
#  Scenario: DB validation for configuration details id 4
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#    And I send the GET request to "leaveconfigurations_getConfigurationDetails" endpoint with dynamic access token, path and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|4|
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.leaveDetails.frequency|DB:leaveconfigurations:frequency: id=4|
#      |$.leaveDetails.leaveType|DB:leaveconfigurations:leaveType: id=4|
#      |$.leaveDetails.carry_forward|DB:leaveconfigurations:carry_forward: id=4|
#      |$.leaveDetails.detailEntity|DB:leaveconfigurations:detailEntity: id=4|
