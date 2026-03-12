@AssignRoleToUser @Sanity @All  @Execution @allPost
Feature: TC5222 This feature file is of the testcases of post end point of Assign Role Specific id to user

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      | Content-Type      | application/xml           |
    And I modify fields with random values and remove fields in "postCreateUsers" XML payload
      |XPath         |Value   |
      | User/username | randomStr |
      | User/employeeid |  random |
    And I post the request with "postCreateUsers" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And I store the "User/employeeid" from the previous XML request body of "postCreateUsers" request in new request body of "postAssignRoleToUser" in "User/employeeid" xpath the chain as an input

  @AssignRoleToUserPositive
  Scenario: TC_01 AssignRoleToUser -  positive case
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.Result  | 1   |
      | Users.User.Reason |  User added successfully  |
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserWithEmptyemployeeid
  Scenario: TC_02 AssignRoleToUser -  Post the API with empty employeeid
    And I modify fields with random values and remove fields in "postAssignRoleToUser" XML payload
      |XPath         |Value   |
      | User/employeeid |   |
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.Result  | 0   |
      | Users.User.Reason  |  Role specific erp id is empty  |
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserwithOutEmployeeid
  Scenario: TC_03 AssignRoleToUser -  Post the API with out employeeid case
    And I remove the fields from XML "postAssignRoleToUser" payload
      |XPath         |
      |User/employeeid |
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.Result  | 0   |
      | Users.User.Reason  |  Role specific erp id is empty |
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserwithEmptyRolespecific_erpid
  Scenario: TC_04 AssignRoleToUser -  Post the API with empty rolespecific_erpid
    And I modify fields with random values and remove fields in "postAssignRoleToUser" XML payload
      |XPath         |Value   |
      | User/rolespecific_erpid |   |
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.Result  | 0   |
      | Users.User.Reason  |  Response for rolespecific_erpid : No distributor present with the supplied rolespecific_erpid. Please, try again.  |
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserwithOutRolespecific_erpid
  Scenario: TC_05 AssignRoleToUser -  Post the API with out rolespecific_erpid
    And I remove the fields from XML "postAssignRoleToUser" payload
      |XPath  |
      | User/rolespecific_erpid |
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.result  | 0   |
      | Users.User.reason  | Rolespecific erp_id is mandatory  |
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserWithAlreadyAddedUser
  Scenario: TC_06 AssignRoleToUser -  try to assign role to user which is already added
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.Result  | 1   |
      | Users.User.Reason  |  User added successfully  |
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value |
      |access_token  |Access_TOKEN  |
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.Result  | 1   |
      |Users.User.Reason  |  No new data to update!  |
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserWithWrongResourceURI
  Scenario: TC_07 AssignRoleToUser - Post API with wrong Resource URI
    And I modify fields with random values and remove fields in "Invalid_AssignRoleToUser" XML payload
      |XPath         |Value   |
      | User/employeeid |  random |
    And I post the request with "Invalid_AssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value  |
      |access_token  | Access_TOKEN |
    Then I should see the response code as "404"
    And verify response time is less than "1500" milliseconds

  @AssignRoleToUserWithOutAccessToken
  Scenario: TC_08 CreateUAssignRoleToUsersers -  Post API with out Access Token
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath     | Value    |
      |error      | invalid_request|
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserWithInvalidAccessToken
  Scenario: TC_09 AssignRoleToUser -  Post API with Invalid Access Token
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  | gguywgaus56787sgabj |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      |JPath     | Value    |
      |error      | invalid_grant|
    And verify response time is less than "2500" milliseconds

  @AssignRoleToUserwithEmptyBody
  Scenario: TC_10 AssignRoleToUser -  Post the API with empty body
    And I send empty body with "postAssignRoleToUser" XML request
    And I post the request with "postAssignRoleToUser" xml payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |Access_TOKEN  |
    Then I should see the response code as "200"
    And Validating fields in XML response should match with expected values
      | xmlPathHeader     | xmlValue    |
      | Users.User.result | 0   |
      | Users.User.reason | Rolespecific erp_id is mandatory |
    And verify response time is less than "2500" milliseconds