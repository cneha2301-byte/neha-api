@EditSku @Sanity @All @Execution @allPost
Feature: TC5064 This feature file is of the testcases of POST edit skunits of Product Master Api
  @EditSkuPositive
  Scenario: TC_01 Post the API with Positive data
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type | application/xml|
    And I post the request with "post_EditSkunits" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |ACCESS_TOKEN|
    Then I should see the response code as "200"
    And validating the response contains the string
      | XPath         | Value       |
      | Response.Result  |true|
      | Response.Reason   |Skunit updated successfully|
    And verify response time is less than "1500" milliseconds

  @EditSkuWithEmptyName
  Scenario: TC_02 Post the API with null name value
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type | application/xml|
    And I modify fields with random values and remove fields in "post_EditSkunits" XML payload
      | XPath         | Value       |
      | /Skunit/name  |  |
    And I post the request with "post_EditSkunits" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And validating the response contains the string
      |XPath         | Value       |
      |Response.Result |true|
      |Response.Reason |Skunit updated successfully|
    And verify response time is less than "1500" milliseconds

  @EditSkuWithEmptySkuCode
  Scenario: TC_03 Post the API with null SkuCode value
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type | application/xml|
    And I modify fields with random values and remove fields in "post_EditSkunits" XML payload
      | XPath           | Value |
      | /Skunit/skucode | null  |
    And I post the request with "post_EditSkunits" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Reason   | Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode) |
    And verify response time is less than "1500" milliseconds

  @EditSkuWithWrongResourceUri
  Scenario: TC_04 Post the API with wrong Resource URI
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type | application/xml|
    And I post the request with "Invalid_EditSkunits" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "404"
    And verify response time is less than "1500" milliseconds

  @EditSkuWithOutAccessToken
  Scenario: TC_05 Post the API with out Access Token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type | application/xml|
    And I post the request with "post_EditSkunits" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  | |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value |
      | error   |  invalid_request   |
    And verify response time is less than "1500" milliseconds

  @EditSkuWithWrongAccessToken
  Scenario: TC_06 Post the API with Invalid Access Token
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type | application/xml|
    And I post the request with "post_EditSkunits" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  | xyz |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath     | Value |
      | error   |  invalid_grant |
    And verify response time is less than "1500" milliseconds


  @EditSkuWithEmptyBody
  Scenario: TC_07 Post the API without Body
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type | application/xml|
    And I send empty body with "post_EditSkunits" request with out curly braces
    And I post the request with "post_EditSkunits" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |ACCESS_TOKEN |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue |
      | Response.Result   |    0      |
      | Response.Reason   | Please fill all the parameters. Mandatory fields are (name, mrp, price, unitspercase, skucode) |
    And verify response time is less than "1500" milliseconds


