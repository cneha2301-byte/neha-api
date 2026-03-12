@GenericData @Sanity @All @allGet
Feature: This feature file is of the testcases of GET end point of GenericData
  @GenericDataPositive
  Scenario: TC_01 Generic data -  positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getGenericData" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
      |responsetype  |xml                                       |
      |fromdate      |2022-01-01                                |
      |todate        |2023-02-15                                |
      |startseq      |0                                         |
      |endseq        |1                                         |

    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader    | xmlValue       |
      | body.Result  |1            |

    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "3000" milliseconds
    And I store the response as "GenericData" name using xml full path


  @GenericDataNopParam
  Scenario: TC_02 GenericData -  no param
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getGenericData" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value     |
      | Result  | false   |
    And verify response headers
      | HeaderName         | HeaderValue                |
      | Content-Type       | text/html; charset=UTF-8   |
      | Server             | Bizom                      |
      | Connection         | keep-alive                 |
    And verify response time is less than "3000" milliseconds
    And I store the response as "GenericData" name using full path

  @GenericDataNoAuth
  Scenario: TC_03 GenericData-  No Auth
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName     |HeaderValue     |
      |Accept         |*/*             |
      |Accept-Encoding|gzip,deflate, br|
      |Connection     |keep-alive      |
    And I send the GET request to "getGenericData" endpoint with query parameters
      |QueryParamName|QueryParamValue |
      |fromdate      |2021-04-09      |
      |todate        |2025-04-09      |
      |fromtime      |14%3A30%3A20      |
      |totime        |14%3A34%3A20      |
      |responsetype  |xml             |
      |startseq      |0               |
      |endseq        |1000             |
      |genericformfield_ids  |1             |

    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                | Value                             |
      | $.error              | invalid_request                   |
      | $.error_description  | The access token was not found.   |

    And verify response headers
      | HeaderName    | HeaderValue                |
      | Content-Type  | text/html; charset=UTF-8   |
      | Server        | Bizom                      |
      | Connection    | keep-alive                 |
    And verify response time is less than "3000" milliseconds
    And I store the response as "GenericData" name using full path