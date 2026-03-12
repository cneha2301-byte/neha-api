@BizomWebAPI @CompetitorManagement @CompetitorSkunits @SupportingFunctions @OS
Feature: This feature file contains testcases for GET endpoint Competitor SKU Units

  @PositiveScenario
  Scenario: TC_01 Competitor SKU Units - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "1200" milliseconds
    And I store the response as "competitor_skunits_response" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Competitor SKU Units - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Competitorskunits|array|
      |$.Competitorskunits[0].Competitorskunit|object|
      |$.Competitorskunits[0].Competitorskunit.id|string|
      |$.Competitorskunits[0].Competitorskunit.name|string|
      |$.Competitorskunits[0].Competitorskunit.competitor_of|string|
      |$.Competitorskunits[0].Competitorskunit.sku_category_id|string|
      |$.Competitorskunits[0].Competitorskunit.merchandising_competitor_categories|array|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_03 Competitor SKU Units - comprehensive database validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Competitorskunits[0].Competitorskunit.id|"1"|
      |$.Competitorskunits[0].Competitorskunit.name|DB:competitorskunits:name: id=1|
      |$.Competitorskunits[1].Competitorskunit.id|"2"|
      |$.Competitorskunits[1].Competitorskunit.name|DB:competitorskunits:name: id=2|

  @PositiveScenario @Performance
  Scenario: TC_04 Competitor SKU Units - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And verify response time is less than "1000" milliseconds

  @NegativeScenario @Security
  Scenario: TC_05 Competitor SKU Units - without access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Security
  Scenario: TC_06 Competitor SKU Units - with invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.error.code|401|
      |$.error.message|"Invalid Access Token or Credentials"|
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Validation
  Scenario: TC_07 Competitor SKU Units - with invalid query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_08 Competitor SKU Units - with SQL injection attempt
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE competitor_skunits; --|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @Regression
  Scenario: TC_09 Competitor SKU Units - database consistency validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Competitorskunits[0].Competitorskunit.id|"1"|
      |$.Competitorskunits[0].Competitorskunit.name|DB:competitorskunits:name: id=1|
      |$.Competitorskunits[1].Competitorskunit.name|DB:competitorskunits:name: id=2|

  @PositiveScenario @DBValidation @EndToEnd
  Scenario: TC_10 Competitor SKU Units - end-to-end database validation workflow
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Competitorskunits[0].Competitorskunit.name|DB:competitorskunits:name: id=1|
      |$.Competitorskunits[1].Competitorskunit.name|DB:competitorskunits:name: id=2|
     
  @PositiveScenario @BusinessLogic
  Scenario: TC_11 Competitor SKU Units - validate business logic
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @PositiveScenario @DataIntegrity
  Scenario: TC_12 Competitor SKU Units - validate data integrity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.Competitorskunits|array|
      |$.Competitorskunits[0].Competitorskunit|object|
      |$.Competitorskunits[0].Competitorskunit.id|string|
      |$.Competitorskunits[0].Competitorskunit.name|string|
      |$.Competitorskunits[0].Competitorskunit.competitor_of|string|
      |$.Competitorskunits[0].Competitorskunit.sku_category_id|string|
      |$.Competitorskunits[0].Competitorskunit.merchandising_competitor_categories|array|
      |$.Competitorskunits[1].Competitorskunit|object|
      |$.Competitorskunits[1].Competitorskunit.id|string|
      |$.Competitorskunits[1].Competitorskunit.name|string|
      |$.Competitorskunits[1].Competitorskunit.competitor_of|string|
      |$.Competitorskunits[1].Competitorskunit.sku_category_id|string|
      |$.Competitorskunits[1].Competitorskunit.merchandising_competitor_categories|array|

  @PositiveScenario @Functional
  Scenario: TC_13 Competitor SKU Units - validate response completeness
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Competitorskunits|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Competitorskunits[0].Competitorskunit.id|"1"|
      |$.Competitorskunits[0].Competitorskunit.name|"Ashirvad"|
      |$.Competitorskunits[0].Competitorskunit.competitor_of|"1"|
      |$.Competitorskunits[1].Competitorskunit.id|"2"|
      |$.Competitorskunits[1].Competitorskunit.name|"MTR"|
      |$.Competitorskunits[1].Competitorskunit.competitor_of|"2"|

  @PositiveScenario @ArrayValidation
  Scenario: TC_14 Competitor SKU Units - validate array structure and content
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Competitorskunits|array|
      |$.Competitorskunits[0]|object|
      |$.Competitorskunits[1]|object|
      |$.Competitorskunits[0].Competitorskunit|object|
      |$.Competitorskunits[1].Competitorskunit|object|
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Competitorskunits[0].Competitorskunit.id|"1"|
      |$.Competitorskunits[0].Competitorskunit.name|"Ashirvad"|
      |$.Competitorskunits[1].Competitorskunit.id|"2"|
      |$.Competitorskunits[1].Competitorskunit.name|"MTR"|

  @PositiveScenario @ContentValidation
  Scenario: TC_15 Competitor SKU Units - validate content structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
    And validating the response contains the following values
      |Value|
      |Competitorskunits|
      |Competitorskunit|
      |id|
      |name|
      |competitor_of|
      |sku_category_id|
      |merchandising_competitor_categories|

  @PositiveScenario @LoadTesting
  Scenario: TC_16 Competitor SKU Units - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

  @NegativeScenario @Timeout
  Scenario: TC_17 Competitor SKU Units - timeout handling
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|

#  @NegativeScenario @ErrorHandling
#  Scenario: TC_18 Competitor SKU Units - invalid endpoint
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#    And I send the GET request to "getCompetitorSkunits_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Boundary
   Scenario: TC_19 Competitor SKU Units - maximum query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompetitorSkunits" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|"true"|
      |$.Reason|""|
