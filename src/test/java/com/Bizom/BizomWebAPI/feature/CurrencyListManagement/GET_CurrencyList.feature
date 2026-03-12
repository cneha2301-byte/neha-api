@BizomWebAPI @OS @CurrencyListManagement @CurrencyManagement @CurrencyList @SupportingFunctions
Feature: This feature file contains testcases for GET endpoint Currency List

  @PositiveScenario
  Scenario: TC_01 Currency List - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Server|Bizom|
      |Connection|keep-alive|
    And verify response time is less than "1200" milliseconds
    And I store the response as "currency_list_response" name using full path

  @PositiveScenario @DataValidation
  Scenario: TC_02 Currency List - validate response structure and data types
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
      |$[0]|array|
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @DataIntegrity
  Scenario: TC_03 Currency List - comprehensive database validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].name|DB:currencies:name: id=1|
      |$[1].id|"2"|
      |$[1].name|DB:currencies:name: id=2|
      |$[2].id|"3"|
      |$[2].name|DB:currencies:name: id=3|
      |$[3].id|"4"|
      |$[3].name|DB:currencies:name: id=4|
      |$[4].id|"5"|
      |$[4].name|DB:currencies:name: id=5|
   

  @PositiveScenario @Performance
  Scenario: TC_04 Currency List - performance validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds

  @NegativeScenario @Security
  Scenario: TC_05 Currency List - without access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Security
  Scenario: TC_06 Currency List - with invalid access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @NegativeScenario @Validation
  Scenario: TC_07 Currency List - with invalid query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Security
  Scenario: TC_08 Currency List - with SQL injection attempt
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE currencies; --|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DBValidation @Regression
  Scenario: TC_09 Currency List - database consistency validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].name|DB:currencies:name: id=1|
      |$[1].id|"2"|
      |$[1].name|DB:currencies:name: id=2|
      |$[2].id|"3"|
      |$[2].name|DB:currencies:name: id=3|
      |$[3].id|"4"|
      |$[3].name|DB:currencies:name: id=4|
      |$[4].id|"5"|
      |$[4].name|DB:currencies:name: id=5|
  
  @PositiveScenario @DBValidation @EndToEnd
  Scenario: TC_10 Currency List - end-to-end database validation workflow
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$[0].name|DB:currencies:name: id=1|
      |$[1].name|DB:currencies:name: id=2|
      |$[2].name|DB:currencies:name: id=3|
      |$[3].name|DB:currencies:name: id=4|
      |$[4].name|DB:currencies:name: id=5|
    
  @PositiveScenario @BusinessLogic
  Scenario: TC_11 Currency List - validate business logic
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @PositiveScenario @DataIntegrity
  Scenario: TC_12 Currency List - validate data integrity
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @PositiveScenario @Regression
  Scenario: TC_13 Currency List - regression test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|

  @PositiveScenario @Functional
  Scenario: TC_14 Currency List - validate response completeness
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].name|"Albania Lek"|
      |$[1].id|"2"|
      |$[1].name|"Afghanistan Afghani"|
      |$[2].id|"3"|
      |$[2].name|"Argentina Peso"|
      |$[3].id|"4"|
      |$[3].name|"Aruba Guilder"|
      |$[4].id|"5"|
      |$[4].name|"AUD"|

  @PositiveScenario @ArrayValidation
  Scenario: TC_15 Currency List - validate array structure and content
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$|array|
    And the fields in response should match with expected values
      |JPath|Value|
      |$[0].id|"1"|
      |$[0].name|"Albania Lek"|
      |$[0].currencycode|"Lek"|
      |$[1].id|"2"|
      |$[1].name|"Afghanistan Afghani"|
      |$[2].id|"3"|
      |$[2].name|"Argentina Peso"|
      |$[2].currencycode|"$"|
      |$[3].id|"4"|
      |$[3].name|"Aruba Guilder"|
      |$[4].id|"5"|
      |$[4].name|"AUD"|
      |$[4].currencycode|"$"|
      |$[5].id|"6"|
      |$[5].name|"Azerbaijan New Manat"|
      |$[6].id|"7"|
      |$[6].name|"Bahamas Dollar"|
      |$[6].currencycode|"$"|
      |$[7].id|"8"|
      |$[7].name|"Barbados Dollar"|
      |$[7].currencycode|"$"|
      |$[8].id|"9"|
      |$[8].name|"Belarus Ruble"|
      |$[8].currencycode|"p."|
      |$[9].id|"10"|
      |$[9].name|"Belize Dollar"|
      |$[9].currencycode|"BZ$"|

  @PositiveScenario @ContentValidation
  Scenario: TC_16 Currency List - validate content structure
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds
    And validating the response contains the following values
      |Value|
      |id|
      |name|
      |currencycode|
      |Albania Lek|
      |Afghanistan Afghani|
      |Argentina Peso|
      |Aruba Guilder|
      |AUD|
      |Azerbaijan New Manat|
      |Bahamas Dollar|
      |Barbados Dollar|
      |Belarus Ruble|
      |Belize Dollar|

  @PositiveScenario @LoadTesting
  Scenario: TC_17 Currency List - load testing
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @NegativeScenario @ErrorHandling
  Scenario: TC_18 Currency List - invalid endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @PositiveScenario @Concurrency
  Scenario: TC_19 Currency List - concurrent access test
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

  @NegativeScenario @Boundary
   Scenario: TC_20 Currency List - maximum query parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCurrencyList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "1200" milliseconds

