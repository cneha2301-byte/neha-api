@BizomWebAPI @CE @BrandsManagement @EditBrands @ConfigurationSettings
Feature: Brands Edit API Test
  As a system user
  I want to edit brand information through the web interface
  So that I can update brand data for various operations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: TC_01 Edit brand with valid data successfully
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And I send the GET request to "brands_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

  @Positive @Functional
  Scenario: TC_02 Edit brand with updated name and sequence
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection to "brands_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | Premium Brand |
      | data[Brand][sequence] | 5 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | premium123 |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @DataValidation
  Scenario: TC_03 Edit brand with status change to inactive
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection to "brands_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 0 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_04 Edit brand with empty name field
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] |  |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_05 Edit brand with very long name field (over 255 characters)
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VeryLongBrandNameThatExceedsTheMaximumAllowedLengthForBrandNamesInTheSystemAndShouldBeRejectedByValidationRulesToEnsureDataIntegrityAndProperStorageInDatabaseTablesWithCharacterLimitations |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_06 Edit brand with special characters in name
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | Brand@#$%^&*()_+{}[]|
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_07 Edit brand with negative sequence number
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | -1 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_08 Edit brand with invalid status value
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 5 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_09 Edit brand with empty ERP ID
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] |  |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_10 Edit brand with duplicate ERP ID
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | existing_erp_id |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Security
  Scenario: TC_11 Edit brand with SQL injection in name field
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | '; DROP TABLE brands; -- |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Security
  Scenario: TC_12 Edit brand with XSS attempt in name field
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | <script>alert('xss')</script> |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Security
  Scenario: TC_13 Edit brand with invalid CSRF token
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | invalid_csrf_token |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_14 Edit brand with non-existent brand ID
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit_invalid" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Negative @Validation
  Scenario: TC_15 Edit brand with whitespace-only name
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] |    |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds
    

  @Performance @Load
  Scenario: TC_16 Edit brand performance test with large payload
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection to "brands_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | Performance Test Brand |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | perf123 |
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Integration @DatabaseValidation
  Scenario: TC_17 Edit brand and verify database update
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection to "brands_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | Database Test Brand |
      | data[Brand][sequence] | 3 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | dbtest123 |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Integration @DatabaseValidation
  Scenario: TC_18 Edit brand status and verify database status change
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection to "brands_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 0 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Integration @DatabaseValidation
  Scenario: TC_19 Edit brand sequence and verify database sequence update
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection to "brands_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 10 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | trp123 |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Integration @DatabaseValidation
  Scenario: TC_20 Edit brand ERP ID and verify database ERP ID update
    When I send the POST request with "webEditBrand.txt" filepath to "brands_edit" endpoint and follow redirection to "brands_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Brand][name] | VIP |
      | data[Brand][sequence] | 2 |
      | data[Brand][pictureurl] |  |
      | data[Brand][status] | 1 |
      | data[Brand][erp_id] | updated_erp_123 |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
