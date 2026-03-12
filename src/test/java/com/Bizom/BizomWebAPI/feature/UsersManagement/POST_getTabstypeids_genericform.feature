@UsersManagement @POSTTabstypeidsgenericform

Feature: POST getTabstypeids genericform
  As an API automation tester
  I want to validate the POST /users/getTabstypeids/genericform endpoint
  So that it works as expected for all scenarios

  @Positive @Smoke
  Scenario: TC_01 - Valid access token returns tabstypeids data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath         |Value                       |
      |$.result      |true                        |
      |$.reason      |""                          |
      |$.data.1      |Generic Image Vidio Test    |
      |$.data.2      |form after attendance       |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 - Invalid access token returns error
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |INVALID_TOKEN |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath     |Value           |
      |$.result  |false           |
      |$.reason  |"invalid_token" |
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 - Missing access token returns error
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |      |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath     |Value           |
      |$.result  |false           |
      |$.reason  |"invalid_token" |
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_04 - Invalid request body returns error
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform_invalid" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "400"
    And the fields in response should match with expected values
      |JPath     |Value           |
      |$.result  |false           |
      |$.reason  |"invalid_body"  |
    And verify response time is less than "2500" milliseconds

  @DBValidation @Positive
  Scenario: TC_05 - DB validation for tabstypeids data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"

  @Negative @Duplicate
  Scenario: TC_06 - Duplicate request returns same result
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath         |Value                       |
      |$.result      |true                        |
      |$.reason      |""                          |
      |$.data.1      |Generic Image Vidio Test    |
      |$.data.2      |form after attendance       |

  @Boundary @Negative
  Scenario: TC_07 - Boundary test with empty access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |      |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath     |Value           |
      |$.result  |false           |
      |$.reason  |"invalid_token" |

  @Performance @Positive
  Scenario: TC_08 - Performance test for fast response
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds

  @Compatibility @Negative
  Scenario: TC_09 - Compatibility test with content-type text/plain
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |text/plain        |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "415"
    And the fields in response should match with expected values
      |JPath     |Value           |
      |$.result  |false           |
      |$.reason  |"unsupported_media_type" |

  @Regression @Positive
  Scenario: TC_10 - Regression test for unchanged valid input
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName      |HeaderValue        |
      |Accept          |*/*               |
      |Content-Type    |application/json  |
    And I post the request with "POST_getTabstypeids_genericform" payload with dynamic access token and query parameters
      |Query         |Value        |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath         |Value                       |
      |$.result      |true                        |
      |$.reason      |""                          |
      |$.data.1      |Generic Image Vidio Test    |
      |$.data.2      |form after attendance       |
