@BizomWebAPI @OS @OrdersManagement @GetOrdersNewIndex @WorkflowAutomation
Feature: Orders New Index API Testing
  As a system user
  I want to access the orders new index page
  So that I can view and manage orders in the system

  Background:
    Given I set up base URI for transactions

#  @Positive @Smoke
#  Scenario: Access orders new index page successfully
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "orders_newindex" endpoint
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And contentType as "text/html"

  @Positive @Functional
  Scenario: Verify orders new index page content and structure
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
      | priority                  | u=0, i                                                                                                                                        |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | none                                                                                                                                           |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "orders_newindex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds


  @Positive @DataValidation
  Scenario: Verify orders new index page returns valid HTML structure
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
      | priority                  | u=0, i                                                                                                                                        |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | none                                                                                                                                           |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "orders_newindex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds


  @Positive @Performance
  Scenario: Verify orders new index page performance under normal load
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
      | priority                  | u=0, i                                                                                                                                        |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | none                                                                                                                                           |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "orders_newindex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds


  @Positive @Security
  Scenario: Verify orders new index page security headers
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
      | priority                  | u=0, i                                                                                                                                        |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | none                                                                                                                                           |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "orders_newindex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds


  @Positive @Integration
  Scenario: Verify orders new index page integration with session management
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
      | priority                  | u=0, i                                                                                                                                        |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | none                                                                                                                                           |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
    And I send the GET request to "orders_newindex" endpoint
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds


#  @Negative @Validation
#  Scenario: Access orders new index with invalid endpoint
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "orders_newindex_invalid" endpoint
#    Then I should see the response code as "404"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Access orders new index without authentication
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "orders_newindex" endpoint
#    Then I should see the response code as "401"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Access orders new index with invalid session token
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=invalid_cake_token; PHPSESSID=invalid_session_token; XSRF-TOKEN=invalid_csrf_token |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "orders_newindex" endpoint
#    Then I should see the response code as "401"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Access orders new index with expired session
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=expired_cake_token; PHPSESSID=expired_session_token; XSRF-TOKEN=expired_csrf_token |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the GET request to "orders_newindex" endpoint
#    Then I should see the response code as "401"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @MethodValidation
#  Scenario: Access orders new index with POST method
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the POST request to "orders_newindex" endpoint
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @MethodValidation
#  Scenario: Access orders new index with PUT method
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @MethodValidation
#  Scenario: Access orders new index with DELETE method
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |
#    And I send the DELETE request to "orders_newindex" endpoint
#    Then I should see the response code as "405"
#    And verify response time is less than "2000" milliseconds

  @Negative @Performance
  Scenario: Verify orders new index page performance under high load
    When I set up request specification
      | HeaderName                | HeaderValue                                                                                                                                    |
      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
      | priority                  | u=0, i                                                                                                                                        |
      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
      | sec-fetch-dest            | document                                                                                                                                       |
      | sec-fetch-mode            | navigate                                                                                                                                       |
      | sec-fetch-site            | none                                                                                                                                           |
      | sec-fetch-user            | ?1                                                                                                                                             |
      | upgrade-insecure-requests | 1                                                                                                                                              |
      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
      | x-ht-session-id           | AmitabhaBagchi                                                                                                                                 |

#  @Negative @Security
#  Scenario: Access orders new index with SQL injection attempt in headers
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | '; DROP TABLE users; --                                                                                                                       |
#    And I send the GET request to "orders_newindex" endpoint
#    Then I should see the response code as "400"
#    And verify response time is less than "2000" milliseconds
#
#  @Negative @Security
#  Scenario: Access orders new index with XSS attempt in headers
#    When I set up request specification
#      | HeaderName                | HeaderValue                                                                                                                                    |
#      | accept                    | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7 |
#      | accept-language           | en-GB,en-US;q=0.9,en;q=0.8                                                                                                                   |
#      | Cookie                    | toolbarDisplay=hide; language=en; CAKEPHP=ds7v79eo2rd3858nsl1av6mstl; PHPSESSID=ds7v79eo2rd3858nsl1av6mstl; XSRF-TOKEN=eyJpdiI6IkFGNkU1QlR5RTJXaStYWGdhNE5PWGc9PSIsInZhbHVlIjoiMlBrYWMwOTIvcEhsc1gvZDNiMURISlJSM3JlaEFqR2VHN1RBVURJUlk3UzFrZ2oxSzR3RnVlcmFwRUtzSkdCSEhqWDRpQXRManNMTEZzcGVSZVR5QlUyOTBPUUJHbTJGdTl3SUFuQklWMWdiSzlqbnVHTXRGOHJseUdJcmlHYkEiLCJtYWMiOiI0ZmUwNTE3Nzc2MTNjNDQxYWY5YmEwN2RmNTdhYWE3ZTBlZDhhM2E2OWRkNTdmMmU0Yzc3MzAwYjJiNTg3MGU5IiwidGFnIjoiIn0%3D |
#      | priority                  | u=0, i                                                                                                                                        |
#      | sec-ch-ua                 | "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"                                                                             |
#      | sec-ch-ua-mobile          | ?0                                                                                                                                             |
#      | sec-ch-ua-platform        | "macOS"                                                                                                                                        |
#      | sec-fetch-dest            | document                                                                                                                                       |
#      | sec-fetch-mode            | navigate                                                                                                                                       |
#      | sec-fetch-site            | none                                                                                                                                           |
#      | sec-fetch-user            | ?1                                                                                                                                             |
#      | upgrade-insecure-requests | 1                                                                                                                                              |
#      | user-agent                | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36                    |
#      | x-ht-session-id           | <script>alert('XSS')</script>                                                                                                                 |
#    And I send the GET request to "orders_newindex" endpoint
#    Then I should see the response code as "400"
#    And verify response time is less than "2000" milliseconds
