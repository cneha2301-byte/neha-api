@BizomWebAPI @AreaCategoriesManagement @DeleteAreaCategory @MasterDataManagement @CE
Feature: This feature file is of the testcases of POST end point of delete Area Category

#-------------------------------------------------------------------------------------------------

#  @Test_1-positive
#  Scenario: TC_01 DeleteAreaCategory - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  | DB:areacategories:id: id=1 LIMIT 1 |
#    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "The areaCategory has been deleted successfully!" |
#    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_2-negative
#  Scenario: TC_02 DeleteAreaCategory without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  | DB:areacategories:id: id=1 LIMIT 1 |
#    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |||id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_request"|
#    And verify response time is less than "1500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_3-negative
#  Scenario: TC_03 DeleteAreaCategory with blank id in payload - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  |  |
#    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id||
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_4-negative
  Scenario: TC_04 DeleteAreaCategory with null id in payload - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
      |JPath       |Value       |
      |$.id  | null |
    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|null|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_5-negative
  Scenario: TC_05 DeleteAreaCategory with missing id field in payload - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
      |JPath       |Value       |
      |$.id  | remove |
    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_6-negative
#  Scenario: TC_06 DeleteAreaCategory with blank path parameter id - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  | DB:areacategories:id: id=1 LIMIT 1 |
#    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id||
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_7-negative
#  Scenario: TC_07 DeleteAreaCategory with null path parameter id - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  | DB:areacategories:id: id=1 LIMIT 1 |
#    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|null|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_8-negative
  Scenario: TC_08 DeleteAreaCategory with invalid id (non-existent) - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
      |JPath       |Value       |
      |$.id  | 999999 |
    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_9-negative
#  Scenario: TC_09 DeleteAreaCategory with wrong access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  | DB:areacategories:id: id=1 LIMIT 1 |
#    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|xyz|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_grant"|
#    And verify response time is less than "500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_10-negative
#  Scenario: TC_10 DeleteAreaCategory with wrong Resource URI - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  | DB:areacategories:id: id=1 LIMIT 1 |
#    And I post the request with "areacategories_delete_invalid" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "404"
#    And verify response time is less than "1000" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_11-negative
  Scenario: TC_11 DeleteAreaCategory with negative id value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
      |JPath       |Value       |
      |$.id  | -1 |
    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|-1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_12-negative
  Scenario: TC_12 DeleteAreaCategory with zero id value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
      |JPath       |Value       |
      |$.id  | 0 |
    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|0|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_13-negative
  Scenario: TC_13 DeleteAreaCategory with string id value in payload - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
      |JPath       |Value       |
      |$.id  | "invalid" |
    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_14-negative
  Scenario: TC_14 DeleteAreaCategory with mismatched id (path param different from payload) - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
      |JPath       |Value       |
      |$.id  | 999 |
    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_15-negative
#  Scenario: TC_15 DeleteAreaCategory with already deleted id - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_DeleteAreaCategory" payload
#      |JPath       |Value       |
#      |$.id  | DB:areacategories:id: id=1 LIMIT 1 |
#    And I post the request with "POST_DeleteAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds

