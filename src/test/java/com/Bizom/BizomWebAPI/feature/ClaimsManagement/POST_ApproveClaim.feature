@BizomWebAPI @ClaimsManagement @ApproveClaim @SupportingFunctions @CE
Feature: This feature file is of the testcases of POST end point of approve claim

#-------------------------------------------------------------------------------------------------

  @Test_1-positive
  Scenario: TC_01 Approve claim with valid access token and valid claim details - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1|
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result|true|
    And I store the response as "approveClaim_response" name using full path

    #-----------------------------------------------------------------------------------------------------

  @Test_2-negative
  Scenario: TC_02 Approve claim without access token - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------

  @Test_3-negative @Validation
  Scenario: TC_03 Approve claim with blank id field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |status  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_4-negative @Validation
  Scenario: TC_04 Approve claim with blank approvalstatus field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_5-negative @Validation
  Scenario: TC_05 Approve claim with blank user_id field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_6-negative @Validation
  Scenario: TC_06 Approve claim with blank approvedamount field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_7-negative @Validation
  Scenario: TC_07 Approve claim with invalid id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | 99999 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_8-negative @Validation
  Scenario: TC_08 Approve claim with invalid approvalstatus value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 999 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_9-negative @Validation
  Scenario: TC_09 Approve claim with invalid user_id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | 99999 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_10-negative @Validation
  Scenario: TC_10 Approve claim with negative approvedamount value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | -100 |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_11-negative @Validation
  Scenario: TC_11 Approve claim with zero approvedamount value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | 0 |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_12-negative @Validation
  Scenario: TC_12 Approve claim with string value for numeric field id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | invalidNumber |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_13-negative @Validation
  Scenario: TC_13 Approve claim with string value for numeric field approvedamount - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | invalidAmount |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_14-negative @Validation
  Scenario: TC_14 Approve claim with very long comment field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_15-negative @Validation
  Scenario: TC_15 Approve claim with invalid budgetRuleId - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1  |
      |$.Claimdetail[0].budgetRuleId  | 99999 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_16-negative @Validation
  Scenario: TC_16 Approve claim with invalid claimdetailfield_id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].claimdetailfield_id  | 99999 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_17-positive
  Scenario: TC_17 Approve claim with all optional fields populated - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].quantity  | randomInt |
      |$.Claimdetail[0].require_audit  | 1 |
      |$.Claimdetail[0].comment  | randomString:50 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_18-positive
  Scenario: TC_18 Approve claim with multiple claim details in array - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
      |$.Claimdetail[1].id  | DB:claimdetails:id: id=2 LIMIT 1 |
      |$.Claimdetail[1].approvalstatus  | 1 |
      |$.Claimdetail[1].user_id  | DB:users:id: id=2 LIMIT 1 |
      |$.Claimdetail[1].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_19-negative @Validation
  Scenario: TC_19 Approve claim with empty Claimdetail array - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail  | [] |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_20-negative @Validation
  Scenario: TC_20 Approve claim with maximum approvedamount value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | 999999999 |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_21-negative @ErrorHandling
#  Scenario: TC_21 Approve claim with invalid endpoint - negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "claimdetails_approveclaim_invalid" payload
#      |JPath       |Value       |
#      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
#      |$.Claimdetail[0].approvalstatus  | 1 |
#      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
#      |$.Claimdetail[0].approvedamount  | randomInt |
#    And I post the request with "claimdetails_approveclaim_invalid" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_22-positive
  Scenario: TC_22 Approve claim with boundary values - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | 1 |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_23-positive @Performance
  Scenario: TC_23 Performance test for approve claim endpoint
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result|true|

    #-----------------------------------------------------------------------------------------------------

  @Test_24-positive @DataValidation
  Scenario: TC_24 Approve claim response structure validation
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 1 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result|true|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|

    #-----------------------------------------------------------------------------------------------------

  @Test_25-positive
  Scenario: TC_25 Approve claim with different approvalstatus values - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "claimdetails_approveclaim" payload
      |JPath       |Value       |
      |$.Claimdetail[0].id  | DB:claimdetails:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvalstatus  | 0 |
      |$.Claimdetail[0].user_id  | DB:users:id: id=1 LIMIT 1 |
      |$.Claimdetail[0].approvedamount  | randomInt |
    And I post the request with "claimdetails_approveclaim" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      | JPath     | Value    |
      |$.Result|true|



