@BizomWebAPI @SkuUnitsManagement @Products @ProductManagement @OS
Feature: SKU Units Get Products For Report API Testing
  As a system user
  I want to test the skunits getproductsforreport endpoint
  So that I can ensure proper functionality and data retrieval for products report management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get products for report without access token
    When I send the GET request to "skunits_get_products_for_report" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get products for report with invalid access token
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
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
#  Scenario: Get products for report with expired access token
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
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
#  Scenario: Get products for report with malformed access token
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
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
#  Scenario: Get products for report with valid access token
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And I store the response as "products_report_response" name using full path

#  @Positive @DataValidation
#  Scenario: Validate products for report response structure
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.products|object|
#      |$.products['1']|string|
#      |$.products['2']|string|
#      |$.products['3']|string|

#  @Positive @DataValidation
#  Scenario: Validate products for report specific data values
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.products['1']|DB:skunits:name: id=1|
#      |$.products['2']|DB:skunits:name: id=2|
#      |$.products['3']|DB:skunits:name: id=3|
#      |$.products['4']|DB:skunits:name: id=4|
#      |$.products['5']|DB:skunits:name: id=5|

#  @Positive @DataValidation
#  Scenario: Validate products for report with static values
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.products['1']|Cafe Cuba|
#      |$.products['2']|Maaza|
#      |$.products['3']|Fanta|
#      |$.products['4']|Slice|
#      |$.products['5']|Lays |
#      |$.products['6']|Kurkure|
#      |$.products['7']|12|
#      |$.products['8']|t1|
#      |$.products['9']|asdasdas|
#      |$.products['10']|asdsadas|
#      |$.products['11']|edit|
#      |$.products['12']|s1222|
#      |$.products['13']|TC_163_1|
#      |$.products['14']|TC_163_2|
#      |$.products['15']|TC_162_1|
#      |$.products['16']|TC_162_2|
#      |$.products['17']|TC_33_1|
#      |$.products['18']|50-50|
#      |$.products['19']|P88|
#      |$.products['20']|Penicillin|
#      |$.products['21']|Penicillin|
#      |$.products['22']|\"\"|
#      |$.products['23']|adsad|
#      |$.products['24']|asjaksj|
#      |$.products['25']|adad|
#      |$.products['26']|abc|
#      |$.products['801']|SKU976|
#      |$.products['803']|654478|
#      |$.products['804']|Penic56778|
#      |$.products['806']|EXtp9804|
#      |$.products['807']|randomAlphaNum|
#      |$.products['833']|TESTskunit|
#      |$.products['834']|TESTskunit02|
#      |$.products['836']|TestSKU1|

#  @Positive @Performance
#  Scenario: Performance test for products for report endpoint
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Positive @Concurrency
#  Scenario: Concurrent access test for products for report endpoint
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.products|object|
#      |$.products['1']|string|
#      |$.products['2']|string|

#  @Negative @Validation
#  Scenario: Get products for report with invalid query parameters
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |invalid_param|invalid_value|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Validation
#  Scenario: Get products for report with special characters in query parameters
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|<script>alert('XSS')</script>|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Security
#  Scenario: Get products for report with SQL injection attempt
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |test_param|'; DROP TABLE skunits; --|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Boundary
#  Scenario: Get products for report with maximum query parameters
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |param1|value1|
#      |param2|value2|
#      |param3|value3|
#      |param4|value4|
#      |param5|value5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @ErrorHandling
#  Scenario: Get products for report with invalid endpoint
#    And I send the GET request to "skunits_get_products_for_report_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.error|not_found|
#      |$.message|Endpoint not found|

#  @Positive @BusinessLogic
#  Scenario: Validate products for report business logic
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.products|object|
#      |$.products['1']|string|
#      |$.products['2']|string|

  @Positive @DataIntegrity
  Scenario: Validate products for report data integrity
    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.products|object|
      |$.products['1']|string|
      |$.products['2']|string|
      |$.products['3']|string|
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

#  @Positive @Regression
#  Scenario: Regression test for products for report endpoint
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.products|object|
#      |$.products['1']|string|
#      |$.products['2']|string|

#  @Positive @Functional
#  Scenario: Validate products for report response completeness
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.products|object|
#      |$.products['1']|string|
#      |$.products['2']|string|
#      |$.products['3']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.products['1']|Cafe Cuba|
#      |$.products['2']|Maaza|
#      |$.products['3']|Fanta|
#      |$.products['4']|Slice|
#      |$.products['5']|Lays |
#      |$.products['6']|Kurkure|
#      |$.products['801']|SKU976|
#      |$.products['803']|654478|
#      |$.products['806']|EXtp9804|
#      |$.products['807']|randomAlphaNum|
#      |$.products['833']|TESTskunit|
#      |$.products['834']|TESTskunit02|
#      |$.products['836']|TestSKU1|

#  @Positive @ObjectValidation
#  Scenario: Validate products for report object structure and content
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.products|object|
#      |$.products['1']|string|
#      |$.products['2']|string|
#      |$.products['3']|string|
#      |$.products['801']|string|
#      |$.products['836']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.products['1']|Cafe Cuba|
#      |$.products['2']|Maaza|
#      |$.products['3']|Fanta|
#      |$.products['4']|Slice|
#      |$.products['5']|Lays |
#      |$.products['6']|Kurkure|
#      |$.products['801']|SKU976|
#      |$.products['803']|654478|
#      |$.products['804']|Penic56778|
#      |$.products['806']|EXtp9804|
#      |$.products['807']|randomAlphaNum|
#      |$.products['833']|TESTskunit|
#      |$.products['834']|TESTskunit02|
#      |$.products['836']|TestSKU1|
#      |$.products['837']|qG2rDqqeA6|
#      |$.products['845']|Rny4yTC1Qa|
#      |$.products['846']|cg7x4C9l1r|
#      |$.products['847']|bN5DnQJ5PR|

#  @Positive @ContentValidation
#  Scenario: Validate products for report content structure
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And validating the response contains the following values
#      |Value|
#      |Result|
#      |Reason|
#      |products|
#      |Cafe Cuba|
#      |Maaza|
#      |Fanta|
#      |Slice|
#      |Lays |
#      |Kurkure|
#      |SKU976|
#      |654478|
#      |EXtp9804|
#      |randomAlphaNum|
#      |TESTskunit|
#      |TESTskunit02|
#      |TestSKU1|
#      |qG2rDqqeA6|
#      |Rny4yTC1Qa|
#      |cg7x4C9l1r|
#      |bN5DnQJ5PR|

#  @Positive @LoadTesting
#  Scenario: Load testing for products for report endpoint
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "3000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Negative @Timeout
#  Scenario: Test products for report endpoint timeout handling
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "5000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||

#  @Positive @EndToEnd
#  Scenario: End-to-end products for report data retrieval workflow
#    And I send the GET request to "skunits_get_products_for_report" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|"true"|
#      |$.Reason||
#    And I store the response as "products_report_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|string|
#      |$.Reason|string|
#      |$.products|object|
#      |$.products['1']|string|
#      |$.products['2']|string|
#      |$.products['3']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.products['1']|Cafe Cuba|
#      |$.products['2']|Maaza|
#      |$.products['3']|Fanta|
#      |$.products['4']|Slice|
#      |$.products['5']|Lays |
#      |$.products['6']|Kurkure|
#      |$.products['801']|SKU976|
#      |$.products['803']|654478|
#      |$.products['806']|EXtp9804|
#      |$.products['807']|randomAlphaNum|
#      |$.products['833']|TESTskunit|
#      |$.products['834']|TESTskunit02|
#      |$.products['836']|TestSKU1|
#      |$.products['837']|qG2rDqqeA6|
#      |$.products['845']|Rny4yTC1Qa|
#      |$.products['846']|cg7x4C9l1r|
#      |$.products['847']|bN5DnQJ5PR|

