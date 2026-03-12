package com.Bizom.hooks;

import java.util.ArrayList;

import com.Bizom.api.Base.TestContext;
import com.Bizom.commonUtils.MemoryManager;
import com.Bizom.reportutils.ReportManager;
import com.aventstack.extentreports.ExtentTest;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;




public class CucumberHooksDef {
    public static ArrayList<String> passedTests = new ArrayList<String>();
    public static ArrayList<String> failedTests = new ArrayList<String>();
    public static ArrayList<String> totalTestCases = new ArrayList<String>();

    public static String featureFileName;

    @Before
    public void before(Scenario scenario) throws Exception {
        String[] tags = scenario.getSourceTagNames()
                .toArray(new String[0]);

            ReportManager.startTestAPI(scenario.getName(), tags);

        }

        /**
         * ReportManager.createAPI_Node(scenario.getName()); String str_Features =
         * scenario.getId().split(";")[0]; String[] str_arryFeature =
         * str_Features.split("features/"); System.out.println(str_arryFeature);
         * String[] str_Feature = str_arryFeature[1].split(".feature"); featureFileName
         * = str_Feature[0]; System.out.println(str_Feature[0]);
         **/
    @After
    public void after(Scenario scenario) throws Exception {
            // Remove passed tests from Extent Report - only keep failed tests
            if (scenario.getStatus().toString().equals("PASSED")) {
                try {
                    ExtentTest currentTest = ReportManager.getCurrentAPITest();
                    if (currentTest != null) {
                        // Remove the test from extent report if it passed
                        ReportManager.removePassedTest(currentTest);
                    }
                } catch (Exception e) {
                    // Error handled silently - failure will be reported by test framework
                }
            } else if (scenario.getStatus().toString().equals("FAILED")) {
                try {
                    // Explicitly fail the test in ExtentReports
                    // This ensures the test is marked as FAILED, not passed
                    ExtentTest currentTest = ReportManager.getCurrentAPITest();
                    if (currentTest != null) {
                        // Get failure message from scenario if available
                        String errorMessage = "Scenario failed";
                        
                        // Try to get error details from scenario's exception
                        // Note: Cucumber Scenario doesn't have getError(), but we can check
                        // if there's exception information in the scenario name or use a generic message
                        if (scenario.getName() != null && !scenario.getName().isEmpty()) {
                            errorMessage = "Test Failed: " + scenario.getName();
                        }
                        
                        // Explicitly fail the test using ExtentReports fail() method
                        // This is more reliable than just logging FAIL status
                        currentTest.fail(errorMessage);
                        
                        // Also log the failure for additional context
                        ReportManager.logFailAPI("Test execution failed");
                    }
                    
                    // End the test so it appears in the report with FAIL status
                    ReportManager.endCurrentAPITest();
                } catch (Exception e) {
                    // If error logging fails, still try to fail and end the test
                    try {
                        ExtentTest currentTest = ReportManager.getCurrentAPITest();
                        if (currentTest != null) {
                            currentTest.fail("Test failed with unknown error: " + e.getMessage());
                            ReportManager.endCurrentAPITest();
                        }
                    } catch (Exception ex) {
                        // Error handled silently - failure will be reported by test framework
                    }
                }
            } else if (scenario.getStatus().toString().equals("SKIPPED")) {
                // Handle skipped tests - remove them from report
                try {
                    ExtentTest currentTest = ReportManager.getCurrentAPITest();
                    if (currentTest != null) {
                        ReportManager.removePassedTest(currentTest);
                    }
                } catch (Exception e) {
                    // Error handled silently - failure will be reported by test framework
                }
            }
            
            // Memory cleanup after scenario completion
            // This happens AFTER report data is written, so no impact on reports
            try {
                TestContext currentContext = TestContext.getCurrent();
                if (currentContext != null) {
                    // Cleanup TestContext to release memory
                    MemoryManager.cleanupTestContext(currentContext);
                    // Clear ThreadLocal reference
                    TestContext.clearCurrent();
                }
                
                // Suggest garbage collection (non-blocking)
                MemoryManager.suggestGarbageCollection();
                
                // Periodically clear static collections to prevent accumulation
                // Clear every 50 scenarios to prevent memory buildup
                if (totalTestCases.size() % 50 == 0) {
                    MemoryManager.clearStaticCollections();
                }
            } catch (Exception e) {
                // Silently handle cleanup errors - should not fail tests
            }

    }

}

