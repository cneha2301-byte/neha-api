@BizomWebAPI @CE @OutletsManagement @GetMinMaxQtyValue @ProductManagement
Feature: Testcases for GET /outlets/getMinMaxQtyValue

#  @Test_1-positive
#  Scenario: TC_01 GetMinMaxQtyValue - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                 | Value |
#      |$.Result              |true|
#      |$.Errors              |""|
#      |$.quantity_constraints|[]|
#    And verify response time is less than "2500" milliseconds

#  @Test_4-positive @Dynamic
#  Scenario: TC_04 GetMinMaxQtyValue with numeric outletIds and numeric sendNewFormat
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "GET_getMinMaxQtyValue" payload
#      |JPath         |Value             |
#      |$.outletIds   |[2,3,100]         |
#      |$.sendNewFormat|1                 |
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value              |
#      |access_token  |ACCESS_TOKEN       |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                 | Value |
#      |$.Result              |true|
#      |$.Errors              |""|
#      |$.quantity_constraints|[]|
#    And verify response time is less than "2500" milliseconds

#  @Test_5-positive @Dynamic
#  Scenario: TC_05 GetMinMaxQtyValue with string outletIds containing unicode and duplicates
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "GET_getMinMaxQtyValue" payload
#      |JPath         |Value                             |
#      |$.outletIds   |["2","2","3"]        |
#      |$.sendNewFormat|"1"                              |
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value              |
#      |access_token  |ACCESS_TOKEN       |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                 | Value |
#      |$.Result              |true|
#      |$.Errors              |""|
#      |$.quantity_constraints|[]|
#    And verify response time is less than "2500" milliseconds

#  @Test_6-positive @Dynamic
#  Scenario: TC_06 GetMinMaxQtyValue with sendNewFormat as boolean
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "GET_getMinMaxQtyValue" payload
#      |JPath         |Value             |
#      |$.sendNewFormat|true              |
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value              |
#      |access_token  |ACCESS_TOKEN       |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                 | Value |
#      |$.Result              |true|
#      |$.Errors              |""|
#      |$.quantity_constraints|[]|
#    And verify response time is less than "2500" milliseconds

#  @Test_7-positive @Dynamic
#  Scenario: TC_07 GetMinMaxQtyValue with null outletIds
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "GET_getMinMaxQtyValue" payload
#      |JPath         |Value             |
#      |$.outletIds   |null              |
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value              |
#      |access_token  |ACCESS_TOKEN       |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                 | Value |
#      |$.Result              |true|
#      |$.Errors              |""|
#      |$.quantity_constraints|[]|
#    And verify response time is less than "2500" milliseconds

#  @Test_8-negative @Validation
#  Scenario: TC_08 GetMinMaxQtyValue with invalid outletIds type (string) - expect bad request
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "GET_getMinMaxQtyValue" payload
#      |JPath         |Value             |
#      |$.outletIds   |"not_an_array"   |
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value              |
#      |access_token  |ACCESS_TOKEN       |
#    Then I should see the response code as "400"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_request"|
#    And verify response time is less than "2500" milliseconds

#  @Test_9-positive @Dynamic
#  Scenario: TC_09 GetMinMaxQtyValue with very large outletIds array (20 ids)
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "GET_getMinMaxQtyValue" payload
#      |JPath         |Value             |
#      |$.outletIds   |["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]|
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value              |
#      |access_token  |ACCESS_TOKEN       |
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      | JPath                 | Value |
#      |$.Result              |true|
#      |$.Errors              |""|
#      |$.quantity_constraints|[]|
#    And verify response time is less than "2500" milliseconds

  @Test_2-negative
  Scenario: TC_02 GetMinMaxQtyValue without access token - negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |  |
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Test_3-negative
  Scenario: TC_03 GetMinMaxQtyValue with empty outletIds - validation case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "GET_getMinMaxQtyValue" payload
      |JPath       |Value       |
      |$.outletIds  |  |
    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                 | Value |
      |$.Result              |true|
      |$.Errors              |""|
      |$.quantity_constraints|[]|
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_10 GetMinMaxQtyValue with invalid endpoint
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I send the GET request to "GET_getMinMaxQtyValue_invalid" endpoint with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds
#      |$.message  |"Endpoint not found"|

#  @DBvalidation
#  Scenario: DB validation for getMinMaxQtyValue - basic mapping
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Content-Type|application/json|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#    And I send the GET request to "GET_getMinMaxQtyValue" endpoint with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "200"
#    And I verify API response at path with DB and static values
#      |JPath|Value|
#      |$.Result|DB:outlet_min_max:result: id=1|
#      |$.quantity_constraints|DB:outlet_min_max:quantity_constraints: id=1|
