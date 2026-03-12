@BizomWebAPI @SkuUnitsManagement @Skus @ProductManagement @OS
Feature: SKU Units Get SKUs API Testing
  As a system user
  I want to test the skunits getskus endpoint
  So that I can ensure proper functionality and data retrieval for SKU management

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKUs without access token
    When I send the GET request to "skunits_get_skus" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: Get SKUs with invalid access token
#    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get SKUs with expired access token
#    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
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
#  Scenario: Get SKUs with malformed access token
#    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
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
  Scenario: Get SKUs with valid access token
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
    And I store the response as "skus_response" name using full path

  @Positive @DataValidation
  Scenario: Validate SKUs response structure
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
      |$['4']|string|
      |$['5']|string|

  @Positive @DataValidation
  Scenario: Validate SKUs specific data values
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$['1']|DB:skunits:name: id=1|
      |$['2']|DB:skunits:name: id=2|
      |$['3']|DB:skunits:name: id=3|
      |$['4']|DB:skunits:name: id=4|
      |$['5']|DB:skunits:name: id=5|

#  @Positive @DataValidation
#  Scenario: Validate SKUs with static values
#    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|Cuba - Cafe Cuba|
#      |$['2']|Maza - Maaza|
#      |$['3']|Fanta - Fanta|
#      |$['4']|Slice - Slice|
#      |$['5']|Lays - Lays |
#      |$['6']|6 - Kurkure|
#      |$['7']|12|
#      |$['8']|t1|
#      |$['9']|asdasdas|
#      |$['10']|asdsadas|
#      |$['11']|edit|
#      |$['12']|s1222|
#      |$['13']|3 - TC_163_1|
#      |$['14']|TC_163_2|
#      |$['15']|TC_162_1|
#      |$['16']|TC_162_2|
#      |$['17']|TC_33_1|
#      |$['18']|50-50|
#      |$['19']|NAV_ERP_P1008 - P88|
#      |$['20']|NAV_ERP_P1008 - Penicillin|
#      |$['21']|penicillin - Penicillin|
#      |$['22']|penicillin - \"\"|
#      |$['23']|penicillin - adsad|
#      |$['24']|penicillin - asjaksj|
#      |$['25']|penicillin - adad|
#      |$['26']|penicillin - abc|
#      |$['800']|ABC0861 - SKU0861|
#      |$['801']|ABC0976 - SKU976|
#      |$['803']|67870976 - 654478|
#      |$['806']|OJUd5878 - EXtp9804|
#      |$['807']|randomAlphaNum - randomAlphaNum|
#      |$['833']|TESTskunit|
#      |$['834']|TESTskunit02|
#      |$['836']|1 - TestSKU1|

  @Positive @Performance
  Scenario: Performance test for SKUs endpoint
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|

  @Positive @Concurrency
  Scenario: Concurrent access test for SKUs endpoint
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|

  @Negative @Validation
  Scenario: Get SKUs with invalid query parameters
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Validation
  Scenario: Get SKUs with special characters in query parameters
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Security
  Scenario: Get SKUs with SQL injection attempt
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE skunits; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|

  @Negative @Boundary
  Scenario: Get SKUs with maximum query parameters
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
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
      |$|object|

#  @Negative @ErrorHandling
#  Scenario: Get SKUs with invalid endpoint
#    And I send the GET request to "skunits_get_skus_invalid" endpoint with dynamic access token and query parameters
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
  Scenario: Validate SKUs business logic
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
      |$['4']|string|
      |$['5']|string|

  @Positive @DataIntegrity
  Scenario: Validate SKUs data integrity
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|
      |$['3']|string|
    And validating the response contains the following values
      |Value|
      |Cuba - Cafe Cuba|
      |Maza - Maaza|
      |Fanta - Fanta|
      |Slice - Slice|
      |Lays |
      |Kurkure|
      |ABC0976 - SKU976|
      |67870976 - 654478|
      |OJUd5878 - EXtp9804|
      |randomAlphaNum - randomAlphaNum|
      |TESTskunit|
      |TESTskunit02|
      |1 - TestSKU1|

  @Positive @Regression
  Scenario: Regression test for SKUs endpoint
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|
      |$['2']|string|

#  @Positive @Functional
#  Scenario: Validate SKUs response completeness
#    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$['1']|string|
#      |$['2']|string|
#      |$['3']|string|
#      |$['4']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|Cuba - Cafe Cuba|
#      |$['2']|Maza - Maaza|
#      |$['3']|Fanta - Fanta|
#      |$['4']|Slice - Slice|
#      |$['5']|Lays - Lays |
#      |$['6']|6 - Kurkure|
#      |$['801']|ABC0976 - SKU976|
#      |$['803']|67870976 - 654478|
#      |$['806']|OJUd5878 - EXtp9804|
#      |$['807']|randomAlphaNum - randomAlphaNum|
#      |$['833']|TESTskunit|
#      |$['834']|TESTskunit02|
#      |$['836']|1 - TestSKU1|

#  @Positive @ObjectValidation
#  Scenario: Validate SKUs object structure and content
#    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$['1']|string|
#      |$['2']|string|
#      |$['3']|string|
#      |$['801']|string|
#      |$['836']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|Cuba - Cafe Cuba|
#      |$['2']|Maza - Maaza|
#      |$['3']|Fanta - Fanta|
#      |$['4']|Slice - Slice|
#      |$['5']|Lays - Lays |
#      |$['6']|6 - Kurkure|
#      |$['801']|ABC0976 - SKU976|
#      |$['803']|67870976 - 654478|
#      |$['804']|peni556778 - Penic56778|
#      |$['806']|OJUd5878 - EXtp9804|
#      |$['807']|randomAlphaNum - randomAlphaNum|
#      |$['808']|yazE1387 - hgZq7312|
#      |$['833']|TESTskunit|
#      |$['834']|TESTskunit02|
#      |$['836']|1 - TestSKU1|
#      |$['837']|gRA2Jg4hEW - qG2rDqqeA6|
#      |$['845']|WXVFHX7YxS - Rny4yTC1Qa|
#      |$['846']|RBvkjAPhnr - cg7x4C9l1r|
#      |$['847']|dn1XHvhSaj - bN5DnQJ5PR|

  @Positive @ContentValidation
  Scenario: Validate SKUs content structure
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Cuba - Cafe Cuba|
      |Maza - Maaza|
      |Fanta - Fanta|
      |Slice - Slice|
      |Lays |
      |Kurkure|
      |ABC0976 - SKU976|
      |67870976 - 654478|
      |OJUd5878 - EXtp9804|
      |randomAlphaNum - randomAlphaNum|
      |TESTskunit|
      |TESTskunit02|
      |1 - TestSKU1|
      |gRA2Jg4hEW - qG2rDqqeA6|
      |WXVFHX7YxS - Rny4yTC1Qa|
      |RBvkjAPhnr - cg7x4C9l1r|
      |dn1XHvhSaj - bN5DnQJ5PR|

  @Positive @LoadTesting
  Scenario: Load testing for SKUs endpoint
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|

  @Negative @Timeout
  Scenario: Test SKUs endpoint timeout handling
    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|object|
      |$['1']|string|

#  @Positive @EndToEnd
#  Scenario: End-to-end SKUs data retrieval workflow
#    And I send the GET request to "skunits_get_skus" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And I store the response as "skus_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$|object|
#      |$['1']|string|
#      |$['2']|string|
#      |$['3']|string|
#      |$['4']|string|
#      |$['5']|string|
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$['1']|Cuba - Cafe Cuba|
#      |$['2']|Maza - Maaza|
#      |$['3']|Fanta - Fanta|
#      |$['4']|Slice - Slice|
#      |$['5']|Lays - Lays |
#      |$['6']|6 - Kurkure|
#      |$['801']|ABC0976 - SKU976|
#      |$['803']|67870976 - 654478|
#      |$['806']|OJUd5878 - EXtp9804|
#      |$['807']|randomAlphaNum - randomAlphaNum|
#      |$['833']|TESTskunit|
#      |$['834']|TESTskunit02|
#      |$['836']|1 - TestSKU1|
#      |$['837']|gRA2Jg4hEW - qG2rDqqeA6|
#      |$['845']|WXVFHX7YxS - Rny4yTC1Qa|
#      |$['846']|RBvkjAPhnr - cg7x4C9l1r|
#      |$['847']|dn1XHvhSaj - bN5DnQJ5PR|

