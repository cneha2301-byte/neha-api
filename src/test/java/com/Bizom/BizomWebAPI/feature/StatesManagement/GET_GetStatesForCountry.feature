@BizomWebAPI @CE @StatesManagement @GetStatesForCountry @ProductManagement
Feature: States for Country API Testing
  As a system user
  I want to test the states/getstateforcountry endpoint
  So that I can ensure proper functionality and data retrieval for states listing

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
    When I send the GET request to "get_states_for_country" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get states with invalid access token
#    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
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
#    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
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
#    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
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
#  Scenario: Get states for country with valid access token
#    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|true|
#      |$.error.message|""|
#      |$.states|[{"id":"1","name":"ANDAMAN AND NICOBAR ISLANDS","code":"AN","country_id":"2","statecode":"35"},{"id":"2","name":"ANDHRA PRADESH","code":"AP","country_id":"2","statecode":"28"},{"id":"3","name":"ARUNACHAL PRADESH","code":"AR","country_id":"2","statecode":"12"},{"id":"4","name":"ASSAM","code":"AS","country_id":"2","statecode":"18"},{"id":"5","name":"BIHAR","code":"BR","country_id":"2","statecode":"10"},{"id":"6","name":"CHHATTISGARH","code":"CG","country_id":"2","statecode":"22"},{"id":"7","name":"CHANDIGARH","code":"CH","country_id":"2","statecode":"04"},{"id":"8","name":"DELHI","code":"DL","country_id":"2","statecode":"07"},{"id":"9","name":"DADRA AND NAGAR HAVELI","code":"DN","country_id":"2","statecode":"26"},{"id":"10","name":"GOA","code":"GA","country_id":"2","statecode":"30"},{"id":"11","name":"GUJARAT","code":"GJ","country_id":"2","statecode":"24"},{"id":"12","name":"HIMACHAL PRADESH","code":"HP","country_id":"2","statecode":"02"},{"id":"13","name":"HARYANA","code":"HR","country_id":"2","statecode":"06"},{"id":"14","name":"JHARKHAND","code":"JH","country_id":"2","statecode":"20"},{"id":"15","name":"JAMMU AND KASHMIR","code":"JK","country_id":"2","statecode":"01"},{"id":"16","name":"KARNATAKA","code":"KA","country_id":"2","statecode":"29"},{"id":"17","name":"KERALA","code":"KL","country_id":"2","statecode":"32"},{"id":"18","name":"LAKSHADWEEP","code":"LD","country_id":"2","statecode":"31"},{"id":"19","name":"MAHARASHTRA","code":"MH","country_id":"2","statecode":"27"},{"id":"20","name":"MEGHALAYA","code":"ML","country_id":"2","statecode":"17"},{"id":"21","name":"MANIPUR","code":"MN","country_id":"2","statecode":"14"},{"id":"22","name":"MADHYA PRADESH","code":"MP","country_id":"2","statecode":"23"},{"id":"23","name":"MIZORAM","code":"MZ","country_id":"2","statecode":"15"},{"id":"24","name":"NAGALAND","code":"NL","country_id":"2","statecode":"13"},{"id":"25","name":"ORISSA","code":"OR","country_id":"2","statecode":"21"},{"id":"26","name":"PUNJAB","code":"PB","country_id":"2","statecode":"03"},{"id":"27","name":"PONDICHERRY","code":"PY","country_id":"2","statecode":"34"},{"id":"28","name":"RAJASTHAN","code":"RJ","country_id":"2","statecode":"08"},{"id":"29","name":"SIKKIM","code":"SK","country_id":"2","statecode":"11"},{"id":"30","name":"TAMIL NADU","code":"TN","country_id":"2","statecode":"33"},{"id":"31","name":"TRIPURA","code":"TR","country_id":"2","statecode":"16"},{"id":"32","name":"UTTARAKHAND","code":"UA","country_id":"2","statecode":"05"},{"id":"33","name":"UTTAR PRADESH","code":"UP","country_id":"2","statecode":"09"},{"id":"34","name":"WEST BENGAL","code":"WB","country_id":"2","statecode":"19"},{"id":"35","name":"Daman and Diu","code":"DD","country_id":"2","statecode":"25"},{"id":"36","name":"LADAKH","code":"LA","country_id":"2","statecode":"38"},{"id":"37","name":"TELANGANA","code":"TG","country_id":"2","statecode":"36"},{"id":"38","name":"APITest001","code":"APITest001","country_id":"2","statecode":""},{"id":"39","name":"randomString","code":"14","country_id":"2","statecode":""}]|
#    And I store the response as "states_for_country_response" name using full path

  @Positive @DataValidation
  Scenario: Validate states response structure
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.error|object|
      |$.error.message|string|
      |$.states|array|
      |$.states[0]|object|
      |$.states[0].id|string|
      |$.states[0].name|string|
      |$.states[0].code|string|
      |$.states[0].country_id|string|
      |$.states[0].statecode|string|

#  @Positive @DataValidation
#  Scenario: Validate key static state values
#    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.states[0].id|"1"|
#      |$.states[0].name|ANDAMAN AND NICOBAR ISLANDS|
#      |$.states[0].code|AN|
#      |$.states[0].country_id|"2"|
#      |$.states[0].statecode|"35"|
#      |$.states[7].name|DELHI|
#      |$.states[7].code|DL|
#      |$.states[15].name|KARNATAKA|
#      |$.states[15].code|KA|
#      |$.states[33].name|UTTAR PRADESH|
#      |$.states[33].code|UP|

  @Positive @DataValidation
  Scenario: Validate dynamic and boundary state records
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.states|array|

  @Positive @Performance
  Scenario: Performance test for states endpoint
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Positive @ContentValidation
  Scenario: Validate states content presence
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |result|
      |error|
      |message|
      |states|
      |name|
      |code|
      |statecode|

  @Negative @Validation
  Scenario: Get states with invalid query parameters
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: Get states with special characters in query parameters
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |search|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get states with SQL injection attempt
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |search|'; DROP TABLE states; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: Get states with invalid endpoint
#    And I send the GET request to "get_states_for_country_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate states business logic
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.states[0].name|DB:states:name: id=1|
      |$.states[0].code|DB:states:code: id=1|

  @Positive @Regression
  Scenario: Regression test for states endpoint
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.states|array|

  @Positive @ArrayValidation
  Scenario: Validate states array and entries
    And I send the GET request to "get_states_for_country" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.states|array|
      |$.states[0]|object|
      |$.states[1]|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.states[1].id|"2"|
      |$.states[1].name|ANDHRA PRADESH|
      |$.states[1].code|AP|
      |$.states[1].country_id|"2"|
      |$.states[1].statecode|"28"|
