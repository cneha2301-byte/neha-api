@BizomWebAPI @AreaCategoriesManagement @EditAreaCategory @MasterDataManagement @CE
Feature: This feature file is of the testcases of POST end point of edit Area Category

#-------------------------------------------------------------------------------------------------

#  @Test_1-positive
#  Scenario: TC_01 EditAreaCategory - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | randomString:20 |
#    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "The areaCategory has been updated" |
#    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_2-negative
#  Scenario: TC_02 EditAreaCategory without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | randomString:20 |
#    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
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
#  Scenario: TC_03 EditAreaCategory with blank name - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  |  |
#    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | false  |
#      | $.Reason  | "Please provide valid areaCategory " |
#    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_4-negative
  Scenario: TC_04 EditAreaCategory with null name - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | null |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Please provide valid areaCategory " |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_5-negative
  Scenario: TC_05 EditAreaCategory with missing name field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | remove |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Please provide valid areaCategory " |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_6-negative
  Scenario: TC_06 EditAreaCategory with blank id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomString:20 |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id||
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_7-negative
  Scenario: TC_07 EditAreaCategory with null id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomString:20 |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|null|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_8-negative
  Scenario: TC_08 EditAreaCategory with invalid id (non-existent) - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomString:20 |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_9-negative
#  Scenario: TC_09 EditAreaCategory with wrong access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | randomString:20 |
#    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|xyz|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_grant"|
#    And verify response time is less than "500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_10-negative
#  Scenario: TC_10 EditAreaCategory with wrong Resource URI - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | randomString:20 |
#    And I post the request with "areacategories_edit_invalid" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "404"
#    And verify response time is less than "1000" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_11-negative
  Scenario: TC_11 EditAreaCategory with very long name - Boundary case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomString:500 |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_12-negative
  Scenario: TC_12 EditAreaCategory with special characters in name - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | "!@#$%^&*()_+-=[]{};':\",./<>?" |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_13-negative
  Scenario: TC_13 EditAreaCategory with numeric name - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomInt |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_14-negative
  Scenario: TC_14 EditAreaCategory with whitespace only name - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | "   " |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Please provide valid areaCategory " |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_15-negative
#  Scenario: TC_15 EditAreaCategory with duplicate name (existing name) - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | DB:areacategories:name: id!=DB:areacategories:id: id=1 LIMIT 1 LIMIT 1 |
#    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|DB:areacategories:id: id=1 LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_16-negative
  Scenario: TC_16 EditAreaCategory with string id value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_EditAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomString:20 |
    And I post the request with "POST_EditAreaCategory" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|invalid|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

