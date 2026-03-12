@BizomWebAPI @TagsManagement @EditTag @MasterDataManagement
Feature: This feature file is of the testcases of POST end point of edit Tag

#-------------------------------------------------------------------------------------------------
  @Test_1-positive
  Scenario: TC_01 EditTag - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_2-positive
  Scenario: TC_02 EditTag with tagIsActive as 1 - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 1 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_3-negative
  Scenario: TC_03 EditTag without access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |||id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_4-negative @Validation
  Scenario: TC_04 EditTag with blank tagName - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_5-negative @Validation
  Scenario: TC_05 EditTag with blank tagType - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_6-negative @Validation
  Scenario: TC_06 EditTag with invalid tag ID - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_7-negative @Validation
  Scenario: TC_07 EditTag with non-existent tag ID - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_8-negative @Validation
  Scenario: TC_08 EditTag with negative tag ID - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|-1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_9-negative @Validation
  Scenario: TC_09 EditTag with blank tagIsActive - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_10-negative @Validation
  Scenario: TC_10 EditTag with invalid tagIsActive value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 2 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_11-negative @Validation
  Scenario: TC_11 EditTag with very long tagName - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:500 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_12-negative @Security
  Scenario: TC_12 EditTag with SQL injection in tagName - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | "'; DROP TABLE tags; --" |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_13-negative @Security
  Scenario: TC_13 EditTag with XSS attempt in tagName - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | "<script>alert('XSS')</script>" |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_14-negative @Validation
  Scenario: TC_14 EditTag with missing tagName field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | remove |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_15-negative @Validation
  Scenario: TC_15 EditTag with missing tagType field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | remove |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_16-negative @Validation
  Scenario: TC_16 EditTag with missing tagIsActive field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | remove |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_17-positive
  Scenario: TC_17 EditTag with different tag ID - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=2 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_18-positive
  Scenario: TC_18 EditTag with static tag ID - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_19-negative @Validation
  Scenario: TC_19 EditTag with invalid access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_20-negative @ErrorHandling
  Scenario: TC_20 EditTag with invalid endpoint - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag_invalid" payload
      |JPath       |Value       |
      |$.tagType  | "outlet" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag_invalid" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_404_NOT_FOUND"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_21-positive
  Scenario: TC_21 EditTag with different tagType values - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "outlet" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_22-negative @Validation
  Scenario: TC_22 EditTag with blank id path parameter - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id||
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_23-positive
  Scenario: TC_23 EditTag with all fields populated - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 1 |
      |$.tagName  | randomString:25 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_24-negative @Validation
  Scenario: TC_24 EditTag with string value for tagIsActive - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | "invalid" |
      |$.tagName  | randomString:20 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_25-positive
  Scenario: TC_25 EditTag with boundary values - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditTag" payload
      |JPath       |Value       |
      |$.tagType  | "colletral" |
      |$.tagIsActive  | 0 |
      |$.tagName  | randomString:100 |
    And I post the request with "POST_EditTag" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:tags:id: id=1 LIMIT 1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "2500" milliseconds

