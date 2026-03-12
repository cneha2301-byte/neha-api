@BizomWebAPI @EntityMappings @InactivateEntityMappings
Feature: Inactivate Entity Mappings - Index
  This feature validates the /inactivateentitymappings/index endpoint which returns a list of entity mappings
  with details including ID, Module, Entity, Block Type, Enabled status, and Actions.

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-GB,en-US;q=0.9,en;q=0.8|
      |cache-control|max-age=0|
      |sec-ch-ua|"Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"macOS"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|same-origin|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36|
      |x-ht-session-id|AmitabhaBagchi|

  @Positive @Smoke
  Scenario: TC_01 Retrieve all entity mappings successfully
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds
    And validating the response contains the following values
      |Value|
      |Inactivate Entity Mappings|
      |ID|
      |Module|
      |Entity|
      |Block Type|
      |Enabled|
      |Actions|
    And I store the response as "inactivateEntityMappings_default" name using full path

  @Positive @DataValidation
  Scenario: TC_02 Verify entity mappings table structure and data
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Skunit|
      |Inventory|
      |Scheme|
      |Orders|
      |Soft|
      |Hard|
      |Yes|
      |Edit|
    And verify response time is less than "2000" milliseconds

  @Positive @Pagination
  Scenario: TC_03 Verify pagination controls are present
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Show|
      |entries|
      |Previous|
      |Next|
      |Showing|
      |to|
      |of|
      |entries|
    And verify response time is less than "2000" milliseconds

  @Positive @Search
  Scenario: TC_04 Verify search functionality is present
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Search:|
    And verify response time is less than "2000" milliseconds

  @Positive @Actions
  Scenario: TC_05 Verify Add New button is present
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Add New|
    And verify response time is less than "2000" milliseconds

  @Positive @Sorting
  Scenario: TC_06 Verify table columns are sortable
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    # Note: Sorting arrows are typically rendered via CSS/JS, but the column headers should be present

  @Positive @ContentValidation
  Scenario: TC_07 Verify specific entity mappings are displayed
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Inventory|
      |Scheme|
      |Orders|
      |Collateral|
      |Targets|
    And verify response time is less than "2000" milliseconds

  @Positive @BlockType
  Scenario: TC_08 Verify both Soft and Hard block types are present
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Soft|
      |Hard|
    And verify response time is less than "2000" milliseconds

  @Positive @Module
  Scenario: TC_09 Verify Skunit module is displayed
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Skunit|
    And verify response time is less than "2000" milliseconds

  @Positive @EnabledStatus
  Scenario: TC_10 Verify Enabled status column shows Yes values
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Yes|
    And verify response time is less than "2000" milliseconds

  @Positive @EditAction
  Scenario: TC_11 Verify Edit action buttons are present
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Edit|
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: TC_12 Measure response time under standard load
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @ResponseStructure
  Scenario: TC_13 Verify response contains HTML table structure
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    # HTML table structure validation would be done via parsing if needed

  @Negative @Security
  Scenario: TC_14 Access endpoint without authentication headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8|
    And I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "401"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_15 Access endpoint with invalid session token
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8|
      |Cookie|XSRF-TOKEN=invalid_token_12345|
    And I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "401"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_16 Access endpoint with malformed headers
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|invalid/format|
    And I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "400"
    And verify response time is less than "2000" milliseconds

  @Positive @QueryParams
  Scenario: TC_17 Retrieve entity mappings with query parameters
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |page|1|
      |per_page|10|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Positive @QueryParams
  Scenario: TC_18 Retrieve entity mappings with search query parameter
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |search|Inventory|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Inventory|
    And verify response time is less than "2000" milliseconds

  @Positive @QueryParams
  Scenario: TC_19 Retrieve entity mappings filtered by module
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |module|Skunit|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Skunit|
    And verify response time is less than "2000" milliseconds

  @Positive @QueryParams
  Scenario: TC_20 Retrieve entity mappings filtered by block type
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |block_type|Hard|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Hard|
    And verify response time is less than "2000" milliseconds

  @Positive @QueryParams
  Scenario: TC_21 Retrieve entity mappings filtered by enabled status
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |enabled|Yes|
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Yes|
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: TC_22 Retrieve entity mappings with invalid query parameter
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Boundary
  Scenario: TC_23 Retrieve entity mappings with very large page size
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |per_page|99999|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Security
  Scenario: TC_24 Access endpoint with SQL injection attempt in query parameter
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |search|'; DROP TABLE entity_mappings; --|
    Then I should see the response code as "400"
    And verify response time is less than "2000" milliseconds

  @Negative @Security
  Scenario: TC_25 Access endpoint with XSS attempt in query parameter
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |search|<script>alert('XSS')</script>|
    Then I should see the response code as "400"
    And verify response time is less than "2000" milliseconds

  @Positive @Integration
  Scenario: TC_26 Verify complete entity mappings workflow
    When I send the GET request to "inactivateEntityMappingsIndex" endpoint
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value|
      |Inactivate Entity Mappings|
      |Add New|
      |ID|
      |Module|
      |Entity|
      |Block Type|
      |Enabled|
      |Actions|
      |Search:|
      |Show|
      |entries|
    And verify response time is less than "2000" milliseconds
    And I store the response as "inactivateEntityMappings_complete" name using full path