@BizomWebAPI @AreaCategoriesManagement @AddAreaCategory @MasterDataManagement @CE
Feature: This feature file is of the testcases of POST end point of add Area Category
#for negative Scenario we are not getting expected responce(https://bugzilla.bizom.in/show_bug.cgi?id=140827)

#-------------------------------------------------------------------------------------------------

  @Test_1-positive
  Scenario: TC_01 CreateNewAreaCategory - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomString:20 |
    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "The areaCategory has been saved" |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_2-negative
#  Scenario: TC_02 CreateNewAreaCategory without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | randomString:20 |
#    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |  |
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_request"|
#    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_3-negative
#  Scenario: TC_03 CreateNewAreaCategory with duplicate name - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | DB:areacategories:name: id=1 LIMIT 1 |
#    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | false  |
#      | $.Reason  | "Duplicate areaCategory name Found" |
#    And verify response time is less than "1500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_4-negative
#  Scenario: TC_04 CreateNewAreaCategory with blank name - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  |  |
#    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "500"
#    And verify response time is less than "1500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_5-negative
#  Scenario: TC_05 CreateNewAreaCategory with null name - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | null |
#    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "500"
#    And verify response time is less than "1500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_6-negative
#  Scenario: TC_06 CreateNewAreaCategory with missing name field - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | remove |
#    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "500"
#    And verify response time is less than "1500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_7-negative
#  Scenario: TC_07 CreateNewAreaCategory with wrong access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | randomString:20 |
#    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  | xyz |
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_grant"|
#    And verify response time is less than "500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_8-negative
#  Scenario: TC_08 CreateNewAreaCategory with wrong Resource URI - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | randomString:20 |
#    And I post the request with "areacategories_add_invalid" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "404"
#    And verify response time is less than "1000" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_9-negative
  Scenario: TC_09 CreateNewAreaCategory with very long name - Boundary case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomString:500 |
    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_10-negative
  Scenario: TC_10 CreateNewAreaCategory with special characters in name - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
      |JPath       |Value       |
      |$.name  | "!@#$%^&*()_+-=[]{};':\",./<>?" |
    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_11-negative
  Scenario: TC_11 CreateNewAreaCategory with numeric name - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
      |JPath       |Value       |
      |$.name  | randomInt |
    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

#  @Test_12-negative
#  Scenario: TC_12 CreateNewAreaCategory with whitespace only name - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddAreaCategory" payload
#      |JPath       |Value       |
#      |$.name  | "   " |
#    And I post the request with "POST_AddAreaCategory" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "500"
#    And verify response time is less than "1500" milliseconds

