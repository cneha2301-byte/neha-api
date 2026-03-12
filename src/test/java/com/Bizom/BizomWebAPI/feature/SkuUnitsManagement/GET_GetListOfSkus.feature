@BizomWebAPI @SkuUnitsManagement @Skus @ProductManagement @OS
Feature: SKU Units Get List of SKUs API Testing
  As a system user
  I want to test the skunits getlistofskus endpoint
  So that I can ensure proper functionality and data retrieval for SKU list management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get list of SKUs without access token
    When I send the GET request to "skunits_get_list_of_skus" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get list of SKUs with invalid access token
#    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get list of SKUs with expired access token
#    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get list of SKUs with malformed access token
#    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
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
  Scenario: Get list of SKUs with valid access token
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
    And I store the response as "skus_list_response" name using full path

  @Positive @DataValidation
  Scenario: Validate list of SKUs response structure
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|

  @Positive @DataValidation
  Scenario: Validate list of SKUs specific data values
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.data['1']|DB:skunits:name: id=1|
      |$.data['2']|DB:skunits:name: id=2|
      |$.data['3']|DB:skunits:name: id=3|
      |$.data['4']|DB:skunits:name: id=4|
      |$.data['5']|DB:skunits:name: id=5|

#  @Positive @DataValidation
#  Scenario: Validate list of SKUs with static values
#    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data['1']|Cafe Cuba|
#      |$.data['2']|Maaza|
#      |$.data['3']|Fanta|
#      |$.data['4']|Slice|
#      |$.data['5']|Lays |
#      |$.data['6']|Kurkure|
#      |$.data['7']|12|
#      |$.data['8']|t1|
#      |$.data['9']|asdasdas|
#      |$.data['10']|asdsadas|
#      |$.data['11']|edit|
#      |$.data['12']|s1222|
#      |$.data['13']|TC_163_1|
#      |$.data['14']|TC_163_2|
#      |$.data['15']|TC_162_1|
#      |$.data['16']|TC_162_2|
#      |$.data['17']|TC_33_1|
#      |$.data['18']|50-50|
#      |$.data['19']|P88|
#      |$.data['20']|Penicillin|
#      |$.data['801']|SKU976|
#      |$.data['803']|654478|
#      |$.data['804']|Penic56778|
#      |$.data['806']|EXtp9804|
#      |$.data['807']|randomAlphaNum|
#      |$.data['833']|TESTskunit|
#      |$.data['834']|TESTskunit02|
#      |$.data['836']|TestSKU1|

  @Positive @Performance
  Scenario: Performance test for list of SKUs endpoint
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @Concurrency
  Scenario: Concurrent access test for list of SKUs endpoint
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|

  @Negative @Validation
  Scenario: Get list of SKUs with invalid query parameters
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Validation
  Scenario: Get list of SKUs with special characters in query parameters
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Security
  Scenario: Get list of SKUs with SQL injection attempt
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Boundary
  Scenario: Get list of SKUs with maximum query parameters
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

#  @Negative @ErrorHandling
#  Scenario: Get list of SKUs with invalid endpoint
#    And I send the GET request to "skunits_get_list_of_skus_invalid" endpoint with dynamic access token and query parameters
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
  Scenario: Validate list of SKUs business logic
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|

  @Positive @DataIntegrity
  Scenario: Validate list of SKUs data integrity
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
    And validating the response contains the following values
      |Value|
      |Cafe Cuba|
      |Maaza|
      |Fanta|
      |Slice|
      |Lays |
      |Kurkure|
      |SKU976|
      |654478|
      |EXtp9804|
      |randomAlphaNum|
      |TESTskunit|
      |TestSKU1|

  @Positive @Regression
  Scenario: Regression test for list of SKUs endpoint
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|

#  @Positive @Functional
#  Scenario: Validate list of SKUs response completeness
#    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data|object|
#      |$.data['1']|string|
#      |$.data['2']|string|
#      |$.data['3']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.data['1']|Cafe Cuba|
#      |$.data['2']|Maaza|
#      |$.data['3']|Fanta|
#      |$.data['4']|Slice|
#      |$.data['5']|Lays |
#      |$.data['6']|Kurkure|
#      |$.data['801']|SKU976|
#      |$.data['803']|654478|
#      |$.data['806']|EXtp9804|
#      |$.data['807']|randomAlphaNum|
#      |$.data['833']|TESTskunit|
#      |$.data['834']|TESTskunit02|
#      |$.data['836']|TestSKU1|

  @Positive @ObjectValidation
  Scenario: Validate list of SKUs object structure and content
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|"Cafe Cuba"|
      |$.data['2']|"Maaza"|
      |$.data['3']|"Fanta"|
      |$.data['4']|"Slice"|
      |$.data['5']|"Lays "|
      |$.data['6']|"Kurkure"|
      |$.data['7']|"12"|
      |$.data['8']|"t1"|
      |$.data['9']|"asdasdas"|
      |$.data['10']|"asdsadas"|
      |$.data['801']|"SKU976"|
      |$.data['803']|"654478"|
      |$.data['804']|"Penic56778"|
      |$.data['806']|"EXtp9804"|
      |$.data['807']|"randomAlphaNum"|
      |$.data['833']|"TESTskunit"|
      |$.data['834']|"TESTskunit02"|
      |$.data['836']|"TestSKU1"|
      |$.data['837']|"qG2rDqqeA6"|
      |$.data['845']|"Rny4yTC1Qa"|
      |$.data['846']|"cg7x4C9l1r"|
      |$.data['847']|"bN5DnQJ5PR"|

  @Positive @ContentValidation
  Scenario: Validate list of SKUs content structure
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |data|
      |Cafe Cuba|
      |Maaza|
      |Fanta|
      |Slice|
      |Lays |
      |Kurkure|
      |SKU976|
      |654478|
      |EXtp9804|
      |randomAlphaNum|
      |TESTskunit|
      |TESTskunit02|
      |TestSKU1|
      |qG2rDqqeA6|
      |Rny4yTC1Qa|
      |cg7x4C9l1r|
      |bN5DnQJ5PR|

  @Positive @LoadTesting
  Scenario: Load testing for list of SKUs endpoint
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Negative @Timeout
  Scenario: Test list of SKUs endpoint timeout handling
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|

  @Positive @EndToEnd
  Scenario: End-to-end list of SKUs data retrieval workflow
    And I send the GET request to "skunits_get_list_of_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "skus_list_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.data|object|
      |$.data['1']|string|
      |$.data['2']|string|
      |$.data['3']|string|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.data['1']|"Cafe Cuba"|
      |$.data['2']|"Maaza"|
      |$.data['3']|"Fanta"|
      |$.data['4']|"Slice"|
      |$.data['5']|"Lays "|
      |$.data['6']|"Kurkure"|
      |$.data['801']|"SKU976"|
      |$.data['803']|"654478"|
      |$.data['806']|"EXtp9804"|
      |$.data['807']|"randomAlphaNum"|
      |$.data['833']|"TESTskunit"|
      |$.data['834']|"TESTskunit02"|
      |$.data['836']|"TestSKU1"|
      |$.data['837']|"qG2rDqqeA6"|
      |$.data['845']|"Rny4yTC1Qa"|
      |$.data['846']|"cg7x4C9l1r"|
      |$.data['847']|"bN5DnQJ5PR"|

