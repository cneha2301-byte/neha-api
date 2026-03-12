@AttendanceData @sanity @all @allGet @Execution

Feature: This feature file is of the testcases of GET end point of attendance data api.

  @test1
  Scenario: TC_01 - GET Attendance Data - Positive Case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "attendance_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |date          |2020-04-07                              |
      |startseq      |0                                       |
      |endseq        |1                                       |
    Then I should see the response code as "200"
    And I store the response as "attendance_data" name using full path
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Reason         |"Data retrieved successfully."|
      |$.Attendances[0].id|2                           |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test2
  Scenario: TC_02 - GET Attendance Data - Negative Case - removal of parameters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "attendance_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And I store the response as "attendance_data" name using full path
    And the fields in response should match with expected values
      |JPath     |Value     |
      |$.result  |true      |
      |$.reason  |""        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds


  @test3
  Scenario: TC_03 - GET Attendance Data - Negative Case - removal of access token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "attendance_data" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |date          |2020-03-07                              |
      |startseq      |0                                       |
      |endseq        |1                                       |
    Then I should see the response code as "401"
    And I store the response as "activity_form" name using full path
    And the fields in response should match with expected values
      |JPath              |Value           |
      |$.error            |"invalid_request"|
      |$.error_description|"The access token was not found."        |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1200" milliseconds

    @CE
  Scenario: TC_04 - GET Attendance Data - Positive Case [comment field added in response]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "attendance_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |date          |2020-04-07                              |
      |startseq      |0                                       |
      |endseq        |1                                       |
    Then I should see the response code as "200"
    And I store the response as "attendance_data" name using full path
      And the fields in response should match with expected values
        | JPath                    | Value |
        | $.Result                 | true  |
        | $.Reason                 | "Data retrieved successfully." |
        | $.Attendances[0].comment | ""    |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_05 - GET Attendance Data - Positive Case [Remark field added in response]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "attendance_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |date          |2020-04-07                              |
      |startseq      |0                                       |
      |endseq        |1                                       |
    Then I should see the response code as "200"
    And I store the response as "attendance_data" name using full path
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | "Data retrieved successfully." |
      | $.Attendances[0].remark  | ""    |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  Scenario: TC_06 - GET Attendance Data - Positive Case [Remark &comment both  field added in response]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "attendance_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |date          |2020-04-07                              |
      |startseq      |0                                       |
      |endseq        |1                                       |
    Then I should see the response code as "200"
    And I store the response as "attendance_data" name using full path
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | true  |
      | $.Reason                 | "Data retrieved successfully." |
      | $.Attendances[0].comment | ""    |
      | $.Attendances[0].remark  | ""    |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds

  Scenario: TC_07 - GET Attendance Data - Positive Case [Remark &comment value will come in String ]
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "attendance_data" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token  |ACCESS_TOKEN|
      |date          |2020-04-07                              |
      |startseq      |0                                       |
      |endseq        |1                                       |
    Then I should see the response code as "200"
    And I store the response as "attendance_data" name using full path
    And the fields in response should match with expected values
      |JPath|ExpectedType|
      | $.Attendances[0].comment | string |
      | $.Attendances[0].remark  | string |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds