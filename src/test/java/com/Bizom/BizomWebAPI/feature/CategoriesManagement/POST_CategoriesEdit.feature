@BizomWebAPI @CE @CategoriesManagement @EditCategories @ConfigurationSettings
Feature: Categories Edit API Test
  As a system user
  I want to edit category information through the web interface
  So that I can update category data for various operations

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Positive @Smoke
  Scenario: TC_01 Edit category with valid data successfully
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint and follow redirection
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And I send the GET request to "categories_index" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|

  @Positive @Functional
  Scenario: TC_02 Edit category with updated name and sequence
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint and follow redirection to "categories_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Premium Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 5 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @DataValidation
  Scenario: TC_03 Edit category with status change to inactive
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint and follow redirection to "categories_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 0 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 0 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_04 Edit category with empty name field
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] |  |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_05 Edit category with very long name field (over 255 characters)
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | VeryLongCategoryNameThatExceedsTheMaximumAllowedLengthForCategoryNamesInTheSystemAndShouldBeRejectedByValidationRulesToEnsureDataIntegrityAndProperStorageInDatabaseTablesWithCharacterLimitations |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_06 Edit category with special characters in name
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Category@#$%^&*()_+{}[]|
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_07 Edit category with negative sequence number
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | -1 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_08 Edit category with invalid status value
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 5 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_09 Edit category with empty ERP ID
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] |  |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_10 Edit category with duplicate ERP ID
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | existing_erp_id |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Security
  Scenario: TC_11 Edit category with SQL injection in name field
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | '; DROP TABLE categories; -- |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Security
  Scenario: TC_12 Edit category with XSS attempt in name field
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | <script>alert('xss')</script> |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Security
  Scenario: TC_13 Edit category with invalid CSRF token
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | invalid_csrf_token |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_14 Edit category with non-existent category ID
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit_invalid" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 99999 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_15 Edit category with invalid image URL
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | invalid_url_format |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Negative @Validation
  Scenario: TC_16 Edit category with whitespace-only name
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] |    |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "302"
    And verify response time is less than "3000" milliseconds

  @Performance @Load
  Scenario: TC_17 Edit category performance test with large payload
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint and follow redirection to "categories_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Performance Test Category |
      | data[Category][erp_id] | perf123 |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Integration @DatabaseValidation
  Scenario: TC_18 Edit category and verify database update
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint and follow redirection to "categories_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Database Test Category |
      | data[Category][erp_id] | dbtest123 |
      | data[Category][category_sequence] | 3 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Integration @DatabaseValidation
  Scenario: TC_19 Edit category status and verify database status change
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint and follow redirection to "categories_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 0 |
      | data[Category][status] | 0 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 0 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Integration @DatabaseValidation
  Scenario: TC_20 Edit category sequence and verify database sequence update
    When I send the POST request with "webEditCategory.txt" filepath to "categories_edit" endpoint and follow redirection to "categories_index" endpoint
      | FormKey | FormValue |
      | _token  | w6iwBbR4Z4rgI4h9qoiuzXtqOJ1WDQ7QUfeOcZff |
      | data[Category][id] | 1 |
      | data[Category][name] | Juice |
      | data[Category][erp_id] | 123mnh |
      | data[Category][category_sequence] | 10 |
      | data[Category][status] | 1 |
      | data[Category][special] | 0 |
      | data[Category][is_active] | 1 |
      | data[Category][imageurl] | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/470212/4702121_392f4f80parle.jpg |
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
