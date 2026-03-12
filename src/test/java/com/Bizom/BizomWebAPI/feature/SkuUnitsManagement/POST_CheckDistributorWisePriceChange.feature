@BizomWebAPI @SkuUnitsManagement @CheckDistributorWisePriceChange @ProductManagement @OS
Feature: This feature file contains testcases for POST endpoint check distributor wise price change

#-------------------------------------------------------------------------------------------------

#  @Test_1-positive @Smoke
#  Scenario: TC_01 Check distributor wise price change with valid payload - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "head"
#    And the HTML response should contain element "body"
#    And the HTML response should contain element "div"
#    And the HTML response should contain element "table"
#    And the HTML response should contain element "h2"
#    And I store the response as "check_distributor_price_change_response" name using full path

  #-----------------------------------------------------------------------------------------------------
#
#  @Test_2-negative @Security
#  Scenario: TC_02 Check distributor wise price change without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |  |
#    Then I should see the response code as "401"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.message    |"Unauthenticated."|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.message|string|
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_3-negative @Validation
#  Scenario: TC_03 Check distributor wise price change with invalid access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |invalid_token_12345 |
#    Then I should see the response code as "401"
#    And verify response time is less than "2500" milliseconds
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.message    |"Unauthenticated."|
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_4-negative @Validation
#  Scenario: TC_04 Check distributor wise price change with blank category_id array - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id  |  |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_5-negative @Validation
#  Scenario: TC_05 Check distributor wise price change with blank skunit_id array - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id  |  |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_6-negative @Validation
#  Scenario: TC_06 Check distributor wise price change with blank zone array - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone  |  |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_7-negative @Validation
#  Scenario: TC_07 Check distributor wise price change with blank distributor_id array - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id  |  |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_8-negative @Validation
#  Scenario: TC_08 Check distributor wise price change with blank changetype - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  |  |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_9-negative @Validation
#  Scenario: TC_09 Check distributor wise price change with blank changevalue - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  |  |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_10-negative @Validation
#  Scenario: TC_10 Check distributor wise price change with invalid category_id - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | 99999 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_11-negative @Validation
#  Scenario: TC_11 Check distributor wise price change with invalid skunit_id - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | 99999 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_12-negative @Validation
#  Scenario: TC_12 Check distributor wise price change with invalid distributor_id - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | 99999 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_13-negative @Validation
#  Scenario: TC_13 Check distributor wise price change with negative changevalue - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | -10 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_14-negative @Validation
#  Scenario: TC_14 Check distributor wise price change with invalid changetype - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 99 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_15-negative @Security
#  Scenario: TC_15 Check distributor wise price change with SQL injection in category_id - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | "1' OR '1'='1" |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_16-negative @Security
#  Scenario: TC_16 Check distributor wise price change with XSS in changevalue - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | "<script>alert('XSS')</script>" |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_17-positive @DataValidation
#  Scenario: TC_17 Check distributor wise price change with multiple category_ids - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id[1]  | DB:categories:id: id=2 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "body"
#    And the HTML response should contain element "table"
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_18-positive @Performance
#  Scenario: TC_18 Check distributor wise price change performance test - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_19-positive @BusinessLogic
#  Scenario: TC_19 Check distributor wise price change with different changetype values - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 2 |
#      |$.data.Skunit.changevalue  | 10 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "body"
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_20-negative @InvalidEndpoint
#  Scenario: TC_20 Check distributor wise price change with invalid endpoint - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange_invalid" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange_invalid" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_21-positive @Content
#  Scenario: TC_21 Check distributor wise price change and validate HTML content structure - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_CheckDistributorWisePriceChange" payload
#      |JPath       |Value       |
#      |$._token  | randomString:32 |
#      |$._method  | POST |
#      |$.data.Skunit.category_id[0]  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.skunit_id[0]  | DB:skunits:id: id=1 LIMIT 1 |
#      |$.data.Skunit.zone[0]  | DB:zones:id: id=1 LIMIT 1 |
#      |$.data.Skunit.distributor_id[0]  | DB:distributors:id: id=1 LIMIT 1 |
#      |$.data.Skunit.changetype  | 1 |
#      |$.data.Skunit.changevalue  | 5 |
#      |$.data.Skunit.unitcase[0]  | 0 |
#      |$.data.Skunit.unitcase[1]  | 1 |
#    And I post the request with "POST_CheckDistributorWisePriceChange" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And verify response headers
#      |HeaderName|HeaderValue|
#      |Content-Type|text/html; charset=UTF-8|
#    And the HTML response should contain element "html"
#    And the HTML response should contain element "head"
#    And the HTML response should contain element "body"
#    And the HTML response should contain element "div"
#    And the HTML response should contain element "table"
#    And the HTML response should contain element "h2"
#    And the HTML response should contain element "thead"
#    And the HTML response should contain element "tbody"
#    And the HTML response should contain element "tr"
#    And the HTML response should contain element "td"

