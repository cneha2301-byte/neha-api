@BizomWebAPI @AreaCategoriesManagement @ChangeAreaStatus @MasterDataManagement @CE
Feature: This feature file is of the testcases of POST end point of change Area Category Status

#-------------------------------------------------------------------------------------------------

  @Test_1-positive
  Scenario: TC_01 ChangeAreaStatus with status 1 - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | 1 |
      |$.id  | DB:area_categories:id:id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Status updated successfully." |
    And verify response time is less than "1500" milliseconds

#  #-----------------------------------------------------------------------------------------------------
#
  @Test_2-positive
  Scenario: TC_02 ChangeAreaStatus with status 0 - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | 0 |
      |$.id  | DB:area_categories:id: id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
      | $.Reason  | "Status updated successfully." |
    And verify response time is less than "1500" milliseconds

#  #-----------------------------------------------------------------------------------------------------
#need to log bug
#  @Test_3-negative
#  Scenario: TC_03 ChangeAreaStatus without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
#      |JPath       |Value       |
#      |$.status  | 1 |
#      |$.id  | DB:area_categories:id: id=1  |
#    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |||id|1|
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_request"|
#    And verify response time is less than "1500" milliseconds

#  #-----------------------------------------------------------------------------------------------------
#
  @Test_4-negative
  Scenario: TC_04 ChangeAreaStatus with invalid status value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | 2 |
      |$.id  | DB:area_categories:id: id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Invalid status value!" |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_5-negative
  Scenario: TC_05 ChangeAreaStatus with blank status - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  |"" |
      |$.id  | DB:area_categories:id: id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_6-negative
  Scenario: TC_06 ChangeAreaStatus with null status - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | null |
      |$.id  | DB:area_categories:id: id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Invalid data provided!" |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_7-negative
  Scenario: TC_07 ChangeAreaStatus with missing status field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | remove |
      |$.id  | DB:area_categories:id: id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | true  |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_8-negative
  Scenario: TC_08 ChangeAreaStatus with blank id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | 1 |
      |$.id  | "" |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id||
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Category ID not provided!"|
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_9-negative
  Scenario: TC_09 ChangeAreaStatus with null id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | 1 |
      |$.id  | null |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|null|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_10-negative
  Scenario: TC_10 ChangeAreaStatus with invalid id (non-existent) - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | 1 |
      |$.id  | 999999 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|999999|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Invalid data provided!" |
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  #need to raise bug
#  @Test_11-negative
#  Scenario: TC_11 ChangeAreaStatus with wrong access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
#      |JPath       |Value       |
#      |$.status  | 1 |
#      |$.id  | DB:area_categories:id: id=1 |
#    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|xyz|id|1|
#    Then I should see the response code as "401"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_grant"|
#    And verify response time is less than "500" milliseconds
#
#  #-----------------------------------------------------------------------------------------------------
#
#  @Test_12-negative
#  Scenario: TC_12 ChangeAreaStatus with wrong Resource URI - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
#      |JPath       |Value       |
#      |$.status  | 1 |
#      |$.id  | DB:area_categories:id: id=1 |
#    And I post the request with "areacategories_change_status_invalid" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|id|1|
#    Then I should see the response code as "404"
#    And verify response time is less than "1000" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_13-negative
  Scenario: TC_13 ChangeAreaStatus with negative status value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | -1 |
      |$.id  | DB:area_categories:id: id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Invalid status value!"|
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_14-negative
  Scenario: TC_14 ChangeAreaStatus with string status value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | "active" |
      |$.id  | DB:area_categories:id: id=1 |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|1|
    Then I should see the response code as "STATUS_200_OK"
    And verify response time is less than "1500" milliseconds

  #-----------------------------------------------------------------------------------------------------

  @Test_15-negative
  Scenario: TC_15 ChangeAreaStatus with string id value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangeAreaStatus" payload
      |JPath       |Value       |
      |$.status  | 1 |
      |$.id  | "invalid" |
    And I post the request with "POST_ChangeAreaStatus" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|id|invalid|
    Then I should see the response code as "STATUS_200_OK"
    And the fields in response should match with expected values
      | JPath     | Value |
      | $.Result  | false  |
      | $.Reason  | "Invalid data provided!" |
    And verify response time is less than "1500" milliseconds

