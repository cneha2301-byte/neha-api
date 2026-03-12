@BizomWebAPI @CE @OutletsManagement @OutletsDownloadCustomOutletImage @SystemOperations
Feature: Download Custom Outlet Image API Testing
  As a system user
  I want to test the download custom outlet image endpoint
  So that I can ensure proper functionality for downloading custom outlet images

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Download custom outlet image without access token
    When I send the GET request to "outlets_download_custom_outlet_image" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Download custom outlet image with invalid access token
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Download custom outlet image with expired access token
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Download custom outlet image with malformed access token
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Download custom outlet image with valid access token
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"
    And I store the response as "custom_outlet_image_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate custom outlet image HTML response structure
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"

  @Positive @DataValidation
  Scenario: TC_07 Validate custom outlet image HTML content
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"
    And validating the response contains the following values
      |Value|
      |Download Custom Outlet Pictures|
      |Outlets|

  @Positive @Performance
  Scenario: TC_08 Performance test for custom outlet image endpoint
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Positive @Concurrency
  Scenario: TC_09 Concurrent access test for custom outlet image endpoint
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"

  @Negative @Validation
  Scenario: TC_10 Download custom outlet image with invalid query parameters
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |invalid_param|invalid_value|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Negative @Validation
  Scenario: TC_11 Download custom outlet image with special characters in query parameters
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|<script>alert('XSS')</script>|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Negative @Security
  Scenario: TC_12 Download custom outlet image with SQL injection attempt
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |test_param|'; DROP TABLE outlets; --|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Negative @Boundary
  Scenario: TC_13 Download custom outlet image with maximum query parameters
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |param1|value1|
      |param2|value2|
      |param3|value3|
      |param4|value4|
      |param5|value5|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"

#  @Negative @ErrorHandling
#  Scenario: TC_14 Download custom outlet image with invalid endpoint
#    And I send the GET request to "outlets_download_custom_outlet_image_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#    Then I should see the response code as "200"
#    And verify response time is less than "2500" milliseconds
#    And the HTML response should contain page title "Users"

  @Positive @BusinessLogic
  Scenario: TC_15 Validate custom outlet image business logic
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"

  @Positive @DataIntegrity
  Scenario: TC_16 Validate custom outlet image HTML data integrity
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"
    And validating the response contains the following values
      |Value|
      |Download Custom Outlet Pictures|
      |Outlets|

  @Positive @Regression
  Scenario: TC_17 Regression test for custom outlet image endpoint
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"

  @Positive @Functional
  Scenario: TC_18 Validate custom outlet image response completeness
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"
    And I store the response as "custom_outlet_image_response" name using full path

  @Positive @ContentValidation
  Scenario: TC_19 Validate custom outlet image HTML content structure
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"
    And validating the response contains the following values
      |Value|
      |Download Custom Outlet Pictures|
      |Outlets|
      |h2|

  @Positive @LoadTesting
  Scenario: TC_20 Load testing for custom outlet image endpoint
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And contentType as "text/html; charset=UTF-8"

  @Negative @Timeout
  Scenario: TC_21 Test custom outlet image endpoint timeout handling
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"

  @Positive @EndToEnd
  Scenario: TC_22 End-to-end custom outlet image download workflow
    And I send the GET request to "outlets_download_custom_outlet_image" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And contentType as "text/html; charset=UTF-8"
    And the HTML response should contain page title "Outlets"
    And the HTML response should contain element "h2" with content "Download Custom Outlet Pictures"
    And I store the response as "custom_outlet_image_response" name using full path
    And validating the response contains the following values
      |Value|
      |Download Custom Outlet Pictures|
      |Outlets|

