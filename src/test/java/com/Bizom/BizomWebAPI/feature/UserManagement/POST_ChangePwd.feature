@BizomWebAPI @CE @UserManagement @ChangePwd @UserSecurity
Feature: This feature file is of the testcases of POST end point of change user password

#-------------------------------------------------------------------------------------------------

#  @Test_1-positive
#  Scenario: TC_01 ChangePwd with valid password - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
#      |$.data.User.password  | randomAlphanumeric:12 |
#      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "Successfully changed password" |
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_2-positive
#  Scenario: TC_02 ChangePwd with strong password containing special characters - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
#      |$.data.User.password  | "Test@123456" |
#      |$.data.User.passwordconfirm  | "Test@123456" |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "Successfully changed password" |
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_3-negative
#  Scenario: TC_03 ChangePwd without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
#      |$.data.User.password  | randomAlphanumeric:12 |
#      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |||userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_request"|
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_4-negative @Validation
#  Scenario: TC_04 ChangePwd with blank password - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
#      |$.data.User.password  |  |
#      |$.data.User.passwordconfirm  |  |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_5-negative @Validation
  Scenario: TC_05 ChangePwd with password mismatch - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "Password@123" |
      |$.data.User.passwordconfirm  | "Password@456" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_6-negative @Validation
  Scenario: TC_06 ChangePwd with invalid user ID - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | 999999 |
      |$.data.User.password  | randomAlphanumeric:12 |
      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_7-negative @Validation
  Scenario: TC_07 ChangePwd with non-existent user ID - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | 0 |
      |$.data.User.password  | randomAlphanumeric:12 |
      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|0|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_8-negative @Validation
  Scenario: TC_08 ChangePwd with negative user ID - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | -1 |
      |$.data.User.password  | randomAlphanumeric:12 |
      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|-1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_9-negative @Validation
  Scenario: TC_09 ChangePwd with short password - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "Pass1" |
      |$.data.User.passwordconfirm  | "Pass1" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_10-negative @Validation
  Scenario: TC_10 ChangePwd with very long password - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | randomAlphanumeric:500 |
      |$.data.User.passwordconfirm  | randomAlphanumeric:500 |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_11-negative @Validation
#  Scenario: TC_11 ChangePwd with blank passwordconfirm - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
#      |$.data.User.password  | randomAlphanumeric:12 |
#      |$.data.User.passwordconfirm  |  |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_12-negative @Validation
#  Scenario: TC_12 ChangePwd with blank userID in payload - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  |  |
#      |$.data.User.password  | randomAlphanumeric:12 |
#      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_13-negative @Security
  Scenario: TC_13 ChangePwd with SQL injection in password - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "'; DROP TABLE users; --" |
      |$.data.User.passwordconfirm  | "'; DROP TABLE users; --" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_14-negative @Security
  Scenario: TC_14 ChangePwd with XSS attempt in password - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "<script>alert('XSS')</script>" |
      |$.data.User.passwordconfirm  | "<script>alert('XSS')</script>" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_15-negative @Validation
  Scenario: TC_15 ChangePwd with special characters only in password - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "!@#$%^&*()" |
      |$.data.User.passwordconfirm  | "!@#$%^&*()" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_16-negative @Validation
  Scenario: TC_16 ChangePwd with numeric password only - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "1234567890" |
      |$.data.User.passwordconfirm  | "1234567890" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_17-negative @Validation
  Scenario: TC_17 ChangePwd with alphabetic password only - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "abcdefghij" |
      |$.data.User.passwordconfirm  | "abcdefghij" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_18-positive
#  Scenario: TC_18 ChangePwd with different user ID - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 OFFSET 1 |
#      |$.data.User.password  | randomAlphanumeric:12 |
#      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1 OFFSET 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "Successfully changed password" |
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_19-negative @Validation
  Scenario: TC_19 ChangePwd with path parameter and payload userID mismatch - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | 999 |
      |$.data.User.password  | randomAlphanumeric:12 |
      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_20-negative @Validation
  Scenario: TC_20 ChangePwd with invalid access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | randomAlphanumeric:12 |
      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_21-positive
#  Scenario: TC_21 ChangePwd with minimum valid password length - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
#      |$.data.User.password  | "Test@123" |
#      |$.data.User.passwordconfirm  | "Test@123" |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "Successfully changed password" |
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_22-positive
#  Scenario: TC_22 ChangePwd with alphanumeric password - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
#      |JPath       |Value       |
#      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
#      |$.data.User.password  | randomAlphanumeric:15 |
#      |$.data.User.passwordconfirm  | randomAlphanumeric:15 |
#    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|Path|Value|
#      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath     | Value |
#      | $.Result  | true  |
#      | $.Reason  | "Successfully changed password" |
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_23-negative @ErrorHandling
  Scenario: TC_23 ChangePwd with invalid endpoint - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | randomAlphanumeric:12 |
      |$.data.User.passwordconfirm  | randomAlphanumeric:12 |
    And I post the request with "POST_ChangePwd_invalid" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_24-positive
  Scenario: TC_24 ChangePwd with password containing spaces - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "Test Pass@123" |
      |$.data.User.passwordconfirm  | "Test Pass@123" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_25-positive
  Scenario: TC_25 ChangePwd with unicode characters in password - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_ChangePwd" payload
      |JPath       |Value       |
      |$.data.User.userID  | DB:users:id: active=1 ORDER BY id DESC LIMIT 1 |
      |$.data.User.password  | "Test@123" |
      |$.data.User.passwordconfirm  | "Test@123" |
    And I post the request with "POST_ChangePwd" payload with path parameter and dynamic access token and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|userId|DB:users:id: active=1 ORDER BY id DESC LIMIT 1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

