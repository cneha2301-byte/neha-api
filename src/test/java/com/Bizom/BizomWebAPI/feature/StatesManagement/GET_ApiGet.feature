@BizomWebAPI @CE @StatesManagement @StatesAPI @ProductManagement
Feature: States API Get Testing
  As a system user
  I want to test the states API get endpoint
  So that I can ensure proper functionality and data retrieval for states management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get states without access token
    When I send the GET request to "api_get" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get states with invalid access token
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
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
#  Scenario: Get states with expired access token
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
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
#  Scenario: Get states with malformed access token
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Positive @Smoke
#  Scenario: Get states with valid access token
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#    And I store the response as "states_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate states response structure
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|

#  @Positive @DataValidation
#  Scenario: Validate states specific data values
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$['1']|DB:states:name: id=1|
#      |$['2']|DB:states:name: id=2|
#      |$['3']|DB:states:name: id=3|
#      |$['4']|DB:states:name: id=4|
#      |$['5']|DB:states:name: id=5|

#  @Positive @DataValidation
#  Scenario: Validate states with static values
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|ANDAMAN AND NICOBAR ISLANDS|
#      |$['2']|ANDHRA PRADESH|
#      |$['3']|ARUNACHAL PRADESH|
#      |$['4']|ASSAM|
#      |$['5']|BIHAR|
#      |$['6']|CHHATTISGARH|
#      |$['7']|CHANDIGARH|
#      |$['8']|DELHI|
#      |$['9']|DADRA AND NAGAR HAVELI|
#      |$['9']|GOA|
#      |$['11']|GUJARAT|
#      |$['12']|HIMACHAL PRADESH|
#      |$['13']|HARYANA|
#      |$['14']|JHARKHAND|
#      |$['15']|JAMMU AND KASHMIR|
#      |$['16']|KARNATAKA|
#      |$['17']|KERALA|
#      |$['18']|LAKSHADWEEP|
#      |$['19']|MAHARASHTRA|
#      |$['20']|MEGHALAYA|
#      |$['21']|MANIPUR|
#      |$['22']|MADHYA PRADESH|
#      |$['23']|MIZORAM|
#      |$['24']|NAGALAND|
#      |$['25']|ORISSA|
#      |$['26']|PUNJAB|
#      |$['27']|PONDICHERRY|
#      |$['28']|RAJASTHAN|
#      |$['29']|SIKKIM|
#      |$['30']|TAMIL NADU|
#      |$['31']|TRIPURA|
#      |$['32']|UTTARAKHAND|
#      |$['33']|UTTAR PRADESH|
#      |$['34']|WEST BENGAL|
#      |$['35']|Daman and Diu|
#      |$['36']|LADAKH|
#      |$['37']|TELANGANA|
#      |$['38']|APITest001|
#      |$['39']|randomString|

#  @Positive @Performance
#  Scenario: Performance test for states endpoint
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|

#  @Positive @Concurrency
#  Scenario: Concurrent access test for states endpoint
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|

#  @Negative @Validation
#  Scenario: Get states with invalid query parameters
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Negative @Validation
#  Scenario: Get states with special characters in query parameters
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Negative @Security
#  Scenario: Get states with SQL injection attempt
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE states; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Negative @Boundary
#  Scenario: Get states with maximum query parameters
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Negative @ErrorHandling
#  Scenario: Get states with invalid endpoint
#    And I send the GET request to "api_get_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|
#
#  @Positive @BusinessLogic
#  Scenario: Validate states business logic
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Positive @DataIntegrity
#  Scenario: Validate states data integrity
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Positive @Regression
#  Scenario: Regression test for states endpoint
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Positive @Functional
#  Scenario: Validate states response completeness
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|ANDAMAN AND NICOBAR ISLANDS|
#      |$['2']|ANDHRA PRADESH|
#      |$['3']|ARUNACHAL PRADESH|
#      |$['4']|ASSAM|
#      |$['5']|BIHAR|
#      |$['6']|CHHATTISGARH|
#      |$['7']|CHANDIGARH|
#      |$['8']|DELHI|
#      |$['9']|DADRA AND NAGAR HAVELI|
#      |$['9']|GOA|
#
#  @Positive @ObjectValidation
#  Scenario: Validate states object structure and content
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|ANDAMAN AND NICOBAR ISLANDS|
#      |$['2']|ANDHRA PRADESH|
#      |$['3']|ARUNACHAL PRADESH|
#      |$['4']|ASSAM|
#      |$['5']|BIHAR|
#      |$['6']|CHHATTISGARH|
#      |$['7']|CHANDIGARH|
#      |$['8']|DELHI|
#      |$['9']|DADRA AND NAGAR HAVELI|
#      |$['9']|GOA|
#      |$['11']|GUJARAT|
#      |$['12']|HIMACHAL PRADESH|
#      |$['13']|HARYANA|
#      |$['14']|JHARKHAND|
#      |$['15']|JAMMU AND KASHMIR|
#      |$['16']|KARNATAKA|
#      |$['17']|KERALA|
#      |$['18']|LAKSHADWEEP|
#      |$['19']|MAHARASHTRA|
#      |$['20']|MEGHALAYA|
#      |$['21']|MANIPUR|
#      |$['22']|MADHYA PRADESH|
#      |$['23']|MIZORAM|
#      |$['24']|NAGALAND|
#      |$['25']|ORISSA|
#      |$['26']|PUNJAB|
#      |$['27']|PONDICHERRY|
#      |$['28']|RAJASTHAN|
#      |$['29']|SIKKIM|
#      |$['30']|TAMIL NADU|
#      |$['31']|TRIPURA|
#      |$['32']|UTTARAKHAND|
#      |$['33']|UTTAR PRADESH|
#      |$['34']|WEST BENGAL|
#      |$['35']|Daman and Diu|
#      |$['36']|LADAKH|
#      |$['37']|TELANGANA|
#      |$['38']|APITest001|
#      |$['39']|randomString|
#
#  @Positive @ContentValidation
#  Scenario: Validate states content structure
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response contains the following values
#      |Value|
#      |ANDAMAN AND NICOBAR ISLANDS|
#      |ANDHRA PRADESH|
#      |ARUNACHAL PRADESH|
#      |ASSAM|
#      |BIHAR|
#      |CHHATTISGARH|
#      |CHANDIGARH|
#      |DELHI|
#      |DADRA AND NAGAR HAVELI|
#      |GOA|
#      |GUJARAT|
#      |HIMACHAL PRADESH|
#      |HARYANA|
#      |JHARKHAND|
#      |JAMMU AND KASHMIR|
#      |KARNATAKA|
#      |KERALA|
#      |LAKSHADWEEP|
#      |MAHARASHTRA|
#      |MEGHALAYA|
#      |MANIPUR|
#      |MADHYA PRADESH|
#      |MIZORAM|
#      |NAGALAND|
#      |ORISSA|
#      |PUNJAB|
#      |PONDICHERRY|
#      |RAJASTHAN|
#      |SIKKIM|
#      |TAMIL NADU|
#      |TRIPURA|
#      |UTTARAKHAND|
#      |UTTAR PRADESH|
#      |WEST BENGAL|
#      |Daman and Diu|
#      |LADAKH|
#      |TELANGANA|
#      |APITest001|
#      |randomString|
#
#  @Positive @LoadTesting
#  Scenario: Load testing for states endpoint
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Negative @Timeout
#  Scenario: Test states endpoint timeout handling
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#
#  @Positive @EndToEnd
#  Scenario: End-to-end states data retrieval workflow
#    And I send the GET request to "api_get" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I store the response as "states_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|ANDAMAN AND NICOBAR ISLANDS|
#      |$['2']|ANDHRA PRADESH|
#      |$['3']|ARUNACHAL PRADESH|
#      |$['4']|ASSAM|
#      |$['5']|BIHAR|
#      |$['6']|CHHATTISGARH|
#      |$['7']|CHANDIGARH|
#      |$['8']|DELHI|
#      |$['9']|DADRA AND NAGAR HAVELI|
#      |$['10']|GOA|
#      |$['11']|GUJARAT|
#      |$['12']|HIMACHAL PRADESH|
#      |$['13']|HARYANA|
#      |$['14']|JHARKHAND|
#      |$['15']|JAMMU AND KASHMIR|
#      |$['16']|KARNATAKA|
#      |$['17']|KERALA|
#      |$['18']|LAKSHADWEEP|
#      |$['19']|MAHARASHTRA|
#      |$['20']|MEGHALAYA|
#      |$['21']|MANIPUR|
#      |$['22']|MADHYA PRADESH|
#      |$['23']|MIZORAM|
#      |$['24']|NAGALAND|
#      |$['25']|ORISSA|
#      |$['26']|PUNJAB|
#      |$['27']|PONDICHERRY|
#      |$['28']|RAJASTHAN|
#      |$['29']|SIKKIM|
#      |$['30']|TAMIL NADU|
#      |$['31']|TRIPURA|
#      |$['32']|UTTARAKHAND|
#      |$['33']|UTTAR PRADESH|
#      |$['34']|WEST BENGAL|
#      |$['35']|Daman and Diu|
#      |$['36']|LADAKH|
#      |$['37']|TELANGANA|
#      |$['38']|APITest001|
#      |$['39']|randomString|
