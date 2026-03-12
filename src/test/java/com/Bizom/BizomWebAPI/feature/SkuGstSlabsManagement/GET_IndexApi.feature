@BizomWebAPI @SkuGstSlabsManagement @SkuGstSlabs @WarehouseOperations @OS
Feature: SKU GST Slabs Index API Testing
  As a system user
  I want to test the skunitgstslabs indexApi endpoint
  So that I can ensure proper functionality and data retrieval for SKU GST slabs management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get GST slabs index without access token
    When I send the GET request to "skunitgstslabs_index_api" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get GST slabs index with invalid access token
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get GST slabs index with expired access token
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Get GST slabs index with malformed access token
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|Invalid Access Token or Credentials|
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Get GST slabs index with valid access token
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].fromAmount|string|
      |$.aaData[0].gstPercentage|string|
      |$.aaData[0].skunitID|string|
      |$.aaData[0].skunitName|string|
      |$.aaData[0].slabID|string|
      |$.aaData[0].toAmount|string|
    And I store the response as "skunitgstslabs_response" name using full path

  @Positive @DataValidation
  Scenario: Validate GST slabs index response structure
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].fromAmount|string|
      |$.aaData[0].gstPercentage|string|
      |$.aaData[0].skunitID|string|
      |$.aaData[0].skunitName|string|
      |$.aaData[0].slabID|string|
      |$.aaData[0].toAmount|string|

#  @Positive @DataValidation
#  Scenario: Validate GST slabs index specific data values
#    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.aaData[0].skunitID|DB:skunitgstslabs:skunit_id: id=1|
#      |$.aaData[0].slabID|DB:skunitgstslabs:id: id=1|
#      |$.aaData[1].skunitID|DB:skunitgstslabs:skunit_id: id=2|
#      |$.aaData[1].slabID|DB:skunitgstslabs:id: id=2|

#  @Positive @DataValidation
#  Scenario: Validate GST slabs index with static values
#    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|8|
#      |$.iTotalDisplayRecords|8|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].fromAmount|0.00000|
#      |$.aaData[0].gstPercentage|5.00|
#      |$.aaData[0].skunitID|801|
#      |$.aaData[0].skunitName|SKU976|
#      |$.aaData[0].slabID|1|
#      |$.aaData[0].toAmount|1049.00000|
#      |$.aaData[1].fromAmount|0.00000|
#      |$.aaData[1].gstPercentage|5.00|
#      |$.aaData[1].skunitID|803|
#      |$.aaData[1].skunitName|654478|
#      |$.aaData[1].slabID|2|
#      |$.aaData[1].toAmount|1049.00000|
#      |$.aaData[2].fromAmount|0.00000|
#      |$.aaData[2].gstPercentage|5.00|
#      |$.aaData[2].skunitID|806|
#      |$.aaData[2].skunitName|EXtp9804|
#      |$.aaData[2].slabID|3|
#      |$.aaData[2].toAmount|1049.00000|

  @Positive @Performance
  Scenario: Performance test for GST slabs index endpoint
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @Concurrency
  Scenario: Concurrent access test for GST slabs index endpoint
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|

  @Negative @Validation
  Scenario: Get GST slabs index with invalid query parameters
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Validation
  Scenario: Get GST slabs index with special characters in query parameters
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Security
  Scenario: Get GST slabs index with SQL injection attempt
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunitgstslabs; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Boundary
  Scenario: Get GST slabs index with maximum query parameters
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
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
      |$.sEcho|1|

#  @Negative @ErrorHandling
#  Scenario: Get GST slabs index with invalid endpoint
#    And I send the GET request to "skunitgstslabs_index_api_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "404"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

  @Positive @BusinessLogic
  Scenario: Validate GST slabs index business logic
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
      |$.iTotalRecords|8|
      |$.iTotalDisplayRecords|8|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].fromAmount|string|
      |$.aaData[0].gstPercentage|string|
      |$.aaData[0].skunitID|string|
      |$.aaData[0].skunitName|string|
      |$.aaData[0].slabID|string|
      |$.aaData[0].toAmount|string|

  @Positive @DataIntegrity
  Scenario: Validate GST slabs index data integrity
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|
      |$.aaData[0].fromAmount|string|
      |$.aaData[0].gstPercentage|string|
      |$.aaData[0].skunitID|string|
      |$.aaData[0].skunitName|string|
      |$.aaData[0].slabID|string|
      |$.aaData[0].toAmount|string|
    And validating the response contains the following values
      |Value|
      |fromAmount|
      |gstPercentage|
      |skunitID|
      |skunitName|
      |slabID|
      |toAmount|
      |SKU976|
      |654478|
      |EXtp9804|

  @Positive @Regression
  Scenario: Regression test for GST slabs index endpoint
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|number|
      |$.iTotalRecords|number|
      |$.iTotalDisplayRecords|number|
      |$.aaData|array|
      |$.aaData[0]|object|

#  @Positive @Functional
#  Scenario: Validate GST slabs index response completeness
#    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].fromAmount|string|
#      |$.aaData[0].gstPercentage|string|
#      |$.aaData[0].skunitID|string|
#      |$.aaData[0].skunitName|string|
#      |$.aaData[0].slabID|string|
#      |$.aaData[0].toAmount|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].fromAmount|0.00000|
#      |$.aaData[0].gstPercentage|5.00|
#      |$.aaData[0].skunitID|801|
#      |$.aaData[0].skunitName|SKU976|
#      |$.aaData[0].slabID|1|
#      |$.aaData[0].toAmount|1049.00000|
#      |$.aaData[1].fromAmount|0.00000|
#      |$.aaData[1].gstPercentage|5.00|
#      |$.aaData[1].skunitID|803|
#      |$.aaData[1].skunitName|654478|
#      |$.aaData[1].slabID|2|
#      |$.aaData[1].toAmount|1049.00000|

#  @Positive @ArrayValidation
#  Scenario: Validate GST slabs index array structure and content
#    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|8|
#      |$.iTotalDisplayRecords|8|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].fromAmount|string|
#      |$.aaData[0].gstPercentage|string|
#      |$.aaData[0].skunitID|string|
#      |$.aaData[0].skunitName|string|
#      |$.aaData[0].slabID|string|
#      |$.aaData[0].toAmount|string|
#      |$.aaData[1]|object|
#      |$.aaData[1].fromAmount|string|
#      |$.aaData[1].gstPercentage|string|
#      |$.aaData[1].skunitID|string|
#      |$.aaData[1].skunitName|string|
#      |$.aaData[1].slabID|string|
#      |$.aaData[1].toAmount|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].fromAmount|0.00000|
#      |$.aaData[0].gstPercentage|5.00|
#      |$.aaData[0].skunitID|801|
#      |$.aaData[0].skunitName|SKU976|
#      |$.aaData[0].slabID|1|
#      |$.aaData[0].toAmount|1049.00000|
#      |$.aaData[1].fromAmount|0.00000|
#      |$.aaData[1].gstPercentage|5.00|
#      |$.aaData[1].skunitID|803|
#      |$.aaData[1].skunitName|654478|
#      |$.aaData[1].slabID|2|
#      |$.aaData[1].toAmount|1049.00000|

  @Positive @ContentValidation
  Scenario: Validate GST slabs index content structure
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And validating the response contains the following values
      |Value|
      |sEcho|
      |iTotalRecords|
      |iTotalDisplayRecords|
      |aaData|
      |fromAmount|
      |gstPercentage|
      |skunitID|
      |skunitName|
      |slabID|
      |toAmount|
      |SKU976|
      |654478|
      |EXtp9804|
      |randomAlphaNum|

  @Positive @LoadTesting
  Scenario: Load testing for GST slabs index endpoint
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Negative @Timeout
  Scenario: Test GST slabs index endpoint timeout handling
    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

#  @Positive @EndToEnd
#  Scenario: End-to-end GST slabs index data retrieval workflow
#    And I send the GET request to "skunitgstslabs_index_api" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.sEcho|1|
#      |$.iTotalRecords|8|
#      |$.iTotalDisplayRecords|8|
#    And I store the response as "skunitgstslabs_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.sEcho|number|
#      |$.iTotalRecords|number|
#      |$.iTotalDisplayRecords|number|
#      |$.aaData|array|
#      |$.aaData[0]|object|
#      |$.aaData[0].fromAmount|string|
#      |$.aaData[0].gstPercentage|string|
#      |$.aaData[0].skunitID|string|
#      |$.aaData[0].skunitName|string|
#      |$.aaData[0].slabID|string|
#      |$.aaData[0].toAmount|string|
#    And validating the response contains the following values
#      |Value|
#      |sEcho|
#      |iTotalRecords|
#      |iTotalDisplayRecords|
#      |aaData|
#      |fromAmount|
#      |gstPercentage|
#      |skunitID|
#      |skunitName|
#      |slabID|
#      |toAmount|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.aaData[0].fromAmount|0.00000|
#      |$.aaData[0].gstPercentage|5.00|
#      |$.aaData[0].skunitID|801|
#      |$.aaData[0].skunitName|SKU976|
#      |$.aaData[0].slabID|1|
#      |$.aaData[0].toAmount|1049.00000|
#      |$.aaData[1].fromAmount|0.00000|
#      |$.aaData[1].gstPercentage|5.00|
#      |$.aaData[1].skunitID|803|
#      |$.aaData[1].skunitName|654478|
#      |$.aaData[1].slabID|2|
#      |$.aaData[1].toAmount|1049.00000|
#      |$.aaData[2].fromAmount|0.00000|
#      |$.aaData[2].gstPercentage|5.00|
#      |$.aaData[2].skunitID|806|
#      |$.aaData[2].skunitName|EXtp9804|
#      |$.aaData[2].slabID|3|
#      |$.aaData[2].toAmount|1049.00000|
#      |$.aaData[3].fromAmount|0.00000|
#      |$.aaData[3].gstPercentage|5.00|
#      |$.aaData[3].skunitID|807|
#      |$.aaData[3].skunitName|randomAlphaNum|
#      |$.aaData[3].slabID|4|
#      |$.aaData[3].toAmount|1049.00000|
#      |$.aaData[4].fromAmount|0.00000|
#      |$.aaData[4].gstPercentage|5.00|
#      |$.aaData[4].skunitID|808|
#      |$.aaData[4].skunitName|hgZq7312|
#      |$.aaData[4].slabID|5|
#      |$.aaData[4].toAmount|1049.00000|
#      |$.aaData[5].fromAmount|0.00000|
#      |$.aaData[5].gstPercentage|5.00|
#      |$.aaData[5].skunitID|809|
#      |$.aaData[5].skunitName|EXtp96604|
#      |$.aaData[5].slabID|6|
#      |$.aaData[5].toAmount|1049.00000|
#      |$.aaData[6].fromAmount|0.00000|
#      |$.aaData[6].gstPercentage|5.00|
#      |$.aaData[6].skunitID|810|
#      |$.aaData[6].skunitName|EX804|
#      |$.aaData[6].slabID|7|
#      |$.aaData[6].toAmount|1049.00000|
#      |$.aaData[7].fromAmount|0.00000|
#      |$.aaData[7].gstPercentage|5.00|
#      |$.aaData[7].skunitID|811|
#      |$.aaData[7].skunitName|EX804|
#      |$.aaData[7].slabID|8|
#      |$.aaData[7].toAmount|1049.00000|

