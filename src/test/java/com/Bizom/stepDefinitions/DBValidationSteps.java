package com.Bizom.stepDefinitions;


import java.util.Collections;
import java.util.List;
import java.util.Map;

import com.Bizom.api.Base.TestContext;
import com.jayway.jsonpath.JsonPath;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;
import org.testng.Assert;


import com.Bizom.commonUtils.*;
import com.Bizom.reportutils.ReportManager;

public class DBValidationSteps {

    private TestContext apiTestContext;

    public DBValidationSteps(TestContext apiTestContext) {
        this.apiTestContext = apiTestContext;
    }

    @Then("^I validate response field \"([^\"]*)\" against DB column \"([^\"]*)\" from table \"([^\"]*)\" with where \"([^\"]*)\"$")
    public void validateResponseWithDB(String jsonPath, String column, String table, String where) {
        String actualValue = JsonPath.read(apiTestContext.getApiTestBase().response.asString(), jsonPath);

        List<Map<String, Object>> dbData = DBUtil.getData(table, Collections.singletonList(column), where);
        String expectedValue = String.valueOf(dbData.get(0).get(column));

        Assert.assertEquals("Response mismatch with DB", expectedValue, actualValue);
    }

  /*  @And("I validate that the operation was successfully completed by checking the latest entry in {string} table")
    public void validateOperationSuccessByDB(String tableName) {
        try {
            // Get the latest entry from the table (assuming there's an id or timestamp column)
            List<Map<String, Object>> dbData = DBUtil.getData(tableName, Collections.singletonList("*"), "ORDER BY id DESC LIMIT 1");
            
            if (dbData.isEmpty()) {
                Assert.fail("No data found in table " + tableName + " to validate operation success");
            }
            
            Map<String, Object> latestEntry = dbData.get(0);
            ReportManager.logInfoAPI("Latest entry in " + tableName + " table: " + latestEntry.toString());
            
            // Basic validation - check if the entry exists and has required fields
            Assert.assertNotNull(latestEntry, "Latest entry should not be null");
            Assert.assertFalse(latestEntry.isEmpty(), "Latest entry should not be empty");
            
            ReportManager.logInfoAPI("Operation validated successfully - latest entry found in " + tableName + " table");
            
        } catch (Exception e) {
            Assert.fail("DB validation failed for table " + tableName + ": " + e.getMessage());
        }
    }

    @And("I validate that the operation was successfully completed by checking the latest entry in {string} table with specific field {string} equals {string}")
    public void validateOperationSuccessByDBWithField(String tableName, String fieldName, String expectedValue) {
        try {
            // Get the latest entry from the table
            List<Map<String, Object>> dbData = DBUtil.getData(tableName, Collections.singletonList("*"), "ORDER BY id DESC LIMIT 1");
            
            if (dbData.isEmpty()) {
                Assert.fail("No data found in table " + tableName + " to validate operation success");
            }
            
            Map<String, Object> latestEntry = dbData.get(0);
            String actualValue = String.valueOf(latestEntry.get(fieldName));
            
            ReportManager.logInfoAPI("Latest entry in " + tableName + " table: " + latestEntry.toString());
            ReportManager.logInfoAPI("Validating field " + fieldName + ": expected=" + expectedValue + ", actual=" + actualValue);
            
            Assert.assertEquals(actualValue, expectedValue, 
                "Field " + fieldName + " in latest entry of " + tableName + " table should match expected value");
            
            ReportManager.logInfoAPI("Operation validated successfully - field " + fieldName + " matches expected value in " + tableName + " table");
            
        } catch (Exception e) {
            Assert.fail("DB validation failed for table " + tableName + " field " + fieldName + ": " + e.getMessage());
        }
    }

    @And("I validate that the operation failed by checking no new entry was created in {string} table since {string}")
    public void validateOperationFailureByDB(String tableName, String timestampField) {
        try {
            // This would require storing the timestamp before the operation
            // For now, we'll implement a basic check that no new entries exist
            List<Map<String, Object>> dbData = DBUtil.getData(tableName, Collections.singletonList("COUNT(*) as count"), "");
            
            if (!dbData.isEmpty()) {
                int count = Integer.parseInt(String.valueOf(dbData.get(0).get("count")));
                ReportManager.logInfoAPI("Current count in " + tableName + " table: " + count);
                
                // This is a basic implementation - in real scenarios, you'd compare with pre-operation count
                ReportManager.logInfoAPI("Operation failure validated - no new entries created in " + tableName + " table");
            }
            
        } catch (Exception e) {
            ReportManager.logInfoAPI("DB validation for operation failure: " + e.getMessage());
        }
    }

    @And("I validate that the latest entry in {string} table contains the data from the request")
    public void validateLatestEntryContainsRequestData(String tableName) {
        try {
            // Get the latest entry from the table
            List<Map<String, Object>> dbData = DBUtil.getData(tableName, Collections.singletonList("*"), "ORDER BY id DESC LIMIT 1");
            
            if (dbData.isEmpty()) {
                Assert.fail("No data found in table " + tableName + " to validate request data");
            }
            
            Map<String, Object> latestEntry = dbData.get(0);
            String requestPayload = apiTestContext.getApiTestBase().requestMap.get("PAYLOAD");
            
            ReportManager.logInfoAPI("Latest entry in " + tableName + " table: " + latestEntry.toString());
            ReportManager.logInfoAPI("Request payload: " + requestPayload);
            
            // Basic validation - check if entry exists and has data
            Assert.assertNotNull(latestEntry, "Latest entry should not be null");
            Assert.assertFalse(latestEntry.isEmpty(), "Latest entry should not be empty");
            
            ReportManager.logInfoAPI("Request data validation completed for " + tableName + " table");
            
        } catch (Exception e) {
            Assert.fail("DB validation failed for table " + tableName + ": " + e.getMessage());
        }
    }
*/
  @Then("I validate DB record in table {string} with where {string}")
  public void i_validate_db_record_in_table_with_where(
          String table,
          String where,
          io.cucumber.datatable.DataTable dataTable) {

      List<Map<String, String>> expectedData = dataTable.asMaps();

      for (Map<String, String> row : expectedData) {
          String column = row.get("column");
          String expectedValue = row.get("value");

          List<Map<String, Object>> dbData =
                  DBUtil.getData(table, Collections.singletonList(column), where);

          Assert.assertFalse(dbData.isEmpty(),
                  "No record found in DB for table " + table + " with condition " + where);

          String actualValue = String.valueOf(dbData.get(0).get(column));

          ReportManager.logInfoAPI(
                  "DB Validation → Table: " + table +
                          ", Column: " + column +
                          ", Expected: " + expectedValue +
                          ", Actual: " + actualValue
          );

          Assert.assertEquals(actualValue, expectedValue,
                  "DB column value mismatch for " + column);
      }
  }


}

